@implementation _TVAppDocumentController

- (_TVAppDocumentController)initWithAppDocument:(id)a3
{
  id v4;
  _TVAppDocumentController *v5;
  void *v6;
  _TVPagePerformanceController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  -[TVDocumentViewController tvdvc_initWithNibName:bundle:](&v12, sel_tvdvc_initWithNibName_bundle_, 0, 0);
  v5 = (_TVAppDocumentController *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_TVAppDocumentController setAppDocument:](v5, "setAppDocument:", v4);
    -[_TVAppDocumentController appDocument](v5, "appDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v5);

    v5->_opaque = 1;
    v7 = objc_alloc_init(_TVPagePerformanceController);
    -[_TVAppDocumentController setPagePerformance:](v5, "setPagePerformance:", v7);

    -[_TVAppDocumentController pagePerformance](v5, "pagePerformance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v5);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__darkerSystemColorStatusChanged_, *MEMORY[0x24BDF7230], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel__boldTextStatusChanged_, *MEMORY[0x24BDF71F8], 0);

  }
  return v5;
}

- (void)replaceAppDocumentWithAppDocument:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v5 = (id)TVMLKitSignpostLogObject;
  v6 = TVMLKitSignpostLogObject;
  v7 = a3;
  v8 = os_signpost_id_make_with_pointer(v6, self);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_222D98000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TVAppDocumentControllerReplace", (const char *)&unk_222E7E612, v14, 2u);
    }
  }

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", 0);
  -[_TVAppDocumentController setAppDocument:](self, "setAppDocument:", v7);

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  if (-[_TVAppDocumentController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVAppDocumentController _updateTemplateViewController](self, "_updateTemplateViewController");
    -[_TVAppDocumentController _updateIdleModeStatus](self, "_updateIdleModeStatus");
    -[_TVAppDocumentController appDocument](self, "appDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "onLoad");

    -[_TVAppDocumentController appDocument](self, "appDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "onAppear");

    objc_msgSend(v10, "onDisappear");
    objc_msgSend(v10, "onUnload");
  }

}

- (void)dealloc
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

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onUnload");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willMoveToParentViewController:", 0);

  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromParentViewController");

  -[_TVAppDocumentController setTemplateViewController:](self, "setTemplateViewController:", 0);
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  if (-[_TVAppDocumentController isVisualEffectDisablementNeeded](self, "isVisualEffectDisablementNeeded"))
  {
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_TVVisualEffectView removeHostView:](_TVVisualEffectView, "removeHostView:", v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController dealloc](&v12, sel_dealloc);
}

