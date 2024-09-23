@implementation SKUIDocumentContainerViewController

- (SKUIDocumentContainerViewController)initWithDocument:(id)a3 options:(id)a4 clientContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  SKUIDocumentContainerViewController *v25;
  SKUIDocumentContainerViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  NSDictionary *presentationOptions;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  SKUIMetricsPageRenderEvent *v41;
  NSString *urlString;
  void *v43;
  SKUIDocumentContainerViewController *v44;
  SKUIMetricsDOMChangeQueue *v45;
  SKUIDocumentContainerViewController *v46;
  void *v48;
  void *v49;
  _QWORD v50[4];
  SKUIDocumentContainerViewController *v51;
  objc_super v52;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG)))
  {
    if (v11)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  if (!v11)
  {
LABEL_5:
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "debugDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[%@]: Missing client context for %@"), v21, v22);

    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[%@]: Document options %@"), v24, v10);

  }
LABEL_6:
  v52.receiver = self;
  v52.super_class = (Class)SKUIDocumentContainerViewController;
  v25 = -[SKUIDocumentContainerViewController init](&v52, sel_init);
  v26 = v25;
  if (v25)
  {
    -[SKUIViewController setClientContext:](v25, "setClientContext:", v11);
    objc_msgSend(v10, "objectForKey:", CFSTR("sidepackType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("url"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v26->_urlString, v28);
    objc_msgSend(v9, "templateElement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = v29;
      -[SKUIDocumentContainerViewController _sidepackViewControllerWithOptions:clientContext:](v26, "_sidepackViewControllerWithOptions:clientContext:", v10, v11);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIDocumentContainerViewController navigationItem](v26, "navigationItem");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_setExistingNavigationItem:", v31);
    }
    else if (v29 || !v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = v26;
        v26 = 0;
        goto LABEL_27;
      }
      v33 = -[SKUIDocumentContainerViewController _newViewControllerWithTemplateElement:options:clientContext:](v26, "_newViewControllerWithTemplateElement:options:clientContext:", v29, v10, v11);
      v34 = v29;
      v31 = v33;
      v49 = v34;
      if (v33)
      {
        v31 = v33;
        v26->_templateViewElementType = objc_msgSend(v34, "elementType");
      }
      v30 = v31;
    }
    else
    {
      v49 = 0;
      v30 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
      objc_msgSend(v30, "view");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setBackgroundColor:", v32);

    }
    if (!v30)
    {
      v30 = v26;
      v26 = 0;
LABEL_26:
      v29 = v49;
LABEL_27:

      goto LABEL_28;
    }
    v48 = v27;
    objc_storeStrong((id *)&v26->_document, a3);
    -[IKAppDocument setDelegate:](v26->_document, "setDelegate:", v26);
    v26->_scrollingTabAppearanceStatus.progress = 1.0;
    *(_QWORD *)&v26->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    -[SKUIDocumentContainerViewController _setChildViewController:](v26, "_setChildViewController:", v30);
    v35 = objc_msgSend(v10, "copy");
    presentationOptions = v26->_presentationOptions;
    v26->_presentationOptions = (NSDictionary *)v35;

    -[IKAppDocument onLoad](v26->_document, "onLoad");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v26, sel__skui_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v37, "addObserver:selector:name:object:", v26, sel_documentDidSendMessage_, 0x1E73B3990, v26->_document);
    objc_msgSend(v11, "applicationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "options");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "pageRenderMetricsEnabled"))
    {
      v40 = +[SKUIMetricsPageRenderEvent shouldCollectPageRenderDataForDocument:](SKUIMetricsPageRenderEvent, "shouldCollectPageRenderDataForDocument:", v26->_document);

      v27 = v48;
      if (!v40)
      {
LABEL_25:

        goto LABEL_26;
      }
      v41 = objc_alloc_init(SKUIMetricsPageRenderEvent);
      -[SKUIDocumentContainerViewController setPageRenderEvent:](v26, "setPageRenderEvent:", v41);

      urlString = v26->_urlString;
      -[SKUIDocumentContainerViewController pageRenderEvent](v26, "pageRenderEvent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setPageURL:", urlString);

      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __78__SKUIDocumentContainerViewController_initWithDocument_options_clientContext___block_invoke;
      v50[3] = &unk_1E73A5BB0;
      v44 = v26;
      v51 = v44;
      +[SKUIMetricsAppLaunchEvent withPendingLaunchEvent:](SKUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", v50);
      v45 = objc_alloc_init(SKUIMetricsDOMChangeQueue);
      v46 = v44;
      v27 = v48;
      -[SKUIDocumentContainerViewController setDomChangeTimingQueue:](v46, "setDomChangeTimingQueue:", v45);

      v38 = v51;
    }
    else
    {

      v27 = v48;
    }

    goto LABEL_25;
  }
LABEL_28:

  return v26;
}

void __78__SKUIDocumentContainerViewController_initWithDocument_options_clientContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "launchCorrelationKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageRenderEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLaunchCorrelationKey:", v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC138], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E73B3990, self->_document);
  if (-[NSSet count](self->_personalizationItems, "count"))
  {
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endObservingLibraryItems:", self->_personalizationItems);

  }
  if (-[SKUIDocumentContainerViewController _appearState](self, "_appearState") == 3)
    -[IKAppDocument onDisappear](self->_document, "onDisappear");
  -[IKAppDocument setDelegate:](self->_document, "setDelegate:", 0);
  -[SKUIMediaQueryEvaluator setDelegate:](self->_mediaQueryEvaluator, "setDelegate:", 0);
  -[SKUINavigationBarController setParentViewController:](self->_navigationBarController, "setParentViewController:", 0);
  -[SSVLoadURLOperation setOutputBlock:](self->_loadURLOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_loadURLOperation, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIViewController dealloc](&v5, sel_dealloc);
}

+ (BOOL)allowsChildViewControllerNavigationBarManagement
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        +[SKUIDocumentContainerViewController allowsChildViewControllerNavigationBarManagement].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (void)skui_viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIViewController skui_viewWillAppear:](self->_childViewController, "skui_viewWillAppear:", v3);
  v5.receiver = self;
  v5.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIViewController skui_viewWillAppear:](&v5, sel_skui_viewWillAppear_, v3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_childViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_childViewController;
}

