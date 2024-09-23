@implementation SUNavigationController

- (SUNavigationController)initWithSection:(id)a3
{
  return -[SUNavigationController initWithSection:rootViewController:](self, "initWithSection:rootViewController:", a3, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[SUNavigationController _popoverController](self, "_popoverController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SUNavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SUNavigationBarRemoveStyling(v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  -[SUNavigationController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  -[SUNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "supportedInterfaceOrientations");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
    {
      v4 = 30;
    }
    else if (SUAllowsLandscapePhone())
    {
      v4 = 26;
    }
    else
    {
      v4 = 2;
    }
  }

  return v4;
}

- (void)setClientInterface:(id)a3
{
  SUClientInterface *v5;
  SUClientInterface **p_clientInterface;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  SUClientInterface *v12;

  v5 = (SUClientInterface *)a3;
  p_clientInterface = &self->_clientInterface;
  if (self->_clientInterface != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_clientInterface, a3);
    -[SUClientInterface appearance](*p_clientInterface, "appearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUNavigationController navigationBar](self, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "styleNavigationBar:", v8);

    v9 = -[SUNavigationController isToolbarHidden](self, "isToolbarHidden");
    v5 = v12;
    if ((v9 & 1) == 0)
    {
      -[SUClientInterface appearance](*p_clientInterface, "appearance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUNavigationController toolbar](self, "toolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "styleToolbar:", v11);

      v5 = v12;
    }
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUNavigationController;
  -[SUNavigationController loadView](&v6, sel_loadView);
  if (!self->_storeBarStyle)
  {
    -[SUNavigationController section](self, "section");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "defaultPNGStyle") == 1)
    {
      -[SUNavigationController navigationBar](self, "navigationBar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBarStyle:", 1);

      v5 = 2;
    }
    else
    {
      v5 = 1;
    }
    -[SUNavigationController _setStoreBarStyle:clientInterface:](self, "_setStoreBarStyle:clientInterface:", v5, self->_clientInterface);

  }
}

- (SUSection)section
{
  return self->_section;
}

- (void)_setStoreBarStyle:(int64_t)a3 clientInterface:(id)a4
{
  objc_super v4;

  if (self->_storeBarStyle != a3)
  {
    self->_storeBarStyle = a3;
    v4.receiver = self;
    v4.super_class = (Class)SUNavigationController;
    -[UINavigationController _setStoreBarStyle:clientInterface:](&v4, sel__setStoreBarStyle_clientInterface_);
  }
}

- (void)setParentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[SUNavigationController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SUNavigationController;
  -[SUNavigationController setParentViewController:](&v8, sel_setParentViewController_, v4);

  -[SUNavigationController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[UIViewController parentViewControllerHierarchyDidChange](self, "parentViewControllerHierarchyDidChange");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SUViewControllerParentViewControllerDidChangeNotification"), self);

  }
  if (v4 && !self->_canBeWeakScriptReference)
    self->_canBeWeakScriptReference = 1;

}

- (SUNavigationController)initWithSection:(id)a3 rootViewController:(id)a4
{
  id v6;
  id v7;
  SUNavigationController *v8;
  void *v9;
  SUNavigationContainerViewController *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[SUNavigationController setSection:](self, "setSection:", v6);
  v13.receiver = self;
  v13.super_class = (Class)SUNavigationController;
  v8 = -[SUNavigationController init](&v13, sel_init);
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "clientInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUNavigationController setClientInterface:](v8, "setClientInterface:", v9);

    }
    if (v7)
    {
      if (objc_msgSend(v6, "type") == 1 || !objc_msgSend(v6, "type"))
      {
        -[SUNavigationController pushViewController:animated:](v8, "pushViewController:animated:", v7, 0);
      }
      else
      {
        v10 = -[SUNavigationContainerViewController initWithChildViewController:]([SUNavigationContainerViewController alloc], "initWithChildViewController:", v7);
        -[SUNavigationController pushViewController:animated:](v8, "pushViewController:animated:", v10, 0);

      }
      objc_msgSend(v7, "tabBarItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUNavigationController setTabBarItem:](v8, "setTabBarItem:", v11);

    }
  }

  return v8;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (SUNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUNavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUNavigationController;
  v4 = -[SUNavigationController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
    -[SUNavigationController setNavigationBarClass:](v4, "setNavigationBarClass:", objc_opt_class());
  return v4;
}

- (SUNavigationController)initWithRootViewController:(id)a3
{
  return -[SUNavigationController initWithSection:rootViewController:](self, "initWithSection:rootViewController:", 0, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUViewControllerLoadingDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SUNavigationController;
  -[SUNavigationController dealloc](&v4, sel_dealloc);
}

- (void)setSkLoading:(BOOL)a3
{
  id v4;

  if (self->_skLoading != a3)
  {
    self->_skLoading = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SUViewControllerLoadingDidChangeNotification"), self);

  }
}

- (void)addChildViewController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SUViewControllerLoadingDidChangeNotification"), v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__loadingDidChangeNotification_, CFSTR("SUViewControllerLoadingDidChangeNotification"), v5);
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  -[SUNavigationController addChildViewController:](&v7, sel_addChildViewController_, v5);

}

- (id)copyArchivableContext
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SUNavigationController;
  v3 = -[UIViewController copyArchivableContext](&v17, sel_copyArchivableContext);
  objc_msgSend(v3, "setType:", 4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUNavigationController isNavigationBarHidden](self, "isNavigationBarHidden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forMetadataKey:", v4, CFSTR("navbarhidden"));

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUNavigationController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyArchivableContext");
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "setValue:forMetadataKey:", v5, CFSTR("controllers"));

  return v3;
}

