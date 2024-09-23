@implementation SXScrollViewController

- (SXScrollViewController)initWithScrollView:(id)a3 documentControllerContainer:(id)a4 resourceDataSourceContainer:(id)a5 analyticsReportingContainer:(id)a6 presentationDelegateContainer:(id)a7 presentationAttributeManager:(id)a8 viewport:(id)a9 tangierController:(id)a10 componentController:(id)a11 interactor:(id)a12 appStateMonitor:(id)a13 viewControllerPresentingManager:(id)a14 scrollPositionManager:(id)a15 documentStyleRenderer:(id)a16 componentInteractionManager:(id)a17 interactionContextManager:(id)a18 hoverStyleManager:(id)a19 scrollReporter:(id)a20 videoPlayerViewControllerManager:(id)a21 mediaSharingPolicyProvider:(id)a22 fontIndex:(id)a23 documentProvider:(id)a24 transitionDataSourceProvider:(id)a25 DOMObjectProvider:(id)a26
{
  id v31;
  id v32;
  id v33;
  SXScrollViewController *v34;
  SXScrollViewController *v35;
  id v36;
  SXFullscreenVideoPlaybackManager *v37;
  SXFullscreenVideoPlaybackManager *fullscreenVideoPlaybackManager;
  uint64_t v39;
  NSMutableArray *articleScrollEvents;
  SXTextSelectionManager *v41;
  SXTextSelectionManager *textSelectionManager;
  void *v43;
  UIScrollView *scrollView;
  void *v45;
  id v46;
  void *v47;
  UIScrollView *v48;
  void *v49;
  UIScrollView *v50;
  void *v51;
  SXDocumentSectionManager *v52;
  SXDocumentSectionManager *documentSectionManager;
  id v56;
  id v57;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  objc_super v81;

  v76 = a3;
  v75 = a4;
  v74 = a5;
  v73 = a6;
  v56 = a7;
  v72 = a7;
  v57 = a8;
  v71 = a8;
  v80 = a9;
  v70 = a10;
  v69 = a11;
  v68 = a12;
  v79 = a13;
  v78 = a14;
  v77 = a15;
  v67 = a16;
  v66 = a17;
  v65 = a18;
  v64 = a19;
  v63 = a20;
  v62 = a21;
  v61 = a22;
  v60 = a23;
  v31 = a24;
  v32 = a25;
  v33 = a26;
  v81.receiver = self;
  v81.super_class = (Class)SXScrollViewController;
  v34 = -[SXScrollViewController initWithNibName:bundle:](&v81, sel_initWithNibName_bundle_, 0, 0);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_scrollView, a3);
    objc_storeStrong((id *)&v35->_documentControllerContainer, a4);
    objc_storeStrong((id *)&v35->_analyticsReportingContainer, a6);
    objc_storeStrong((id *)&v35->_resourceDataSourceContainer, a5);
    v59 = v31;
    objc_storeStrong((id *)&v35->_presentationDelegateContainer, v56);
    objc_storeStrong((id *)&v35->_presentationAttributesManager, v57);
    objc_storeStrong((id *)&v35->_mediaSharingPolicyProvider, a22);
    -[SXPresentationDelegateContainer registerPresentationDelegate:](v35->_presentationDelegateContainer, "registerPresentationDelegate:", v35);
    objc_storeStrong((id *)&v35->_viewControllerPresentingManager, a14);
    objc_msgSend(v78, "setPresentingViewController:", v35);
    objc_storeStrong((id *)&v35->_scrollPositionManager, a15);
    objc_msgSend(v77, "setScrollPositionRestoring:", v35);
    objc_storeStrong((id *)&v35->_interactionContextManager, a18);
    -[SXInteractionContextManager setDelegate:](v35->_interactionContextManager, "setDelegate:", v35);
    objc_storeStrong((id *)&v35->_hoverStyleManager, a19);
    objc_storeStrong((id *)&v35->_componentInteractionManager, a17);
    objc_storeStrong((id *)&v35->_documentStyleRenderer, a16);
    objc_storeStrong((id *)&v35->_viewport, a9);
    objc_storeStrong((id *)&v35->_appStateMonitor, a13);
    objc_storeStrong((id *)&v35->_tangierController, a10);
    -[SXTangierController setDelegate:](v35->_tangierController, "setDelegate:", v35);
    objc_storeStrong((id *)&v35->_componentController, a11);
    v36 = v33;
    objc_storeStrong((id *)&v35->_interactor, a12);
    -[SXFormatInteractor setDelegate:](v35->_interactor, "setDelegate:", v35);
    -[SXFormatInteractor updateWithPresentationEnvironment:](v35->_interactor, "updateWithPresentationEnvironment:", v35);
    v37 = objc_alloc_init(SXFullscreenVideoPlaybackManager);
    fullscreenVideoPlaybackManager = v35->_fullscreenVideoPlaybackManager;
    v35->_fullscreenVideoPlaybackManager = v37;

    objc_storeStrong((id *)&v35->_videoPlayerViewControllerManager, a21);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v39 = objc_claimAutoreleasedReturnValue();
    articleScrollEvents = v35->_articleScrollEvents;
    v35->_articleScrollEvents = (NSMutableArray *)v39;

    v41 = objc_alloc_init(SXTextSelectionManager);
    textSelectionManager = v35->_textSelectionManager;
    v35->_textSelectionManager = v41;

    -[SXTextSelectionManager addTextSelecting:](v35->_textSelectionManager, "addTextSelecting:", v35->_tangierController);
    objc_storeStrong((id *)&v35->_scrollReporter, a20);
    objc_storeStrong((id *)&v35->_fontIndex, a23);
    objc_storeStrong((id *)&v35->_documentProvider, a24);
    objc_storeStrong((id *)&v35->_transitionDataSourceProvider, a25);
    objc_storeStrong((id *)&v35->_DOMObjectProvider, a26);
    -[SXTangierController cvc](v35->_tangierController, "cvc");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController addChildViewController:](v35, "addChildViewController:", v43);

    scrollView = v35->_scrollView;
    -[SXScrollViewController canvasViewController](v35, "canvasViewController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "view");
    v46 = v32;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](scrollView, "addSubview:", v47);

    v32 = v46;
    v48 = v35->_scrollView;
    -[SXTangierController icc](v35->_tangierController, "icc");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v48;
    v33 = v36;
    -[UIScrollView setDelegate:](v50, "setDelegate:", v49);

    -[SXTangierController cvc](v35->_tangierController, "cvc");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "didMoveToParentViewController:", v35);

    v31 = v59;
    v52 = -[SXDocumentSectionManager initWithSectionHosting:viewport:appStateMonitor:]([SXDocumentSectionManager alloc], "initWithSectionHosting:viewport:appStateMonitor:", v35, v80, v79);
    documentSectionManager = v35->_documentSectionManager;
    v35->_documentSectionManager = v52;

    -[SXScrollViewController setRestoreScrollPositionOnNextLayout:](v35, "setRestoreScrollPositionOnNextLayout:", 1);
  }

  return v35;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[SXScrollViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);

  -[SXScrollViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 1);

  -[SXScrollViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollsToTop:", 1);
  -[SXScrollViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setScrollViewDelegate:", self);
  objc_msgSend(v5, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v5, "setClipsToBounds:", 0);
  objc_msgSend(v5, "setDirectionalLockEnabled:", 1);
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);
  -[SXScrollViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  -[SXScrollViewController interactionContextManager](self, "interactionContextManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerOnView:", v9);

  -[SXScrollViewController viewport](self, "viewport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addViewportChangeListener:forOptions:", self, 8);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_screenTraitCollectionDidChange_, *MEMORY[0x24BDF8198], 0);

}