- (id)contentScrollView
{
  void *v2;
  objc_super v4;

  if (self->_childViewController)
  {
    -[UIViewController contentScrollView](self->_childViewController, "contentScrollView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SKUIDocumentContainerViewController;
    -[SKUIDocumentContainerViewController contentScrollView](&v4, sel_contentScrollView);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UIViewController *childViewController;
  void *v14;
  double v15;

  -[IKAppDocument templateElement](self->_document, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ikBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15 = 1.0;
    if (objc_msgSend(v6, "getRed:green:blue:alpha:", 0, 0, 0, &v15))
      v7 = v15 <= 0.00000011920929;
    else
      v7 = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", v15);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = (void *)objc_msgSend(v10, "initWithFrame:");

  objc_msgSend(v12, "setBackgroundColor:", v9);
  childViewController = self->_childViewController;
  if (childViewController)
  {
    -[UIViewController view](childViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAutoresizingMask:", 18);
    objc_msgSend(v12, "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v12, "addSubview:", v14);

  }
  -[SKUIDocumentContainerViewController setView:](self, "setView:", v12);

}

- (id)previewMenuItems
{
  return (id)-[UIViewController previewMenuItems](self->_childViewController, "previewMenuItems");
}

- (void)reloadData
{
  if (self->_urlString)
  {
    if (!self->_loadURLOperation)
      -[SKUIDocumentContainerViewController _enqueueLoadURLOperation](self, "_enqueueLoadURLOperation");
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIDocumentContainerViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[UIViewController setPreferredContentSize:](self->_childViewController, "setPreferredContentSize:", width, height);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  -[SKUIViewController clientContext](self, "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SKUIUserInterfaceIdiom(v2);

  if (v3 == 1)
    return 30;
  if (SKUIAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  UIViewController *v5;
  objc_super v6;

  v4 = a3;
  if (v4)
  {
    v5 = self->_childViewController;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIViewController delayPresentationIfNeededForParentViewController:](v5, "delayPresentationIfNeededForParentViewController:", v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIDocumentContainerViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageAppearTime");
  v7 = v6;

  if (v7 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPageAppearTime:", v10);

    -[SKUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SKUIApplicationPageDidDisplayNotification"), self);

  -[IKAppDocument onAppear](self->_document, "onAppear");
  v13.receiver = self;
  v13.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIDocumentContainerViewController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPageDisappearTime:", v8);

  }
  -[IKAppDocument onDisappear](self->_document, "onDisappear");
  v10.receiver = self;
  v10.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIDocumentContainerViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  CGSize *p_viewSize;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double height;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  p_viewSize = &self->_viewSize;
  -[SKUIDocumentContainerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  width = p_viewSize->width;
  height = p_viewSize->height;

  if (width != v6 || height != v8)
  {
    -[SKUIDocumentContainerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    p_viewSize->width = v13;
    p_viewSize->height = v14;

    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_viewSize->height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("height"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_viewSize->width);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("width"));

    -[SKUIDocumentContainerViewController _sendOnViewAttributesChangeWithAttributes:viewWillAppear:](self, "_sendOnViewAttributesChangeWithAttributes:viewWillAppear:", v15, 0);
    -[SKUIMediaQueryEvaluator reloadData](self->_mediaQueryEvaluator, "reloadData");

  }
  -[SKUIDocumentContainerViewController _reloadNavigationBarControllerIfNeeded](self, "_reloadNavigationBarControllerIfNeeded");
  v25.receiver = self;
  v25.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIDocumentContainerViewController viewDidLayoutSubviews](&v25, sel_viewDidLayoutSubviews);
  -[SKUIDocumentContainerViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "length");
  v20 = v19;

  -[SKUIDocumentContainerViewController topLayoutGuide](self, "topLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "length");
  v23 = v22;

  if (vabdd_f64(self->_lastBottomLayoutGuideLength, v20) > 0.00000011920929
    || vabdd_f64(self->_lastTopLayoutGuideLength, v23) > 0.00000011920929)
  {
    self->_lastBottomLayoutGuideLength = v20;
    self->_lastTopLayoutGuideLength = v23;
    if (-[UIViewController isViewLoaded](self->_childViewController, "isViewLoaded"))
    {
      -[UIViewController view](self->_childViewController, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setNeedsLayout");

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  CGSize *p_viewSize;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *personalizationItems;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  NSNumber *orientationAtDisappear;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v48;
  void *v49;
  void *sizeAtDisappear;
  void *v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  objc_super v61;

  v3 = a3;
  p_viewSize = &self->_viewSize;
  -[SKUIDocumentContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  p_viewSize->width = v7;
  p_viewSize->height = v8;

  -[SKUIDocumentContainerViewController reloadData](self, "reloadData");
  if (!self->_personalizationItems)
  {
    -[IKAppDocument templateElement](self->_document, "templateElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "personalizationLibraryItems");
      v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
      personalizationItems = self->_personalizationItems;
      self->_personalizationItems = v11;

      +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "beginObservingLibraryItems:", self->_personalizationItems);

    }
  }
  -[SKUIDocumentContainerViewController _reloadNavigationBarControllerIfNeeded](self, "_reloadNavigationBarControllerIfNeeded");
  if (-[SKUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    -[SKUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidesBackButton:animated:", objc_msgSend(v14, "hidesBackButton"), 0);

    objc_msgSend(v14, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "visibility");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("hidden"));

    -[SKUIDocumentContainerViewController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNavigationBarHidden:animated:", v18, v3);

  }
  -[SKUIViewController forceOrientationBackToSupportedOrientation](self, "forceOrientationBackToSupportedOrientation");
  -[SKUIDocumentContainerViewController contentScrollView](self, "contentScrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentInset");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  if (v22 == 0.0)
  {
    -[SKUIDocumentContainerViewController topLayoutGuide](self, "topLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "length");
    v31 = v30;

    if (v22 != v31)
    {
      -[SKUIDocumentContainerViewController topLayoutGuide](self, "topLayoutGuide");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "length");
      v34 = v33;

      -[SKUIDocumentContainerViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", v34, v24, v26, v28);
    }
  }
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_orientationAtDisappear)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "statusBarOrientation");

    if (v37 != -[NSNumber integerValue](self->_orientationAtDisappear, "integerValue"))
    {
      if ((unint64_t)(v37 - 3) >= 2)
        v38 = CFSTR("portrait");
      else
        v38 = CFSTR("landscape");
      objc_msgSend(v35, "setObject:forKey:", v38, CFSTR("orientation"));
    }
    orientationAtDisappear = self->_orientationAtDisappear;
    self->_orientationAtDisappear = 0;

  }
  if (self->_sizeAtDisappear)
  {
    -[SKUIDocumentContainerViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v42 = v41;
    v44 = v43;

    -[NSValue CGSizeValue](self->_sizeAtDisappear, "CGSizeValue");
    if (v46 != v42 || v45 != v44)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v48, CFSTR("height"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v49, CFSTR("width"));

    }
    sizeAtDisappear = self->_sizeAtDisappear;
    self->_sizeAtDisappear = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "userInterfaceIdiom");

  if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "SKUI_isFullscreen");

    if ((v54 & 1) == 0)
    {
      -[SKUIDocumentContainerViewController view](self, "view");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "frame");
      v57 = v56;
      v59 = v58;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v60, CFSTR("height"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
      sizeAtDisappear = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", sizeAtDisappear, CFSTR("width"));
LABEL_24:

    }
  }
  if (objc_msgSend(v35, "count"))
  {
    -[SKUIDocumentContainerViewController _sendOnViewAttributesChangeWithAttributes:viewWillAppear:](self, "_sendOnViewAttributesChangeWithAttributes:viewWillAppear:", v35, 1);
    -[SKUIMediaQueryEvaluator reloadData](self->_mediaQueryEvaluator, "reloadData");
  }
  v61.receiver = self;
  v61.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIViewController viewWillAppear:](&v61, sel_viewWillAppear_, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  NSNumber *v7;
  NSNumber *orientationAtDisappear;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSValue *v13;
  NSValue *sizeAtDisappear;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  objc_super v19;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSNumber *)objc_msgSend(v5, "initWithInteger:", objc_msgSend(v6, "statusBarOrientation"));
  orientationAtDisappear = self->_orientationAtDisappear;
  self->_orientationAtDisappear = v7;

  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[SKUIDocumentContainerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "valueWithCGSize:", v11, v12);
  v13 = (NSValue *)objc_claimAutoreleasedReturnValue();
  sizeAtDisappear = self->_sizeAtDisappear;
  self->_sizeAtDisappear = v13;

  -[SKUIDocumentContainerViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", self);

  if ((v17 & 1) == 0)
  {
    -[IKAppDocument navigationBarElement](self->_document, "navigationBarElement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 8, 0, 0, 0, 0);

  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIDocumentContainerViewController;
  -[SKUIDocumentContainerViewController viewWillDisappear:](&v19, sel_viewWillDisappear_, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  objc_super v14;
  _QWORD v15[5];
  CGAffineTransform v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("popover"));

  if ((v9 & 1) == 0)
  {
    self->_viewSize.width = width;
    self->_viewSize.height = height;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("height"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("width"));

    if (v7)
      objc_msgSend(v7, "targetTransform");
    else
      memset(&v16, 0, sizeof(v16));
    if (!CGAffineTransformIsIdentity(&v16))
    {
      if (width <= height)
        v13 = CFSTR("portrait");
      else
        v13 = CFSTR("landscape");
      objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("orientation"));
    }
    -[SKUIDocumentContainerViewController _sendOnViewAttributesChangeWithAttributes:viewWillAppear:](self, "_sendOnViewAttributesChangeWithAttributes:viewWillAppear:", v10, -[SKUIDocumentContainerViewController _appearState](self, "_appearState") == 1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __90__SKUIDocumentContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_1E739FF90;
    v15[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v15);
    v14.receiver = self;
    v14.super_class = (Class)SKUIDocumentContainerViewController;
    -[SKUIDocumentContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
    -[SKUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");

  }
}

uint64_t __90__SKUIDocumentContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "reloadData");
}

- (id)toolbarItems
{
  return -[SKUIToolbarController toolbarItems](self->_toolbarController, "toolbarItems");
}

- (id)pendingSizeTransitionCompletion
{
  return _Block_copy(self->_pendingSizeTransitionCompletion);
}

- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4
{
  id v5;
  SKUIMediaQueryEvaluator *mediaQueryEvaluator;
  SKUIMediaQueryEvaluator *v7;
  SKUIMediaQueryEvaluator *v8;
  BOOL v9;

  v5 = a4;
  mediaQueryEvaluator = self->_mediaQueryEvaluator;
  if (!mediaQueryEvaluator)
  {
    v7 = objc_alloc_init(SKUIMediaQueryEvaluator);
    v8 = self->_mediaQueryEvaluator;
    self->_mediaQueryEvaluator = v7;

    -[SKUIMediaQueryEvaluator setDelegate:](self->_mediaQueryEvaluator, "setDelegate:", self);
    mediaQueryEvaluator = self->_mediaQueryEvaluator;
  }
  v9 = -[SKUIMediaQueryEvaluator evaluateMediaQuery:](mediaQueryEvaluator, "evaluateMediaQuery:", v5);

  return v9;
}

- (void)document:(id)a3 runTestWithName:(id)a4 options:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF433FF8))-[UIViewController performTestWithName:options:](self->_childViewController, "performTestWithName:options:", v8, v7);

}

- (void)documentDidUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  id v11;
  double Current;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSNumber *pageResponseAbsoluteTime;
  void *v18;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  void *v23;
  NSSet *v24;
  NSSet *v25;
  NSSet *personalizationItems;
  UIViewController *v27;
  void *v28;
  NSDictionary *presentationOptions;
  void *v30;
  void *v31;
  void *v32;
  SKUINavigationBarController *navigationBarController;
  void *v34;
  NSArray *v35;
  NSArray *searchBarControllers;
  SKUINavigationBarController *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  SKUIToolbarController *toolbarController;
  void *v47;
  SKUIToolbarController *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  int v58;
  void *v59;
  __int16 v60;
  double v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_pageResponseAbsoluteTime)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v9 = v7;
  else
    v9 = v7 & 2;
  if (!v9)
    goto LABEL_11;
  v10 = (void *)objc_opt_class();
  v11 = v10;
  Current = CFAbsoluteTimeGetCurrent();
  -[NSNumber doubleValue](self->_pageResponseAbsoluteTime, "doubleValue");
  v14 = Current - v13;
  -[NSDictionary objectForKey:](self->_presentationOptions, "objectForKey:", CFSTR("url"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 138412802;
  v59 = v10;
  v60 = 2048;
  v61 = v14;
  v62 = 2112;
  v63 = v15;
  LODWORD(v55) = 32;
  v54 = &v58;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v58, v55);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v16);
    v54 = (int *)v8;
    SSFileLog();
LABEL_11:

  }
  pageResponseAbsoluteTime = self->_pageResponseAbsoluteTime;
  self->_pageResponseAbsoluteTime = 0;

LABEL_13:
  objc_msgSend(MEMORY[0x1E0C99D68], "date", v54);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  v20 = v19;

  objc_msgSend(v4, "templateElement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = objc_msgSend(v21, "elementType");
  else
    v22 = 0;
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_personalizationItems;
  objc_msgSend(v21, "personalizationLibraryItems");
  v25 = (NSSet *)objc_claimAutoreleasedReturnValue();
  personalizationItems = self->_personalizationItems;
  self->_personalizationItems = v25;

  if (-[NSSet count](self->_personalizationItems, "count"))
    objc_msgSend(v23, "beginObservingLibraryItems:", self->_personalizationItems);
  if (-[NSSet count](v24, "count"))
    objc_msgSend(v23, "endObservingLibraryItems:", v24);
  if (v22 == self->_templateViewElementType)
  {
    v27 = self->_childViewController;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIViewController documentDidUpdate:](v27, "documentDidUpdate:", v4);
    if (SKUIViewControllerIsVisible(self->_childViewController))
    {
      v57 = *MEMORY[0x1E0C99860];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performSelector:withObject:afterDelay:inModes:", sel_onUpdate, 0, v28, 0.0);

    }
  }
  else
  {
    if (v22)
    {
      presentationOptions = self->_presentationOptions;
      -[SKUIViewController clientContext](self, "clientContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SKUIDocumentContainerViewController _newViewControllerWithTemplateElement:options:clientContext:](self, "_newViewControllerWithTemplateElement:options:clientContext:", v21, presentationOptions, v30);

    }
    else
    {
      v27 = 0;
    }
    -[SKUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v27);
    self->_templateViewElementType = v22;
  }

  -[SKUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  navigationBarController = self->_navigationBarController;
  v56 = v4;
  if (v31)
  {
    -[SKUINavigationBarController navigationBarViewElement](navigationBarController, "navigationBarViewElement");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34 == v31)
    {
      -[SKUINavigationBarController updateNavigationItem:](self->_navigationBarController, "updateNavigationItem:", v32);
      -[SKUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");
    }
    else
    {
      -[SKUIDocumentContainerViewController _reloadNavigationBarController](self, "_reloadNavigationBarController");
    }
  }
  else
  {
    -[SKUINavigationBarController existingSearchBarControllers](navigationBarController, "existingSearchBarControllers");
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchBarControllers = self->_searchBarControllers;
    self->_searchBarControllers = v35;

    -[SKUINavigationBarController detachFromNavigationItem:](self->_navigationBarController, "detachFromNavigationItem:", v32);
    -[SKUINavigationBarController setParentViewController:](self->_navigationBarController, "setParentViewController:", 0);
    v37 = self->_navigationBarController;
    self->_navigationBarController = 0;

  }
  -[SKUIDocumentContainerViewController prefersNavigationBarHidden](self, "prefersNavigationBarHidden");
  if (-[SKUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    v38 = objc_msgSend(v31, "hidesBackButton");
    -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidesBackButton:", v38);

    objc_msgSend(v31, "style");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "visibility");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("hidden"));

    -[SKUIDocumentContainerViewController navigationController](self, "navigationController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setNavigationBarHidden:animated:", v42, 0);

  }
  -[SKUIDocumentContainerViewController _reloadDefaultBarButtonItems](self, "_reloadDefaultBarButtonItems");
  -[SKUIDocumentContainerViewController _toolbarViewElement](self, "_toolbarViewElement");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDocumentContainerViewController navigationController](self, "navigationController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  toolbarController = self->_toolbarController;
  if (v44)
  {
    -[SKUIToolbarController toolbarViewElement](toolbarController, "toolbarViewElement");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47 == v44)
      -[SKUIToolbarController updateToolbarForNavigationController:](self->_toolbarController, "updateToolbarForNavigationController:", v45);
    else
      -[SKUIDocumentContainerViewController _reloadToolbar](self, "_reloadToolbar");
  }
  else
  {
    -[SKUIToolbarController detachFromNavigationController:](toolbarController, "detachFromNavigationController:", v45);
    -[SKUIToolbarController setDelegate:](self->_toolbarController, "setDelegate:", 0);
    v48 = self->_toolbarController;
    self->_toolbarController = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "postNotificationName:object:", CFSTR("SKUIApplicationPageDidUpdateNotification"), self);

  -[SKUIDocumentContainerViewController domChangeTimingQueue](self, "domChangeTimingQueue");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "oldestPendingChange");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "timeIntervalSince1970");
    objc_msgSend(v51, "setRenderEndTime:");

    objc_msgSend(v51, "setRenderStartTime:", v20);
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addDOMChange:", v51);

  }
  -[SKUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");

}

- (void)documentScrollToTop:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[SKUIDocumentContainerViewController contentScrollView](self, "contentScrollView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "contentOffset");
    v5 = v4;
    objc_msgSend(v7, "contentInset");
    objc_msgSend(v7, "setContentOffset:animated:", 0, v5, -v6);
    v3 = v7;
  }

}

- (id)impressionableViewElementsForDocument:(id)a3
{
  UIViewController *v3;
  void *v4;

  v3 = self->_childViewController;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController impressionableViewElements](v3, "impressionableViewElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)documentDidSendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E73B39B0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E73B39D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", 0x1E73B3910))
  {
    -[SKUIDocumentContainerViewController _onReportPlatformJsonTimes:](self, "_onReportPlatformJsonTimes:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", 0x1E73B3930))
  {
    -[SKUIDocumentContainerViewController _onReportDOMChange:](self, "_onReportDOMChange:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", 0x1E73B3950))
  {
    -[SKUIDocumentContainerViewController _onReportRequestTimes:](self, "_onReportRequestTimes:", v7);
  }
  else if (objc_msgSend(v8, "isEqualToString:", 0x1E73B3970))
  {
    -[SKUIDocumentContainerViewController _onReportDocumentReady:](self, "_onReportDocumentReady:", v7);
  }

}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceRequestStartTime");
  v6 = v5;

  if (v6 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setResourceRequestStartTime:", v9);

  }
  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setResourceRequestEndTime:", 0.0);

}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResourceRequestOnScreenEndTime:", v8);

  }
  if (objc_msgSend(v15, "isIdle"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResourceRequestEndTime:", v12);

    -[SKUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");
  }
  else
  {
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setResourceRequestEndTime:", 0.0);

  }
}

- (id)mediaQueryEvaluator:(id)a3 valueForKey:(id)a4
{
  id v5;
  void *v6;
  double height;
  void *v8;
  void *v10;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", 0x1E73AA1B0))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    height = self->_viewSize.height;
LABEL_5:
    objc_msgSend(v6, "numberWithDouble:", height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", 0x1E73AA190))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    height = self->_viewSize.width;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isEqualToString:", 0x1E73AA210))
  {
    objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIMediaQueryNetworkTypeString(objc_msgSend(v10, "networkType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
LABEL_6:

  return v8;
}

- (void)mediaQueryEvaluatorDidChange:(id)a3
{
  SKUIMediaQueryEvaluator *mediaQueryEvaluator;
  char v5;
  UIViewController *childViewController;
  IKAppDocument *document;

  -[SKUIMediaQueryEvaluator setDelegate:](self->_mediaQueryEvaluator, "setDelegate:", self);
  mediaQueryEvaluator = self->_mediaQueryEvaluator;
  self->_mediaQueryEvaluator = 0;

  -[IKAppDocument setViewElementStylesDirty](self->_document, "setViewElementStylesDirty");
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF404A00))
  {
    v5 = objc_opt_respondsToSelector();
    childViewController = self->_childViewController;
    document = self->_document;
    if ((v5 & 1) != 0)
      -[UIViewController documentMediaQueriesDidUpdate:](childViewController, "documentMediaQueriesDidUpdate:", document);
    else
      -[UIViewController documentDidUpdate:](childViewController, "documentDidUpdate:", document);
  }
}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, SKUIModalSourceViewProvider *);
  void *v7;
  SKUIModalSourceViewProvider *v8;
  SKUIModalSourceViewProvider *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, SKUIModalSourceViewProvider *))a4;
  -[SKUINavigationBarController barButtonItemForElementIdentifier:](self->_navigationBarController, "barButtonItemForElementIdentifier:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(SKUIModalSourceViewProvider);
    -[SKUIModalSourceViewProvider setSourceButtonBarItem:](v8, "setSourceButtonBarItem:", v7);
    v6[2](v6, v8);
  }
  else
  {
    -[SKUINavigationBarController viewForElementIdentifier:](self->_navigationBarController, "viewForElementIdentifier:", v10);
    v8 = (SKUIModalSourceViewProvider *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc_init(SKUIModalSourceViewProvider);
      -[SKUIModalSourceViewProvider setOriginalSourceView:](v9, "setOriginalSourceView:", v8);
      v6[2](v6, v9);

    }
    else if ((-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF438FA8) & 1) != 0)
    {
      -[UIViewController getModalSourceViewForElementIdentifier:completionBlock:](self->_childViewController, "getModalSourceViewForElementIdentifier:completionBlock:", v10, v6);
    }
    else
    {
      v6[2](v6, 0);
    }
  }

}