- (void)setAppDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  $3D74E0BA28085DB937595DAB3734F33A *p_delegateFlags;
  void *v8;
  void *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appDelegate, obj);
    if ((objc_msgSend(obj, "conformsToProtocol:", &unk_2557D9540) & 1) != 0)
    {
      -[_TVAppDocumentController appDelegate](self, "appDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      p_delegateFlags = &self->_delegateFlags;
      self->_delegateFlags.hasMediaQueryEvaluator = objc_opt_respondsToSelector() & 1;

      -[_TVAppDocumentController appDelegate](self, "appDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_delegateFlags.hasWillHostTemplateViewController = objc_opt_respondsToSelector() & 1;

      -[_TVAppDocumentController appDelegate](self, "appDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      p_delegateFlags->hasDidHostTemplateViewController = objc_opt_respondsToSelector() & 1;

    }
    else
    {
      *(_WORD *)&self->_delegateFlags.hasMediaQueryEvaluator = 0;
      self->_delegateFlags.hasDidHostTemplateViewController = 0;
    }
    v5 = obj;
  }

}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[_TVAppDocumentController isTransitioning](self, "isTransitioning"))
  {
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_TVAppDocumentController childViewControllers](self, "childViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
  {
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v7;
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[_TVAppDocumentController pagePerformance](self, "pagePerformance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markViewWillLoad");

  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = (id)objc_msgSend(v4, "initWithFrame:");

  if (self->_opaque)
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[_TVAppDocumentController setView:](self, "setView:", v7);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _TVLoadingViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewDidLoad](&v20, sel_viewDidLoad);
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_TVAppDocumentController _updateTemplateViewController](self, "_updateTemplateViewController");
    -[_TVAppDocumentController appDocument](self, "appDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onLoad");
  }
  else
  {
    -[_TVAppDocumentController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(_TVLoadingViewController);
    -[_TVAppDocumentController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_TVLoadingViewController navigationItem](v5, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v7);

    }
    -[_TVAppDocumentController setTemplateViewController:](self, "setTemplateViewController:", v5);
    -[_TVAppDocumentController preferredContentSize](self, "preferredContentSize");
    if (*MEMORY[0x24BDBF148] != v10 || *(double *)(MEMORY[0x24BDBF148] + 8) != v9)
    {
      -[_TVAppDocumentController preferredContentSize](self, "preferredContentSize");
      -[_TVLoadingViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
    }
    -[_TVAppDocumentController addChildViewController:](self, "addChildViewController:", v5);
    -[_TVLoadingViewController view](v5, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v12);
    -[_TVLoadingViewController didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("enableTVMLRefresh"));

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 13, self, sel_reload);
    -[_TVAppDocumentController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", v15);

  }
  -[_TVAppDocumentController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "interactivePopGestureRecognizer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);

  -[_TVAppDocumentController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[_TVAppDocumentController pagePerformance](self, "pagePerformance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "markViewDidLoad");

}

- (void)reload
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "reload");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[_TVAppDocumentController pagePerformance](self, "pagePerformance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markViewWillAppear");

  v9.receiver = self;
  v9.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  if (!-[_TVAppDocumentController isTransitioning](self, "isTransitioning")
    && -[_TVAppDocumentController isVisualEffectDisablementNeeded](self, "isVisualEffectDisablementNeeded"))
  {
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_TVVisualEffectView disableForHostView:](_TVVisualEffectView, "disableForHostView:", v7);

  }
  -[_TVAppDocumentController _updateIdleModeStatus](self, "_updateIdleModeStatus");
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onAppear");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  if (!-[_TVAppDocumentController isTransitioning](self, "isTransitioning")
    && -[_TVAppDocumentController isVisualEffectDisablementNeeded](self, "isVisualEffectDisablementNeeded"))
  {
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_TVVisualEffectView enableForHostView:](_TVVisualEffectView, "enableForHostView:", v5);

  }
  -[_TVAppDocumentController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 1;

  -[_TVAppDocumentController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interactivePopGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v8);

  -[_TVAppDocumentController pagePerformance](self, "pagePerformance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markViewDidAppear");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  -[_TVAppDocumentController pagePerformance](self, "pagePerformance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markViewWillDisappear");

  v8.receiver = self;
  v8.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  if (!-[_TVAppDocumentController isTransitioning](self, "isTransitioning"))
  {
    if (-[_TVAppDocumentController isVisualEffectDisablementNeeded](self, "isVisualEffectDisablementNeeded"))
    {
      -[_TVAppDocumentController templateViewController](self, "templateViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_TVVisualEffectView disableForHostView:](_TVVisualEffectView, "disableForHostView:", v7);

    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[_TVAppDocumentController pagePerformance](self, "pagePerformance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markViewDidDisappear");

  -[_TVAppDocumentController pagePerformanceView](self, "pagePerformanceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onDisappear");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  _TVAppDocumentController *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (_TVAppDocumentController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[_TVAppDocumentController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setCenter:", v7 * 0.5, v9 * 0.5);
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v7, v9);

  }
  if (self->_shouldMarkStylesDirtyBeforeLayout)
  {
    self->_shouldMarkStylesDirtyBeforeLayout = 0;
    -[_TVAppDocumentController _markAndNotifyStylesDirty](self, "_markAndNotifyStylesDirty");
  }
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "preferredStatusBarStyle");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVAppDocumentController;
    v5 = -[_TVAppDocumentController preferredStatusBarStyle](&v7, sel_preferredStatusBarStyle);
  }

  return (int64_t)v5;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;

  -[_TVAppDocumentController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "appDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVAppDocumentController appDocument](self, "appDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "templateElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_controllerTransitionFromElement:toElement:forNavigationControllerOperation:relativeToFrom:", v10, v8, a3, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {

        goto LABEL_8;
      }
    }

  }
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
    v12 = 0;
    goto LABEL_10;
  }
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customAnimatorForNavigationControllerOperation:fromViewController:", a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_10:
  return v12;
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "appDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVAppDocumentController appDocument](self, "appDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "templateElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_controllerTransitionFromElement:toElement:forNavigationControllerOperation:relativeToFrom:", v10, v8, a3, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {

        goto LABEL_8;
      }
    }

  }
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
    v12 = 0;
    goto LABEL_10;
  }
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customAnimatorForNavigationControllerOperation:toViewController:", a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_10:
  return v12;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[_TVAppDocumentController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (id)objc_msgSend(v4, "supportedInterfaceOrientations");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVAppDocumentController;
    v5 = -[_TVAppDocumentController supportedInterfaceOrientations](&v8, sel_supportedInterfaceOrientations);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    -[_TVAppDocumentController viewWillTransitionToSize:withTransitionCoordinator:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    self->_shouldMarkStylesDirtyBeforeLayout = 1;
  v17.receiver = self;
  v17.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (id)overrideTraitCollectionForChildViewController:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController overrideTraitCollectionForChildViewController:](&v18, sel_overrideTraitCollectionForChildViewController_, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      -[_TVAppDocumentController appDocument](self, "appDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "templateElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[TVMLUtilities overrideInterfaceStyleForTemplateElement:](TVMLUtilities, "overrideInterfaceStyleForTemplateElement:", v10);

      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v5)
        {
          v14 = (void *)MEMORY[0x24BDF6F30];
          v19[0] = v5;
          v19[1] = v12;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "traitCollectionWithTraitsFromCollections:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v16;
        }
        else
        {
          v5 = v12;
        }

      }
    }
  }

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_16;
  -[_TVAppDocumentController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "templateElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[TVMLUtilities overrideInterfaceStyleForTemplateElement:](TVMLUtilities, "overrideInterfaceStyleForTemplateElement:", v8);

  if (!v9 && objc_msgSend(v4, "userInterfaceStyle"))
  {
    v14 = objc_msgSend(v4, "userInterfaceStyle");
    v10 = v14 != objc_msgSend(v6, "userInterfaceStyle");
    if (!v4)
      goto LABEL_8;
LABEL_4:
    v11 = objc_msgSend(v4, "horizontalSizeClass");
    if (v11 == objc_msgSend(v6, "horizontalSizeClass"))
    {
      v12 = objc_msgSend(v4, "verticalSizeClass");
      v13 = v12 != objc_msgSend(v6, "verticalSizeClass");
    }
    else
    {
      v13 = 1;
    }
    objc_msgSend(v4, "preferredContentSizeCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15 != v16;
    goto LABEL_11;
  }
  v10 = 0;
  if (v4)
    goto LABEL_4;
LABEL_8:
  -[_TVAppDocumentController mediaQueryEvaluator](self, "mediaQueryEvaluator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "windowSizeAdaptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v16, "update");
  v17 = 0;
LABEL_11:

  if (v10)
  {
    -[_TVAppDocumentController _markAndNotifyStylesDirty](self, "_markAndNotifyStylesDirty");
  }
  else if ((v13 | v17) == 1)
  {
    self->_shouldMarkStylesDirtyBeforeLayout = 1;
  }

LABEL_16:
  -[_TVAppDocumentController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "modalRootViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "isEqual:", v20);

  if (v21)
  {
    -[_TVAppDocumentController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "navigationBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "traitCollectionDidChange:", v4);

  }
  v24.receiver = self;
  v24.super_class = (Class)_TVAppDocumentController;
  -[_TVAppDocumentController traitCollectionDidChange:](&v24, sel_traitCollectionDidChange_, v4);

}

- (CGSize)tv_adjustedWindowSizeForDocument:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  -[_TVAppDocumentController mediaQueryEvaluator](self, "mediaQueryEvaluator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowSizeAdaptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustedWindowSize");
  v7 = v6;
  v9 = v8;

  -[_TVAppDocumentController parentViewController](self, "parentViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_5;
  v11 = (void *)v10;
  -[_TVAppDocumentController parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isViewLoaded");

  if (!v13)
    goto LABEL_5;
  -[_TVAppDocumentController parentViewController](self, "parentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;

  if (v17 >= v7 && v19 >= v9)
  {
LABEL_5:
    v17 = v7;
    v19 = v9;
  }
  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)documentNeedsUpdate:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a3;
  v4 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    -[_TVAppDocumentController documentNeedsUpdate:].cold.1((uint64_t)v3, v4, v5);

}

- (void)documentDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  if ((-[_TVAppDocumentController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    if ((objc_msgSend(v30, "isUpdated") & 1) != 0 || !objc_msgSend(v30, "isSubtreeUpdated"))
    {
      -[_TVAppDocumentController _updateTemplateViewController](self, "_updateTemplateViewController");
      -[_TVAppDocumentController appDocument](self, "appDocument");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "templateElement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resetProperty:", 1);
    }
    else
    {
      -[_TVAppDocumentController pagePerformance](self, "pagePerformance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppDocumentController appDocument](self, "appDocument");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "templateElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getEntryForTemplate:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "markTemplateWillRender");
      -[_TVAppDocumentController appDocument](self, "appDocument");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "templateElement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "updateType") == 4)
      {
        -[_TVAppDocumentController mediaQueryEvaluator](self, "mediaQueryEvaluator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTemplateElement:", v9);

      }
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_willParseAppDocument:forImplicitUpdates:", v30, 0);

      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppDocumentController appDocument](self, "appDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "templateElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppDocumentController templateViewController](self, "templateViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_viewControllerFromElement:existingController:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "markTemplateDidRender");
      objc_msgSend(v7, "markTemplateWillTransition");
      objc_msgSend(v7, "markTemplateDidTransition");
      -[_TVAppDocumentController appDocument](self, "appDocument");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "templateElement");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resetProperty:", 1);

      -[_TVAppDocumentController tabBarController](self, "tabBarController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        if (-[_TVAppDocumentController _isFlowcaseStack](self, "_isFlowcaseStack"))
        {
          -[_TVAppDocumentController templateViewController](self, "templateViewController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setClipsToBounds:", 0);

          -[_TVAppDocumentController templateViewController](self, "templateViewController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subviews");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setClipsToBounds:", 0);

        }
        objc_msgSend(v19, "_setSelectedViewControllerNeedsLayout");
      }
      objc_msgSend(v16, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppDocumentController _updateModalPresentationStateWithTemplateView:](self, "_updateModalPresentationStateWithTemplateView:", v26);

    }
    -[_TVAppDocumentController _updateIdleModeStatus](self, "_updateIdleModeStatus");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:", CFSTR("_TVAppDocumentDidUpdateNotification"), self);

    objc_msgSend(v30, "onUpdate");
  }
  else
  {
    -[_TVAppDocumentController appDocument](self, "appDocument");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "templateElement");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "resetProperty:", 1);

  }
}

- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[_TVAppDocumentController mediaQueryEvaluator](self, "mediaQueryEvaluator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "evaluateMediaQuery:", v5);

  return v7;
}

- (id)impressionableViewElementsForDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_impressionableElementsForDocument:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)documentDidUpdateImplicitly:(id)a3
{
  void *v4;
  id v5;

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_willParseAppDocument:forImplicitUpdates:", v4, 1);

}

