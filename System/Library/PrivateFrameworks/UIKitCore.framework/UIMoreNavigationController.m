@implementation UIMoreNavigationController

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIMoreNavigationController;
  -[UIViewController _willChangeToIdiom:onScreen:](&v6, sel__willChangeToIdiom_onScreen_, a3, a4);
  -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", a3 == 3, 0);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIMoreNavigationController;
  -[UINavigationController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (!a3)
  {
    if (-[UINavigationController needsDeferredTransition](self, "needsDeferredTransition"))
      -[UINavigationController _startDeferredTransitionIfNeeded](self, "_startDeferredTransitionIfNeeded");
  }
}

- (UIViewController)displayedViewController
{
  UIMoreNavigationController *v2;
  UIMoreNavigationController *v3;
  UINavigationController *originalNavigationController;
  UIMoreNavigationController *v5;
  void *v6;
  unint64_t v7;
  UIMoreNavigationController *v8;

  v2 = self;
  v3 = v2;
  originalNavigationController = v2->_originalNavigationController;
  if (originalNavigationController)
  {
    v5 = originalNavigationController;
LABEL_5:

    v3 = v5;
    return (UIViewController *)v3;
  }
  -[UINavigationController viewControllers](v2, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 2)
  {
    -[UINavigationController viewControllers](v3, "viewControllers");
    v8 = (UIMoreNavigationController *)objc_claimAutoreleasedReturnValue();
    -[UIMoreNavigationController objectAtIndex:](v8, "objectAtIndex:", 1);
    v5 = (UIMoreNavigationController *)objc_claimAutoreleasedReturnValue();

    v3 = v8;
    goto LABEL_5;
  }
  return (UIViewController *)v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v4 = a4;
  v10[1] = *MEMORY[0x1E0C80C00];
  -[UIMoreNavigationController _preparedViewController:](self, "_preparedViewController:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1 || (dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_8:

      goto LABEL_9;
    }
    v9.receiver = self;
    v9.super_class = (Class)UIMoreNavigationController;
    -[UINavigationController pushViewController:animated:](&v9, sel_pushViewController_animated_, v8, v4);
LABEL_7:
    objc_msgSend((id)UIApp, "_findBestActivityToMakeCurrent:", self);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "count"))
  {
    v10[0] = self->_moreListController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UINavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v8, v4);
    goto LABEL_7;
  }
LABEL_9:

}

- (void)setAllowsCustomizing:(BOOL)a3
{
  -[UIMoreListController setAllowsCustomizing:](self->_moreListController, "setAllowsCustomizing:", a3);
}

- (NSArray)moreViewControllers
{
  return -[UIMoreListController moreViewControllers](self->_moreListController, "moreViewControllers");
}