- (id)copyScriptViewController
{
  SUScriptNavigationController *v3;

  v3 = objc_alloc_init(SUScriptNavigationController);
  -[SUScriptViewController setNativeViewController:](v3, "setNativeViewController:", self);
  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)SUNavigationController;
  -[SUNavigationController description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUNavigationController section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)ITunesStoreUIBarStyle
{
  return self->_storeBarStyle;
}

- (id)moreListImage
{
  void *v2;
  void *v3;

  -[SUNavigationController section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moreListImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)moreListSelectedImage
{
  void *v2;
  void *v3;

  -[SUNavigationController section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedMoreListImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeChildViewController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SUViewControllerLoadingDidChangeNotification"), v5);
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  -[SUNavigationController removeChildViewController:](&v7, sel_removeChildViewController_, v5);

}

- (void)restoreArchivableContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForMetadataKey:", CFSTR("navbarhidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", objc_msgSend(v5, "BOOLValue"));

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "valueForMetadataKey:", CFSTR("controllers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyViewController");
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  -[SUNavigationController setViewControllers:](self, "setViewControllers:", v6);
  v13.receiver = self;
  v13.super_class = (Class)SUNavigationController;
  -[UIViewController restoreArchivableContext:](&v13, sel_restoreArchivableContext_, v4);

}

- (void)setToolbarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (!a3)
  {
    -[SUClientInterface appearance](self->_clientInterface, "appearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUNavigationController toolbar](self, "toolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleToolbar:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  -[SUNavigationController setToolbarHidden:](&v7, sel_setToolbarHidden_, v3);
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  if (!a3)
  {
    -[SUClientInterface appearance](self->_clientInterface, "appearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUNavigationController toolbar](self, "toolbar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "styleToolbar:", v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)SUNavigationController;
  -[SUNavigationController setToolbarHidden:animated:](&v9, sel_setToolbarHidden_animated_, v5, v4);
}

- (void)setViewControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabBarItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUNavigationController setTabBarItem:](self, "setTabBarItem:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationController;
  -[SUNavigationController setViewControllers:](&v7, sel_setViewControllers_, v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SUViewControllerDidDisappearNotification"), self);

  v6.receiver = self;
  v6.super_class = (Class)SUNavigationController;
  -[SUNavigationController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUNavigationController;
  v7 = -[SUNavigationController window:shouldAutorotateToInterfaceOrientation:](&v12, sel_window_shouldAutorotateToInterfaceOrientation_, v6, a4);
  -[SUNavigationController topViewController](self, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
    LOBYTE(v7) = objc_msgSend(v8, "window:shouldAutorotateToInterfaceOrientation:", v6, a4);

  return v7;
}

- (BOOL)clearsWeakScriptReferences
{
  return self->_canBeWeakScriptReference;
}

- (void)_loadingDidChangeNotification:(id)a3
{
  id v4;

  -[SUNavigationController topViewController](self, "topViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUNavigationController setSkLoading:](self, "setSkLoading:", objc_msgSend(v4, "isSkLoaded"));

}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (BOOL)isSkLoading
{
  return self->_skLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end