- (void)loadContext:(id)a3 analyticsReporting:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SXAnalyticsReporterProxy *v15;
  void *v16;
  SXComponentAnimationController *v17;
  void *v18;
  SXComponentAnimationController *v19;
  SXComponentAnimationController *animationController;
  SXMediaPlaybackController *v21;
  void *v22;
  SXMediaPlaybackController *v23;
  SXMediaPlaybackController *mediaPlaybackController;
  id v25;
  void *v26;
  void *v27;
  SXComponentBehaviorController *v28;
  void *v29;
  SXComponentBehaviorController *v30;
  SXComponentBehaviorController *behaviorController;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SXDocumentFontFamilyProvider *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  SXDocumentFontFamilyProvider *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v49 = a4;
  v8 = SXDefaultLog;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v10;
      _os_log_impl(&dword_217023000, v9, OS_LOG_TYPE_DEFAULT, "Loaded Silex context with identifier: %{public}@", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_ERROR))
  {
    -[SXScrollViewController loadContext:analyticsReporting:].cold.1(v8);
  }
  objc_storeStrong((id *)&self->_context, a3);
  -[SXScrollViewController documentControllerContainer](self, "documentControllerContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerDocumentController:", v12);

  -[SXScrollViewController resourceDataSourceContainer](self, "resourceDataSourceContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerResourceDataSource:", v14);

  v15 = -[SXAnalyticsReporterProxy initWithAnalyticsReporter:]([SXAnalyticsReporterProxy alloc], "initWithAnalyticsReporter:", v49);
  -[SXScrollViewController analyticsReportingContainer](self, "analyticsReportingContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerAnalyticsReporting:", v15);

  v17 = [SXComponentAnimationController alloc];
  -[SXScrollViewController viewport](self, "viewport");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SXComponentAnimationController initWithViewport:](v17, "initWithViewport:", v18);
  animationController = self->_animationController;
  self->_animationController = v19;

  v21 = [SXMediaPlaybackController alloc];
  -[SXScrollViewController viewport](self, "viewport");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (SXMediaPlaybackController *)-[SXMediaPlaybackController initWithViewport:]((id *)&v21->super.isa, v22);
  mediaPlaybackController = self->_mediaPlaybackController;
  self->_mediaPlaybackController = v23;

  v25 = objc_alloc(MEMORY[0x24BDF6A18]);
  -[SXScrollViewController scrollView](self, "scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithReferenceView:", v26);

  v28 = [SXComponentBehaviorController alloc];
  -[SXScrollViewController viewport](self, "viewport");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[SXComponentBehaviorController initWithViewport:andAnimator:](v28, "initWithViewport:andAnimator:", v29, v27);
  behaviorController = self->_behaviorController;
  self->_behaviorController = v30;

  v32 = (void *)SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    objc_msgSend(v7, "documentController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "document");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v35;
    _os_log_impl(&dword_217023000, v33, OS_LOG_TYPE_DEFAULT, "Updating document with provider: %{public}@", buf, 0xCu);

  }
  -[SXScrollViewController documentProvider](self, "documentProvider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "document");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDocument:", v38);

  v39 = [SXDocumentFontFamilyProvider alloc];
  -[SXScrollViewController context](self, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "documentController");
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v41, "document");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[SXDocumentFontFamilyProvider initWithDocument:](v39, "initWithDocument:", v42);

  -[SXScrollViewController fontIndex](self, "fontIndex");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addFontFamilyProvider:", v43);

  objc_initWeak((id *)buf, self);
  -[SXScrollViewController appStateMonitor](self, "appStateMonitor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v41) = objc_opt_respondsToSelector();

  v46 = MEMORY[0x24BDAC760];
  if ((v41 & 1) != 0)
  {
    -[SXScrollViewController appStateMonitor](self, "appStateMonitor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v46;
    v52[1] = 3221225472;
    v52[2] = __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke;
    v52[3] = &unk_24D6873B8;
    objc_copyWeak(&v53, (id *)buf);
    objc_msgSend(v47, "performOnApplicationWindowDidBecomeBackground:", v52);

    objc_destroyWeak(&v53);
  }
  -[SXScrollViewController appStateMonitor](self, "appStateMonitor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v46;
  v50[1] = 3221225472;
  v50[2] = __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke_2;
  v50[3] = &unk_24D6873B8;
  objc_copyWeak(&v51, (id *)buf);
  objc_msgSend(v48, "performOnApplicationDidEnterBackground:", v50);

  objc_destroyWeak(&v51);
  objc_destroyWeak((id *)buf);

}

void __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishArticleScrollEvents");

}

void __57__SXScrollViewController_loadContext_analyticsReporting___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishArticleScrollEvents");

}

- (void)updatePresentationWithAttributes:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = SXDefaultLog;
  if (os_log_type_enabled((os_log_t)SXDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Received request to update presentation attributes: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  -[SXScrollViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_storeStrong((id *)&self->_presentationAttributes, a3);
    -[SXScrollViewController componentController](self, "componentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedBlueprint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController updateViewportForBlueprint:](self, "updateViewportForBlueprint:", v9);

    if (objc_msgSend(v5, "enableViewportDebugging")
      && (-[SXScrollViewController viewportDebugger](self, "viewportDebugger"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v11 = -[SXViewportDebugger initWithViewport:]((id *)[SXViewportDebugger alloc], self->_viewport);
      -[SXScrollViewController setViewportDebugger:](self, "setViewportDebugger:", v11);

      -[SXScrollViewController viewportDebugger](self, "viewportDebugger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXScrollViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXViewportDebugger presentOnView:]((uint64_t)v12, v13);

    }
    else if ((objc_msgSend(v5, "enableViewportDebugging") & 1) == 0)
    {
      -[SXScrollViewController setViewportDebugger:](self, "setViewportDebugger:", 0);
    }
    -[SXScrollViewController presentationAttributesManager](self, "presentationAttributesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateAttributes:", v5);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  -[SXScrollViewController viewport](self, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearState:", 1);

  -[SXScrollViewController viewport](self, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterfaceOrientation:", -[SXScrollViewController interfaceOrientation](self, "interfaceOrientation"));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

  -[SXScrollViewController showScrollViewIfNeeded](self, "showScrollViewIfNeeded");
  -[SXScrollViewController tangierController](self, "tangierController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cvc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginAppearanceTransition:animated:", 1, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[SXScrollViewController viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppearState:", 2);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_assistiveTechnologyStatusDidChange_, *MEMORY[0x24BDF7458], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_assistiveTechnologyStatusDidChange_, *MEMORY[0x24BDF7380], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_smartInvertColorsStatusDidChange_, *MEMORY[0x24BDF7258], 0);

  -[SXScrollViewController tangierController](self, "tangierController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cvc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endAppearanceTransition");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewWillDisappear:](&v13, sel_viewWillDisappear_);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF7458], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDF7380], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BDF7258], 0);

  -[SXScrollViewController viewport](self, "viewport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppearState:", 3);

  -[SXScrollViewController finishArticleScrollEvents](self, "finishArticleScrollEvents");
  -[SXScrollViewController currentCanvasController](self, "currentCanvasController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismiss");

  -[SXScrollViewController dismissFullscreenCanvasForComponent:](self, "dismissFullscreenCanvasForComponent:", 0);
  -[SXScrollViewController tangierController](self, "tangierController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cvc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginAppearanceTransition:animated:", 0, v3);

  -[SXScrollViewController textSelectionManager](self, "textSelectionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearSelection");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D0], 0);

  -[SXScrollViewController viewport](self, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearState:", 0);

  -[SXScrollViewController tangierController](self, "tangierController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cvc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endAppearanceTransition");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController headerBlueprint](self, "headerBlueprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  -[SXScrollViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightForBlueprint:canvasSize:traitCollection:", v4, v10, v7, v9);
  v12 = v11;

  -[SXScrollViewController setHeaderHeight:](self, "setHeaderHeight:", v12);
  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController footerBlueprint](self, "footerBlueprint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController presentationAttributes](self, "presentationAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "canvasSize");
  v17 = v16;
  v19 = v18;
  -[SXScrollViewController traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightForBlueprint:canvasSize:traitCollection:", v14, v20, v17, v19);
  v22 = v21;

  -[SXScrollViewController setFooterHeight:](self, "setFooterHeight:", v22);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[SXScrollViewController componentController](self, "componentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedBlueprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController updateViewportForBlueprint:](self, "updateViewportForBlueprint:", v4);

  -[SXScrollViewController interactor](self, "interactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithPresentationEnvironment:", self);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[7];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SXScrollViewController;
  v7 = a4;
  -[SXScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SXScrollViewController setTransitioning:](self, "setTransitioning:", 1);
  -[SXScrollViewController fullscreenVideoPlaybackManager](self, "fullscreenVideoPlaybackManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenVideoPlaybackManager willLayoutAndTransitionToSize:]((uint64_t)v8);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__SXScrollViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24D6873E0;
  v9[4] = self;
  *(double *)&v9[5] = width;
  *(double *)&v9[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);

}

uint64_t __77__SXScrollViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "fullscreenVideoPlaybackManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenVideoPlaybackManager didTransitionToSize:]((uint64_t)v2);

  return objc_msgSend(*(id *)(a1 + 32), "setTransitioning:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[SXScrollViewController interactor](self, "interactor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithPresentationEnvironment:", self);

}

- (void)screenTraitCollectionDidChange:(id)a3
{
  id v4;

  -[SXScrollViewController interactor](self, "interactor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithPresentationEnvironment:", self);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)assistiveTechnologyStatusDidChange:(id)a3
{
  id v3;

  -[SXScrollViewController componentController](self, "componentController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistiveTechnologyStatusDidChange");

}

- (void)smartInvertColorsStatusDidChange:(id)a3
{
  id v4;

  -[SXScrollViewController interactor](self, "interactor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithPresentationEnvironment:", self);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[SXScrollViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[SXScrollViewController tangierController](self, "tangierController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teardown");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  -[SXScrollViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  objc_super v6;

  -[SXScrollViewController tangierController](self, "tangierController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cvc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  return -[SXScrollViewController becomeFirstResponder](&v6, sel_becomeFirstResponder);
}

- (BOOL)resignFirstResponder
{
  void *v3;
  void *v4;
  objc_super v6;

  -[SXScrollViewController tangierController](self, "tangierController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cvc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  v6.receiver = self;
  v6.super_class = (Class)SXScrollViewController;
  return -[SXScrollViewController resignFirstResponder](&v6, sel_resignFirstResponder);
}

- (UIResponder)responder
{
  void *v2;
  void *v3;

  -[SXScrollViewController tangierController](self, "tangierController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cvc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIResponder *)v3;
}

- (void)applyHeaderBlueprint:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  SXScrollViewController *v40;
  id v41;
  _QWORD v42[5];
  void (**v43)(_QWORD);
  double v44;
  _QWORD v45[5];
  id v46;
  id v47;

  v5 = a3;
  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController headerBlueprint](self, "headerBlueprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  -[SXScrollViewController traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightForBlueprint:canvasSize:traitCollection:", v7, v13, v10, v12);
  v15 = v14;

  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  -[SXScrollViewController traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightForBlueprint:canvasSize:traitCollection:", v5, v22, v19, v21);
  v24 = v23;

  -[SXScrollViewController setHeaderHeight:](self, "setHeaderHeight:", v24);
  if (v15 == v24)
  {
    objc_storeStrong((id *)&self->_headerBlueprint, a3);
    -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController presentationAttributes](self, "presentationAttributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "canvasSize");
    objc_msgSend(v25, "applySectionBlueprint:identifier:offset:size:", v5, CFSTR("header"), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v33, v34);

  }
  else
  {
    -[SXScrollViewController componentController](self, "componentController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentedBlueprint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke;
      v45[3] = &unk_24D687430;
      v45[4] = self;
      v46 = v26;
      v47 = v25;
      v29 = (void (**)(_QWORD))MEMORY[0x219A070A8](v45);
      if (v15 > 0.0 && v24 == 0.0)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DC8]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 210.0, 29.0, 0.0, 0.0);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:timingParameters:", v30, 0.0);
        v42[0] = v28;
        v42[1] = 3221225472;
        v42[2] = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_3;
        v42[3] = &unk_24D687458;
        v42[4] = self;
        v44 = v15;
        v43 = v29;
        objc_msgSend(v31, "addAnimations:", v42);
        v36 = v28;
        v37 = 3221225472;
        v38 = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_4;
        v39 = &unk_24D687480;
        v40 = self;
        v41 = v5;
        objc_msgSend(v31, "addCompletion:", &v36);
        objc_msgSend(v31, "startAnimation", v36, v37, v38, v39, v40);

      }
      else
      {
        objc_storeStrong((id *)&self->_headerBlueprint, a3);
        v29[2](v29);
      }

    }
    else
    {
      objc_storeStrong((id *)&self->_headerBlueprint, a3);
      -[SXScrollViewController interactor](self, "interactor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updateWithPresentationEnvironment:", self);

    }
  }

}

void __47__SXScrollViewController_applyHeaderBlueprint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactor:willIntegrateBlueprint:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "tangierController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRebuildFlows:", 0);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_2;
  v7[3] = &unk_24D687408;
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  objc_msgSend(v6, "integrateBlueprint:withCompletion:", v8, v7);

}

void __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "interactor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactor:didIntegrateBlueprint:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "headerBlueprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        memset(&v13, 0, sizeof(v13));
        CGAffineTransformMakeTranslation(&v13, 0.0, -*(double *)(a1 + 48));
        objc_msgSend(v8, "sectionItemViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v13;
        objc_msgSend(v10, "setTransform:", &v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __47__SXScrollViewController_applyHeaderBlueprint___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "headerBlueprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v15 = *MEMORY[0x24BDBD8B8];
    v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "sectionItemViewController", v13, v14, v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v15;
        v16[1] = v14;
        v16[2] = v13;
        objc_msgSend(v9, "setTransform:", v16);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1184), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "documentSectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "headerBlueprint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v10, "applySectionBlueprint:identifier:offset:size:", v11, CFSTR("header"), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (void)applyFooterBlueprint:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_footerBlueprint, a3);
  -[SXScrollViewController componentController](self, "componentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedBlueprint");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_13:
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v5, "items", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v53 != v32)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "sectionItemViewController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "view");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setHidden:", 1);

        }
        v31 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v31);
    }
    goto LABEL_20;
  }
  v8 = (void *)v7;
  -[SXScrollViewController componentController](self, "componentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedBlueprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isComplete");

  if (!v11)
    goto LABEL_13;
  -[SXScrollViewController componentController](self, "componentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentedBlueprint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "blueprintSize");
  v15 = v14;

  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController headerHeight](self, "headerHeight");
  v18 = v15 + v17;
  -[SXScrollViewController presentationAttributes](self, "presentationAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "canvasSize");
  objc_msgSend(v16, "applySectionBlueprint:identifier:offset:size:", v5, CFSTR("footer"), 0.0, v18, v20, v21);

  -[SXScrollViewController contentOverlayBlueprint](self, "contentOverlayBlueprint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController presentationAttributes](self, "presentationAttributes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "canvasSize");
    v39 = v38;
    v41 = v40;
    -[SXScrollViewController traitCollection](self, "traitCollection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "heightForBlueprint:canvasSize:traitCollection:", v5, v42, v39, v41);
    v44 = v43;

    -[SXScrollViewController setFooterHeight:](self, "setFooterHeight:", v44);
    -[SXScrollViewController scrollView](self, "scrollView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController scrollView](self, "scrollView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contentSize");
    v48 = v47;
    -[SXScrollViewController footerHeight](self, "footerHeight");
    v50 = v15 + v49;
    -[SXScrollViewController headerHeight](self, "headerHeight");
    objc_msgSend(v45, "setContentSize:", v48, v50 + v51);

    goto LABEL_21;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v5, "items");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v57 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "sectionItemViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setHidden:", 1);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v25);
  }