- (id)additionalLeftBarButtonItemForNavigationBarController:(id)a3
{
  void *v4;
  void *v5;

  -[SKUIViewController clientContext](self, "clientContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalLeftBarButtonItemForDocumentContainerViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)additionalRightBarButtonItemForNavigationBarController:(id)a3
{
  void *v4;
  void *v5;

  -[SKUIViewController clientContext](self, "clientContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalRightBarButtonItemForDocumentContainerViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)navigationBarTitleTextTintColor
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController navigationBarTitleTextTintColor](self->_childViewController, "navigationBarTitleTextTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)navigationBarTintAdjustmentMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewController navigationBarTintAdjustmentMode](self->_childViewController, "navigationBarTintAdjustmentMode");
  else
    return 0;
}

- (id)navigationBarTintColor
{
  void *v3;
  void *v4;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF451A38))
  {
    -[UIViewController navigationBarTintColor](self->_childViewController, "navigationBarTintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)prefersNavigationBarBackgroundViewHidden
{
  void *v4;
  char v5;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF451A38))return -[UIViewController prefersNavigationBarBackgroundViewHidden](self->_childViewController, "prefersNavigationBarBackgroundViewHidden");
  -[SKUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTransparent");

  return v5;
}

- (BOOL)prefersNavigationBarHidden
{
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF451A38)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    return -[UIViewController prefersNavigationBarHidden](self->_childViewController, "prefersNavigationBarHidden");
  }
  else
  {
    return 0;
  }
}

- (UIView)navigationPaletteView
{
  void *v3;

  -[SKUINavigationBarController navigationPaletteView](self->_navigationBarController, "navigationPaletteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF404A00)&& (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIViewController navigationPaletteView](self->_childViewController, "navigationPaletteView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return (UIView *)v3;
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  $D35E09B864CB17FEE2308AEA3FA0107F *p_scrollingTabAppearanceStatus;

  p_scrollingTabAppearanceStatus = &self->_scrollingTabAppearanceStatus;
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF448B10))-[UIViewController scrollingTabAppearanceStatusWasUpdated:](self->_childViewController, "scrollingTabAppearanceStatusWasUpdated:", *(_QWORD *)&p_scrollingTabAppearanceStatus->progress, *(_QWORD *)&p_scrollingTabAppearanceStatus->isBouncingOffTheEdge);
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  void *v3;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF448BD8))
  {
    -[UIViewController scrollingTabNestedPagingScrollView](self->_childViewController, "scrollingTabNestedPagingScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIScrollView *)v3;
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  void *v5;

  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF448BD8))
  {
    -[UIViewController scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:](self->_childViewController, "scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF433FF8))v8 = -[UIViewController performTestWithName:options:](self->_childViewController, "performTestWithName:options:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (void)_onReportPlatformJsonTimes:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("jsonParseStartTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "platformJsonParseStartTime");
    v7 = v6;

    if (v7 < 2.22044605e-16)
    {
      +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v4);
      v9 = v8;
      -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPlatformJsonParseStartTime:", v9);

    }
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("jsonParseEndTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "platformJsonParseEndTime");
    v14 = v13;

    if (v14 < 2.22044605e-16)
    {
      +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v11);
      v16 = v15;
      -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPlatformJsonParseEndTime:", v16);

    }
  }

}

