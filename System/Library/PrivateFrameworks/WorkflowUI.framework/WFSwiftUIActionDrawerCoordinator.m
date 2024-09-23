@implementation WFSwiftUIActionDrawerCoordinator

- (WFSwiftUIActionDrawerCoordinator)initWithHome:(id)a3 workflow:(id)a4 actionSuggester:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  WFSwiftUIActionDrawerCoordinator *v14;
  WFSwiftUIActionDrawerCoordinator *v15;
  WFSwiftUIActionDrawerCoordinator *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSwiftUIActionDrawerCoordinator.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSwiftUIActionDrawerCoordinator.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionSuggester"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)WFSwiftUIActionDrawerCoordinator;
  v14 = -[WFSwiftUIActionDrawerCoordinator init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_workflow, a4);
    objc_storeStrong((id *)&v15->_actionSuggester, a5);
    v15->_presentationMode = 0;
    -[WFSwiftUIActionDrawerCoordinator subscribeForTextEditingNotifications](v15, "subscribeForTextEditingNotifications");
    v16 = v15;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[WFSwiftUIActionDrawerCoordinator unsubscribeFromTextEditingNotifications](self, "unsubscribeFromTextEditingNotifications");
  v3.receiver = self;
  v3.super_class = (Class)WFSwiftUIActionDrawerCoordinator;
  -[WFSwiftUIActionDrawerCoordinator dealloc](&v3, sel_dealloc);
}

- (void)clearSearchBar
{
  id v2;

  -[WFSwiftUIActionDrawerCoordinator drawerViewController](self, "drawerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSearchBar");

}

- (void)focusSearchBar
{
  id v2;

  -[WFSwiftUIActionDrawerCoordinator drawerViewController](self, "drawerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusSearchBar");

}

- (void)subscribeForTextEditingNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_responderDidBeginEditing_, *MEMORY[0x24BEBE860], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_responderDidBeginEditing_, *MEMORY[0x24BEBE980], 0);

}

- (void)unsubscribeFromTextEditingNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE860], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE980], 0);

}

- (void)responderDidBeginEditing:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[WFSwiftUIActionDrawerCoordinator presentationMode](self, "presentationMode") == 1;
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v12, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isFirstResponder"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isDescendantOfView:", v9);

      if ((v10 & 1) == 0)
      {
        -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "transitionToVisibility:withDimming:animated:completion:", 1, 3, 1, 0);

      }
    }

    v5 = v12;
  }

}

- (id)newDrawerViewControllerWithStyle:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc(MEMORY[0x24BEC2EE8]);
  -[WFSwiftUIActionDrawerCoordinator home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSwiftUIActionDrawerCoordinator workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSwiftUIActionDrawerCoordinator actionSuggester](self, "actionSuggester");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithHome:workflow:actionSuggester:", v6, v7, v8);

  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setNavigationStyle:", a3);
  return v9;
}

