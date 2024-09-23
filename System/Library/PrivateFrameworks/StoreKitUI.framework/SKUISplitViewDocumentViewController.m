@implementation SKUISplitViewDocumentViewController

- (SKUISplitViewDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SKUISplitViewDocumentViewController *v9;
  SKUISplitViewDocumentViewController *v10;
  _SKUISplitViewDocumentSplitViewController *v11;
  UISplitViewController *splitViewController;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISplitViewDocumentViewController initWithTemplateElement:clientContext:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISplitViewDocumentViewController;
  v9 = -[SKUISplitViewDocumentViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_templateElement, a3);
    -[SKUIViewController setClientContext:](v10, "setClientContext:", v8);
    v11 = objc_alloc_init(_SKUISplitViewDocumentSplitViewController);
    splitViewController = v10->_splitViewController;
    v10->_splitViewController = &v11->super;

    -[SKUISplitViewDocumentViewController _reloadSplitViewControllers](v10, "_reloadSplitViewControllers");
    -[SKUISplitViewDocumentViewController addChildViewController:](v10, "addChildViewController:", v10->_splitViewController);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUINavigationDocumentController setDelegate:](self->_leftNavigationDocumentController, "setDelegate:", 0);
  -[SKUINavigationDocumentController setDelegate:](self->_rightNavigationDocumentController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUISplitViewDocumentViewController;
  -[SKUIViewController dealloc](&v3, sel_dealloc);
}

- (void)delayPresentationIfNeededForParentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_delayingPresentationViewController;
  UIViewController *delayingPresentationViewController;
  UIViewController *v8;
  UIViewController *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = (UIViewController *)a3;
  p_delayingPresentationViewController = &self->_delayingPresentationViewController;
  delayingPresentationViewController = self->_delayingPresentationViewController;
  if (delayingPresentationViewController != v5)
  {
    -[UIViewController _endDelayingPresentation](delayingPresentationViewController, "_endDelayingPresentation");
    if (-[SKUISplitViewTemplateElement usesInlineSplitContent](self->_templateElement, "usesInlineSplitContent")
      || -[SKUISplitViewDocumentViewController _isFullyPopulated](self, "_isFullyPopulated"))
    {
      v8 = *p_delayingPresentationViewController;
      *p_delayingPresentationViewController = 0;

    }
    else
    {
      objc_storeStrong((id *)&self->_delayingPresentationViewController, a3);
      objc_initWeak(&location, self);
      v9 = *p_delayingPresentationViewController;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __88__SKUISplitViewDocumentViewController_delayPresentationIfNeededForParentViewController___block_invoke;
      v10[3] = &unk_1E73A3FA8;
      objc_copyWeak(&v11, &location);
      -[UIViewController _beginDelayingPresentation:cancellationHandler:](v9, "_beginDelayingPresentation:cancellationHandler:", v10, 3.0);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

}

uint64_t __88__SKUISplitViewDocumentViewController_delayPresentationIfNeededForParentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_skui_endDelayingPresentation");

  return 1;
}