LABEL_20:

LABEL_21:
}

- (void)applyContentOverlayBlueprint:(id)a3 topOffset:(double)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v30 = a3;
  objc_storeStrong((id *)&self->_contentOverlayBlueprint, a3);
  self->_contentOverlayTopOffset = a4;
  -[SXScrollViewController viewport](self, "viewport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController contentOverlayTopOffset](self, "contentOverlayTopOffset");
  v12 = v9 + v11;
  -[SXScrollViewController presentationAttributes](self, "presentationAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "canvasSize");
  objc_msgSend(v10, "applySectionBlueprint:identifier:offset:size:", v30, CFSTR("contentOverlay"), 0.0, v12, v14, v15);

  if (v30)
  {
    -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    -[SXScrollViewController traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heightForBlueprint:canvasSize:traitCollection:", v30, v22, v19, v21);
    v24 = v23;

    -[SXScrollViewController scrollView](self, "scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController scrollView](self, "scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentSize");
    v28 = v27;
    -[SXScrollViewController contentOverlayTopOffset](self, "contentOverlayTopOffset");
    objc_msgSend(v25, "setContentSize:", v28, v24 + v9 + v29);

  }
}

- (void)updatePrimaryContentScrollProgress
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double Height;
  double v11;
  double v12;
  void *v13;
  char v14;
  id v15;
  CGRect v16;

  -[SXScrollViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;

  -[SXScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  -[SXScrollViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Height = CGRectGetHeight(v16);
  -[SXScrollViewController footerHeight](self, "footerHeight");
  v12 = v11;

  if (v5 > 0.0 && v5 >= v8 - Height - v12)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[SXScrollViewController delegate](self, "delegate");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scrollViewControllerDidScrollToBottomOfPrimaryContent:", self);

    }
  }
}

- (void)updateStickyHeaders
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[SXScrollViewController headerBlueprint](self, "headerBlueprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXScrollViewController scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    -[SXScrollViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentInset");
    v9 = v6 + v8;

    if (v9 < 0.0)
    {
      v37 = 0uLL;
      v38 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
      -[SXScrollViewController headerBlueprint](self, "headerBlueprint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "items");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v19);
            v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            memset(&v34, 0, sizeof(v34));
            CGAffineTransformMakeTranslation(&v34, 0.0, v9);
            objc_msgSend(v15, "sectionItemViewController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "view");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v34;
            objc_msgSend(v17, "setTransform:", &v33);

          }
          v12 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v12);
      }
    }
    else
    {
      v31 = 0uLL;
      v32 = 0uLL;
      v29 = 0uLL;
      v30 = 0uLL;
      -[SXScrollViewController headerBlueprint](self, "headerBlueprint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "items");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v30;
        v27 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        v28 = *MEMORY[0x24BDBD8B8];
        v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v30 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "sectionItemViewController", v26, v27, v28);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "view");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_OWORD *)&v34.a = v28;
            *(_OWORD *)&v34.c = v27;
            *(_OWORD *)&v34.tx = v26;
            objc_msgSend(v25, "setTransform:", &v34);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        }
        while (v21);
      }
    }

  }
}

