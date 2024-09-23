@implementation PSSplitViewController

- (id)childViewControllerForStatusBarStyle
{
  void *v2;
  void *v3;

  -[PSSplitViewController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setViewControllers:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPrefersLargeTitles:", 1);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PSSplitViewController;
  -[PSSplitViewController setViewControllers:](&v9, sel_setViewControllers_, v4);

}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (void)setContainerNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_containerNavigationController, a3);
}

- (PSRootController)containerNavigationController
{
  PSRootController *containerNavigationController;
  PSRootController *v4;
  PSRootController *v5;

  containerNavigationController = self->_containerNavigationController;
  if (!containerNavigationController)
  {
    v4 = objc_alloc_init(PSRootController);
    v5 = self->_containerNavigationController;
    self->_containerNavigationController = v4;

    -[PSSplitViewController setupControllerForToolbar:](self, "setupControllerForToolbar:", self->_containerNavigationController);
    containerNavigationController = self->_containerNavigationController;
  }
  return containerNavigationController;
}

- (id)categoryController
{
  void *v2;
  void *v3;
  void *v4;

  -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)popRecursivelyToRootController
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSSplitViewController;
  -[UIViewController popRecursivelyToRootController](&v4, sel_popRecursivelyToRootController);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  objc_msgSend(WeakRetained, "splitViewControllerDidPopToRootController:", self);

}

- (void)showInitialViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PSSplitViewController *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "sf_isInternalInstall");

    if (v20)
      NSLog(CFSTR("Trying to show a nil initial view controller."));
    goto LABEL_18;
  }
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_1EE6E3CA8))
    goto LABEL_10;
  -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE6E3CA8);

  if (!v9)
    goto LABEL_10;
  -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_10;
  }
  -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "specifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v16)
  {
LABEL_10:
    -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "toolbar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);

    v29[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setViewControllers:", v23);

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE6E3CA8))
      objc_msgSend(v5, "setRootController:", self->_containerNavigationController);
    -[PSSplitViewController setupControllerForToolbar:](self, "setupControllerForToolbar:", v5);
    goto LABEL_13;
  }
  -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "popToRootViewControllerAnimated:", 1);

LABEL_13:
  -[PSSplitViewController viewControllers](self, "viewControllers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "containsObject:", v26))
  {

LABEL_17:
    goto LABEL_18;
  }
  -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "splitViewController");
  v28 = (PSSplitViewController *)objc_claimAutoreleasedReturnValue();

  if (v28 != self)
  {
    -[PSSplitViewController containerNavigationController](self, "containerNavigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSplitViewController showDetailViewController:sender:](self, "showDetailViewController:sender:", v25, self);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)setupControllerForToolbar:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "_setSuppressesBottomBar:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_setSuppressesBottomBar:", objc_msgSend(v3, "performSelector:", sel_needsToShowToolbarInPrefsAppRoot) == 0);

}

- (PSSplitViewControllerNavigationDelegate)navigationDelegate
{
  return (PSSplitViewControllerNavigationDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_containerNavigationController, 0);
}

@end