- (void)setOpaque:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_opaque != a3)
  {
    self->_opaque = a3;
    -[_TVAppDocumentController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_opaque)
      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (void)scrollToTop
{
  void *v3;
  char v4;
  id v5;

  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_TVAppDocumentController templateViewController](self, "templateViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToTop");

  }
}

- (void)_markAndNotifyStylesDirty
{
  OUTLINED_FUNCTION_1(&dword_222D98000, a1, a3, "DirtyStyles: style dirty at: {%.1lf, %.1lf}", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_updateIdleModeStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "templateElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tv_elementType");

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 != 28)
  {
    v13 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v13;
    if ((v8 & 1) != 0)
    {
      v9 = ((unint64_t)(v5 - 65) < 0xA) & (0x241u >> (v5 - 65));
      -[_TVAppDocumentController templateViewController](self, "templateViewController", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "conformsToProtocol:", &unk_255796988))
      {
        -[_TVAppDocumentController templateViewController](self, "templateViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) == 0)
        {
LABEL_7:
          objc_msgSend(v13, "updateIdleModeVisualEffectsStatus:", v9);
          v7 = v13;
          goto LABEL_8;
        }
        -[_TVAppDocumentController templateViewController](self, "templateViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "supportsIdleModeVisualEffects");
      }

      goto LABEL_7;
    }
  }
LABEL_8:

}