- (CGSize)viewportSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;
  CGRect v35;

  -[SXScrollViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SXScrollViewController view](self, "view");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      objc_msgSend(v13, "center");
      v15 = v14;
      objc_msgSend(v13, "bounds");
      v5 = v5 + v15 - v16 * 0.5;
      objc_msgSend(v13, "center");
      v18 = v17;
      objc_msgSend(v13, "bounds");
      v7 = v7 + v18 - v19 * 0.5;
      objc_msgSend(v13, "superview");
      v20 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v20;
    }
    while (v20);
  }
  -[SXScrollViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  v25 = v24 - CGRectGetMaxY(v35);

  -[SXScrollViewController scrollView](self, "scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v27;
  -[SXScrollViewController scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  v31 = v25 + v30;

  v32 = v28;
  v33 = v31;
  result.height = v33;
  result.width = v32;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  void *v2;
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
  UIEdgeInsets result;

  -[SXScrollViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UITraitCollection)presentationTraitCollection
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
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[SXScrollViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  v9 = (void *)MEMORY[0x24BDF6F30];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollectionWithTraitsFromCollections:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v12;
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  void *v5;
  int v6;
  id v7;

  if (objc_msgSend(a3, "appearState") == 2)
  {
    -[SXScrollViewController componentController](self, "componentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPresented");

    if (v6)
    {
      -[SXScrollViewController videoPlayerViewControllerManager](self, "videoPlayerViewControllerManager");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPresentedAndAppeared:", 1);

    }
  }
}

- (void)interactor:(id)a3 willLayoutWithOptions:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  -[SXScrollViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollViewControllerWillLayoutContent:", self);

  }
  -[SXScrollViewController componentController](self, "componentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedBlueprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "diffWithLayoutOptions:", v11);

  -[SXScrollViewController previouslyRestoredScrollPosition](self, "previouslyRestoredScrollPosition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 || v12)
  {
    -[SXScrollViewController setRestoreScrollPositionOnNextLayout:](self, "setRestoreScrollPositionOnNextLayout:", 1);
  }
  else
  {
    -[SXScrollViewController componentController](self, "componentController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentedBlueprint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController setRestoreScrollPositionOnNextLayout:](self, "setRestoreScrollPositionOnNextLayout:", -[SXScrollViewController shouldRestoreScrollPositionForLayoutBlueprint:](self, "shouldRestoreScrollPositionForLayoutBlueprint:", v14));

  }
}

- (void)interactor:(id)a3 willIntegrateBlueprint:(id)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  id v53;

  v53 = a4;
  -[SXScrollViewController componentController](self, "componentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPresented"))
  {
    v6 = -[SXScrollViewController restoreScrollPositionOnNextLayout](self, "restoreScrollPositionOnNextLayout");

    if (v6)
    {
      -[SXScrollViewController previouslyRestoredScrollPosition](self, "previouslyRestoredScrollPosition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        -[SXScrollViewController scrollPosition](self, "scrollPosition");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

      -[SXScrollViewController setRestoredScrollPosition:](self, "setRestoredScrollPosition:", v10);
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (!-[SXScrollViewController restoreScrollPositionOnNextLayout](self, "restoreScrollPositionOnNextLayout"))
    -[SXScrollViewController setRestoreScrollPositionOnNextLayout:](self, "setRestoreScrollPositionOnNextLayout:", 1);
LABEL_10:
  -[SXScrollViewController componentController](self, "componentController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentedBlueprint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && objc_msgSend(v12, "isComplete")
    && (objc_msgSend(v12, "layoutOptions"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v53, "layoutOptions"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "isEqual:", v14),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    -[SXScrollViewController tangierController](self, "tangierController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 0;
  }
  else
  {
    -[SXScrollViewController tangierController](self, "tangierController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 1;
  }
  objc_msgSend(v16, "setRebuildFlows:", v18);

  -[SXScrollViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;

  objc_msgSend(v53, "blueprintSize");
  v23 = v22;
  -[SXScrollViewController headerHeight](self, "headerHeight");
  v25 = v24;
  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController footerBlueprint](self, "footerBlueprint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v32 = v31;
  -[SXScrollViewController traitCollection](self, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "heightForBlueprint:canvasSize:traitCollection:", v27, v33, v30, v32);
  v35 = v34;

  -[SXScrollViewController contentOverlayBlueprint](self, "contentOverlayBlueprint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController contentOverlayBlueprint](self, "contentOverlayBlueprint");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController scrollView](self, "scrollView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bounds");
    v41 = v40;
    v43 = v42;
    -[SXScrollViewController traitCollection](self, "traitCollection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "heightForBlueprint:canvasSize:traitCollection:", v38, v44, v41, v43);
    v46 = v45;

    -[SXScrollViewController viewport](self, "viewport");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    v49 = v48;
    -[SXScrollViewController contentOverlayTopOffset](self, "contentOverlayTopOffset");
    v51 = v46 + v50 + v49;

  }
  else
  {
    v51 = v23 + v25 + v35;
  }
  -[SXScrollViewController scrollView](self, "scrollView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setContentSize:", v21, v51);

  -[SXScrollViewController updateViewportForBlueprint:](self, "updateViewportForBlueprint:", v53);
}

- (UIColor)documentBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[SXScrollViewController DOMObjectProvider](self, "DOMObjectProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)interactor:(id)a3 didIntegrateBlueprint:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[SXScrollViewController tangierController](self, "tangierController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  v11 = v10;
  -[SXScrollViewController componentController](self, "componentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flattenedComponentViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateCanvasSize:forComponentViews:", v13, v9, v11);

  -[SXScrollViewController behaviorController](self, "behaviorController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reset");

  -[SXScrollViewController updateViewportForBlueprint:](self, "updateViewportForBlueprint:", v5);
  objc_msgSend(v5, "snapLinesIncludingChildren:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController setSnapLines:](self, "setSnapLines:", v15);

  -[SXScrollViewController videoPlayerViewControllerManager](self, "videoPlayerViewControllerManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController viewport](self, "viewport");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPresentedAndAppeared:", objc_msgSend(v17, "appearState") == 2);

  -[SXScrollViewController fullscreenVideoPlaybackManager](self, "fullscreenVideoPlaybackManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController viewport](self, "viewport");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v19, "bounds");
  -[SXFullscreenVideoPlaybackManager didLayoutForSize:]((uint64_t)v18);

  -[SXScrollViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scrollViewControllerDidLayoutContent:", self);

  }
  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController headerBlueprint](self, "headerBlueprint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  objc_msgSend(v22, "applySectionBlueprint:identifier:offset:size:", v23, CFSTR("header"), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  if (objc_msgSend(v5, "isComplete"))
  {
    -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController footerBlueprint](self, "footerBlueprint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blueprintSize");
    v28 = v27;
    -[SXScrollViewController headerHeight](self, "headerHeight");
    v30 = v28 + v29;
    -[SXScrollViewController scrollView](self, "scrollView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bounds");
    objc_msgSend(v25, "applySectionBlueprint:identifier:offset:size:", v26, CFSTR("footer"), 0.0, v30);

  }
  -[SXScrollViewController viewport](self, "viewport");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");

  -[SXScrollViewController scrollView](self, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v35 = v34;

  -[SXScrollViewController documentSectionManager](self, "documentSectionManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController contentOverlayBlueprint](self, "contentOverlayBlueprint");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController contentOverlayTopOffset](self, "contentOverlayTopOffset");
  v39 = v35 + v38;
  -[SXScrollViewController scrollView](self, "scrollView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  objc_msgSend(v36, "applySectionBlueprint:identifier:offset:size:", v37, CFSTR("contentOverlay"), 0.0, v39);

  -[SXScrollViewController behaviorController](self, "behaviorController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "update");

  -[SXScrollViewController documentStyleRenderer](self, "documentStyleRenderer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController DOMObjectProvider](self, "DOMObjectProvider");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "documentStyle");
  v44 = objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController scrollView](self, "scrollView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applyStyle:onView:", v44, v45);

  -[SXScrollViewController delegate](self, "delegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v44) = objc_opt_respondsToSelector();

  if ((v44 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController DOMObjectProvider](self, "DOMObjectProvider");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "documentStyle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "scrollViewController:didApplyDocumentStyle:", self, v49);

  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[SXScrollViewController headerBlueprint](self, "headerBlueprint");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "items");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v78;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v78 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v55);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SXScrollViewController DOMObjectProvider](self, "DOMObjectProvider");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "documentStyle");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "scrollViewController:didApplyDocumentStyle:", self, v58);

        }
        ++v55;
      }
      while (v53 != v55);
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v53);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[SXScrollViewController footerBlueprint](self, "footerBlueprint", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "items");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v74;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v74 != v63)
          objc_enumerationMutation(v60);
        v65 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v64);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SXScrollViewController DOMObjectProvider](self, "DOMObjectProvider");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "documentStyle");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "scrollViewController:didApplyDocumentStyle:", self, v67);

        }
        ++v64;
      }
      while (v62 != v64);
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v62);
  }

  -[SXScrollViewController restoredScrollPosition](self, "restoredScrollPosition");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    v70 = objc_msgSend(v5, "isComplete");

    if (v70)
    {
      -[SXScrollViewController restoredScrollPosition](self, "restoredScrollPosition");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXScrollViewController updateScrollPosition:animated:](self, "updateScrollPosition:animated:", v71, 0);

      -[SXScrollViewController restoredScrollPosition](self, "restoredScrollPosition");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXScrollViewController setPreviouslyRestoredScrollPosition:](self, "setPreviouslyRestoredScrollPosition:", v72);

      -[SXScrollViewController setRestoredScrollPosition:](self, "setRestoredScrollPosition:", 0);
    }
  }

}

- (void)hideContentsForLayoutWithInteractor:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__SXScrollViewController_hideContentsForLayoutWithInteractor___block_invoke;
  v3[3] = &unk_24D6874A8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v3);
}

void __62__SXScrollViewController_hideContentsForLayoutWithInteractor___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)displayContentsAfterLayoutWithInteractor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];

  if (-[SXScrollViewController transitioning](self, "transitioning", a3))
  {
    -[SXScrollViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationForKey:", CFSTR("bounds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SXScrollViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v10 = v9;
      objc_msgSend(v6, "beginTime");
      v12 = v10 - v11;

      objc_msgSend(v6, "duration");
      v14 = v13 - v12;
      if (v14 >= 0.0)
        v15 = v14;
      else
        v15 = 0.0;
    }
    else
    {
      v15 = 0.15;
    }

  }
  else
  {
    v15 = 0.15;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __67__SXScrollViewController_displayContentsAfterLayoutWithInteractor___block_invoke;
  v16[3] = &unk_24D6874A8;
  v16[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v16, 0, v15, 0.0);
}