- (void)documentDidUpdate:(id)a3
{
  SKUISplitViewTemplateElement *v4;
  SKUISplitViewTemplateElement *templateElement;

  objc_msgSend(a3, "templateElement");
  v4 = (SKUISplitViewTemplateElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  if (self->_splitViewController)
    -[SKUISplitViewDocumentViewController _reloadSplitViewControllers](self, "_reloadSplitViewControllers");
}

- (id)leftBarButtonItemsForDocument:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[UISplitViewController displayModeButtonItem](self->_splitViewController, "displayModeButtonItem", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)skui_viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[SKUINavigationDocumentController navigationController](self->_leftNavigationDocumentController, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "skui_viewWillAppear:", v3);
  -[SKUINavigationDocumentController navigationController](self->_rightNavigationDocumentController, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "skui_viewWillAppear:", v3);
  v9.receiver = self;
  v9.super_class = (Class)SKUISplitViewDocumentViewController;
  -[SKUIViewController skui_viewWillAppear:](&v9, sel_skui_viewWillAppear_, v3);

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[SKUISplitViewDocumentViewController _defaultBackgroundColor](self, "_defaultBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  -[UISplitViewController view](self->_splitViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v5, "addSubview:", v4);
  -[SKUISplitViewDocumentViewController setView:](self, "setView:", v5);

}

- (void)navigationDocumentStackDidChange:(id)a3
{
  SKUINavigationDocumentController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UISplitViewController *splitViewController;
  void *v11;
  void *v12;
  SKUINavigationDocumentController *v13;

  v13 = (SKUINavigationDocumentController *)a3;
  if (-[SKUISplitViewDocumentViewController _isFullyPopulated](self, "_isFullyPopulated"))
    -[SKUISplitViewDocumentViewController _skui_endDelayingPresentation](self, "_skui_endDelayingPresentation");
  v4 = v13;
  if (self->_leftNavigationDocumentController == v13)
  {
    -[SKUINavigationDocumentController documents](v13, "documents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "navigationBarElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v6, "templateElement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "navigationBarElement");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    objc_msgSend(v7, "firstChildForElementType:", 138);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    splitViewController = self->_splitViewController;
    objc_msgSend(v9, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitViewController _setDisplayModeButtonItemTitle:](splitViewController, "_setDisplayModeButtonItemTitle:", v12);

    v4 = v13;
  }

}

- (id)_defaultBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SKUISplitViewTemplateElement style](self->_templateElement, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)_isFullyPopulated
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SKUINavigationDocumentController documentStackItems](self->_leftNavigationDocumentController, "documentStackItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[SKUINavigationDocumentController documentStackItems](self->_rightNavigationDocumentController, "documentStackItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_reloadSplitViewControllers
{
  void *v3;
  void *v4;
  id v5;
  SKUINavigationDocumentController *v6;
  SKUINavigationDocumentController *leftNavigationDocumentController;
  SKUINavigationDocumentController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SKUINavigationDocumentController *v17;
  SKUINavigationDocumentController *rightNavigationDocumentController;
  SKUINavigationDocumentController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UISplitViewController *splitViewController;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  double v36;
  UISplitViewController *v37;
  UISplitViewController *v38;
  double v39;
  UISplitViewController *v40;
  double v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  -[SKUISplitViewTemplateElement leftSplitElement](self->_templateElement, "leftSplitElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_leftNavigationDocumentController)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
    v6 = -[SKUINavigationDocumentController initWithNavigationController:]([SKUINavigationDocumentController alloc], "initWithNavigationController:", v5);
    leftNavigationDocumentController = self->_leftNavigationDocumentController;
    self->_leftNavigationDocumentController = v6;

    v8 = self->_leftNavigationDocumentController;
    -[SKUIViewController clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationDocumentController setClientContext:](v8, "setClientContext:", v9);

    -[SKUINavigationDocumentController setDelegate:](self->_leftNavigationDocumentController, "setDelegate:", self);
    objc_msgSend(v4, "ikBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "setBackgroundColor:", v11);
    }
    else
    {
      -[SKUISplitViewDocumentViewController _defaultBackgroundColor](self, "_defaultBackgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v14);

    }
  }
  -[SKUISplitViewTemplateElement leftNavigationDocument](self->_templateElement, "leftNavigationDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNavigationDocumentController:", self->_leftNavigationDocumentController);

  if (!self->_rightNavigationDocumentController)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
    v17 = -[SKUINavigationDocumentController initWithNavigationController:]([SKUINavigationDocumentController alloc], "initWithNavigationController:", v16);
    rightNavigationDocumentController = self->_rightNavigationDocumentController;
    self->_rightNavigationDocumentController = v17;

    v19 = self->_rightNavigationDocumentController;
    -[SKUIViewController clientContext](self, "clientContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationDocumentController setClientContext:](v19, "setClientContext:", v20);

    -[SKUINavigationDocumentController setDelegate:](self->_rightNavigationDocumentController, "setDelegate:", self);
    -[SKUISplitViewTemplateElement rightSplitElement](self->_templateElement, "rightSplitElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ikBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "color");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      objc_msgSend(v25, "setBackgroundColor:", v24);
    }
    else
    {
      -[SKUISplitViewDocumentViewController _defaultBackgroundColor](self, "_defaultBackgroundColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBackgroundColor:", v27);

    }
  }
  -[SKUISplitViewTemplateElement rightNavigationDocument](self->_templateElement, "rightNavigationDocument");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNavigationDocumentController:", self->_rightNavigationDocumentController);

  splitViewController = self->_splitViewController;
  -[SKUINavigationDocumentController navigationController](self->_leftNavigationDocumentController, "navigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v30;
  -[SKUINavigationDocumentController navigationController](self->_rightNavigationDocumentController, "navigationController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitViewController setViewControllers:](splitViewController, "setViewControllers:", v32);

  -[UISplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", -[SKUISplitViewTemplateElement preferredDisplayMode](self->_templateElement, "preferredDisplayMode"));
  objc_msgSend(v4, "itemWidth");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v35 = v34;
  v36 = v34;

  if (v35 >= 1.0)
  {
    -[UISplitViewController setMaximumPrimaryColumnWidth:](self->_splitViewController, "setMaximumPrimaryColumnWidth:", v36);
    -[UISplitViewController setMinimumPrimaryColumnWidth:](self->_splitViewController, "setMinimumPrimaryColumnWidth:", v36);
    v40 = self->_splitViewController;
    v41 = *MEMORY[0x1E0DC53A8];
  }
  else
  {
    v37 = self->_splitViewController;
    if (v35 >= 0.00000011921)
    {
      -[UISplitViewController setMaximumPrimaryColumnWidth:](v37, "setMaximumPrimaryColumnWidth:", 1.79769313e308);
      v38 = self->_splitViewController;
      v39 = *MEMORY[0x1E0DC53A8];
    }
    else
    {
      v36 = *MEMORY[0x1E0DC53A8];
      -[UISplitViewController setMaximumPrimaryColumnWidth:](v37, "setMaximumPrimaryColumnWidth:", *MEMORY[0x1E0DC53A8]);
      v38 = self->_splitViewController;
      v39 = v36;
    }
    -[UISplitViewController setMinimumPrimaryColumnWidth:](v38, "setMinimumPrimaryColumnWidth:", v39);
    v40 = self->_splitViewController;
    v41 = v36;
  }
  -[UISplitViewController setPreferredPrimaryColumnWidthFraction:](v40, "setPreferredPrimaryColumnWidthFraction:", v41);

}

- (void)_skui_endDelayingPresentation
{
  UIViewController *delayingPresentationViewController;
  UIViewController *v4;

  delayingPresentationViewController = self->_delayingPresentationViewController;
  if (delayingPresentationViewController)
  {
    -[UIViewController _endDelayingPresentation](delayingPresentationViewController, "_endDelayingPresentation");
    v4 = self->_delayingPresentationViewController;
    self->_delayingPresentationViewController = 0;

  }
}

- (SKUINavigationDocumentController)leftNavigationDocumentController
{
  return self->_leftNavigationDocumentController;
}

- (void)setLeftNavigationDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_leftNavigationDocumentController, a3);
}

- (SKUINavigationDocumentController)rightNavigationDocumentController
{
  return self->_rightNavigationDocumentController;
}

- (void)setRightNavigationDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_rightNavigationDocumentController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNavigationDocumentController, 0);
  objc_storeStrong((id *)&self->_leftNavigationDocumentController, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_delayingPresentationViewController, 0);
}

- (void)initWithTemplateElement:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISplitViewDocumentViewController initWithTemplateElement:clientContext:]";
}

@end
