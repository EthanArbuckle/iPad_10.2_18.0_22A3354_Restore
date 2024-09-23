@implementation WFDrawerController

- (WFDrawerController)init
{
  WFDrawerController *v2;
  uint64_t v3;
  NSArray *paneContainers;
  uint64_t v5;
  NSMapTable *paneContainersByViewControllers;
  void *v7;
  uint64_t v8;
  NSString *drawerGroup;
  WFDrawerController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFDrawerController;
  v2 = -[WFDrawerController init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    paneContainers = v2->_paneContainers;
    v2->_paneContainers = (NSArray *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    paneContainersByViewControllers = v2->_paneContainersByViewControllers;
    v2->_paneContainersByViewControllers = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    drawerGroup = v2->_drawerGroup;
    v2->_drawerGroup = (NSString *)v8;

    v10 = v2;
  }

  return v2;
}

- (WFDrawerController)initWithRootViewController:(id)a3
{
  id v6;
  WFDrawerController *v7;
  WFDrawerController *v8;
  WFDrawerController *v9;
  void *v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDrawerController.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

  }
  v7 = -[WFDrawerController init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_initializationViewController, a3);
    v9 = v8;
  }

  return v8;
}

- (void)loadView
{
  WFPassthroughView *v3;
  void *v4;
  WFPassthroughView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIViewController *initializationViewController;

  v3 = [WFPassthroughView alloc];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[WFPassthroughView initWithFrame:](v3, "initWithFrame:");
  -[WFDrawerController setView:](self, "setView:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[WFDrawerController initializationViewController](self, "initializationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFDrawerController initializationViewController](self, "initializationViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerController pushViewController:withVisibility:dimming:animated:](self, "pushViewController:withVisibility:dimming:animated:", v9, 2, 3, 0);

    initializationViewController = self->_initializationViewController;
    self->_initializationViewController = 0;

  }
}