void __67__SXScrollViewController_displayContentsAfterLayoutWithInteractor___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)addComponentView:(id)a3
{
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;

  v21 = a3;
  -[SXScrollViewController tangierController](self, "tangierController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialSubviewCount");

  for (i = 0; ; ++i)
  {
    -[SXScrollViewController canvasViewController](self, "canvasViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[SXScrollViewController canvasViewController](self, "canvasViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (i >= v9)
    {
      objc_msgSend(v11, "addSubview:", v21);
      goto LABEL_8;
    }
    objc_msgSend(v11, "subviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
      -[SXScrollViewController canvasViewController](self, "canvasViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "subviews");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "indexOfObject:", v15);

      v20 = objc_msgSend(v15, "componentIndex");
      if (v20 > objc_msgSend(v21, "componentIndex"))
        break;
    }

  }
  -[SXScrollViewController canvasViewController](self, "canvasViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSubview:atIndex:", v21, v19);
LABEL_8:

}

- (void)removeComponentView:(id)a3
{
  objc_msgSend(a3, "removeFromSuperview");
}

- (void)updateViewportForBlueprint:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double Width;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v4 = a3;
  -[SXScrollViewController viewport](self, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUpdates");

  objc_msgSend(v4, "blueprintSize");
  v7 = v6;
  v9 = v8;
  -[SXScrollViewController headerHeight](self, "headerHeight");
  v11 = v9 + v10;
  -[SXScrollViewController viewport](self, "viewport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDocumentSize:", v7, v11);

  -[SXScrollViewController viewport](self, "viewport");
  v13 = objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController headerHeight](self, "headerHeight");
  v15 = v14;
  -[SXScrollViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  Width = CGRectGetWidth(v55);
  objc_msgSend(v4, "blueprintSize");
  v19 = v18;

  objc_msgSend((id)v13, "setContentFrame:", 0.0, v15, Width, v19);
  -[SXScrollViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_opt_respondsToSelector();

  v21 = 0.0;
  if ((v13 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "navigationBarHeightForScrollViewController:", self);
    v21 = v23;

  }
  -[SXScrollViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "toolBarHeightForScrollViewController:", self);

  }
  -[SXScrollViewController scrollView](self, "scrollView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentOffset");
  -[SXScrollViewController scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  -[SXScrollViewController scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contentSize");

  -[SXScrollViewController scrollView](self, "scrollView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "contentOffset");
  -[SXScrollViewController scrollView](self, "scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  CGRectGetHeight(v56);

  -[SXScrollViewController headerHeight](self, "headerHeight");
  v33 = v32;
  -[SXScrollViewController scrollView](self, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "contentOffset");
  v36 = v21 + v35;

  if (v36 >= 0.0)
    v37 = v36;
  else
    v37 = 0.0;
  v38 = v33 - v37;
  if (v38 >= 0.0)
    v39 = v38;
  else
    v39 = 0.0;
  -[SXScrollViewController scrollView](self, "scrollView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "contentOffset");
  v42 = v41;

  v43 = -fmin(v42, 0.0);
  if (v42 >= 0.0)
    v43 = 0.0;
  if (v21 >= v43)
    v43 = v21;
  v44 = v39 + v43;
  -[SXScrollViewController scrollView](self, "scrollView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  CGRectGetHeight(v57);

  -[SXScrollViewController scrollView](self, "scrollView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "contentOffset");
  v48 = v44 + v47;

  -[SXScrollViewController viewport](self, "viewport");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bounds");
  objc_msgSend(v49, "setDynamicBounds:", 0.0, v48);

  -[SXScrollViewController viewport](self, "viewport");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController scrollView](self, "scrollView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  objc_msgSend(v51, "setBounds:");

  -[SXScrollViewController viewport](self, "viewport");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setInterfaceOrientation:", -[SXScrollViewController interfaceOrientation](self, "interfaceOrientation"));

  -[SXScrollViewController viewport](self, "viewport");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "endUpdates");

}

- (BOOL)isPresentingFullscreenCanvas
{
  void *v2;
  BOOL v3;

  -[SXScrollViewController fullscreenCanvasViewController](self, "fullscreenCanvasViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGRect)frameOfComponentWithVideoPlayerViewController:(id)a3
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
  CGRect result;

  -[SXScrollViewController videoComponentViewForVideoPlayerViewController:](self, "videoComponentViewForVideoPlayerViewController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contentFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SXScrollViewController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

  }
  else
  {
    v16 = *MEMORY[0x24BDBF090];
    v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)videoComponentViewForVideoPlayerViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SXScrollViewController componentController](self, "componentController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flattenedComponentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "videoPlayerViewController");
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v4)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (BOOL)textSelectionEnabled
{
  return -[SXTangierController selectionEnabled](self->_tangierController, "selectionEnabled");
}

- (void)setTextSelectionEnabled:(BOOL)a3
{
  -[SXTangierController setSelectionEnabled:](self->_tangierController, "setSelectionEnabled:", a3);
}

- (NSString)selectedText
{
  void *v2;
  void *v3;

  -[SXScrollViewController textSelectionManager](self, "textSelectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)headlineAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  CGPoint v19;
  CGRect v20;

  -[SXScrollViewController componentController](self, "componentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentViewsForRole:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "absoluteFrame");
  v19.x = v15;
  v19.y = v16;
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  LODWORD(v3) = CGRectContainsPoint(v20, v19);

  if ((_DWORD)v3)
  {
    objc_msgSend(v5, "_accessibilityFindDescendant:", &__block_literal_global_2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __54__SXScrollViewController_headlineAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

- (id)scrollPosition
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[SXScrollViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  -[SXScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v5 + v7;

  if (v8 > 0.0
    || (-[SXScrollViewController presentationAttributes](self, "presentationAttributes"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "useTransparentToolbar"),
        v9,
        v10))
  {
    -[SXScrollViewController componentController](self, "componentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "flattenedComponentViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController scrollPositionForPlayingVideoComponentInComponentViews:](self, "scrollPositionForPlayingVideoComponentInComponentViews:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[SXScrollViewController componentController](self, "componentController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "flattenedComponentViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXScrollViewController textScrollPositionForComponentViews:](self, "textScrollPositionForComponentViews:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[SXScrollViewController componentController](self, "componentController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "flattenedComponentViews");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXScrollViewController scrollPositionForComponentViews:](self, "scrollPositionForComponentViews:", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)scrollPositionForComponentViews:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  SXComponentScrollPosition *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double MinY;
  void *v38;
  double v39;
  SXComponentScrollPosition *v40;
  void *v42;
  CGRect v43;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController dictionaryWithComponentOffsets:forComponentViews:](self, "dictionaryWithComponentOffsets:forComponentViews:", v6, v5);

  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SXScrollViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toView:", v19, v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = [SXComponentScrollPosition alloc];
  objc_msgSend(v9, "component");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController componentController](self, "componentController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "presentedBlueprint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "columnLayout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constrainedViewportSize");
  v36 = v35;
  v43.origin.x = v21;
  v43.origin.y = v23;
  v43.size.width = v25;
  v43.size.height = v27;
  MinY = CGRectGetMinY(v43);
  -[SXScrollViewController scrollView](self, "scrollView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "contentOffset");
  v40 = -[SXComponentScrollPosition initWithComponentIdentifier:canvasWidth:relativePageOffset:](v28, "initWithComponentIdentifier:canvasWidth:relativePageOffset:", v30, v36, MinY - v39);

  return v40;
}

- (void)dictionaryWithComponentOffsets:(id)a3 forComponentViews:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v12, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[SXScrollViewController viewport](self, "viewport");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "frame");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend(v12, "superview");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "convertRectToViewportCoordinateSpace:fromView:", v23, v16, v18, v20, v22);
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;

          v39.origin.x = v25;
          v39.origin.y = v27;
          v39.size.width = v29;
          v39.size.height = v31;
          if (CGRectGetMinY(v39) > 0.0)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKey:", v12, v32);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v9);
  }

}

- (id)scrollPositionForPlayingVideoComponentInComponentViews:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double MinY;
  void *v53;
  double v54;
  SXComponentScrollPosition *v55;
  SXComponentScrollPosition *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v63 = *MEMORY[0x24BDAC8D0];
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v59;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "videoPlayerViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isPlaying") & 1) != 0)
          {
            objc_msgSend(v10, "absoluteFrame");
            v13 = v12;
            v15 = v14;
            v17 = v16;
            v19 = v18;
            -[SXScrollViewController viewport](self, "viewport");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dynamicBounds");
            v66.origin.x = v21;
            v66.origin.y = v22;
            v66.size.width = v23;
            v66.size.height = v24;
            v64.origin.x = v13;
            v64.origin.y = v15;
            v64.size.width = v17;
            v64.size.height = v19;
            v25 = CGRectIntersectsRect(v64, v66);

            if (v25)
            {
              objc_msgSend(v10, "superview");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "frame");
              v28 = v27;
              v30 = v29;
              v32 = v31;
              v34 = v33;
              -[SXScrollViewController scrollView](self, "scrollView");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "convertRect:toView:", v35, v28, v30, v32, v34);
              v37 = v36;
              v39 = v38;
              v41 = v40;
              v43 = v42;

              v57 = [SXComponentScrollPosition alloc];
              objc_msgSend(v10, "component");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "identifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXScrollViewController componentController](self, "componentController");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "presentedBlueprint");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "layoutOptions");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "columnLayout");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "constrainedViewportSize");
              v51 = v50;
              v65.origin.x = v37;
              v65.origin.y = v39;
              v65.size.width = v41;
              v65.size.height = v43;
              MinY = CGRectGetMinY(v65);
              -[SXScrollViewController scrollView](self, "scrollView");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "contentOffset");
              v55 = -[SXComponentScrollPosition initWithComponentIdentifier:canvasWidth:relativePageOffset:](v57, "initWithComponentIdentifier:canvasWidth:relativePageOffset:", v45, v51, MinY - v54);

              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v6);
  }
  v55 = 0;
LABEL_15:

  return v55;
}

- (id)textScrollPositionForComponentViews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SXScrollViewController componentController](self, "componentController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedBlueprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columnLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constrainedViewportSize");

  -[SXScrollViewController tangierController](self, "tangierController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController viewport](self, "viewport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dynamicBounds");
  objc_msgSend(v8, "scrollPositionForVisibleBounds:canvasWidth:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateScrollPosition:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double MinY;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  char v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v4 = a4;
  v59 = a3;
  -[SXScrollViewController componentController](self, "componentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPresented");

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v59;
      -[SXScrollViewController componentController](self, "componentController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentViewForIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SXScrollViewController tangierController](self, "tangierController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "characterIndex");
      objc_msgSend(v8, "componentIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pointForCharacterAtIndex:inComponentWithIdentifier:", v13, v14);
      v16 = v15;

      objc_msgSend(v11, "absoluteFrame");
      v17 = v16 + CGRectGetMinY(v60);
      -[SXScrollViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[SXScrollViewController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "navigationBarHeightForScrollViewController:", self);
        v17 = v17 - v20;

      }
      objc_msgSend(v8, "canvasWidth");
      v22 = v21;
      -[SXScrollViewController componentController](self, "componentController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "presentedBlueprint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "layoutOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "columnLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constrainedViewportSize");
      v28 = v27;

      if (v22 == v28)
      {
        objc_msgSend(v8, "relativeTextOffset");
        v17 = v17 - v29;
      }
      if (v17 <= 10.0)
        MinY = 0.0;
      else
        MinY = v17;
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v59;
      -[SXScrollViewController componentController](self, "componentController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentViewForIdentifier:", v32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(v11, "absoluteFrame");
      MinY = CGRectGetMinY(v61);
      objc_msgSend(v8, "canvasWidth");
      v34 = v33;
      -[SXScrollViewController componentController](self, "componentController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "presentedBlueprint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "layoutOptions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "columnLayout");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constrainedViewportSize");
      v40 = v39;

      if (v34 == v40)
      {
        objc_msgSend(v8, "relativePageOffset");
        MinY = MinY - v41;
      }
      else
      {
        -[SXScrollViewController delegate](self, "delegate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_opt_respondsToSelector();

        if ((v43 & 1) != 0)
        {
          -[SXScrollViewController delegate](self, "delegate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "navigationBarHeightForScrollViewController:", self);
          v46 = MinY - v45;

          -[SXScrollViewController scrollView](self, "scrollView");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "contentInset");
          v49 = -v48;

          -[SXScrollViewController scrollView](self, "scrollView");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "contentSize");
          v52 = v51;
          -[SXScrollViewController scrollView](self, "scrollView");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "frame");
          v54 = v52 - CGRectGetHeight(v62);

          if (v54 <= v49)
            v55 = v49;
          else
            v55 = v54;
          if (v46 >= v55)
            MinY = v55;
          else
            MinY = v46;
        }
      }
      if (MinY <= 10.0)
        MinY = 0.0;
LABEL_24:
      -[SXScrollViewController scrollView](self, "scrollView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setContentOffset:animated:", v4, 0.0, MinY);

      goto LABEL_25;
    }
  }
  else
  {
    -[SXScrollViewController setRestoredScrollPosition:](self, "setRestoredScrollPosition:", v59);
  }
LABEL_26:
  -[SXScrollViewController tangierController](self, "tangierController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "icc");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "invalidateLayers");

}

- (BOOL)shouldRestoreScrollPositionForLayoutBlueprint:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double MaxY;
  void *v16;
  double v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isComplete") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SXScrollViewController componentController](self, "componentController", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flattenedComponentViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "component");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "componentBlueprintForComponentIdentifier:includeChildren:", v13, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v14, "hasValidLayout") & 1) == 0)
          {
            objc_msgSend(v14, "absoluteFrame");
            MaxY = CGRectGetMaxY(v26);
            -[SXScrollViewController viewport](self, "viewport");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "dynamicBounds");
            v18 = v17;

            if (MaxY < v18)
            {

              v5 = 1;
              goto LABEL_14;
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_14:

  }
  return v5;
}

- (SXComponentController)componentController
{
  return self->_componentController;
}

- (SXComponentBehaviorController)behaviorController
{
  return self->_behaviorController;
}

- (SXComponentAnimationController)animationController
{
  return self->_animationController;
}

- (BOOL)allowInteractivityFocusForComponent:(id)a3
{
  BOOL v4;
  void *v5;

  if (-[SXScrollViewController isPreviewing](self, "isPreviewing", a3))
    return 0;
  -[SXScrollViewController viewport](self, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "appearState") == 2;

  return v4;
}

- (BOOL)addInteractivityFocusForComponent:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[SXScrollViewController isPreviewing](self, "isPreviewing")
    || (-[SXScrollViewController focussedComponentView](self, "focussedComponentView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = 0;
  }
  else
  {
    -[SXScrollViewController textSelectionManager](self, "textSelectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearSelection");

    -[SXScrollViewController setFocussedComponentView:](self, "setFocussedComponentView:", v4);
    -[SXScrollViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
    objc_msgSend(v8, "setScrollEnabled:", 1);

  }
  return v6;
}

- (void)removeInteractivityFocusForComponent:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[SXScrollViewController focussedComponentView](self, "focussedComponentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SXScrollViewController setFocussedComponentView:](self, "setFocussedComponentView:", 0);
    -[SXScrollViewController scrollView](self, "scrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 1);

  }
}

- (id)requestFullScreenCanvasViewControllerForComponent:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  SXFullscreenCanvasViewController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = objc_alloc_init(SXFullscreenCanvasViewController);
  -[SXFullscreenCanvasViewController view](v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[SXScrollViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasViewController setStatusBarStyle:](v6, "setStatusBarStyle:", objc_msgSend(v9, "preferredStatusBarStyle"));

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v6);
  objc_msgSend(v10, "setModalPresentationStyle:", 5);
  objc_msgSend(v10, "setModalPresentationCapturesStatusBarAppearance:", 1);
  objc_msgSend(v10, "setNavigationBarHidden:animated:", 1, 0);
  -[SXScrollViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 0, v5);

  -[SXScrollViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollViewControllerRequestsFullscreen:", self);

  }
  -[SXScrollViewController setFullscreenCanvasViewController:](self, "setFullscreenCanvasViewController:", v6);
  -[SXScrollViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollViewController:enableNavigation:", self, 0);

  }
  -[SXScrollViewController fullscreenCanvasViewController](self, "fullscreenCanvasViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)willReturnToFullscreenForComponent:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SXScrollViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willReturnToFullscreen:", self);

  }
}

- (id)requestFullScreenCanvasViewControllerForComponent:(id)a3 canvasController:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SXScrollViewController fullscreenCanvasViewController](self, "fullscreenCanvasViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[SXScrollViewController dismissFullscreenCanvasForComponent:](self, "dismissFullscreenCanvasForComponent:", v8);
  -[SXScrollViewController setCurrentCanvasController:](self, "setCurrentCanvasController:", v9);
  -[SXScrollViewController requestFullScreenCanvasViewControllerForComponent:withCompletionBlock:](self, "requestFullScreenCanvasViewControllerForComponent:withCompletionBlock:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)willDismissFullscreenCanvasForComponent:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SXScrollViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewControllerWillDismissFullscreen:", self);

  }
}

- (void)dismissFullscreenCanvasForComponent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  -[SXScrollViewController fullscreenCanvasViewController](self, "fullscreenCanvasViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXScrollViewController fullscreenCanvasViewController](self, "fullscreenCanvasViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);
    -[SXScrollViewController setCurrentCanvasController:](self, "setCurrentCanvasController:", 0);
    -[SXScrollViewController setFullscreenCanvasViewController:](self, "setFullscreenCanvasViewController:", 0);
    -[SXScrollViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SXScrollViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scrollViewControllerDismissFullscreen:", self);

    }
  }
  -[SXScrollViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollViewController:enableNavigation:", self, 1);

  }
}