- (void)_onReportDOMChange:(id)a3
{
  id v4;
  void *v5;
  SKUIMetricsDOMChange *v6;

  v4 = a3;
  v6 = -[SKUIMetricsDOMChange initWithReportDomBuildTimesMessagePayload:]([SKUIMetricsDOMChange alloc], "initWithReportDomBuildTimesMessagePayload:", v4);

  if (v6)
  {
    -[SKUIDocumentContainerViewController domChangeTimingQueue](self, "domChangeTimingQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addPendingChange:", v6);

  }
}

- (void)_onReportRequestTimes:(id)a3
{
  void *v4;
  SKUIMetricsRequestInfo *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[SKUIMetricsRequestInfo initWithReportRequestTimesMessagePayload:]([SKUIMetricsRequestInfo alloc], "initWithReportRequestTimesMessagePayload:", v7);
    if (v5)
    {
      -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addRequest:", v5);

    }
  }

}

- (void)_onReportDocumentReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("clientCorrelationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("clientCorrelationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClientCorrelationKey:", v5);

  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("metricsBase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("metricsBase"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMetricsBase:", v8);

  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("documentReadyTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("documentReadyTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
  }
  v13 = v12;
  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPageUserReadyTime:", v13);

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("userInteractionTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("userInteractionTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIMetricsUtilities timeIntervalFromJSTime:](SKUIMetricsUtilities, "timeIntervalFromJSTime:", v16);
    v18 = v17;
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPageRequestedTime:", v18);

  }
  -[SKUIDocumentContainerViewController _submitPageRenderIfPossible](self, "_submitPageRenderIfPossible");

}

- (void)_submitPageRenderIfPossible
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isReadyForSubmission") & 1) != 0)
  {
    -[SKUIDocumentContainerViewController domChangeTimingQueue](self, "domChangeTimingQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEmpty");

    if (v4)
    {
      -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewController clientContext](self, "clientContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendSamplingPropertiesFromClientContext:", v6);

      -[SKUIViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_applicationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordMetricsEvent:flushImmediately:", v9, 0);

      if (+[SKUIMetricsUtilities shouldLogTimingMetrics](SKUIMetricsUtilities, "shouldLogTimingMetrics"))
      {
        SSDebugLevel();
        SSDebugFileLevel();
        -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        SSDebugLog();

      }
      if (+[SKUIMetricsUtilities showEventNotifications](SKUIMetricsUtilities, "showEventNotifications", v13))
      {
        -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKUIStatusBarAlertCenter sharedCenter](SKUIStatusBarAlertCenter, "sharedCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __66__SKUIDocumentContainerViewController__submitPageRenderIfPossible__block_invoke;
        v15[3] = &unk_1E739FD38;
        v16 = v10;
        v12 = v10;
        objc_msgSend(v11, "showMessage:withStyle:forDuration:actionBlock:", CFSTR("Page Rendered"), 0, v15, 0.0);

      }
      -[SKUIDocumentContainerViewController setPageRenderEvent:](self, "setPageRenderEvent:", 0);
      -[SKUIDocumentContainerViewController setDomChangeTimingQueue:](self, "setDomChangeTimingQueue:", 0);
    }
  }
  else
  {

  }
}

uint64_t __66__SKUIDocumentContainerViewController__submitPageRenderIfPossible__block_invoke(uint64_t a1)
{
  return +[SKUIObjectInspectorViewController showInspectableObject:](SKUIObjectInspectorViewController, "showInspectableObject:", *(_QWORD *)(a1 + 32));
}

