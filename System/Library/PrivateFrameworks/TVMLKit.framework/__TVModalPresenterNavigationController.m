@implementation __TVModalPresenterNavigationController

- (__TVModalPresenterNavigationController)initWithRootViewController:(id)a3
{
  id v5;
  __TVModalPresenterNavigationController *v6;
  __TVModalPresenterNavigationController *v7;
  uint64_t v8;
  NSMapTable *pushCompletionBlocks;
  uint64_t v10;
  NSMapTable *popCompletionBlocks;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)__TVModalPresenterNavigationController;
  v6 = -[__TVModalPresenterNavigationController initWithRootViewController:](&v15, sel_initWithRootViewController_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootViewController, a3);
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0x10000);
    v8 = objc_claimAutoreleasedReturnValue();
    pushCompletionBlocks = v7->_pushCompletionBlocks;
    v7->_pushCompletionBlocks = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0x10000);
    v10 = objc_claimAutoreleasedReturnValue();
    popCompletionBlocks = v7->_popCompletionBlocks;
    v7->_popCompletionBlocks = (NSMapTable *)v10;

    -[__TVModalPresenterNavigationController setNavigationBarHidden:animated:](v7, "setNavigationBarHidden:animated:", 1, 0);
    -[__TVModalPresenterNavigationController navigationBar](v7, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrefersLargeTitles:", 1);

    -[__TVModalPresenterNavigationController navigationBar](v7, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setHidesShadow:", 1);

  }
  return v7;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;

  -[__TVModalPresenterNavigationController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__TVModalPresenterNavigationController;
  -[__TVModalPresenterNavigationController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[__TVModalPresenterNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[__TVModalPresenterNavigationController _ensureNavigationBarHiddenSafelyForViewSize:](self, "_ensureNavigationBarHiddenSafelyForViewSize:", v4, v5);

}

- (void)_ensureNavigationBarHiddenSafelyForViewSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  -[__TVModalPresenterNavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v6, "TVMLPresenterConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (v14)
  {
    v8 = objc_msgSend(v14, "navigationBarHidden");
    v7 = v14;
    if (v8)
    {
      v9 = objc_msgSend(v14, "configurationType");
      v7 = v14;
      if (v9 == 1 || (v10 = objc_msgSend(v14, "configurationType"), v7 = v14, v10 == 3))
      {
        if (objc_msgSend(v7, "configurationType") == 1)
          objc_msgSend(v14, "formSheetSize");
        else
          objc_msgSend(v14, "popoverSize");
        if (width == v11 && height == v12 || (objc_msgSend(v14, "navigationBarHidden") & 1) == 0)
          v13 = objc_msgSend(v14, "navigationBarHidden");
        else
          v13 = 0;
        -[__TVModalPresenterNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", v13);
        v7 = v14;
      }
    }
  }

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  NSMapTable *pushCompletionBlocks;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if (a5)
  {
    pushCompletionBlocks = self->_pushCompletionBlocks;
    v9 = (void *)MEMORY[0x22767F470](a5);
    -[NSMapTable setObject:forKey:](pushCompletionBlocks, "setObject:forKey:", v9, v10);

  }
  -[__TVModalPresenterNavigationController pushViewController:animated:](self, "pushViewController:animated:", v10, v6);

}

- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  NSMapTable *popCompletionBlocks;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (a4)
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    v7 = (void *)MEMORY[0x22767F470](a4, a2);
    -[__TVModalPresenterNavigationController viewControllers](self, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](popCompletionBlocks, "setObject:forKey:", v7, v9);

  }
  v10 = -[__TVModalPresenterNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", v4);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  -[__TVModalPresenterNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v6, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:", 1);

  }
  -[__TVModalPresenterNavigationController viewControllers](self, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[__TVModalPresenterNavigationController setPreviousViewControllers:](self, "setPreviousViewControllers:", v10);

  v11.receiver = self;
  v11.super_class = (Class)__TVModalPresenterNavigationController;
  -[__TVModalPresenterNavigationController pushViewController:animated:](&v11, sel_pushViewController_animated_, v6, v4);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v3 = a3;
  -[__TVModalPresenterNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__TVModalPresenterNavigationController setPreviousViewControllers:](self, "setPreviousViewControllers:", v5);

  -[__TVModalPresenterNavigationController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 2)
  {
    -[__TVModalPresenterNavigationController _dismissForLastViewController:](self, "_dismissForLastViewController:", v3);
    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)__TVModalPresenterNavigationController;
    -[__TVModalPresenterNavigationController popViewControllerAnimated:](&v9, sel_popViewControllerAnimated_, v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  self->_isModalNavVisisble = 1;
  v3.receiver = self;
  v3.super_class = (Class)__TVModalPresenterNavigationController;
  -[__TVModalPresenterNavigationController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__TVModalPresenterNavigationController;
  -[__TVModalPresenterNavigationController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[__TVModalPresenterNavigationController interactivePopGestureRecognizer](self, "interactivePopGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[__TVModalPresenterNavigationController isBeingDismissed](self, "isBeingDismissed"))
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setOverrideOrientation:", 0);
    self->_isModalNavVisisble = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)__TVModalPresenterNavigationController;
  -[__TVModalPresenterNavigationController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__TVModalPresenterNavigationController;
  -[__TVModalPresenterNavigationController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  if (!self->_isModalNavVisisble)
  {
    -[__TVModalPresenterNavigationController dismissalBlock](self, "dismissalBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[__TVModalPresenterNavigationController dismissalBlock](self, "dismissalBlock");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

      -[__TVModalPresenterNavigationController setDismissalBlock:](self, "setDismissalBlock:", 0);
    }
  }
}

- (void)reset
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  -[NSMapTable removeAllObjects](self->_popCompletionBlocks, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_pushCompletionBlocks, "removeAllObjects");
  v4[0] = self->_rootViewController;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[__TVModalPresenterNavigationController setViewControllers:](self, "setViewControllers:", v3);

  -[__TVModalPresenterNavigationController setPreviousViewControllers:](self, "setPreviousViewControllers:", 0);
}

- (BOOL)shouldAutorotate
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1 || self->_isModalNavVisisble;

  return v4;
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  NSMapTable *popCompletionBlocks;
  void *v9;
  void *v10;
  NSMapTable *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[__TVModalPresenterNavigationController previousViewControllers](self, "previousViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__TVModalPresenterNavigationController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v13) & 1) == 0
    && (objc_msgSend(v6, "lastObject"), v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v7 == v13))
  {
    -[NSMapTable objectForKey:](self->_pushCompletionBlocks, "objectForKey:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](self->_pushCompletionBlocks, "removeObjectForKey:", v13);
  }
  else
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](popCompletionBlocks, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = self->_popCompletionBlocks;
    objc_msgSend(v5, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](v11, "removeObjectForKey:", v12);

  }
  -[__TVModalPresenterNavigationController setPreviousViewControllers:](self, "setPreviousViewControllers:", 0);
  if (v10)
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

- (void)_dismissForLastViewController
{
  -[__TVModalPresenterNavigationController _dismissForLastViewController:](self, "_dismissForLastViewController:", 1);
}

- (void)_dismissForLastViewController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[__TVModalPresenterNavigationController previousViewControllers](self, "previousViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_popCompletionBlocks, "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dismissAnimated:completion:", v3, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("TVModalPresenterDismissedNotification"), 0);

}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[__TVModalPresenterNavigationController childViewControllers](self, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_2557AEA40))
    objc_msgSend(v5, "updatePreferredFocusedViewStateForFocus:", v3);

}

- (id)activeDocument
{
  void *v2;
  void *v3;
  void *v4;

  -[__TVModalPresenterNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_2557AEB30))
    v3 = v2;
  else
    v3 = 0;
  objc_msgSend(v3, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)previousViewControllers
{
  return self->_previousViewControllers;
}

- (void)setPreviousViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_previousViewControllers, a3);
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong((id *)&self->_previousViewControllers, 0);
  objc_storeStrong((id *)&self->_popCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pushCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