- (BOOL)isScrolling
{
  void *v2;
  char v3;

  -[SXScrollViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrolling");

  return v3;
}

- (void)scrollToRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  id v9;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXScrollViewController scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollRectToVisible:animated:", v4, x, y, width, height);

}

- (id)presentingContentViewController
{
  void *v2;
  void *v3;

  -[SXScrollViewController tangierController](self, "tangierController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cvc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateBehaviorForComponentView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXScrollViewController behaviorController](self, "behaviorController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateComponentView:", v4);

}

- (BOOL)shouldPreventDraggingForScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  v4 = a3;
  -[SXScrollViewController focussedComponentView](self, "focussedComponentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5)
  {
    -[SXScrollViewController focussedComponentView](self, "focussedComponentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "gestureShouldBegin:", v7);

    if (!v8)
      v9 = 1;
  }

  return v9;
}

- (BOOL)scrollView:(id)a3 shouldOccludeAccessibilityElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[SXScrollViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "scrollViewController:shouldOccludeAccessibilityElement:", self, v7);
LABEL_9:
    v14 = v11;

    goto LABEL_10;
  }
  objc_msgSend(v6, "accessibilityContainer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v10 = (void *)v12;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(v10, "accessibilityContainer");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
      if (!v13)
        goto LABEL_7;
    }
    v11 = objc_msgSend(v10, "shouldOccludeAccessibilityElement:", v7);
    goto LABEL_9;
  }