- (id)_alertControllerWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Cannot Connect to iTunes Store."), v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x24BDF67E8];
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __54___TVAppDocumentController__alertControllerWithError___block_invoke;
  v13 = &unk_24EB85D60;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "actionWithTitle:style:handler:", CFSTR("OK"), 1, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v8, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  void *v2;
  void *v3;
  char v4;

  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "automaticallyAdjustsScrollViewInsets");
  else
    v4 = 1;

  return v4;
}

- (void)_updateModalPresentationStateWithTemplateView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _TVAppDocumentController *val;
  id obj;
  _QWORD v34[5];
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  val = self;
  -[_TVAppDocumentController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_TVAppDocumentController navigationController](val, "navigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "configuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v28, "type");
      objc_msgSend(v29, "containingAlertController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 && (unint64_t)(v5 - 1001) <= 1)
      {
        v43 = 0u;
        v44 = 0u;
        v42 = 0u;
        v41 = 0u;
        -[_TVAppDocumentController appDocument](val, "appDocument");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "templateElement");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "children");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v42;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v42 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              if (objc_msgSend(v12, "tv_elementType") == 25)
              {
                v26 = v12;
                goto LABEL_16;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
            if (v9)
              continue;
            break;
          }
        }
        v26 = 0;
LABEL_16:

        v13 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(v26, "children");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v26, "unfilteredChildren");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v38 != v16)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v18, "text");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "string");
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v18, "attributes");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKey:", CFSTR("actionStyle"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(v22, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
                {
                  v23 = 1;
                }
                else if (objc_msgSend(v22, "isEqualToString:", CFSTR("destructive")))
                {
                  v23 = 2;
                }
                else
                {
                  v23 = 0;
                }
                objc_initWeak(&location, val);
                v24 = (void *)MEMORY[0x24BDF67E8];
                v34[0] = MEMORY[0x24BDAC760];
                v34[1] = 3221225472;
                v34[2] = __74___TVAppDocumentController__updateModalPresentationStateWithTemplateView___block_invoke;
                v34[3] = &unk_24EB85D88;
                objc_copyWeak(&v35, &location);
                v34[4] = v18;
                objc_msgSend(v24, "actionWithTitle:style:handler:", v20, v23, v34);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v25);

                objc_destroyWeak(&v35);
                objc_destroyWeak(&location);

              }
            }
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v15);
        }

        objc_msgSend(v28, "setAlertActions:", v31);
        objc_msgSend(v28, "_applyAlertActionsForController:", v27);

      }
      objc_msgSend(v30, "tv_sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), v26);
      -[_TVAppDocumentController setPreferredContentSize:](val, "setPreferredContentSize:");

    }
  }
  else
  {

  }
}