- (void)_reloadNavigationItemContents
{
  id v3;

  if (-[SKUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationBarController detachFromNavigationItem:](self->_navigationBarController, "detachFromNavigationItem:", v3);
    -[SKUINavigationBarController attachToNavigationItem:](self->_navigationBarController, "attachToNavigationItem:", v3);

  }
}

- (BOOL)_makeSearchBarFirstResponderOnLoad
{
  return self->_makeSearchBarFirstResponderOnLoad;
}

- (BOOL)_selectSearchBarContentOnBecomingFirstResponder
{
  return self->_selectSearchBarContentOnBecomingFirstResponder;
}

- (void)_setMakeSearchBarFirstResponderOnLoad:(BOOL)a3
{
  self->_makeSearchBarFirstResponderOnLoad = a3;
}

- (void)_setSelectSearchBarContentOnBecomingFirstResponder:(BOOL)a3
{
  self->_selectSearchBarContentOnBecomingFirstResponder = a3;
}

- (void)_networkTypeChangeNotification:(id)a3
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 5000000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__SKUIDocumentContainerViewController__networkTypeChangeNotification___block_invoke;
  v4[3] = &unk_1E739FF68;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__SKUIDocumentContainerViewController__networkTypeChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadPageData");

}

- (void)_skui_applicationDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;
    -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPageDisappearTime:", v7);

  }
  if (SKUIViewControllerIsVisible(self))
    -[IKAppDocument onDisappear](self->_document, "onDisappear");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC4860];
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__skui_applicationWillEnterForeground_, v9, 0);

}

- (void)_skui_applicationWillEnterForeground:(id)a3
{
  id v4;

  if (SKUIViewControllerIsVisible(self))
    -[IKAppDocument onAppear](self->_document, "onAppear");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);

}

- (void)_enqueueLoadURLOperation
{
  void *v3;
  void *v4;
  SSVLoadURLOperation *v5;
  SSVLoadURLOperation *loadURLOperation;
  SSVLoadURLOperation *v7;
  void *v8;
  SSVLoadURLOperation *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSString *urlString;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id location;
  int v27;
  void *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", self->_urlString);
  -[SKUIViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (SSVLoadURLOperation *)objc_msgSend(v4, "newLoadStoreURLOperationWithURL:", v3);
  loadURLOperation = self->_loadURLOperation;
  self->_loadURLOperation = v5;

  v7 = self->_loadURLOperation;
  +[SSVURLDataConsumer consumer](SKUIURLResolverDataConsumer, "consumer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v7, "setDataConsumer:", v8);

  objc_initWeak(&location, self);
  v9 = self->_loadURLOperation;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke;
  v24 = &unk_1E73A5BD8;
  objc_copyWeak(&v25, &location);
  -[SSVLoadURLOperation setOutputBlock:](v9, "setOutputBlock:", &v21);
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldLog");
  v12 = objc_msgSend(v10, "shouldLogToDisk");
  objc_msgSend(v10, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    v11 |= 2u;
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    v11 &= 2u;
  if (!v11)
    goto LABEL_8;
  v15 = (void *)objc_opt_class();
  urlString = self->_urlString;
  v27 = 138412546;
  v28 = v15;
  v29 = 2112;
  v30 = urlString;
  v17 = v15;
  LODWORD(v20) = 22;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v27, v20, v21, v22, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog();
LABEL_8:

  }
  -[SKUIViewController operationQueue](self, "operationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", self->_loadURLOperation);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __63__SKUIDocumentContainerViewController__enqueueLoadURLOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishLoadOperationWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_finishLegacyProtocolOperationForResponse:(id)a3 dataProvider:(id)a4 dictionary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *urlString;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  IKAppDocument *document;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a5;
  objc_msgSend(a4, "redirectURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SKUIDocumentContainerViewController _redirectToURL:](self, "_redirectToURL:", v9);
  }
  else
  {
    objc_msgSend(v21, "URLResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    urlString = self->_urlString;
    self->_urlString = v12;

    -[SKUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", 0);
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DDC1D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC160]), "initWithDialogDictionary:", v14),
          v16 = objc_msgSend(v15, "kind"),
          v15,
          v16 != 1))
    {
      -[SKUIViewController clientContext](self, "clientContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      document = self->_document;
      objc_msgSend(v21, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLResponse");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", document, v19, v20, 0);

    }
  }

}

- (void)_finishLoadOperationWithResponse:(id)a3 error:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  NSObject *v37;
  int v38;
  void *v39;
  NSString *v40;
  id v41;
  void *v42;
  _BYTE *v43;
  void *v44;
  int v45;
  NSObject *v46;
  int v47;
  void *v48;
  NSString *urlString;
  id v50;
  void *v51;
  _BYTE *v52;
  void *v53;
  void *v54;
  void *v55;
  SKUIErrorDocumentViewController *v56;
  void *v57;
  SKUIErrorDocumentViewController *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  SKUILegacyNativeViewController *v64;
  void *v65;
  SKUILegacyNativeViewController *v66;
  void *v67;
  void *v68;
  NSNumber *v69;
  NSNumber *pageResponseAbsoluteTime;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  IKAppDocument *document;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSString *v81;
  SSVLoadURLOperation *loadURLOperation;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _BYTE *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  NSString *v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  id v97;
  id from;
  _QWORD v99[4];
  id v100;
  _QWORD v101[3];
  _QWORD v102[3];
  _BYTE location[12];
  __int16 v104;
  NSString *v105;
  __int16 v106;
  NSString *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSString *)a4;
  v92 = v7;
  if (v6 && !v7)
  {
    objc_msgSend(v6, "URLResponse");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "allHeaderFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ISDictionaryValueForCaseInsensitiveString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v91, "MIMEType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SSVLoadURLOperation metricsPageEvent](self->_loadURLOperation, "metricsPageEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientCorrelationKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v10, "clientCorrelationKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setClientCorrelationKey:", v13);

        objc_msgSend(v10, "requestStartTime");
        v16 = v15;
        -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPlatformRequestStartTime:", v16);

        objc_msgSend(v10, "responseStartTime");
        v19 = v18;
        -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPlatformResponseStartTime:", v19);

        objc_msgSend(v10, "responseEndTime");
        v22 = v21;
        -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setPlatformResponseEndTime:", v22);

        v24 = objc_msgSend(v10, "isCachedResponse");
        -[SKUIDocumentContainerViewController pageRenderEvent](self, "pageRenderEvent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPlatformResponseWasCached:", v24);

      }
    }
    if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("itml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "shouldLog");
      if (objc_msgSend(v44, "shouldLogToDisk"))
        v45 |= 2u;
      objc_msgSend(v44, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        v47 = v45;
      else
        v47 = v45 & 2;
      if (v47)
      {
        v48 = (void *)objc_opt_class();
        urlString = self->_urlString;
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v48;
        v104 = 2112;
        v105 = urlString;
        v50 = v48;
        LODWORD(v89) = 22;
        v88 = location;
        v51 = (void *)_os_log_send_and_compose_impl();

        if (v51)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v51, 4, location, v89);
          v52 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          free(v51);
          v88 = v52;
          SSFileLog();

        }
      }
      else
      {

      }
      v69 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", CFAbsoluteTimeGetCurrent());
      pageResponseAbsoluteTime = self->_pageResponseAbsoluteTime;
      self->_pageResponseAbsoluteTime = v69;

      v101[0] = CFSTR("requestStartTime");
      objc_msgSend(v10, "requestStartTime");
      +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = v71;
      v101[1] = CFSTR("responseStartTime");
      objc_msgSend(v10, "responseStartTime");
      +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v102[1] = v72;
      v101[2] = CFSTR("responseEndTime");
      objc_msgSend(v10, "responseEndTime");
      +[SKUIMetricsUtilities jsTimeFromTimeInterval:](SKUIMetricsUtilities, "jsTimeFromTimeInterval:");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v102[2] = v73;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIViewController clientContext](self, "clientContext");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      document = self->_document;
      objc_msgSend(v6, "data");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLResponse");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", document, v77, v78, v74);

      goto LABEL_42;
    }
    if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("application/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("html"), 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v9, "rangeOfString:options:", CFSTR("text/xml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v26 = (void *)MEMORY[0x1E0CB38B0];
          objc_msgSend(v6, "data");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "propertyListWithData:options:format:error:", v27, 0, 0, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v28, "objectForKey:", CFSTR("page-type"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29
              && (objc_msgSend(v28, "objectForKey:", CFSTR("items")),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30,
                  v29,
                  v30))
            {
              v31 = objc_alloc_init(MEMORY[0x1E0DDC260]);
              objc_msgSend(v31, "loadFromDictionary:", v28);
              -[SSVLoadURLOperation URLRequest](self->_loadURLOperation, "URLRequest");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "URLResponse");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKUIDocumentContainerViewController _showLegacyStorePageWithRequest:page:pageType:URLResponse:](self, "_showLegacyStorePageWithRequest:page:pageType:URLResponse:", v32, v31, 0, v33);

            }
            else
            {
              v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC198]), "initWithPropertyList:", v28);
              objc_msgSend(MEMORY[0x1E0DDC1A0], "provider");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "setShouldProcessAuthenticationDialogs:", 1);
              objc_msgSend(v84, "setShouldProcessDialogs:", 0);
              objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "activeAccount");
              v90 = (void *)objc_claimAutoreleasedReturnValue();

              if (v90)
              {
                v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF490]), "initWithAccount:", v90);
                objc_msgSend(v84, "setAuthenticationContext:", v86);

              }
              objc_msgSend(v83, "setDataProvider:", v84);
              objc_initWeak((id *)location, v83);
              objc_initWeak(&from, self);
              v93[0] = MEMORY[0x1E0C809B0];
              v93[1] = 3221225472;
              v93[2] = __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_228;
              v93[3] = &unk_1E73A5C00;
              objc_copyWeak(&v96, (id *)location);
              objc_copyWeak(&v97, &from);
              v94 = v6;
              v95 = v28;
              objc_msgSend(v83, "setCompletionBlock:", v93);
              -[SKUIViewController operationQueue](self, "operationQueue");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "addOperation:", v83);

              objc_destroyWeak(&v97);
              objc_destroyWeak(&v96);
              objc_destroyWeak(&from);
              objc_destroyWeak((id *)location);

            }
          }

        }
        goto LABEL_42;
      }
      -[SSVLoadURLOperation URLRequest](self->_loadURLOperation, "URLRequest");
      v66 = (SKUILegacyNativeViewController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "data");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLResponse");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIDocumentContainerViewController _showLegacyStorePageWithRequest:page:pageType:URLResponse:](self, "_showLegacyStorePageWithRequest:page:pageType:URLResponse:", v66, v79, 1, v80);

    }
    else
    {
      v64 = [SKUILegacyNativeViewController alloc];
      objc_msgSend(v6, "data");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = -[SKUILegacyNativeViewController initWithData:fromOperation:](v64, "initWithData:fromOperation:", v65, self->_loadURLOperation);

      -[SKUIViewController clientContext](self, "clientContext");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIViewController setClientContext:](v66, "setClientContext:", v67);

      -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUILegacyNativeViewController _setExistingNavigationItem:](v66, "_setExistingNavigationItem:", v68);

      -[SKUILegacyNativeViewController reloadData](v66, "reloadData");
      -[SKUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v66);
    }