LABEL_7:
  v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)accessibilityShouldScrollForScrollView:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;

  v4 = a4;
  -[SXScrollViewController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v8, "accessibilityShouldScrollForScrollViewController:defaultValue:", self, v4);

  }
  return v4;
}

- (BOOL)accessibilityShouldHandleInteractionForView:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_respondsToSelector() & 1) != 0
    && -[SXComponentInteractionManager accessibilityShouldHandleInteractionForComponentView:](self->_componentInteractionManager, "accessibilityShouldHandleInteractionForComponentView:", v4);

  return v5;
}

- (void)tangierControllerDidScroll:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  -[SXScrollViewController setPreviouslyRestoredScrollPosition:](self, "setPreviouslyRestoredScrollPosition:", 0);
  -[SXScrollViewController componentController](self, "componentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresented");

  if (v5)
  {
    -[SXScrollViewController componentController](self, "componentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedBlueprint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScrollViewController updateViewportForBlueprint:](self, "updateViewportForBlueprint:", v7);

  }
  -[SXScrollViewController updateStickyHeaders](self, "updateStickyHeaders");
  -[SXScrollViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrollViewControllerDidScroll:", self);

  }
  -[SXScrollViewController scrollReporter](self, "scrollReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didScroll");

  -[SXScrollViewController updatePrimaryContentScrollProgress](self, "updatePrimaryContentScrollProgress");
}

- (void)tangierControllerWillStartScrolling:(id)a3
{
  id v3;

  -[SXScrollViewController scrollReporter](self, "scrollReporter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willStartScrolling");

}

- (void)tangierControllerDidStopScrolling:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[SXScrollViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewControllerDidStopScrolling:", self);

  }
  -[SXScrollViewController scrollReporter](self, "scrollReporter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didStopScrolling");

}

- (void)tangierController:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  SXArticleScrollEvent *v11;

  v5 = a4;
  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  objc_msgSend(v5, "contentSize");
  v9 = v8;

  v11 = objc_alloc_init(SXArticleScrollEvent);
  -[SXArticleScrollEvent setStartPosition:](v11, "setStartPosition:", fmax(v7 / v9 * 100.0, 0.0));
  -[SXScrollViewController articleScrollEvents](self, "articleScrollEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (void)tangierController:(id)a3 scrollViewDidEndDragging:(id)a4 willDecelerate:(BOOL)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  if (!a5)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[SXScrollViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scrollViewControllerDidStopScrolling:", self);

    }
  }

}