- (void)configureAsBottomSheetInParentViewController:(id)a3 belowSubview:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFEditorDrawerViewController *drawerViewController;
  UIViewController *inspectorPaneContainerViewController;
  UIViewController *visibleInspectorPaneContentViewController;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[WFSwiftUIActionDrawerCoordinator presentationMode](self, "presentationMode");
  self->_presentationMode = 1;
  if (v8 == 2)
  {
    -[UIViewController navigationController](self->_inspectorPaneContainerViewController, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willMoveToParentViewController:", 0);
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");

    objc_msgSend(v14, "removeFromParentViewController");
    drawerViewController = self->_drawerViewController;
    self->_drawerViewController = 0;

    inspectorPaneContainerViewController = self->_inspectorPaneContainerViewController;
    self->_inspectorPaneContainerViewController = 0;

    visibleInspectorPaneContentViewController = self->_visibleInspectorPaneContentViewController;
    self->_visibleInspectorPaneContentViewController = 0;

    -[WFSwiftUIActionDrawerCoordinator presentedPopover](self, "presentedPopover");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 1, 0);

    -[WFSwiftUIActionDrawerCoordinator setPresentedPopover:](self, "setPresentedPopover:", 0);
    goto LABEL_7;
  }
  if (v8 != 1)
  {
LABEL_7:
    v9 = -[WFSwiftUIActionDrawerCoordinator newDrawerViewControllerWithStyle:](self, "newDrawerViewControllerWithStyle:", 0);
    objc_storeStrong((id *)&self->_drawerViewController, v9);
    v20 = objc_alloc_init(MEMORY[0x24BEC2EE0]);
    v29[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setViewControllers:animated:", v21, 0);

    objc_msgSend(v20, "setDelegate:", self);
    -[WFSwiftUIActionDrawerCoordinator topInset](self, "topInset");
    objc_msgSend(v20, "setTopInset:");
    -[WFSwiftUIActionDrawerCoordinator bottomInset](self, "bottomInset");
    objc_msgSend(v20, "setBottomInset:");
    objc_storeStrong((id *)&self->_drawerController, v20);
    objc_msgSend(v20, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    objc_msgSend(v22, "setFrame:");

    objc_msgSend(v22, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addChildViewController:", v20);
    objc_msgSend(v6, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v7)
      objc_msgSend(v24, "insertSubview:belowSubview:", v22, v7);
    else
      objc_msgSend(v24, "addSubview:", v22);

    objc_msgSend(v20, "didMoveToParentViewController:", v6);
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceLevel:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverrideTraitCollection:forChildViewController:", v26, v20);

    goto LABEL_13;
  }
  -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v6)
  {
    objc_msgSend(v9, "willMoveToParentViewController:", 0);
    objc_msgSend(v9, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    objc_msgSend(v9, "removeFromParentViewController");
    objc_msgSend(v6, "addChildViewController:", v9);
    objc_msgSend(v6, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v12, "insertSubview:belowSubview:", v13, v7);
    else
      objc_msgSend(v12, "addSubview:", v13);

    objc_msgSend(v9, "didMoveToParentViewController:", v6);
  }
LABEL_13:

  objc_msgSend(v6, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutIfNeeded");

  -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "transitionToVisibility:withDimming:animated:", 1, 1, 0);

}

- (void)setTopInset:(double)a3
{
  id v4;

  if (self->_topInset != a3)
  {
    self->_topInset = a3;
    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTopInset:", a3);

  }
}

- (void)setBottomInset:(double)a3
{
  id v4;

  if (self->_bottomInset != a3)
  {
    self->_bottomInset = a3;
    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBottomInset:", a3);

  }
}

- (unint64_t)visibility
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "visibility");

  return v5;
}