LABEL_42:
    v81 = self->_urlString;
    self->_urlString = 0;

    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "shouldLog");
  if (objc_msgSend(v34, "shouldLogToDisk"))
    v36 = v35 | 2;
  else
    v36 = v35;
  objc_msgSend(v34, "OSLogObject");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    v38 = v36;
  else
    v38 = v36 & 2;
  if (v38)
  {
    v39 = (void *)objc_opt_class();
    v40 = self->_urlString;
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v39;
    v104 = 2112;
    v105 = v92;
    v106 = 2112;
    v107 = v40;
    v41 = v39;
    LODWORD(v89) = 32;
    v88 = location;
    v42 = (void *)_os_log_send_and_compose_impl();

    if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v42, 4, location, v89);
      v43 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      free(v42);
      v88 = v43;
      SSFileLog();

    }
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_beforeErrorChildViewController, self->_childViewController);
  -[UIViewController view](self->_beforeErrorChildViewController, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "backgroundColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    -[SKUIDocumentContainerViewController view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "backgroundColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v56 = [SKUIErrorDocumentViewController alloc];
  -[SKUIViewController clientContext](self, "clientContext");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[SKUIErrorDocumentViewController initWithBackgroundColor:clientContext:](v56, "initWithBackgroundColor:clientContext:", v54, v57);

  objc_initWeak((id *)location, self);
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke;
  v99[3] = &unk_1E739FF68;
  objc_copyWeak(&v100, (id *)location);
  -[SKUIErrorDocumentViewController setRetryActionBlock:](v58, "setRetryActionBlock:", v99);
  -[SKUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v58);
  v59 = +[SKUIMetricsUtilities newErrorPageEvent](SKUIMetricsUtilities, "newErrorPageEvent");
  objc_msgSend(v59, "setPageURL:", self->_urlString);
  objc_msgSend(v59, "setPageType:", CFSTR("SKUIDocumentContainerViewController"));
  -[SKUIViewController clientContext](self, "clientContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_applicationController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "recordMetricsEvent:flushImmediately:", v59, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObserver:selector:name:object:", self, sel__networkTypeChangeNotification_, *MEMORY[0x1E0DDC138], v63);

  objc_destroyWeak(&v100);
  objc_destroyWeak((id *)location);

LABEL_43:
  -[SSVLoadURLOperation setOutputBlock:](self->_loadURLOperation, "setOutputBlock:", 0, v88);
  loadURLOperation = self->_loadURLOperation;
  self->_loadURLOperation = 0;

}

void __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_reloadPageData");
    v2 = +[SKUIMetricsUtilities newErrorRetryClickEvent](SKUIMetricsUtilities, "newErrorRetryClickEvent");
    objc_msgSend(v2, "setPageURL:", v5[153]);
    objc_msgSend(v2, "setPageType:", CFSTR("SKUIDocumentContainerViewController"));
    objc_msgSend(v5, "clientContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_applicationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordMetricsEvent:flushImmediately:", v2, 0);

    WeakRetained = v5;
  }

}

void __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_228(id *a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_2;
  v7 = &unk_1E739FE28;
  objc_copyWeak(&v11, a1 + 7);
  v8 = a1[4];
  v3 = WeakRetained;
  v9 = v3;
  v10 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], &v4);
  objc_msgSend(v3, "setCompletionBlock:", 0, v4, v5, v6, v7);

  objc_destroyWeak(&v11);
}

void __78__SKUIDocumentContainerViewController__finishLoadOperationWithResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_finishLegacyProtocolOperationForResponse:dataProvider:dictionary:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (id)_navigationBarViewElement
{
  void *v3;
  void *v4;

  if (-[SKUIDocumentContainerViewController _shouldFillNavigationBarContentsBasedOnNavigationBarViewElement](self, "_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement"))
  {
    -[IKAppDocument navigationBarElement](self->_document, "navigationBarElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[IKAppDocument templateElement](self->_document, "templateElement");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "navigationBarElement");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_toolbarViewElement
{
  return (id)-[IKAppDocument toolbarElement](self->_document, "toolbarElement");
}

- (id)_newViewControllerWithTemplateElement:(id)a3 options:(id)a4 clientContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  __objc2_class *v16;
  __objc2_class *v17;
  SKUIPhysicalCirclesDocumentViewController *v18;
  id v19;
  void *v20;
  int v21;
  __objc2_class **v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SKUIViewController clientContext](self, "clientContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentViewControllerForTemplateViewElement:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", 0x1E73B2550);
    v15 = objc_msgSend(v8, "elementType");
    if (v15 <= 82)
    {
      if (v15 <= 36)
      {
        if (v15 > 26)
        {
          if (v15 == 27)
          {
            v16 = SKUIContentUnavailableDocumentViewController;
            goto LABEL_43;
          }
          if (v15 == 34)
          {
            v16 = SKUIEditorDocumentViewController;
            goto LABEL_43;
          }
        }
        else
        {
          if (v15 == 17)
          {
            v19 = v8;
            objc_msgSend(v19, "type");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("modern"));

            v22 = off_1E739E3C8;
            if (!v21)
              v22 = off_1E739E0D8;
            v12 = (void *)objc_msgSend(objc_alloc(*v22), "initWithTemplateElement:", v19);

            goto LABEL_45;
          }
          if (v15 == 25)
          {
            v16 = SKUICommentDocumentViewController;
LABEL_43:
            v18 = (SKUIPhysicalCirclesDocumentViewController *)objc_msgSend([v16 alloc], "initWithTemplateElement:", v8);
            goto LABEL_44;
          }
        }
        goto LABEL_45;
      }
      if (v15 <= 70)
      {
        if (v15 == 37)
        {
          v16 = SKUIExploreDocumentViewController;
          goto LABEL_43;
        }
        if (v15 == 65)
        {
          v16 = SKUILoadingDocumentViewController;
          goto LABEL_43;
        }
LABEL_45:

        goto LABEL_46;
      }
      if (v15 == 71)
      {
        v16 = SKUIMenuBarTemplateDocumentViewController;
        goto LABEL_43;
      }
      if (v15 != 78)
        goto LABEL_45;
      goto LABEL_30;
    }
    if (v15 > 120)
    {
      if (v15 <= 131)
      {
        if (v15 == 121)
        {
          v16 = SKUISignInDocumentViewController;
          goto LABEL_43;
        }
        if (v15 != 129)
          goto LABEL_45;
        v17 = SKUISplitViewDocumentViewController;
        goto LABEL_27;
      }
      if (v15 != 132)
      {
        if (v15 == 148)
        {
          v16 = SKUITrendingSearchDocumentViewController;
          goto LABEL_43;
        }
        goto LABEL_45;
      }
    }
    else
    {
      if (v15 <= 92)
      {
        if (v15 == 83)
        {
          v16 = SKUIPanelDocumentViewController;
          goto LABEL_43;
        }
        if (v15 != 85)
          goto LABEL_45;
LABEL_30:
        v18 = -[SKUIPhysicalCirclesDocumentViewController initWithPhysicalCirclesTemplateViewElement:]([SKUIPhysicalCirclesDocumentViewController alloc], "initWithPhysicalCirclesTemplateViewElement:", v8);
        goto LABEL_44;
      }
      if (v15 != 93)
      {
        if (v15 != 115)
          goto LABEL_45;
        v17 = SKUISettingsDocumentViewController;
LABEL_27:
        v18 = (SKUIPhysicalCirclesDocumentViewController *)objc_msgSend([v17 alloc], "initWithTemplateElement:clientContext:", v8, v10);
LABEL_44:
        v12 = v18;
        goto LABEL_45;
      }
    }
    v18 = -[SKUIStackDocumentViewController initWithTemplateElement:layoutStyle:]([SKUIStackDocumentViewController alloc], "initWithTemplateElement:layoutStyle:", v8, v14);
    goto LABEL_44;
  }