- (void)tangierController:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y;
  id v9;
  double v10;
  double v11;
  double v12;
  CGFloat Height;
  double v14;
  double v15;
  void *v16;
  char v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
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
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  y = a5.y;
  v9 = a4;
  v10 = a6->y;
  v36 = v9;
  if (v10 > 0.0)
  {
    objc_msgSend(v9, "contentSize");
    v12 = v11;
    objc_msgSend(v36, "bounds");
    Height = CGRectGetHeight(v37);
    v9 = v36;
    if (v10 < v12 + Height)
    {
      -[SXScrollViewController snaplineForContentOffset:velocity:](self, "snaplineForContentOffset:velocity:", a6->y, y);
      v15 = v14;
      -[SXScrollViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      v18 = 0.0;
      if ((v17 & 1) != 0)
      {
        -[SXScrollViewController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "navigationBarHeightForScrollViewController:", self);
        v18 = v20;

      }
      v9 = v36;
      if (v15 != 9.22337204e18)
      {
        -[SXScrollViewController scrollView](self, "scrollView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "contentSize");
        v23 = v22;
        -[SXScrollViewController scrollView](self, "scrollView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        v25 = v23 - CGRectGetHeight(v38);

        v9 = v36;
        if (v15 < v25)
          a6->y = v15 - v18;
      }
    }
  }
  v26 = a6->y;
  objc_msgSend(v9, "contentSize");
  if (v26 / v27 * 100.0 <= 100.0)
    v28 = v26 / v27 * 100.0;
  else
    v28 = 100.0;
  objc_msgSend(v36, "contentOffset");
  v30 = v29;
  objc_msgSend(v36, "bounds");
  v31 = v30 + CGRectGetHeight(v39);
  objc_msgSend(v36, "contentSize");
  if (v31 / v32 * 100.0 <= 100.0)
    v33 = v31 / v32 * 100.0;
  else
    v33 = 100.0;
  -[SXScrollViewController articleScrollEvents](self, "articleScrollEvents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lastObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setTargetPosition:", v28);
  objc_msgSend(v35, "setEndPosition:", v33);
  objc_msgSend(v35, "setVelocity:", y);
  objc_msgSend(v35, "determineEndDate");

}

- (void)spacebarPressedWithModifierFlags:(int64_t)a3
{
  int v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double Height;
  void *v10;
  char v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v3 = a3;
  -[SXScrollViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  -[SXScrollViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Height = CGRectGetHeight(v19);

  -[SXScrollViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  v12 = 0.0;
  if ((v11 & 1) != 0)
  {
    -[SXScrollViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBarHeightForScrollViewController:", self);
    v12 = v14;

  }
  if ((v3 & 0x20000) == 0)
    -[SXScrollViewController snaplineForContentOffset:velocity:](self, "snaplineForContentOffset:velocity:", v7 + Height + v12, 1.79769313e308);
  -[SXScrollViewController scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentSize");
  -[SXScrollViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  CGRectGetHeight(v20);

  -[SXScrollViewController scrollView](self, "scrollView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SXScrollViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentOffset");
  objc_msgSend(v18, "setContentOffset:animated:", 1);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SXScrollViewController focussedComponentView](self, "focussedComponentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXScrollViewController focussedComponentView](self, "focussedComponentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "gestureShouldBegin:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)shouldStartPreviewForInteractionContextManager:(id)a3
{
  void *v3;
  BOOL v4;

  -[SXScrollViewController focussedComponentView](self, "focussedComponentView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)willStartPreviewingForInteractionContextManager:(id)a3
{
  -[SXScrollViewController setIsPreviewing:](self, "setIsPreviewing:", 1);
}

- (void)willEndPreviewingForInteractionContextManager:(id)a3
{
  -[SXScrollViewController setIsPreviewing:](self, "setIsPreviewing:", 0);
}

- (void)finishArticleScrollEvents
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SXScrollViewController articleScrollEvents](self, "articleScrollEvents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[SXScrollViewController analyticsReportingContainer](self, "analyticsReportingContainer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "analyticsReporting");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reportEvent:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[SXScrollViewController articleScrollEvents](self, "articleScrollEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (double)snaplineForContentOffset:(double)a3 velocity:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  _BOOL4 v25;
  double v26;
  void *v27;
  double v28;
  BOOL v30;
  float v31;
  double v32;
  uint64_t v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[SXScrollViewController snapLines](self, "snapLines");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v10 = (int)a3;
    do
    {
      v11 = 0;
      v34 = v8;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
        -[SXScrollViewController scrollView](self, "scrollView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentOffset");
        v15 = (uint64_t)vabdd_f64(a3, v14);

        v15 /= 50;
        v16 = objc_msgSend(v12, "intValue");
        v17 = -7 * v15 + v16;
        v18 = 14 * v15;
        if (v10 >= v17 && v10 - v17 < v18)
        {
          v20 = v10;
          v21 = v9;
          v22 = (double)v16;
          -[SXScrollViewController scrollView](self, "scrollView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contentOffset");
          v25 = v24 >= v22 || a4 <= 0.0;
          if (v25
            && ((-[SXScrollViewController scrollView](self, "scrollView"),
                 v35 = (void *)objc_claimAutoreleasedReturnValue(),
                 objc_msgSend(v35, "contentOffset"),
                 a4 >= 0.0)
             || v26 <= v22))
          {

            v10 = v20;
            v8 = v34;
          }
          else
          {
            -[SXScrollViewController scrollView](self, "scrollView");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "contentOffset");
            v30 = (unint64_t)v28 < v17 || (unint64_t)v28 - v17 >= v18;

            if (v25)
            v9 = v21;
            v10 = v20;
            v8 = v34;
            if (v30)
            {
              objc_msgSend(v12, "floatValue");
              v32 = v31;
              goto LABEL_30;
            }
          }
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v8);
  }
  v32 = 9.22337204e18;
LABEL_30:

  return v32;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v4;

  -[SXScrollViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[SXScrollViewController showScrollViewIfNeeded](self, "showScrollViewIfNeeded");
}

- (void)showScrollViewIfNeeded
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;

  -[SXScrollViewController componentController](self, "componentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedBlueprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SXScrollViewController isValidBlueprintForCurrentSize:](self, "isValidBlueprintForCurrentSize:", v4);

  if (v5)
  {
    -[SXScrollViewController scrollView](self, "scrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

  }
}

- (BOOL)isValidBlueprintForCurrentSize:(id)a3
{
  id v4;
  void *v5;
  double Width;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGRect v12;

  v4 = a3;
  -[SXScrollViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v12);
  objc_msgSend(v4, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "viewportSize");
  v9 = Width - v8;

  v10 = -v9;
  if (v9 >= 0.0)
    v10 = v9;
  return v10 < 0.00000011920929;
}

- (id)interactiveCanvasController
{
  void *v2;
  void *v3;

  -[SXScrollViewController tangierController](self, "tangierController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)canvasViewController
{
  void *v2;
  void *v3;

  -[SXScrollViewController tangierController](self, "tangierController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cvc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SXMediaPlaybackController)mediaPlaybackController
{
  return self->_mediaPlaybackController;
}

- (SXFullscreenVideoPlaybackManager)fullscreenVideoPlaybackManager
{
  return self->_fullscreenVideoPlaybackManager;
}

- (SXAdDocumentStateManager)adDocumentStateManager
{
  return self->_adDocumentStateManager;
}

- (SXTextSelectionManager)textSelectionManager
{
  return self->_textSelectionManager;
}

- (SXContext)context
{
  return self->_context;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (SXScrollViewControllerDelegate)delegate
{
  return (SXScrollViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXPresentationAttributes)presentationAttributes
{
  return self->_presentationAttributes;
}

- (SXTransitionDataSourceProvider)transitionDataSourceProvider
{
  return self->_transitionDataSourceProvider;
}

- (SXDocumentControllerContainer)documentControllerContainer
{
  return self->_documentControllerContainer;
}

- (SXResourceDataSourceContainer)resourceDataSourceContainer
{
  return self->_resourceDataSourceContainer;
}

- (SXAnalyticsReportingContainer)analyticsReportingContainer
{
  return self->_analyticsReportingContainer;
}

- (SXPresentationDelegateContainer)presentationDelegateContainer
{
  return self->_presentationDelegateContainer;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (SXPresentationAttributesManager)presentationAttributesManager
{
  return self->_presentationAttributesManager;
}

- (SXViewControllerPresentingManager)viewControllerPresentingManager
{
  return self->_viewControllerPresentingManager;
}

- (SXScrollPositionManager)scrollPositionManager
{
  return self->_scrollPositionManager;
}

- (SXComponentInteractionManager)componentInteractionManager
{
  return self->_componentInteractionManager;
}

- (SXLinkHoverStylingManager)hoverStyleManager
{
  return self->_hoverStyleManager;
}

- (SXInteractionContextManager)interactionContextManager
{
  return self->_interactionContextManager;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXFormatInteractor)interactor
{
  return self->_interactor;
}

- (SXDocumentSectionManager)documentSectionManager
{
  return self->_documentSectionManager;
}

- (SXDocumentSectionBlueprint)headerBlueprint
{
  return self->_headerBlueprint;
}

- (SXDocumentSectionBlueprint)footerBlueprint
{
  return self->_footerBlueprint;
}

- (SXDocumentSectionBlueprint)contentOverlayBlueprint
{
  return self->_contentOverlayBlueprint;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void)setViewport:(id)a3
{
  objc_storeStrong((id *)&self->_viewport, a3);
}

- (SXViewportDebugger)viewportDebugger
{
  return self->_viewportDebugger;
}

- (void)setViewportDebugger:(id)a3
{
  objc_storeStrong((id *)&self->_viewportDebugger, a3);
}

- (SXComponentView)focussedComponentView
{
  return self->_focussedComponentView;
}

- (void)setFocussedComponentView:(id)a3
{
  objc_storeStrong((id *)&self->_focussedComponentView, a3);
}

- (SXFullscreenCanvasViewController)fullscreenCanvasViewController
{
  return self->_fullscreenCanvasViewController;
}

- (void)setFullscreenCanvasViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenCanvasViewController, a3);
}

- (SXFullscreenCanvasController)currentCanvasController
{
  return self->_currentCanvasController;
}

- (void)setCurrentCanvasController:(id)a3
{
  objc_storeStrong((id *)&self->_currentCanvasController, a3);
}

- (SXScrollPosition)restoredScrollPosition
{
  return self->_restoredScrollPosition;
}

- (void)setRestoredScrollPosition:(id)a3
{
  objc_storeStrong((id *)&self->_restoredScrollPosition, a3);
}

- (SXScrollPosition)previouslyRestoredScrollPosition
{
  return self->_previouslyRestoredScrollPosition;
}

- (void)setPreviouslyRestoredScrollPosition:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyRestoredScrollPosition, a3);
}

- (BOOL)restoreScrollPositionOnNextLayout
{
  return self->_restoreScrollPositionOnNextLayout;
}

- (void)setRestoreScrollPositionOnNextLayout:(BOOL)a3
{
  self->_restoreScrollPositionOnNextLayout = a3;
}

- (NSOrderedSet)snapLines
{
  return self->_snapLines;
}

- (void)setSnapLines:(id)a3
{
  objc_storeStrong((id *)&self->_snapLines, a3);
}

- (SXDocumentStyleRenderer)documentStyleRenderer
{
  return self->_documentStyleRenderer;
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (void)setTangierController:(id)a3
{
  objc_storeStrong((id *)&self->_tangierController, a3);
}

- (NSMutableArray)articleScrollEvents
{
  return self->_articleScrollEvents;
}

- (void)setArticleScrollEvents:(id)a3
{
  objc_storeStrong((id *)&self->_articleScrollEvents, a3);
}

- (UIViewControllerPreviewing)previewingContext
{
  return self->_previewingContext;
}

- (void)setPreviewingContext:(id)a3
{
  objc_storeStrong((id *)&self->_previewingContext, a3);
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (void)setIsPreviewing:(BOOL)a3
{
  self->_isPreviewing = a3;
}

- (SXScrollReporting)scrollReporter
{
  return self->_scrollReporter;
}

- (SXVideoPlayerViewControllerManager)videoPlayerViewControllerManager
{
  return self->_videoPlayerViewControllerManager;
}

- (SXFontIndex)fontIndex
{
  return self->_fontIndex;
}

- (SXDocumentProvider)documentProvider
{
  return self->_documentProvider;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setFooterHeight:(double)a3
{
  self->_footerHeight = a3;
}

- (double)contentOverlayTopOffset
{
  return self->_contentOverlayTopOffset;
}

- (void)setContentOverlayTopOffset:(double)a3
{
  self->_contentOverlayTopOffset = a3;
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_fontIndex, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllerManager, 0);
  objc_storeStrong((id *)&self->_scrollReporter, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
  objc_storeStrong((id *)&self->_articleScrollEvents, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
  objc_storeStrong((id *)&self->_documentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_snapLines, 0);
  objc_storeStrong((id *)&self->_previouslyRestoredScrollPosition, 0);
  objc_storeStrong((id *)&self->_restoredScrollPosition, 0);
  objc_storeStrong((id *)&self->_currentCanvasController, 0);
  objc_storeStrong((id *)&self->_fullscreenCanvasViewController, 0);
  objc_storeStrong((id *)&self->_focussedComponentView, 0);
  objc_storeStrong((id *)&self->_viewportDebugger, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_contentOverlayBlueprint, 0);
  objc_storeStrong((id *)&self->_footerBlueprint, 0);
  objc_storeStrong((id *)&self->_headerBlueprint, 0);
  objc_storeStrong((id *)&self->_documentSectionManager, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_interactionContextManager, 0);
  objc_storeStrong((id *)&self->_hoverStyleManager, 0);
  objc_storeStrong((id *)&self->_componentInteractionManager, 0);
  objc_storeStrong((id *)&self->_scrollPositionManager, 0);
  objc_storeStrong((id *)&self->_viewControllerPresentingManager, 0);
  objc_storeStrong((id *)&self->_presentationAttributesManager, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_presentationDelegateContainer, 0);
  objc_storeStrong((id *)&self->_analyticsReportingContainer, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceContainer, 0);
  objc_storeStrong((id *)&self->_documentControllerContainer, 0);
  objc_storeStrong((id *)&self->_transitionDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_presentationAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_textSelectionManager, 0);
  objc_storeStrong((id *)&self->_adDocumentStateManager, 0);
  objc_storeStrong((id *)&self->_fullscreenVideoPlaybackManager, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackController, 0);
  objc_storeStrong((id *)&self->_componentController, 0);
  objc_storeStrong((id *)&self->_behaviorController, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
}

- (id)scrollViewForStripGalleryWithComponentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXScrollViewController componentController](self, "componentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentViewForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "itemizedScrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)presentFullscreenGalleryWithComponentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SXScrollViewController componentController](self, "componentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentViewForIdentifier:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forceImageViewFullscreen:", v7);

}

- (id)scrollViewForFullscreenGalleryWithComponentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SXScrollViewController componentController](self, "componentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentViewForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fullScreenCanvasController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemizedScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)loadContext:(os_log_t)log analyticsReporting:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217023000, log, OS_LOG_TYPE_ERROR, "Attempting to load document with nil context", v1, 2u);
}

@end