- (CGRect)collapsedDrawerRect
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  CGFloat MinX;
  CGFloat v17;
  double Width;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightForVisibility:", 1);
  v15 = v14;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v17 = CGRectGetMaxY(v23) - v15;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  Width = CGRectGetWidth(v24);
  v19 = MinX;
  v20 = v17;
  v21 = v15;
  result.size.height = v21;
  result.size.width = Width;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)configureAsNavigationStackInParentViewController:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  WFComposeNavigationController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFDrawerController *drawerController;
  WFEditorDrawerViewController *drawerViewController;
  UIViewController *v19;
  UIViewController *inspectorPaneContainerViewController;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  -[WFSwiftUIActionDrawerCoordinator drawerViewController](self, "drawerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFSwiftUIActionDrawerCoordinator presentationMode](self, "presentationMode");
  self->_presentationMode = 2;
  if (v5 == 1)
  {
    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "willMoveToParentViewController:", 0);

    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");

    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromParentViewController");

    drawerController = self->_drawerController;
    self->_drawerController = 0;

    drawerViewController = self->_drawerViewController;
    self->_drawerViewController = 0;

  }
  else if (v5 == 2)
  {
    objc_msgSend(v4, "parentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v26)
    {
      objc_msgSend(v4, "willMoveToParentViewController:", 0);
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      objc_msgSend(v4, "removeFromParentViewController");
      objc_msgSend(v26, "addChildViewController:", v4);
      objc_msgSend(v26, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      objc_msgSend(v4, "didMoveToParentViewController:", v26);
    }
    v10 = (id)objc_opt_new();
    objc_msgSend(v4, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScrollEdgeAppearance:", v10);

    objc_msgSend(v4, "navigationItem");
    v12 = (WFComposeNavigationController *)objc_claimAutoreleasedReturnValue();
    -[WFComposeNavigationController setCompactScrollEdgeAppearance:](v12, "setCompactScrollEdgeAppearance:", v10);
    goto LABEL_10;
  }
  v10 = -[WFSwiftUIActionDrawerCoordinator newDrawerViewControllerWithStyle:](self, "newDrawerViewControllerWithStyle:", 1);
  objc_storeStrong((id *)&self->_drawerViewController, v10);
  if (!self->_inspectorPaneContainerViewController)
  {
    v19 = (UIViewController *)objc_alloc_init(MEMORY[0x24BEBDB08]);
    inspectorPaneContainerViewController = self->_inspectorPaneContainerViewController;
    self->_inspectorPaneContainerViewController = v19;

  }
  -[WFSwiftUIActionDrawerCoordinator setInspectorPaneViewController:](self, "setInspectorPaneViewController:", self->_drawerViewController);
  v12 = -[WFComposeNavigationController initWithRootViewController:]([WFComposeNavigationController alloc], "initWithRootViewController:", self->_inspectorPaneContainerViewController);
  v21 = (void *)objc_opt_new();
  -[UIViewController navigationItem](self->_inspectorPaneContainerViewController, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setScrollEdgeAppearance:", v21);

  -[UIViewController navigationItem](self->_inspectorPaneContainerViewController, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCompactScrollEdgeAppearance:", v21);

  objc_msgSend(v26, "addChildViewController:", v12);
  objc_msgSend(v26, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeNavigationController view](v12, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v25);

  -[WFComposeNavigationController didMoveToParentViewController:](v12, "didMoveToParentViewController:", v26);
LABEL_10:

}

- (void)setInspectorPaneViewController:(id)a3
{
  id v5;
  UIViewController *inspectorPaneContainerViewController;
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
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  inspectorPaneContainerViewController = self->_inspectorPaneContainerViewController;
  if (inspectorPaneContainerViewController)
  {
    if (self->_visibleInspectorPaneContentViewController)
    {
      -[UIViewController willMoveToParentViewController:](self->_visibleInspectorPaneContentViewController, "willMoveToParentViewController:", 0);
      -[UIViewController view](self->_visibleInspectorPaneContentViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](self->_visibleInspectorPaneContentViewController, "removeFromParentViewController");
      inspectorPaneContainerViewController = self->_inspectorPaneContainerViewController;
    }
    -[UIViewController addChildViewController:](inspectorPaneContainerViewController, "addChildViewController:", v5);
    -[UIViewController view](self->_inspectorPaneContainerViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    objc_msgSend(v5, "didMoveToParentViewController:", self->_inspectorPaneContainerViewController);
    objc_storeStrong((id *)&self->_visibleInspectorPaneContentViewController, a3);
    objc_msgSend(v5, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v23 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v5, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_inspectorPaneContainerViewController, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    objc_msgSend(v5, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_inspectorPaneContainerViewController, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v22;
    objc_msgSend(v5, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_inspectorPaneContainerViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v13;
    objc_msgSend(v5, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_inspectorPaneContainerViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v19);

  }
}

- (void)appendAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSwiftUIActionDrawerCoordinator delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDrawerCoordinator:didAppendAction:", self, v4);

}

- (double)actionCanvasWidth
{
  void *v3;
  double v4;
  double v5;

  -[WFSwiftUIActionDrawerCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionCanvasWidthForActionDrawerCoordinator:", self);
  v5 = v4;

  return v5;
}

- (void)collapseDrawer
{
  void *v3;
  void *v4;
  id v5;

  if (-[WFSwiftUIActionDrawerCoordinator presentationMode](self, "presentationMode") == 1)
  {
    -[WFSwiftUIActionDrawerCoordinator drawerViewController](self, "drawerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endEditing:", 1);

    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionToVisibility:withDimming:animated:", 1, 1, 1);

  }
}

- (void)expandDrawer
{
  id v3;

  if (-[WFSwiftUIActionDrawerCoordinator presentationMode](self, "presentationMode") == 1)
  {
    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transitionToVisibility:withDimming:animated:", 3, 1, 1);

  }
}

- (void)presentDrawerViewController:(id)a3 inPopover:(BOOL)a4 withSourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v9;
  id v11;
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

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v11 = a3;
  v21 = v11;
  if (v9)
  {
    objc_msgSend(v11, "setModalPresentationStyle:", 7);
    objc_msgSend(v21, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);
    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSourceView:", v16);

    }
    else
    {
      -[WFSwiftUIActionDrawerCoordinator drawerViewController](self, "drawerViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSourceView:", v15);
    }

    objc_msgSend(v12, "sourceView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:fromView:", 0, x, y, width, height);
    objc_msgSend(v12, "setSourceRect:");

    -[WFSwiftUIActionDrawerCoordinator drawerViewController](self, "drawerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:animated:completion:", v21, 1, 0);

    -[WFSwiftUIActionDrawerCoordinator setPresentedPopover:](self, "setPresentedPopover:", v21);
  }
  else
  {
    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endEditing:", 1);

    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:withVisibility:dimming:animated:", v21, 3, 1, 1);
  }

}

- (void)performScrollingTest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__WFSwiftUIActionDrawerCoordinator_performScrollingTest___block_invoke;
  aBlock[3] = &unk_24E604E80;
  aBlock[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFSwiftUIActionDrawerCoordinator drawerController](self, "drawerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __57__WFSwiftUIActionDrawerCoordinator_performScrollingTest___block_invoke_3;
    v10[3] = &unk_24E604858;
    v11 = v7;
    objc_msgSend(v9, "transitionToVisibility:withDimming:animated:completion:", 3, 1, 0, v10);

  }
  else
  {
    v7[2](v7);
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[WFSwiftUIActionDrawerCoordinator setPresentedPopover:](self, "setPresentedPopover:", 0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)drawerController:(id)a3 willTransitionToVisibility:(unint64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[WFSwiftUIActionDrawerCoordinator delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFSwiftUIActionDrawerCoordinator delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionDrawerCoordinatorWillTransitionToDrawerVisibility:", a4);

  }
}

- (void)drawerController:(id)a3 didTransitionToVisibility:(unint64_t)a4
{
  id v5;

  -[WFSwiftUIActionDrawerCoordinator drawerViewController](self, "drawerViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didTransitionToVisibility:", a4);

}

- (WFActionDrawerCoordinatorDelegate)delegate
{
  return (WFActionDrawerCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)inspectorPaneContainerViewController
{
  return self->_inspectorPaneContainerViewController;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (double)topInset
{
  return self->_topInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (UIViewController)visibleInspectorPaneContentViewController
{
  return self->_visibleInspectorPaneContentViewController;
}

- (WFEditorDrawerViewController)drawerViewController
{
  return self->_drawerViewController;
}

- (void)setDrawerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_drawerViewController, a3);
}

- (UIViewController)presentedPopover
{
  return self->_presentedPopover;
}

- (void)setPresentedPopover:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPopover, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFContextualActionSuggester)actionSuggester
{
  return self->_actionSuggester;
}

- (WFDrawerController)drawerController
{
  return self->_drawerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawerController, 0);
  objc_storeStrong((id *)&self->_actionSuggester, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_presentedPopover, 0);
  objc_storeStrong((id *)&self->_drawerViewController, 0);
  objc_storeStrong((id *)&self->_visibleInspectorPaneContentViewController, 0);
  objc_storeStrong((id *)&self->_inspectorPaneContainerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__WFSwiftUIActionDrawerCoordinator_performScrollingTest___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = dispatch_time(0, 1000000000);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__WFSwiftUIActionDrawerCoordinator_performScrollingTest___block_invoke_2;
  v4[3] = &unk_24E604E80;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v4);

}

uint64_t __57__WFSwiftUIActionDrawerCoordinator_performScrollingTest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__WFSwiftUIActionDrawerCoordinator_performScrollingTest___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "drawerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performScrollingTest:", *(_QWORD *)(a1 + 40));

}

@end