- (BOOL)userInteractionEnabled
{
  void *v2;
  char v3;

  -[WFDrawerController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");

  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFDrawerController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)setTopInset:(double)a3
{
  id v3;

  if (self->_topInset != a3)
  {
    self->_topInset = a3;
    -[WFDrawerController topPaneContainer](self, "topPaneContainer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutDrawerViewController");

  }
}

- (void)setBottomInset:(double)a3
{
  id v3;

  if (self->_bottomInset != a3)
  {
    self->_bottomInset = a3;
    -[WFDrawerController topPaneContainer](self, "topPaneContainer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutDrawerViewController");

  }
}

- (BOOL)pushViewController:(id)a3 withVisibility:(unint64_t)a4 dimming:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  BOOL v12;
  void *v14;
  WFDrawerPaneContainer *v15;
  WFDrawerItem *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  WFDrawerPaneContainer *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  WFDrawerPaneContainer *v51;
  WFDrawerController *v52;
  id v53;
  BOOL v54;
  id location;
  _QWORD v56[6];

  v6 = a6;
  v10 = a3;
  -[WFDrawerController paneContainerForViewController:](self, "paneContainerForViewController:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_4:
    v12 = 0;
    goto LABEL_5;
  }
  if (-[WFDrawerController inTransition](self, "inTransition"))
    goto LABEL_4;
  self->_inTransition = 1;
  -[WFDrawerController drawerPaneWithViewController:](self, "drawerPaneWithViewController:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFDrawerPaneContainer initWithDrawerPane:]([WFDrawerPaneContainer alloc], "initWithDrawerPane:", v14);
  -[WFDrawerPaneContainer setDelegate:](v15, "setDelegate:", self);
  objc_msgSend(v14, "wf_setDrawerController:", self);
  v16 = -[WFDrawerItem initWithDrawerPane:]([WFDrawerItem alloc], "initWithDrawerPane:", v14);
  objc_msgSend(v14, "wf_setDrawerItem:", v16);

  -[WFDrawerController mutablePaneControllers](self, "mutablePaneControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v15);

  -[WFDrawerController paneContainersByViewControllers](self, "paneContainersByViewControllers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v15, v10);

  -[WFDrawerPaneContainer loadViewIfNeeded](v15, "loadViewIfNeeded");
  -[WFDrawerController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[WFDrawerPaneContainer view](v15, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  -[WFDrawerPaneContainer view](v15, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAutoresizingMask:", 18);

  objc_msgSend(v10, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v14;
  objc_msgSend(v14, "wf_drawerItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTitle:", v30);

  -[WFDrawerController addChildViewController:](self, "addChildViewController:", v15);
  -[WFDrawerController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneContainer view](v15, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v33);

  -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  self->_previousVisibilityOfCoveredPaneContainer = objc_msgSend(v34, "visibility");

  -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = a4;
  if (objc_msgSend(v35, "visibility") <= a4)
  {
    -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v37, "visibility");

  }
  -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (2 * (int)a5) & 4 | objc_msgSend(v38, "dimming");

  -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "beginAppearanceTransition:animated:", 0, v6);

  -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __73__WFDrawerController_pushViewController_withVisibility_dimming_animated___block_invoke;
  v56[3] = &unk_24EE25B00;
  v56[4] = self;
  objc_msgSend(v41, "transitionToVisibility:withDimming:animated:interruptible:completion:", v36, v39, v6, 0, v56);

  if ((a5 & 1) != 0)
  {
    -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "visibility");

    v43 = v45 == 3;
    if (v43)
      a5 &= ~1uLL;
  }
  else
  {
    v43 = 0;
  }
  objc_initWeak(&location, self);
  v50[0] = v42;
  v50[1] = 3221225472;
  v50[2] = __73__WFDrawerController_pushViewController_withVisibility_dimming_animated___block_invoke_2;
  v50[3] = &unk_24EE254C0;
  objc_copyWeak(&v53, &location);
  v46 = v15;
  v54 = v43;
  v51 = v46;
  v52 = self;
  -[WFDrawerPaneContainer transitionToVisibility:withDimming:animated:interruptible:completion:](v46, "transitionToVisibility:withDimming:animated:interruptible:completion:", a4, a5, v6, 0, v50);
  v47 = -[WFDrawerController visibility](self, "visibility");
  -[WFDrawerController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAccessibilityViewIsModal:", v47 == 3);

  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);

  v12 = 1;
LABEL_5:

  return v12;
}

- (BOOL)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  v3 = a3;
  v5 = -[WFDrawerController previousVisibilityOfCoveredPaneContainer](self, "previousVisibilityOfCoveredPaneContainer");
  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "visibility");

  if (v5 >= v7)
    v8 = v7;
  else
    v8 = v5;
  return -[WFDrawerController popViewControllerToVisibility:dimming:animated:](self, "popViewControllerToVisibility:dimming:animated:", v8, 3, v3);
}

- (BOOL)popViewControllerToVisibility:(unint64_t)a3 dimming:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  WFDrawerController *v24;
  id v25;

  v5 = a5;
  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && !-[WFDrawerController inTransition](self, "inTransition"))
  {
    self->_inTransition = 1;
    v11 = objc_msgSend(v9, "visibility");
    -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 >= a3)
    {
      -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transitionToVisibility:withDimming:animated:interruptible:completion:", a3, objc_msgSend(v14, "dimming"), 0, 0, 0);

      -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transitionToVisibility:withDimming:animated:interruptible:completion:", objc_msgSend(v15, "visibility"), a4 | 8, 1, 0, 0);

    }
    else
    {
      objc_msgSend(v12, "transitionToVisibility:withDimming:animated:interruptible:completion:", a3, a4 | 8, 1, 0, 0);
    }

    -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v16, "beginAppearanceTransition:animated:", 1, v5);

    objc_msgSend(v9, "willMoveToParentViewController:", 0);
    -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "visibility") == 3)
      a4 &= ~1uLL;

    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __69__WFDrawerController_popViewControllerToVisibility_dimming_animated___block_invoke;
    v23 = &unk_24EE254E8;
    v24 = self;
    v25 = v9;
    objc_msgSend(v25, "transitionToVisibility:withDimming:animated:interruptible:completion:", 0, a4, v5, 0, &v20);
    -[WFDrawerController view](self, "view", v20, v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccessibilityViewIsModal:", a3 == 3);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[WFDrawerController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      -[WFDrawerController popViewControllerAnimated:](self, "popViewControllerAnimated:", 0);
      if (!--v9)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (!v9)
          break;
      }
    }
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        objc_msgSend(v11, "lastObject", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16 == v17 && v4;
        -[WFDrawerController pushViewController:withVisibility:dimming:animated:](self, "pushViewController:withVisibility:dimming:animated:", v16, 2, 3, v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

}

- (void)drawerPaneContainer:(id)a3 willTransitionToVisibility:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v6 = a3;
  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[WFDrawerController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WFDrawerController coveredPaneContainer](self, "coveredPaneContainer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[WFDrawerController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
        if (v11)
          a4 = objc_msgSend(v11, "visibility");
      }
      objc_msgSend(v10, "drawerController:willTransitionToVisibility:", self, a4);

    }
  }
}

- (void)drawerPaneContainer:(id)a3 didTransitionToVisibility:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;

  v6 = a3;
  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[WFDrawerController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WFDrawerController delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "drawerController:didTransitionToVisibility:", self, a4);

    }
  }
}