- (void)_updateTemplateViewController
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_222D98000, a3, (uint64_t)a3, "Template element: %@", (uint8_t *)a2);

}

- (void)_willHostTemplateViewController:(id)a3 usesTransitions:(BOOL *)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[_TVAppDocumentController willHostTemplateViewController:usesTransitions:](self, "willHostTemplateViewController:usesTransitions:");
  if (self->_delegateFlags.hasWillHostTemplateViewController)
  {
    -[_TVAppDocumentController appDelegate](self, "appDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appDocumentController:willHostTemplateViewController:usesTransitions:", self, v7, a4);

  }
  -[TVDocumentViewController willUpdateDocument](self, "willUpdateDocument");

}

- (void)_didHostTemplateViewController:(id)a3 usedTransitions:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[_TVAppDocumentController didHostTemplateViewController:usedTransitions:](self, "didHostTemplateViewController:usedTransitions:");
  if (self->_delegateFlags.hasDidHostTemplateViewController)
  {
    -[_TVAppDocumentController appDelegate](self, "appDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appDocumentController:didHostTemplateViewController:usedTransitions:", self, v7, v4);

  }
  -[TVDocumentViewController didUpdateDocument](self, "didUpdateDocument");

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return !-[_TVAppDocumentController isTransitioning](self, "isTransitioning");
}