- (id)_preparedViewController:(id)a3
{
  id v5;
  UINavigationController **p_originalNavigationController;
  void *v7;
  UIViewController *v8;
  UIViewController *originalRootViewController;
  UINavigationController *v10;
  __int16 v11;
  UINavigationController *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      p_originalNavigationController = &self->_originalNavigationController;
      objc_storeStrong((id *)&self->_originalNavigationController, a3);
      objc_msgSend(v5, "viewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (dyld_program_sdk_at_least())
        objc_msgSend(v7, "firstObject");
      else
        objc_msgSend(v7, "lastObject");
      v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      originalRootViewController = self->_originalRootViewController;
      self->_originalRootViewController = v8;

      v10 = *p_originalNavigationController;
      if (*p_originalNavigationController)
      {
        v11 = *((_WORD *)&v10->super._viewControllerFlags + 4);
        *((_WORD *)&v10->super._viewControllerFlags + 4) = v11 | 0x100;
        -[UIViewController setParentViewController:](v10, "setParentViewController:", 0);
        *((_WORD *)&v10->super._viewControllerFlags + 4) = *((_WORD *)&v10->super._viewControllerFlags + 4) & 0xFEFF | v11 & 0x100;
        v12 = *p_originalNavigationController;
      }
      else
      {
        v12 = 0;
      }
      -[UINavigationController setViewControllers:](v12, "setViewControllers:", MEMORY[0x1E0C9AA60]);
    }
    else
    {
      v14[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (UIViewController)moreListController
{
  return &self->_moreListController->super;
}

- (UIMoreNavigationController)init
{
  UIMoreNavigationController *v2;
  UIMoreListController *v3;
  UIMoreListController *moreListController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIMoreNavigationController;
  v2 = -[UIViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = (UIMoreListController *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_moreListControllerClass"));
    moreListController = v2->_moreListController;
    v2->_moreListController = v3;

    -[UIMoreNavigationController pushViewController:animated:](v2, "pushViewController:animated:", v2->_moreListController, 0);
  }
  return v2;
}

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (void)setMoreViewControllers:(id)a3
{
  -[UIMoreListController setMoreViewControllers:](self->_moreListController, "setMoreViewControllers:", a3);
  -[UIMoreNavigationController _ensureChildrenHaveParentViewController](self, "_ensureChildrenHaveParentViewController");
}

- (void)_ensureChildrenHaveParentViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIViewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          -[UIViewController _parentViewController]((id *)v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            v10 = v9 == 0;
          else
            v10 = 0;
          if (v10)
          {
            v11 = *(_WORD *)(v8 + 376);
            *(_WORD *)(v8 + 376) = v11 | 0x100;
            objc_msgSend((id)v8, "setParentViewController:", v2);
            *(_WORD *)(v8 + 376) = *(_WORD *)(v8 + 376) & 0xFEFF | v11 & 0x100;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (void)setDisplayedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIMoreNavigationController _restoreOriginalNavigationController](self, "_restoreOriginalNavigationController");
  -[UIMoreNavigationController _preparedViewController:](self, "_preparedViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = self->_moreListController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController setViewControllers:](self, "setViewControllers:", v7);

  objc_msgSend((id)UIApp, "_findBestActivityToMakeCurrent:", self);
}

- (void)_restoreOriginalNavigationController
{
  void *v3;
  UIMoreListController *v4;
  UIMoreListController *moreListController;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  UINavigationController *originalNavigationController;
  void *v14;
  __int16 v15;
  UINavigationController *v16;
  UIViewController *v17;
  UIViewController *originalRootViewController;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (self->_originalNavigationController)
  {
    if (dyld_program_sdk_at_least())
    {
      -[UINavigationController viewControllers](self, "viewControllers");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v4 = (UIMoreListController *)objc_claimAutoreleasedReturnValue();
      moreListController = self->_moreListController;

      if (v4 == moreListController)
      {
        objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
        v6 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v6;
      }
      if (!objc_msgSend(v3, "count"))
      {
        if (self->_originalRootViewController)
        {
          v19[0] = self->_originalRootViewController;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
          v7 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v7;
        }
        else
        {

          v3 = (void *)MEMORY[0x1E0C9AA60];
        }
      }
      v9 = -[UINavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0);
    }
    else
    {
      if (self->_originalRootViewController)
      {
        originalRootViewController = self->_originalRootViewController;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &originalRootViewController, 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = (void *)MEMORY[0x1E0C9AA60];
      }
      v8 = -[UINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 0);
    }
    objc_msgSend(v3, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_existingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    originalNavigationController = self->_originalNavigationController;
    -[UIViewController tabBarController](self, "tabBarController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (originalNavigationController)
    {
      v15 = *((_WORD *)&originalNavigationController->super._viewControllerFlags + 4);
      *((_WORD *)&originalNavigationController->super._viewControllerFlags + 4) = v15 | 0x100;
      -[UIViewController setParentViewController:](originalNavigationController, "setParentViewController:", v14);
      *((_WORD *)&originalNavigationController->super._viewControllerFlags + 4) = *((_WORD *)&originalNavigationController->super._viewControllerFlags
                                                                                  + 4) & 0xFEFF | v15 & 0x100;
    }

    -[UINavigationController setViewControllers:](self->_originalNavigationController, "setViewControllers:", v3);
    v16 = self->_originalNavigationController;
    self->_originalNavigationController = 0;

    v17 = self->_originalRootViewController;
    self->_originalRootViewController = 0;

  }
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIMoreListController *v6;
  UIMoreListController *moreListController;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIMoreNavigationController;
  v6 = (UIMoreListController *)a3;
  -[UINavigationController didShowViewController:animated:](&v8, sel_didShowViewController_animated_, v6, v4);
  moreListController = self->_moreListController;

  if (moreListController == v6)
    -[UIMoreNavigationController _restoreOriginalNavigationController](self, "_restoreOriginalNavigationController", v8.receiver, v8.super_class);
  -[UIMoreNavigationController _ensureChildrenHaveParentViewController](self, "_ensureChildrenHaveParentViewController", v8.receiver, v8.super_class);
}

- (void)restoreOriginalNavigationControllerIfNecessary:(id)a3
{
  if (self->_originalNavigationController == a3)
    -[UIMoreNavigationController _restoreOriginalNavigationController](self, "_restoreOriginalNavigationController");
}

- (id)_stateRestorationParentForChildViewController:(id)a3 index:(unint64_t *)a4
{
  UIMoreListController *v6;
  void *v7;
  int v8;
  UINavigationController *v9;
  void *v10;
  int v11;
  unint64_t v12;

  v6 = (UIMoreListController *)a3;
  -[UIMoreNavigationController moreViewControllers](self, "moreViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    -[UIViewController tabBarController](self, "tabBarController");
    v9 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_originalNavigationController)
    {
      if (self->_moreListController != v6)
      {
        -[UINavigationController viewControllers](self, "viewControllers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v6);

        if (v11)
        {
          v9 = self->_originalNavigationController;
          v12 = 0;
          if (!a4)
            goto LABEL_11;
          goto LABEL_10;
        }
      }
    }
    v9 = 0;
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4)
LABEL_10:
    *a4 = v12;
LABEL_11:

  return v9;
}

- (void)_redisplayMoreTableView
{
  id v2;

  -[UIMoreListController table](self->_moreListController, "table");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (BOOL)allowsCustomizing
{
  return -[UIMoreListController allowsCustomizing](self->_moreListController, "allowsCustomizing");
}

- (BOOL)moreViewControllersChanged
{
  return -[UIMoreListController moreViewControllersChanged](self->_moreListController, "moreViewControllersChanged");
}

- (void)setMoreViewControllersChanged:(BOOL)a3
{
  -[UIMoreListController setMoreViewControllersChanged:](self->_moreListController, "setMoreViewControllersChanged:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRootViewController, 0);
  objc_storeStrong((id *)&self->_originalNavigationController, 0);
  objc_storeStrong((id *)&self->_moreListController, 0);
}

- (id)_resolvedTab
{
  return objc_alloc_init(_UIMoreTabElement);
}

@end