LABEL_46:
  objc_msgSend(v12, "setClientContext:", v10);

  return v12;
}

- (void)_redirectToURL:(id)a3
{
  SSVLoadURLOperation *loadURLOperation;
  id v5;
  SSVLoadURLOperation *v6;
  NSString *v7;
  NSString *urlString;

  loadURLOperation = self->_loadURLOperation;
  v5 = a3;
  -[SSVLoadURLOperation setOutputBlock:](loadURLOperation, "setOutputBlock:", 0);
  -[SSVLoadURLOperation cancel](self->_loadURLOperation, "cancel");
  v6 = self->_loadURLOperation;
  self->_loadURLOperation = 0;

  objc_msgSend(v5, "absoluteString");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  urlString = self->_urlString;
  self->_urlString = v7;

  -[SKUIDocumentContainerViewController _enqueueLoadURLOperation](self, "_enqueueLoadURLOperation");
}

- (void)_reloadDefaultBarButtonItems
{
  UIViewController *v3;
  NSArray *v4;
  NSArray *defaultLeftBarButtonItems;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  id v10;

  -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self->_childViewController;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController leftBarButtonItemsForDocument:](v3, "leftBarButtonItemsForDocument:", self->_document);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  defaultLeftBarButtonItems = self->_defaultLeftBarButtonItems;
  if (defaultLeftBarButtonItems != v4 && !-[NSArray isEqualToArray:](defaultLeftBarButtonItems, "isEqualToArray:", v4))
  {
    objc_msgSend(v10, "leftBarButtonItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "mutableCopy");

    if (v7)
    {
      if (self->_defaultLeftBarButtonItems)
        objc_msgSend(v7, "removeObjectsInArray:");
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    v8 = (NSArray *)-[NSArray copy](v4, "copy");
    v9 = self->_defaultLeftBarButtonItems;
    self->_defaultLeftBarButtonItems = v8;

    if (!objc_msgSend(v7, "count") && -[NSArray count](self->_defaultLeftBarButtonItems, "count"))
      objc_msgSend(v7, "addObjectsFromArray:", self->_defaultLeftBarButtonItems);
    objc_msgSend(v10, "setLeftBarButtonItems:animated:", v7, 0);

  }
}

- (void)_reloadPageData
{
  void *v3;
  uint64_t v4;
  UIViewController *beforeErrorChildViewController;
  id v6;

  if (self->_urlString && !self->_loadURLOperation)
  {
    objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "networkType");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC138], 0);
      -[SKUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", self->_beforeErrorChildViewController);
      beforeErrorChildViewController = self->_beforeErrorChildViewController;
      self->_beforeErrorChildViewController = 0;

      -[SKUIDocumentContainerViewController _enqueueLoadURLOperation](self, "_enqueueLoadURLOperation");
    }
  }
}