- (BOOL)_isFlowcaseStack
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[TVMLUtilities isFlowcaseAtTopOfStackFromElement:](TVMLUtilities, "isFlowcaseAtTopOfStackFromElement:", v3);

  return v4;
}

- (BOOL)_tvTabBarShouldOverlap
{
  return !-[_TVAppDocumentController _isFlowcaseStack](self, "_isFlowcaseStack");
}

- (id)_mediaQueryEvaluator
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (!self->_delegateFlags.hasMediaQueryEvaluator
    || (-[_TVAppDocumentController appDelegate](self, "appDelegate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "mediaQueryEvaluatorForAppDocumentController:", self),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    -[_TVAppDocumentController appDocument](self, "appDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "app");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_255791C30))
    {
      -[_TVAppDocumentController appDocument](self, "appDocument");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "app");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyTraitEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

    -[_TVAppDocumentController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[_TVAppDocumentController parentViewController](self, "parentViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_9;
      -[_TVAppDocumentController parentViewController](self, "parentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_9:
        v17 = (id *)MEMORY[0x24BDF74F8];
        objc_msgSend((id)*MEMORY[0x24BDF74F8], "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*v17, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "window");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = 0;
        }

      }
    }
    -[_TVAppDocumentController appDocument](self, "appDocument");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "templateElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVMediaQueryEvaluator evaluatorForTemplateElement:inWindow:traitEnvironment:](TVMediaQueryEvaluator, "evaluatorForTemplateElement:inWindow:traitEnvironment:", v21, v13, v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (CGSize)formSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_2557AEA40))
  {
    objc_msgSend(v14, "updatePreferredFocusedViewStateForFocus:", v3);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDF6F90];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68___TVAppDocumentController_updatePreferredFocusedViewStateForFocus___block_invoke;
    v15[3] = &unk_24EB85440;
    v5 = v14;
    v16 = v5;
    objc_msgSend(v4, "performWithoutAnimation:", v15);
    objc_msgSend(v5, "preferredFocusEnvironments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "preferredFocusEnvironments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    while (v7 != v9 && v9)
    {
      v10 = v7;
      v7 = v9;

      objc_msgSend(v7, "preferredFocusEnvironments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v7;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v13, "setSelected:animated:", v3, 0);
  }

}

- (void)setMenuGestureHandler:(id)a3
{
  void *v4;
  id menuGestureHandler;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_msgSend(a3, "copy");
  menuGestureHandler = self->_menuGestureHandler;
  self->_menuGestureHandler = v4;

  if (self->_menuGestureHandler)
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__menuGestureHandler_);
    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "setAllowedPressTypes:", &unk_24EBCD430);
    -[_TVAppDocumentController setMenuGestureRecognizer:](self, "setMenuGestureRecognizer:", v10);
    -[_TVAppDocumentController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v10);

  }
  else
  {
    -[_TVAppDocumentController menuGestureRecognizer](self, "menuGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_TVAppDocumentController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppDocumentController menuGestureRecognizer](self, "menuGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeGestureRecognizer:", v9);

      -[_TVAppDocumentController setMenuGestureRecognizer:](self, "setMenuGestureRecognizer:", 0);
    }
  }
}

- (void)_menuGestureHandler:(id)a3
{
  void (**menuGestureHandler)(void);

  if (objc_msgSend(a3, "state") == 3)
  {
    menuGestureHandler = (void (**)(void))self->_menuGestureHandler;
    if (menuGestureHandler)
      menuGestureHandler[2]();
  }
}

- (void)pagePerformanceController:(id)a3 didUpdateMetrics:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if ((objc_msgSend(a3, "pageWasUpdated") & 1) == 0)
  {
    -[_TVAppDocumentController appDocument](self, "appDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "onPerformanceMetricsChange:", v7);

  }
}