- (id)drawerPaneWithViewController:(id)a3
{
  id v4;
  WFTranslucentDrawerPane *v5;
  void *v6;

  v4 = a3;
  v5 = -[WFTranslucentDrawerPane initWithViewController:]([WFTranslucentDrawerPane alloc], "initWithViewController:", v4);

  -[WFDrawerController drawerGroup](self, "drawerGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTranslucentDrawerPane setDrawerGroup:](v5, "setDrawerGroup:", v6);

  return v5;
}

- (id)mutablePaneControllers
{
  return self->_paneContainers;
}

- (NSArray)viewControllers
{
  void *v2;
  void *v3;

  -[WFDrawerController paneContainers](self, "paneContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_5162);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UIViewController)topViewController
{
  void *v2;
  void *v3;
  void *v4;

  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawerPane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v4;
}

- (WFDrawerPaneContainer)topPaneContainer
{
  void *v2;
  void *v3;

  -[WFDrawerController paneContainers](self, "paneContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFDrawerPaneContainer *)v3;
}

- (id)coveredPaneContainer
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  -[WFDrawerController paneContainers](self, "paneContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = v4 - 2;
  if (v4 >= 2)
  {
    -[WFDrawerController paneContainers](self, "paneContainers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)paneContainerForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFDrawerController paneContainersByViewControllers](self, "paneContainersByViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)drawerRect
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFDrawerController topPaneContainer](self, "topPaneContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drawerPane");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (unint64_t)visibility
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "visibility"))
  {

LABEL_5:
    -[WFDrawerController topPaneContainer](self, "topPaneContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "visibility");
    goto LABEL_6;
  }
  -[WFDrawerController paneContainers](self, "paneContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
    goto LABEL_5;
  -[WFDrawerController paneContainers](self, "paneContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerController paneContainers](self, "paneContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "visibility");

LABEL_6:
  return v9;
}

- (void)transitionToVisibility:(unint64_t)a3 withDimming:(unint64_t)a4 animated:(BOOL)a5
{
  -[WFDrawerController transitionToVisibility:withDimming:animated:completion:](self, "transitionToVisibility:withDimming:animated:completion:", a3, a4, a5, 0);
}

- (void)transitionToVisibility:(unint64_t)a3 withDimming:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;

  v6 = a5;
  v10 = a6;
  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionToVisibility:withDimming:animated:interruptible:completion:", a3, a4, v6, 1, v10);

  -[WFDrawerController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityViewIsModal:", a3 == 3);

}

- (double)heightForVisibility:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  -[WFDrawerController topPaneContainer](self, "topPaneContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightForVisibility:", a3);
  v6 = v5;

  return v6;
}

- (WFDrawerControllerDelegate)delegate
{
  return (WFDrawerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)topInset
{
  return self->_topInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (NSArray)paneContainers
{
  return self->_paneContainers;
}

- (NSMapTable)paneContainersByViewControllers
{
  return self->_paneContainersByViewControllers;
}

- (UIViewController)initializationViewController
{
  return self->_initializationViewController;
}

- (NSString)drawerGroup
{
  return self->_drawerGroup;
}

- (unint64_t)previousVisibilityOfCoveredPaneContainer
{
  return self->_previousVisibilityOfCoveredPaneContainer;
}

- (BOOL)inTransition
{
  return self->_inTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawerGroup, 0);
  objc_storeStrong((id *)&self->_initializationViewController, 0);
  objc_storeStrong((id *)&self->_paneContainersByViewControllers, 0);
  objc_storeStrong((id *)&self->_paneContainers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __37__WFDrawerController_viewControllers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "drawerPane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __69__WFDrawerController_popViewControllerToVisibility_dimming_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "coveredPaneContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAppearanceTransition");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 40), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 32), "mutablePaneControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "paneContainersByViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "drawerPane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = 0;
}

void __73__WFDrawerController_pushViewController_withVisibility_dimming_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "coveredPaneContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAppearanceTransition");

}

void __73__WFDrawerController_pushViewController_withVisibility_dimming_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", WeakRetained);
  objc_msgSend(WeakRetained, "coveredPaneContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "coveredPaneContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionToVisibility:withDimming:animated:interruptible:completion:", 0, objc_msgSend(v3, "dimming"), 0, 0, 0);

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "transitionToVisibility:withDimming:animated:interruptible:completion:", objc_msgSend(*(id *)(a1 + 32), "visibility"), objc_msgSend(*(id *)(a1 + 32), "dimming") | 1, 0, 0, 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 968) = 0;

}

@end