- (void)_reloadNavigationBarControllerIfNeeded
{
  if (self->_navigationBarController)
  {
    -[SKUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");
  }
  else
  {
    -[SKUIDocumentContainerViewController _reloadNavigationBarController](self, "_reloadNavigationBarController");
    -[SKUIDocumentContainerViewController _reloadDefaultBarButtonItems](self, "_reloadDefaultBarButtonItems");
    -[SKUIDocumentContainerViewController _reloadToolbar](self, "_reloadToolbar");
  }
}

- (void)_reloadNavigationBarController
{
  void *v3;
  SKUINavigationBarController *navigationBarController;
  NSArray *v5;
  NSArray *searchBarControllers;
  void *v7;
  int v8;
  void *v9;
  SKUINavigationBarController *v10;
  SKUINavigationBarController *v11;
  void *v12;
  SKUINavigationBarController *v13;
  void *v14;
  void *v15;
  id v16;

  -[SKUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  navigationBarController = self->_navigationBarController;
  if (navigationBarController)
  {
    -[SKUINavigationBarController existingSearchBarControllers](navigationBarController, "existingSearchBarControllers");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchBarControllers = self->_searchBarControllers;
    self->_searchBarControllers = v5;

    if (self->_makeSearchBarFirstResponderOnLoad)
    {
      -[NSArray firstObject](self->_searchBarControllers, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_makeSearchBarFirstResponderOnLoad = 0;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v16, "firstChildForElementType:", 106);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_navigationBarController;
    if (v9)
    {
      -[SKUINavigationBarController detachNavigationItemControllers](v10, "detachNavigationItemControllers");
      v8 = 1;
    }
    else
    {
      -[SKUINavigationBarController detachFromNavigationItem:](v10, "detachFromNavigationItem:", v3);
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF448C60))
  {
    -[UIViewController navigationBarControllerWithViewElement:](self->_childViewController, "navigationBarControllerWithViewElement:", v16);
    v11 = (SKUINavigationBarController *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_15;
  }
  else
  {
    v11 = 0;
  }
  if (v16)
    v11 = -[SKUINavigationBarController initWithNavigationBarViewElement:]([SKUINavigationBarController alloc], "initWithNavigationBarViewElement:", v16);
LABEL_15:
  if (v11)
  {
    -[SKUIViewController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationBarController setClientContext:](v11, "setClientContext:", v12);

    -[SKUINavigationBarController setDelegate:](v11, "setDelegate:", self);
    -[SKUINavigationBarController setParentViewController:](v11, "setParentViewController:", self);
    -[SKUINavigationBarController setReusableSearchBarControllers:](v11, "setReusableSearchBarControllers:", self->_searchBarControllers);
    -[SKUINavigationBarController attachToNavigationItem:](v11, "attachToNavigationItem:", v3);
  }
  else if (v8)
  {
    -[SKUINavigationBarController detachFromNavigationItem:](self->_navigationBarController, "detachFromNavigationItem:", v3);
  }
  v13 = self->_navigationBarController;
  self->_navigationBarController = v11;

  if (objc_msgSend(v7, "canBecomeActive"))
  {
    objc_msgSend(v7, "becomeActive");
    if (self->_selectSearchBarContentOnBecomingFirstResponder)
    {
      objc_msgSend(v7, "searchBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "searchField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectAll:", 0);

      self->_selectSearchBarContentOnBecomingFirstResponder = 0;
    }
  }
  -[SKUIDocumentContainerViewController _reloadNavigationPalette](self, "_reloadNavigationPalette");

}

- (void)_reloadNavigationPalette
{
  SKUIDocumentContainerViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SKUIDocumentContainerViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topViewController");
  v3 = (SKUIDocumentContainerViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[SKUIViewController clientContext](self, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUINavigationControllerAssistant assistantForNavigationController:clientContext:](SKUINavigationControllerAssistant, "assistantForNavigationController:clientContext:", v8, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIDocumentContainerViewController navigationPaletteView](self, "navigationPaletteView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPaletteView:animated:", v6, 0);
    -[SKUIDocumentContainerViewController _navigationBarViewElement](self, "_navigationBarViewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidesShadow:", objc_msgSend(v7, "hidesShadow"));

  }
}

- (void)_reloadToolbar
{
  void *v3;
  SKUIToolbarController *v4;
  SKUIToolbarController *v5;
  SKUIToolbarController *toolbarController;
  id v7;

  -[SKUIDocumentContainerViewController _toolbarViewElement](self, "_toolbarViewElement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIDocumentContainerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKUIToolbarController initWithToolbarViewElement:]([SKUIToolbarController alloc], "initWithToolbarViewElement:", v7);
  v5 = v4;
  if (v4)
  {
    -[SKUIToolbarController setDelegate:](v4, "setDelegate:", self);
    -[SKUIToolbarController updateToolbarForNavigationController:](v5, "updateToolbarForNavigationController:", v3);
  }
  toolbarController = self->_toolbarController;
  self->_toolbarController = v5;

}

- (void)_sendOnViewAttributesChangeWithAttributes:(id)a3 viewWillAppear:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  id pendingSizeTransitionCompletion;
  void *v13;
  id v14;
  dispatch_time_t v15;
  _QWORD v16[5];
  _QWORD aBlock[5];
  id v18;
  id v19;
  BOOL v20;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke;
  aBlock[3] = &unk_1E73A5C28;
  objc_copyWeak(&v19, &location);
  v20 = a4;
  aBlock[4] = self;
  v8 = v6;
  v18 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "applicationState");

  if (v11 == 2)
  {
    pendingSizeTransitionCompletion = self->_pendingSizeTransitionCompletion;
    v13 = _Block_copy(v9);
    v14 = self->_pendingSizeTransitionCompletion;
    self->_pendingSizeTransitionCompletion = v13;

    if (!pendingSizeTransitionCompletion)
    {
      v15 = dispatch_time(0, 100000000);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke_2;
      v16[3] = &unk_1E739FD38;
      v16[4] = self;
      dispatch_after(v15, MEMORY[0x1E0C80D38], v16);
    }
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "isViewLoaded"))
  {
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 1;
    else
      v5 = *(_BYTE *)(a1 + 56) != 0;

  }
  else
  {
    v5 = *(_BYTE *)(a1 + 56) != 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  if ((v5 & SKUIAllowsLandscapePhone() & 1) != 0)
  {
LABEL_11:
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onViewAttributesChangeWithArguments:completion:", v10, 0);

  }
LABEL_12:

}

void __96__SKUIDocumentContainerViewController__sendOnViewAttributesChangeWithAttributes_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  objc_msgSend(*(id *)(a1 + 32), "pendingSizeTransitionCompletion");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2]();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1232);
  *(_QWORD *)(v2 + 1232) = 0;

}

- (void)_setChildViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_childViewController;
  UIViewController *childViewController;
  void *v8;
  UIViewController *v9;
  void *v10;
  void *v11;
  UIViewController *v12;

  v5 = (UIViewController *)a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController != v5)
  {
    v12 = v5;
    -[UIViewController willMoveToParentViewController:](childViewController, "willMoveToParentViewController:", 0);
    if (-[UIViewController isViewLoaded](*p_childViewController, "isViewLoaded"))
    {
      -[UIViewController view](*p_childViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    -[UIViewController removeFromParentViewController](*p_childViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_childViewController, a3);
    -[SKUIDocumentContainerViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    if (*p_childViewController)
    {
      -[SKUIDocumentContainerViewController addChildViewController:](self, "addChildViewController:");
      v9 = *p_childViewController;
      -[SKUIDocumentContainerViewController preferredContentSize](self, "preferredContentSize");
      -[UIViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
      if (-[SKUIDocumentContainerViewController _appearState](self, "_appearState") == 1
        || -[SKUIDocumentContainerViewController _appearState](self, "_appearState") == 2)
      {
        -[UIViewController beginAppearanceTransition:animated:](*p_childViewController, "beginAppearanceTransition:animated:", 1, 0);
      }
      -[SKUIDocumentContainerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](*p_childViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoresizingMask:", 18);
      objc_msgSend(v10, "bounds");
      objc_msgSend(v11, "setFrame:");
      objc_msgSend(v10, "insertSubview:atIndex:", v11, 0);
      -[UIViewController didMoveToParentViewController:](*p_childViewController, "didMoveToParentViewController:", self);
      -[UIViewController setNeedsScrollingSegmentContentScrollViewUpdate](self, "setNeedsScrollingSegmentContentScrollViewUpdate");

    }
    -[SKUIDocumentContainerViewController _reloadDefaultBarButtonItems](self, "_reloadDefaultBarButtonItems");
    -[SKUIDocumentContainerViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    v5 = v12;
  }

}

- (BOOL)_shouldFillNavigationBarContentsBasedOnNavigationBarViewElement
{
  int v3;
  void *v4;
  char isKindOfClass;

  v3 = -[SKUIDocumentContainerViewController _appearState](self, "_appearState");
  if (v3)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "allowsChildViewControllerNavigationBarManagement");
    if (v3)
    {
      -[SKUIDocumentContainerViewController parentViewController](self, "parentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        LOBYTE(v3) = 0;
      }
      else if (-[UIViewController conformsToProtocol:](self->_childViewController, "conformsToProtocol:", &unk_1EF404A00)&& (objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v3) = -[UIViewController managesNavigationBarContents](self->_childViewController, "managesNavigationBarContents") ^ 1;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (void)_showAccountViewControllerWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SKUIViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC1E0]), "initWithExternalAccountURL:", v4);

  objc_msgSend(v7, "setCanMoveToOverlay:", 0);
  objc_msgSend(v7, "setClientInterface:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
  if (SKUIUserInterfaceIdiom(v5) == 1)
    objc_msgSend(v8, "setModalPresentationStyle:", 2);
  -[SKUIDocumentContainerViewController transitionCoordinator](self, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__SKUIDocumentContainerViewController__showAccountViewControllerWithURL___block_invoke;
    v10[3] = &unk_1E73A35C8;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v10);

  }
  else
  {
    -[SKUIDocumentContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

uint64_t __73__SKUIDocumentContainerViewController__showAccountViewControllerWithURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_showLegacyStorePageWithRequest:(id)a3 page:(id)a4 pageType:(int64_t)a5 URLResponse:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a6;
  v10 = a4;
  v11 = a3;
  -[SKUIViewController clientContext](self, "clientContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "newLegacyStorePageViewControllerForURLResponse:", v19);
  if (!v13)
    v13 = objc_alloc_init(MEMORY[0x1E0DDC258]);
  objc_msgSend(v13, "clientInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v12, "clientInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClientInterface:", v15);

  }
  objc_msgSend(v13, "setCanMoveToOverlay:", 0);
  objc_msgSend(v13, "setShouldAdjustContentOffsets:", 0);
  -[SKUIDocumentContainerViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setExistingNavigationItem:", v16);

  objc_msgSend(v13, "setExternalRequest:", 1);
  -[SKUIDocumentContainerViewController _setChildViewController:](self, "_setChildViewController:", v13);
  objc_msgSend(v19, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadWithStorePage:ofType:forURL:", v10, a5, v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF670]), "initWithURLRequest:", v11);
  objc_msgSend(v13, "setURLRequestProperties:", v18);

}

- (id)_sidepackViewControllerWithOptions:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SKUIItem *v9;
  uint64_t v10;
  __objc2_class **v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("sidepackType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", 0x1E73B55F0))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("sidepackData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SKUIItem initWithLookupDictionary:]([SKUIItem alloc], "initWithLookupDictionary:", v8);
      v10 = SKUIUserInterfaceIdiom(v6);
      v11 = off_1E739E208;
      if (v10 != 1)
        v11 = off_1E739E218;
      v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithItem:", v9);
      objc_msgSend(v12, "setClientContext:", v6);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)childViewController
{
  return self->_childViewController;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController animationControllerForPresentedController:presentingController:sourceController:](self->_childViewController, "animationControllerForPresentedController:presentingController:sourceController:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController animationControllerForDismissedController:](self->_childViewController, "animationControllerForDismissedController:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SKUIMetricsPageRenderEvent)pageRenderEvent
{
  return self->_pageRenderEvent;
}

- (void)setPageRenderEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pageRenderEvent, a3);
}

- (SKUIMetricsDOMChangeQueue)domChangeTimingQueue
{
  return self->_domChangeTimingQueue;
}

- (void)setDomChangeTimingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_domChangeTimingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domChangeTimingQueue, 0);
  objc_storeStrong((id *)&self->_pageRenderEvent, 0);
  objc_storeStrong(&self->_pendingSizeTransitionCompletion, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_sizeAtDisappear, 0);
  objc_storeStrong((id *)&self->_searchBarControllers, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_personalizationItems, 0);
  objc_storeStrong((id *)&self->_pageResponseAbsoluteTime, 0);
  objc_storeStrong((id *)&self->_orientationAtDisappear, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_navigationBarController, 0);
  objc_storeStrong((id *)&self->_mediaQueryEvaluator, 0);
  objc_storeStrong((id *)&self->_loadURLOperation, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_defaultLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_beforeErrorChildViewController, 0);
}

- (void)initWithDocument:(uint64_t)a3 options:(uint64_t)a4 clientContext:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)allowsChildViewControllerNavigationBarManagement
{
}

@end