- (BOOL)ppt_isLoading
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v8;
  uint64_t v9;

  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  if (-[_TVAppDocumentController isTransitioning](self, "isTransitioning"))
    return 1;
  -[_TVAppDocumentController transitionCoordinator](self, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ppt_isLoading");

  return v9;
}

- (id)activeDocument
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentController templateViewController](self, "templateViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2557AEB30);
  if (v4 && v5)
  {
    objc_msgSend(v4, "activeDocument");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v3;
    v9 = v8;

    v3 = v9;
  }

  return v3;
}

- (id)currentImpressionableElements
{
  void *v3;
  void *v4;

  -[_TVAppDocumentController appDocument](self, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentController impressionableViewElementsForDocument:](self, "impressionableViewElementsForDocument:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)snapshotImpressions
{
  void *v3;
  id v4;

  -[_TVAppDocumentController currentImpressionableElements](self, "currentImpressionableElements");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVAppDocumentController appDocument](self, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotImpressionsForViewElements:", v4);

}

- (IKAppDocument)appDocument
{
  return self->_appDocument;
}

- (void)setAppDocument:(id)a3
{
  objc_storeStrong((id *)&self->_appDocument, a3);
}

- (_TVAppDocumentControllerDelegate)appDelegate
{
  return (_TVAppDocumentControllerDelegate *)objc_loadWeakRetained((id *)&self->_appDelegate);
}

- (UIViewController)templateViewController
{
  return self->_templateViewController;
}

- (void)setTemplateViewController:(id)a3
{
  objc_storeStrong((id *)&self->_templateViewController, a3);
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (id)menuGestureHandler
{
  return self->_menuGestureHandler;
}

- (BOOL)dismissAppOnMenu
{
  return self->_dismissAppOnMenu;
}

- (void)setDismissAppOnMenu:(BOOL)a3
{
  self->_dismissAppOnMenu = a3;
}

- (BOOL)applicationDeactivatedOnMenu
{
  return self->_applicationDeactivatedOnMenu;
}

- (TVMediaQueryEvaluator)mediaQueryEvaluator
{
  return self->_mediaQueryEvaluator;
}

- (void)setMediaQueryEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQueryEvaluator, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_loadWeakRetained((id *)&self->_menuGestureRecognizer);
}

- (void)setMenuGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_menuGestureRecognizer, a3);
}

- (BOOL)isVisualEffectDisablementNeeded
{
  return self->_visualEffectDisablementNeeded;
}

- (void)setVisualEffectDisablementNeeded:(BOOL)a3
{
  self->_visualEffectDisablementNeeded = a3;
}

- (_TVPagePerformanceController)pagePerformance
{
  return self->_pagePerformance;
}

- (void)setPagePerformance:(id)a3
{
  objc_storeStrong((id *)&self->_pagePerformance, a3);
}

- (UIView)pagePerformanceView
{
  return self->_pagePerformanceView;
}

- (void)setPagePerformanceView:(id)a3
{
  objc_storeStrong((id *)&self->_pagePerformanceView, a3);
}

- (BOOL)isPresentedModal
{
  return self->_presentedModal;
}

- (void)setPresentedModal:(BOOL)a3
{
  self->_presentedModal = a3;
}

- (BOOL)adoptsContext
{
  return self->_adoptsContext;
}

- (void)setAdoptsContext:(BOOL)a3
{
  self->_adoptsContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagePerformanceView, 0);
  objc_storeStrong((id *)&self->_pagePerformance, 0);
  objc_destroyWeak((id *)&self->_menuGestureRecognizer);
  objc_storeStrong((id *)&self->_mediaQueryEvaluator, 0);
  objc_storeStrong(&self->_menuGestureHandler, 0);
  objc_storeStrong((id *)&self->_templateViewController, 0);
  objc_destroyWeak((id *)&self->_appDelegate);
  objc_storeStrong((id *)&self->_appDocument, 0);
}

- (void)viewWillTransitionToSize:(uint64_t)a3 withTransitionCoordinator:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_222D98000, a1, a3, "DocStylesDirty: size will change: {%.1lf, %.1lf}", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)documentNeedsUpdate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_222D98000, a2, a3, "Document needs update: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

@end
