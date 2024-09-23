@implementation SUTabBarController

- (SUTabBarController)init
{
  return -[SUTabBarController initWithClientInterface:](self, "initWithClientInterface:", +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"));
}

- (SUTabBarController)initWithClientInterface:(id)a3
{
  SUTabBarController *v4;
  void *v5;
  SUTabBarAppearance *v6;
  SUTabBarAppearance *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  SUNavigationBarBackgroundView *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SUTabBarController;
  v4 = -[SUTabBarController init](&v14, sel_init);
  if (v4)
  {
    v4->_clientInterface = (SUClientInterface *)a3;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
      -[SUTabBarController _setMaximumNumberOfItems:](v4, "_setMaximumNumberOfItems:", 9);
    v5 = (void *)-[SUTabBarController tabBar](v4, "tabBar");
    v6 = -[SUUIAppearance tabBarAppearance](-[SUClientInterface appearance](v4->_clientInterface, "appearance"), "tabBarAppearance");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v5, "setBackgroundImage:", -[SUTabBarAppearance backgroundImage](v6, "backgroundImage"));
      objc_msgSend(v5, "_setSelectionIndicatorImage:", -[SUTabBarAppearance selectionIndicatorImage](v7, "selectionIndicatorImage"));
      -[SUTabBarAppearance tabBarButtonWidth](v7, "tabBarButtonWidth");
      if (v8 > 0.00000011920929)
      {
        objc_msgSend(v5, "_setTabButtonWidth:");
        -[SUTabBarAppearance tabBarButtonSpacing](v7, "tabBarButtonSpacing");
        objc_msgSend(v5, "_setInterTabButtonSpacing:");
      }
      if ((objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG") & 1) == 0)
      {
        v9 = -[SUTabBarAppearance dividerImage](v7, "dividerImage");
        v10 = -[SUTabBarAppearance selectedDividerImage](v7, "selectedDividerImage");
        objc_msgSend(v5, "_setDividerImage:forLeftButtonState:rightButtonState:", v9, 0, 0);
        objc_msgSend(v5, "_setDividerImage:forLeftButtonState:rightButtonState:", v10, 1, 0);
      }
    }
    else
    {
      v11 = objc_alloc_init(SUNavigationBarBackgroundView);
      v4->_tabBarBackdropView = v11;
      -[SUNavigationBarBackgroundView setSeparatorOnTop:](v11, "setSeparatorOnTop:", 1);
      objc_msgSend(v5, "_setBackgroundView:", v4->_tabBarBackdropView);
      objc_msgSend(v5, "setTranslucent:", 1);
    }
    v12 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel__applicationDidChangeStatusBarFrame_, *MEMORY[0x24BDF7518], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel__partnerChanged_, CFSTR("SUPartnerChangedNotification"), 0);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7518], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUPartnerChangedNotification"), 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[SUTabBarController removeChildViewController:](self, "removeChildViewController:", v9);
        objc_msgSend(v9, "setDelegate:", 0);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  -[SUTabBarController dealloc](&v10, sel_dealloc);
}

- (BOOL)loadFromDefaultsAndSetSections:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  SUViewController *preloadedViewController;
  uint64_t v42;
  int *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _QWORD v57[2];
  int v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];

  self->_preloadedViewController = 0;
  self->_preloadedViewControllerIdentifier = 0;
  self->_preloadedViewControllerKey = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("ISURLRequest"));
  v6 = objc_msgSend(v5, "objectForKey:", CFSTR("SUTransientNavigationPath"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = 0;
    v7 = (void *)MEMORY[0x24BDD1620];
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), v6, &v54);
    if (v54)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v12 = objc_msgSend(v11, "shouldLog");
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v13 &= 2u;
      if (v13)
      {
        v14 = objc_opt_class();
        v58 = 138543618;
        v59 = v14;
        v60 = 2114;
        v61 = v54;
        LODWORD(v45) = 22;
        v44 = &v58;
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v58, v45);
          free(v16);
          v44 = (int *)v17;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "count"))
    {
      self->_preloadedViewController = (SUViewController *)-[SUTabBarController _viewControllerForContext:](self, "_viewControllerForContext:", objc_msgSend(v10, "lastObject"));
      self->_preloadedViewControllerKey = (NSString *)CFSTR("SUTransientNavigationPath");
    }
  }
  if (!self->_preloadedViewController)
  {
    v18 = objc_msgSend(v5, "objectForKey:", CFSTR("SUSectionNavigationPath"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = 0;
      v19 = (void *)MEMORY[0x24BDD1620];
      v20 = (void *)MEMORY[0x24BDBCF20];
      v57[0] = objc_opt_class();
      v57[1] = objc_opt_class();
      v21 = (void *)objc_msgSend(v19, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v20, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2)), v18, &v54);
      if (v54)
      {
        v22 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v23 = objc_msgSend(v22, "shouldLog");
        if (objc_msgSend(v22, "shouldLogToDisk"))
          v24 = v23 | 2;
        else
          v24 = v23;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject", v44), OS_LOG_TYPE_ERROR))
          v24 &= 2u;
        if (v24)
        {
          v25 = objc_opt_class();
          v58 = 138543618;
          v59 = v25;
          v60 = 2114;
          v61 = v54;
          LODWORD(v45) = 22;
          v44 = &v58;
          v26 = _os_log_send_and_compose_impl();
          if (v26)
          {
            v27 = (void *)v26;
            v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v58, v45);
            free(v27);
            v44 = (int *)v28;
            SSFileLog();
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v21, "count"))
          v29 = (void *)objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", 0), "sectionIdentifier");
        else
          v29 = 0;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v30 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v56, 16, v44);
        if (v30)
        {
          v31 = v30;
          v32 = 0;
          v33 = *(_QWORD *)v51;
          while (2)
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v51 != v33)
                objc_enumerationMutation(v21);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "type"))
              {
                if (v32 > 0)
                {
                  if (objc_msgSend((id)objc_msgSend(v21, "lastObject"), "sectionIdentifier"))
                  {
                    self->_preloadedViewController = (SUViewController *)-[SUTabBarController _viewControllerForContext:](self, "_viewControllerForContext:", objc_msgSend(v21, "lastObject"));
                    self->_preloadedViewControllerKey = (NSString *)CFSTR("SUSectionNavigationPath");
                  }
                  goto LABEL_42;
                }
                v32 = 1;
              }
            }
            v31 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
            if (v31)
              continue;
            break;
          }
        }
LABEL_42:
        if (!self->_preloadedViewController && v29)
        {
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v35 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          if (v35)
          {
            v36 = v35;
            v37 = 0;
            v38 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v47 != v38)
                  objc_enumerationMutation(a3);
                v40 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v40, "identifier"), "isEqualToString:", v29))
                  v37 = v40;
              }
              v36 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
            }
            while (v36);
          }
          else
          {
            v37 = 0;
          }
          self->_preloadedViewController = (SUViewController *)-[SUTabBarController _rootViewControllerForSection:](self, "_rootViewControllerForSection:", v37);
          self->_preloadedViewControllerIdentifier = (NSString *)v29;
        }
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    preloadedViewController = self->_preloadedViewController;
    v42 = -[SUViewController loadsWhenHidden](preloadedViewController, "loadsWhenHidden");
    -[SUViewController setLoadsWhenHidden:](preloadedViewController, "setLoadsWhenHidden:", 1);
    -[SUViewController reload](preloadedViewController, "reload");
    -[SUViewController setLoadsWhenHidden:](preloadedViewController, "setLoadsWhenHidden:", v42);
  }
  -[SUTabBarController setSections:](self, "setSections:", a3, v44);
  -[SUTabBarController loadFromDefaults](self, "loadFromDefaults");

  self->_preloadedViewController = 0;
  self->_preloadedViewControllerIdentifier = 0;
  self->_preloadedViewControllerKey = 0;
  return 1;
}

- (BOOL)loadFromDefaults
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int *v39;
  int *v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[2];
  int v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("ISURLRequest"));
  v4 = objc_msgSend(v3, "objectForKey:", CFSTR("SURootSections"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUTabBarController setSectionOrdering:](self, "setSectionOrdering:", v4);
  v5 = objc_msgSend(v3, "objectForKey:", CFSTR("SUSectionNavigationPath"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = 0;
    v6 = (void *)MEMORY[0x24BDD1620];
    v7 = (void *)MEMORY[0x24BDBCF20];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    v8 = objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2)), v5, &v43);
    if (v43)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v11 &= 2u;
      if (v11)
      {
        v12 = objc_opt_class();
        v46 = 138543618;
        v47 = v12;
        v48 = 2114;
        v49 = v43;
        LODWORD(v42) = 22;
        v39 = &v46;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v46, v42);
          free(v14);
          v39 = (int *)v15;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUTabBarController _restoreArchivedContexts:](self, "_restoreArchivedContexts:", v8);
  }
  v16 = objc_msgSend(v3, "objectForKey:", CFSTR("SUOverlayContexts"), v39);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = 0;
    v17 = (void *)MEMORY[0x24BDD1620];
    v18 = (void *)MEMORY[0x24BDBCF20];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    v19 = objc_msgSend(v17, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v18, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2)), v16, &v43);
    if (v43)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v21 = objc_msgSend(v20, "shouldLog");
      if (objc_msgSend(v20, "shouldLogToDisk"))
        v22 = v21 | 2;
      else
        v22 = v21;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v20, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v22 &= 2u;
      if (v22)
      {
        v23 = objc_opt_class();
        v46 = 138543618;
        v47 = v23;
        v48 = 2114;
        v49 = v43;
        LODWORD(v42) = 22;
        v40 = &v46;
        v24 = _os_log_send_and_compose_impl();
        if (v24)
        {
          v25 = (void *)v24;
          v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, &v46, v42);
          free(v25);
          v40 = (int *)v26;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUTabBarController _restoreOverlayContexts:](self, "_restoreOverlayContexts:", v19);
  }
  if (-[SUTabBarController selectedIndex](self, "selectedIndex", v40) == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_ignoreTabReselection = 1;
    -[SUTabBarController setSelectedIndex:](self, "setSelectedIndex:", 0);
    self->_ignoreTabReselection = 0;
  }
  v27 = objc_msgSend(v3, "objectForKey:", CFSTR("SUTransientNavigationPath"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = 0;
    v28 = (void *)MEMORY[0x24BDD1620];
    v29 = (void *)MEMORY[0x24BDBCF20];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    v30 = objc_msgSend(v28, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v29, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2)), v27, &v43);
    if (v43)
    {
      v31 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v32 = objc_msgSend(v31, "shouldLog");
      if (objc_msgSend(v31, "shouldLogToDisk"))
        v33 = v32 | 2;
      else
        v33 = v32;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v31, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v33 &= 2u;
      if (v33)
      {
        v34 = objc_opt_class();
        v46 = 138543618;
        v47 = v34;
        v48 = 2114;
        v49 = v43;
        LODWORD(v42) = 22;
        v41 = &v46;
        v35 = _os_log_send_and_compose_impl();
        if (v35)
        {
          v36 = (void *)v35;
          v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v46, v42);
          free(v36);
          v41 = (int *)v37;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUTabBarController _restoreArchivedTransientContexts:](self, "_restoreArchivedTransientContexts:", v30);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v41), "postNotificationName:object:", CFSTR("SUTabBarControllerDidLoadNotification"), self);
  return 1;
}

- (void)pushTransientViewController:(id)a3 onSectionWithIdentifier:(id)a4
{
  -[SUTabBarController _moveTransientViewController:toSectionWithIdentifier:asRoot:](self, "_moveTransientViewController:toSectionWithIdentifier:asRoot:", a3, a4, 0);
}

- (void)reloadSectionVisibilityAnimated:(BOOL)a3
{
  -[SUTabBarController _reloadViewControllersFromSections:animated:](self, "_reloadViewControllersFromSections:animated:", self->_sections, a3);
}

- (void)reloadSectionWithIdentifier:(id)a3 URL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[SUTabBarController setSelectedIdentifier:](self, "setSelectedIdentifier:", a3);
  v6 = -[UITabBarController selectedNavigationController](self, "selectedNavigationController");
  if (v6 == (id)-[SUTabBarController moreNavigationController](self, "moreNavigationController"))
  {
    v7 = (void *)objc_msgSend(v6, "viewControllers");
    if ((unint64_t)objc_msgSend(v7, "count") >= 3)
      objc_msgSend(v6, "popToViewController:animated:", objc_msgSend(v7, "objectAtIndex:", 1), 0);
  }
  else
  {
    objc_msgSend(v6, "popToRootViewControllerAnimated:", 0);
  }
  v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "viewControllers"), "lastObject");
  if (a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", a4);
    objc_msgSend(v8, "reloadWithURLRequestProperties:", v9);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "reload");
  }
}

- (void)resetToSystemDefaults
{
  -[SUTabBarController resetUserDefaults](self, "resetUserDefaults");
  -[SUTabBarController selectDefaultSection](self, "selectDefaultSection");
  objc_msgSend(-[UITabBarController selectedNavigationController](self, "selectedNavigationController"), "popToRootViewControllerAnimated:", 0);
}

- (void)resetUserDefaults
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SUNavigationAccountID"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SURootSections"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SUSectionNavigationPath"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SUTransientNavigationPath"));
  objc_msgSend(v2, "synchronize");
}

- (BOOL)saveOrderingToDefaults
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)-[SUTabBarController viewControllers](self, "viewControllers");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "section");
        if ((objc_msgSend(v9, "isTransient") & 1) == 0 && objc_msgSend(v9, "identifier"))
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "identifier"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setObject:forKey:", v3, CFSTR("SURootSections"));

  return 1;
}

- (BOOL)saveToDefaults
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "activeAccount"), "uniqueIdentifier");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("SUNavigationAccountID"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("SUNavigationAccountID"));
  if (-[SUTabBarController saveOrderingToDefaults](self, "saveOrderingToDefaults")
    && -[SUTabBarController _saveNavigationPathToDefaults](self, "_saveNavigationPathToDefaults")
    && -[SUTabBarController _saveTransientNavigationPathToDefaults](self, "_saveTransientNavigationPathToDefaults"))
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "synchronize");
  }
  else
  {
    return 0;
  }
}

- (void)selectDefaultSection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[SUTabBarController viewControllers](self, "viewControllers");
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(v3, "objectAtIndex:", 0);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_msgSend(v9, "section"), "isDefaultSection") & 1) != 0)
          {
            v4 = (uint64_t)v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:
    -[SUTabBarController setSelectedViewController:](self, "setSelectedViewController:", v4);
  }
}

- (void)selectSectionOfType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)-[SUTabBarController viewControllers](self, "viewControllers");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "section");
        if (objc_msgSend(v10, "type") == a3)
        {
          v11 = objc_msgSend(v10, "identifier");
          if (v11)
            -[SUTabBarController setSelectedIdentifier:](self, "setSelectedIdentifier:", v11);
          return;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
}

- (void)setMoreListSelectedImage:(id)a3 unselectedImage:(id)a4
{
  UIImage *moreListSelectedImage;
  UIImage **p_moreListUnselectedImage;
  UIImage *moreListUnselectedImage;

  moreListSelectedImage = self->_moreListSelectedImage;
  if (moreListSelectedImage == a3)
  {
    p_moreListUnselectedImage = &self->_moreListUnselectedImage;
    moreListUnselectedImage = self->_moreListUnselectedImage;
    if (moreListUnselectedImage == a4)
      return;
  }
  else
  {

    self->_moreListSelectedImage = (UIImage *)a3;
    p_moreListUnselectedImage = &self->_moreListUnselectedImage;
    moreListUnselectedImage = self->_moreListUnselectedImage;
    if (moreListUnselectedImage == a4)
      goto LABEL_6;
  }

  *p_moreListUnselectedImage = (UIImage *)a4;
LABEL_6:
  -[SUTabBarController _applyMoreListConfiguration](self, "_applyMoreListConfiguration");
}

- (void)setMoreListTitle:(id)a3
{
  NSString *moreListTitle;

  moreListTitle = self->_moreListTitle;
  if (moreListTitle != a3)
  {

    self->_moreListTitle = (NSString *)a3;
    -[SUTabBarController _applyMoreListConfiguration](self, "_applyMoreListConfiguration");
  }
}

- (void)setSectionOrdering:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  SUTabBarController *v23;
  NSString *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v24 = -[SUTabBarController selectedIdentifier](self, "selectedIdentifier");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = self;
  v6 = (void *)objc_msgSend((id)-[SUTabBarController viewControllers](self, "viewControllers"), "mutableCopy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = objc_msgSend(v6, "count");
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          while (1)
          {
            v15 = (void *)objc_msgSend(v6, "objectAtIndex:", v14);
            v16 = (void *)objc_msgSend(v15, "section");
            if (objc_msgSend(v16, "identifier"))
            {
              if (objc_msgSend((id)objc_msgSend(v16, "identifier"), "isEqualToString:", v11))
                break;
            }
            if (v13 == ++v14)
              goto LABEL_13;
          }
          objc_msgSend(v5, "addObject:", v15);
          objc_msgSend(v6, "removeObjectAtIndex:", v14);
        }
LABEL_13:
        ;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v6);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(v22, "section"), "isTransient"))
          objc_msgSend(v5, "insertObject:atIndex:", v22, v19++);
        else
          objc_msgSend(v5, "addObject:", v22);
      }
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }
  -[SUTabBarController setViewControllers:](v23, "setViewControllers:", v5);
  -[SUTabBarController setSelectedIdentifier:](v23, "setSelectedIdentifier:", v24);

}

- (void)setTransientViewController:(id)a3 onSectionWithIdentifier:(id)a4
{
  -[SUTabBarController _moveTransientViewController:toSectionWithIdentifier:asRoot:](self, "_moveTransientViewController:toSectionWithIdentifier:asRoot:", a3, a4, 1);
}

+ (Class)_moreNavigationControllerClass
{
  return (Class)objc_opt_class();
}

- (int64_t)ITunesStoreUIBarStyle
{
  return self->_storeBarStyle;
}

- (void)loadView
{
  void *v3;
  SUHitTestView *v4;
  SUHitTestView *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUTabBarController;
  -[SUTabBarController loadView](&v7, sel_loadView);
  v3 = (void *)-[SUTabBarController view](self, "view");
  v4 = [SUHitTestView alloc];
  objc_msgSend(v3, "frame");
  v5 = -[SUHitTestView initWithFrame:](v4, "initWithFrame:");
  -[SUHitTestView setAutoresizingMask:](v5, "setAutoresizingMask:", objc_msgSend(v3, "autoresizingMask"));
  -[SUHitTestView bounds](v5, "bounds");
  objc_msgSend(v3, "setFrame:");
  -[SUHitTestView addSubview:](v5, "addSubview:", v3);
  -[SUTabBarController setView:](self, "setView:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__longPressAction_);
  objc_msgSend((id)-[SUTabBarController tabBar](self, "tabBar"), "addGestureRecognizer:", v6);

}

- (id)rotatingFooterView
{
  objc_super v4;

  if (-[SUTabBarController overlayBackgroundViewController](self, "overlayBackgroundViewController"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SUTabBarController;
  return -[SUTabBarController rotatingFooterView](&v4, sel_rotatingFooterView);
}

- (id)rotatingHeaderView
{
  objc_super v4;

  if (-[SUTabBarController overlayBackgroundViewController](self, "overlayBackgroundViewController"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SUTabBarController;
  return -[SUTabBarController rotatingHeaderView](&v4, sel_rotatingHeaderView);
}

- (id)_sectionForViewController:(id)a3
{
  void *v5;
  id result;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((id)-[SUTabBarController moreNavigationController](self, "moreNavigationController") != a3
    || (unint64_t)objc_msgSend((id)objc_msgSend(a3, "viewControllers"), "count") < 2)
  {
    return 0;
  }
  v5 = (void *)-[SUTabBarController viewControllers](self, "viewControllers");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend((id)objc_msgSend(v10, "viewControllers"), "count"))
          return (id)objc_msgSend(v10, "section");
      }
      v7 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      result = 0;
      if (v7)
        continue;
      break;
    }
  }
  return result;
}

- (void)_setSelectedViewController:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (-[SUTabBarController _isReloadingUnderneathTransientViewController](self, "_isReloadingUnderneathTransientViewController"))
  {
    self->_preTransientSelectedViewController = (UIViewController *)a3;
  }
  else
  {
    v5 = -[SUTabBarController selectedViewController](self, "selectedViewController");
    v6 = (id)-[SUTabBarController transientViewController](self, "transientViewController");
    if (v6 && v6 != a3)
      self->_preTransientSelectedViewController = (UIViewController *)a3;
    if (v5)
    {
      if (v5 != a3)
      {
        v7 = objc_msgSend(a3, "ITunesStoreUIBarStyle");
        if (v7 != self->_storeBarStyle)
        {
          v8 = v7;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = a3;
          else
            v9 = 0;
          objc_msgSend(v9, "_setStoreBarStyle:clientInterface:", v8, self->_clientInterface);
          -[SUTabBarController _setStoreBarStyle:](self, "_setStoreBarStyle:", v8);
          v10 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
          v11 = objc_msgSend(v10, "statusBarStyle");
          if (v8 == 1)
          {
            v12 = 0;
          }
          else
          {
            v12 = v11;
            if (v8 == 2)
              v12 = 1;
          }
          objc_msgSend(v10, "setStatusBarStyle:animated:", v12, 0);
        }
      }
    }
    v13.receiver = self;
    v13.super_class = (Class)SUTabBarController;
    -[SUTabBarController _setSelectedViewController:](&v13, sel__setSelectedViewController_, a3);
    if (v5 == a3 && !self->_ignoreTabReselection)
      objc_msgSend(-[SUTabBarController selectedViewController](self, "selectedViewController"), "tabBarControllerDidReselectTabBarItem:", self);
  }
}

- (id)selectedViewController
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUTabBarController;
  v3 = -[SUTabBarController selectedViewController](&v5, sel_selectedViewController);
  if (v3 == (id)-[SUTabBarController transientViewController](self, "transientViewController"))
    return self->_preTransientSelectedViewController;
  return v3;
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v9;

  if (a3)
  {
    if (!self->_preTransientSelectedViewController)
      self->_preTransientSelectedViewController = (UIViewController *)-[SUTabBarController selectedViewController](self, "selectedViewController");
  }
  else
  {
    if (-[SUTabBarController _isReloadingUnderneathTransientViewController](self, "_isReloadingUnderneathTransientViewController", 0, a4))
    {
      return;
    }
    self->_preTransientSelectedViewController = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)SUTabBarController;
  -[SUTabBarController setTransientViewController:animated:](&v9, sel_setTransientViewController_animated_, a3, 0);
  v6 = (void *)-[SUTabBarController tabBar](self, "tabBar");
  v7 = objc_msgSend(v6, "isUserInteractionEnabled");
  if (!a3 && v7)
  {
    if (self->_preTransientSelectedViewController)
    {
      v8 = objc_msgSend(v6, "isLocked");
      objc_msgSend(v6, "setLocked:", 0);
      objc_msgSend(v6, "setSelectedItem:", -[UIViewController tabBarItem](self->_preTransientSelectedViewController, "tabBarItem"));
      objc_msgSend(v6, "setLocked:", v8);
    }
  }
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  if (self->_preTransientSelectedViewController
    && objc_msgSend(a3, "indexOfObjectIdenticalTo:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_preTransientSelectedViewController = 0;
  }
  self->_ignoreTabReselection = 1;
  v7.receiver = self;
  v7.super_class = (Class)SUTabBarController;
  -[SUTabBarController setViewControllers:animated:](&v7, sel_setViewControllers_animated_, a3, v4);
  -[SUTabBarController _fixupViewControllers](self, "_fixupViewControllers");
  self->_ignoreTabReselection = 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)-[SUTabBarController viewControllers](self, "viewControllers"), "count"))
    return objc_msgSend(-[SUTabBarController selectedViewController](self, "selectedViewController"), "supportedInterfaceOrientations");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
    return 30;
  if (SUAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)tabBar:(id)a3 didEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v5 = a5;
  if (objc_msgSend(MEMORY[0x24BDF6E48], "instancesRespondToSelector:", a2))
  {
    v11.receiver = self;
    v11.super_class = (Class)SUTabBarController;
    -[SUTabBarController tabBar:didEndCustomizingItems:changed:](&v11, sel_tabBar_didEndCustomizingItems_changed_, a3, a4, v5);
  }
  if (v5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUTabBarConfigurationChangedNotification"), self);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom")
    && -[SUPreviewOverlayViewController isViewLoaded](self->_previewOverlayViewController, "isViewLoaded"))
  {
    v9 = (void *)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view");
    v10 = -[SUTabBarController view](self, "view");
    if (objc_msgSend(v9, "superview") != v10)
      -[SUTabBarController _moveView:toView:](self, "_moveView:toView:", v9, v10);
  }
}

- (void)tabBar:(id)a3 willEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  _BOOL8 v5;
  objc_super v9;

  v5 = a5;
  if (objc_msgSend(MEMORY[0x24BDF6E48], "instancesRespondToSelector:", a2))
  {
    v9.receiver = self;
    v9.super_class = (Class)SUTabBarController;
    -[SUTabBarController tabBar:willEndCustomizingItems:changed:](&v9, sel_tabBar_willEndCustomizingItems_changed_, a3, a4, v5);
  }
  if (v5)
    -[SUTabBarController _fixupViewControllers](self, "_fixupViewControllers");
}

- (void)tabBar:(id)a3 willShowCustomizationSheet:(id)a4 withNavigationBar:(id)a5
{
  void *v8;
  void *v9;

  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3), "userInterfaceIdiom"))
  {
    if (-[SUPreviewOverlayViewController isViewLoaded](self->_previewOverlayViewController, "isViewLoaded"))
    {
      v8 = (void *)objc_msgSend(a4, "superview");
      v9 = (void *)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view");
      if ((void *)objc_msgSend(v9, "superview") != v8)
      {
        -[SUTabBarController _moveView:toView:](self, "_moveView:toView:", v9, v8);
        objc_msgSend(v8, "insertSubview:belowSubview:", v9, a4);
      }
    }
  }
  -[SUUIAppearance styleNavigationBar:](-[SUClientInterface appearance](self->_clientInterface, "appearance"), "styleNavigationBar:", a5);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "viewDidAppear:", v3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  -[SUTabBarController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "viewDidDisappear:", v3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  -[SUTabBarController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "viewWillAppear:", v3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  -[SUTabBarController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "viewWillDisappear:", v3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  -[SUTabBarController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);
}

- (void)cancelTransientViewController:(id)a3
{
  -[SUTabBarController setTransientViewController:](self, "setTransientViewController:", 0);
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend((id)-[SUTabBarController view](self, "view"), "viewWithTag:", 1920234350), "removeFromSuperview");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "didRotateFromInterfaceOrientation:", a3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if (-[SUPreviewOverlayViewController isViewLoaded](self->_previewOverlayViewController, "isViewLoaded"))
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "setHidden:", 0);
  v10.receiver = self;
  v10.super_class = (Class)SUTabBarController;
  -[SUTabBarController didRotateFromInterfaceOrientation:](&v10, sel_didRotateFromInterfaceOrientation_, a3);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend((id)-[SUTabBarController view](self, "view"), "viewWithTag:", 1920234350), "setAlpha:", 0.0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)SUTabBarController;
  -[SUTabBarController willAnimateRotationToInterfaceOrientation:duration:](&v12, sel_willAnimateRotationToInterfaceOrientation_duration_, a3, a4);
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "willRotateToInterfaceOrientation:duration:", a3, a4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)SUTabBarController;
  -[SUTabBarController willRotateToInterfaceOrientation:duration:](&v12, sel_willRotateToInterfaceOrientation_duration_, a3, a4);
}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  unsigned int v7;
  id v8;
  BOOL v9;
  NSMutableArray *overlayBackgroundViewControllers;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SUTabBarController;
  v7 = -[SUTabBarController window:shouldAutorotateToInterfaceOrientation:](&v21, sel_window_shouldAutorotateToInterfaceOrientation_);
  v20.receiver = self;
  v20.super_class = (Class)SUTabBarController;
  v8 = -[SUTabBarController selectedViewController](&v20, sel_selectedViewController);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
    v7 = objc_msgSend(v8, "window:shouldAutorotateToInterfaceOrientation:", a3, a4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(overlayBackgroundViewControllers);
        if ((v7 & 1) != 0)
          v7 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "window:shouldAutorotateToInterfaceOrientation:", a3, a4);
        else
          v7 = 0;
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBackgroundViewControllers, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v12);
  }
  if (v7
    && -[SUPreviewOverlayViewController isViewLoaded](self->_previewOverlayViewController, "isViewLoaded"))
  {
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "setHidden:", 1);
  }
  return v7;
}

- (void)dismissOverlayBackgroundViewController
{
  objc_msgSend(-[SUTabBarController overlayBackgroundViewController](self, "overlayBackgroundViewController"), "dismissAnimated:", 1);
}

- (id)overlayBackgroundViewController
{
  return (id)-[NSMutableArray lastObject](self->_overlayBackgroundViewControllers, "lastObject");
}

- (BOOL)presentOverlayBackgroundViewController:(id)a3
{
  char v5;
  NSMutableArray *overlayBackgroundViewControllers;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[NSMutableArray containsObject:](self->_overlayBackgroundViewControllers, "containsObject:");
  if ((v5 & 1) == 0)
  {
    overlayBackgroundViewControllers = self->_overlayBackgroundViewControllers;
    if (!overlayBackgroundViewControllers)
    {
      overlayBackgroundViewControllers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->_overlayBackgroundViewControllers = overlayBackgroundViewControllers;
    }
    v7 = (void *)-[NSMutableArray lastObject](overlayBackgroundViewControllers, "lastObject");
    -[SUTabBarController addChildViewController:](self, "addChildViewController:", a3);
    -[NSMutableArray addObject:](self->_overlayBackgroundViewControllers, "addObject:", a3);
    objc_msgSend(a3, "setDelegate:", self);
    objc_msgSend(v7, "viewWillDisappear:", 0);
    objc_msgSend(a3, "viewWillAppear:", 0);
    v8 = (void *)-[SUTabBarController view](self, "view");
    v9 = (void *)objc_msgSend(a3, "view");
    objc_msgSend(v8, "bounds");
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v8, "addSubview:", v9);
    if (-[SUPreviewOverlayViewController isViewLoaded](self->_previewOverlayViewController, "isViewLoaded"))objc_msgSend(v8, "bringSubviewToFront:", -[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"));
    objc_msgSend(a3, "viewDidAppear:", 0);
    objc_msgSend(v7, "viewDidDisappear:", 0);
  }
  return v5 ^ 1;
}

- (void)scriptOverlayBackgroundDidDismiss:(id)a3
{
  SUTabBarController *v5;
  unint64_t v6;
  id v7;
  id v8;

  v8 = (id)-[NSMutableArray lastObject](self->_overlayBackgroundViewControllers, "lastObject");
  if (v8 == a3)
  {
    v6 = -[NSMutableArray count](self->_overlayBackgroundViewControllers, "count");
    v5 = self;
    if (v6 >= 2)
      v5 = (SUTabBarController *)-[NSMutableArray objectAtIndex:](self->_overlayBackgroundViewControllers, "objectAtIndex:", v6 - 2);
  }
  else
  {
    v5 = 0;
  }
  -[SUTabBarController viewWillAppear:](v5, "viewWillAppear:", 0);
  v7 = a3;
  -[NSMutableArray removeObjectIdenticalTo:](self->_overlayBackgroundViewControllers, "removeObjectIdenticalTo:", a3);
  objc_msgSend(a3, "setDelegate:", 0);
  -[SUTabBarController removeChildViewController:](self, "removeChildViewController:", a3);
  if (objc_msgSend(a3, "isViewLoaded"))
  {
    objc_msgSend(a3, "viewWillDisappear:", 0);
    objc_msgSend((id)objc_msgSend(a3, "view"), "removeFromSuperview");
    objc_msgSend(a3, "viewDidDisappear:", 0);
  }
  -[SUTabBarController viewDidAppear:](v5, "viewDidAppear:", 0);

}

- (unint64_t)indexOfViewControllerWithSectionType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = (void *)-[SUTabBarController viewControllers](self, "viewControllers");
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v7), "section"), "type") != a3)
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (NSString)selectedIdentifier
{
  return (NSString *)objc_msgSend((id)objc_msgSend(-[UITabBarController selectedNavigationController](self, "selectedNavigationController"), "section"), "identifier");
}

- (void)setSections:(id)a3
{
  NSArray *sections;
  NSArray *v6;

  sections = self->_sections;
  if (sections != a3)
  {

    v6 = (NSArray *)a3;
    self->_sections = v6;
    -[SUTabBarController _reloadViewControllersFromSections:animated:](self, "_reloadViewControllersFromSections:animated:", v6, 0);
  }
}

- (void)setSelectedIdentifier:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = (void *)-[SUTabBarController viewControllers](self, "viewControllers");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = (void *)objc_msgSend(v5, "objectAtIndex:", v8);
      v10 = (void *)objc_msgSend(v9, "section");
      if (objc_msgSend(v10, "identifier"))
      {
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "identifier")))
          break;
      }
      if (v7 == ++v8)
        return;
    }
    if (-[SUTabBarController selectedViewController](self, "selectedViewController") != v9)
      -[SUTabBarController setSelectedViewController:](self, "setSelectedViewController:", v9);
  }
}

- (id)viewControllerForSectionIdentifier:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)-[SUTabBarController viewControllers](self, "viewControllers");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "section");
        if (v11 && (objc_msgSend((id)objc_msgSend(v11, "identifier"), "isEqualToString:", a3) & 1) != 0)
        {
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend((id)objc_msgSend(v10, "viewControllers"), "count"))
              return (id)-[SUTabBarController moreNavigationController](self, "moreNavigationController");
          }
          return v10;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 0;
}

- (id)viewControllerForSectionType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[SUTabBarController allViewControllers](self, "allViewControllers");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)objc_msgSend(v9, "section"), "type") == a3)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v9, "topViewController");
  return v9;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimation
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1036831949;
  LODWORD(v2) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (void)_applicationDidChangeStatusBarFrame:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  SUPreviewOverlayViewController *previewOverlayViewController;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF75A8]), "CGRectValue");
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarFrame");
  if (v8 >= v6)
    v11 = v6;
  else
    v11 = v8;
  if (v10 >= v9)
    v12 = v9;
  else
    v12 = v10;
  v13 = v11 - v12;
  if (fabsf(v13) > 0.00000011921)
  {
    previewOverlayViewController = self->_previewOverlayViewController;
    if (previewOverlayViewController)
    {
      v15 = objc_msgSend((id)-[SUPreviewOverlayViewController view](previewOverlayViewController, "view"), "superview");
      if (v15 == -[SUTabBarController view](self, "view"))
      {
        objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "frame");
        objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "setFrame:", v17, v16 - v13, v18, v19);
      }
    }
  }
}

- (void)_partnerChanged:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6F98], "transitionSafePerformer:", self), "_transitionSafeHandlePartnerChange:", a3);
}

- (void)_hidePreviewOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SUPreviewOverlayViewController *previewOverlayViewController;
  id v6;
  SUPreviewOverlayViewController *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (self->_previewOverlayViewController)
  {
    v3 = a3;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
    {
      previewOverlayViewController = self->_previewOverlayViewController;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke;
      v9[3] = &unk_24DE7AF90;
      v9[4] = self;
      -[SUPreviewOverlayViewController hideInViewController:animated:completionBlock:](previewOverlayViewController, "hideInViewController:animated:completionBlock:", self, v3, v9);
    }
    else
    {
      v6 = -[UITabBarController selectedNavigationController](self, "selectedNavigationController");
      v7 = self->_previewOverlayViewController;
      if (v6)
      {
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke_2;
        v8[3] = &unk_24DE7AF90;
        v8[4] = self;
        -[SUPreviewOverlayViewController hideInNavigationController:animated:completionBlock:](v7, "hideInNavigationController:animated:completionBlock:", v6, v3, v8);
      }
      else
      {

        self->_previewOverlayViewController = 0;
      }
    }
  }
}

void __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1304) = 0;
}

void __50__SUTabBarController__hidePreviewOverlayAnimated___block_invoke_2(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1304) = 0;
}

- (SUPreviewOverlayViewController)_previewOverlayViewController
{
  return self->_previewOverlayViewController;
}

- (void)_setStoreBarStyle:(int64_t)a3
{
  UIColor *v4;
  uint64_t v5;

  if (self->_storeBarStyle != a3)
  {
    self->_storeBarStyle = a3;
    if (a3 == 1)
    {
      v4 = -[SUClientInterface lightKeyColor](self->_clientInterface, "lightKeyColor");
      v5 = 10060;
    }
    else
    {
      if (a3 != 2)
        return;
      v4 = -[SUClientInterface darkKeyColor](self->_clientInterface, "darkKeyColor");
      v5 = 11050;
    }
    -[SUNavigationBarBackgroundView setBackdropStyle:](self->_tabBarBackdropView, "setBackdropStyle:", v5);
    if (v4)
      objc_msgSend((id)-[SUTabBarController tabBar](self, "tabBar"), "setInteractionTintColor:", v4);
  }
}

- (void)_showPreviewOverlay:(id)a3 animated:(BOOL)a4
{
  SUPreviewOverlayViewController *previewOverlayViewController;
  _BOOL8 v6;
  SUPreviewOverlayViewController *v8;
  SUPreviewOverlayViewController *v9;
  id v10;
  _QWORD v11[6];

  previewOverlayViewController = self->_previewOverlayViewController;
  if (previewOverlayViewController != a3)
  {
    v6 = a4;
    if (previewOverlayViewController)
    {
      if (-[SUPreviewOverlayViewController isViewLoaded](previewOverlayViewController, "isViewLoaded"))
        objc_msgSend((id)-[SUPreviewOverlayViewController view](self->_previewOverlayViewController, "view"), "removeFromSuperview");
      -[SUPreviewOverlayViewController removeFromParentViewController](self->_previewOverlayViewController, "removeFromParentViewController");
      v8 = self->_previewOverlayViewController;
    }
    else
    {
      v8 = 0;
    }

    v9 = (SUPreviewOverlayViewController *)a3;
    self->_previewOverlayViewController = v9;
    if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
      {
        -[SUPreviewOverlayViewController showInViewController:animated:completionBlock:](self->_previewOverlayViewController, "showInViewController:animated:completionBlock:", self, v6, 0);
      }
      else
      {
        v10 = -[UITabBarController selectedNavigationController](self, "selectedNavigationController");
        if (v10)
        {
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = __51__SUTabBarController__showPreviewOverlay_animated___block_invoke;
          v11[3] = &unk_24DE7AFB8;
          v11[4] = self;
          v11[5] = a3;
          objc_msgSend(a3, "showInNavigationController:animated:completionBlock:", v10, v6, v11);
        }
      }
    }
  }
}

uint64_t __51__SUTabBarController__showPreviewOverlay_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveView:toView:", objc_msgSend(*(id *)(a1 + 40), "view"), objc_msgSend(*(id *)(a1 + 32), "view"));
}

- (void)_applyMoreListConfiguration
{
  void *v3;
  void *v4;
  int v5;
  UIImage *moreListSelectedImage;

  v3 = (void *)objc_msgSend((id)-[SUTabBarController moreNavigationController](self, "moreNavigationController"), "firstViewController");
  v4 = v3;
  if (self->_moreListTitle)
    objc_msgSend(v3, "setTitle:");
  v5 = _UIApplicationUsesLegacyUI();
  moreListSelectedImage = self->_moreListSelectedImage;
  if (v5)
  {
    if (moreListSelectedImage)
    {
      objc_msgSend((id)objc_msgSend(v4, "tabBarItem"), "setFinishedSelectedImage:withFinishedUnselectedImage:", self->_moreListSelectedImage, self->_moreListUnselectedImage);
      return;
    }
  }
  else if (moreListSelectedImage)
  {
    objc_msgSend((id)objc_msgSend(v4, "tabBarItem"), "setSelectedImage:", -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](self->_moreListSelectedImage, "_imageThatSuppressesAccessibilityHairlineThickening"));
  }
  if (self->_moreListUnselectedImage)
    objc_msgSend((id)objc_msgSend(v4, "tabBarItem"), "setImage:", -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](self->_moreListUnselectedImage, "_imageThatSuppressesAccessibilityHairlineThickening"));
}

- (id)_archivedContextsForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (void *)objc_msgSend(a3, "viewControllers");
  else
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0);
  v6 = v5;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyArchivableContext");
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v8);
  }
  v22 = 0;
  v13 = (void *)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v22);
  if (v22)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v17 = objc_opt_class();
      v27 = 138543618;
      v28 = v17;
      v29 = 2114;
      v30 = v22;
      LODWORD(v21) = 22;
      v18 = _os_log_send_and_compose_impl();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v27, v21);
        free(v19);
        SSFileLog();
      }
    }
  }

  return v13;
}

- (void)_beginReloadingUnderneathTransientViewController
{
  if (-[SUTabBarController transientViewController](self, "transientViewController"))
    ++self->_reloadingUnderneathTransientControllerCount;
}

- (void)_endReloadingUnderneathTransientViewController
{
  int64_t reloadingUnderneathTransientControllerCount;
  BOOL v3;
  int64_t v4;

  reloadingUnderneathTransientControllerCount = self->_reloadingUnderneathTransientControllerCount;
  v3 = reloadingUnderneathTransientControllerCount < 1;
  v4 = reloadingUnderneathTransientControllerCount - 1;
  if (!v3)
    self->_reloadingUnderneathTransientControllerCount = v4;
}

- (void)_fixupTabBarSelection
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v3 = (void *)-[SUTabBarController tabBar](self, "tabBar");
  v4 = (void *)objc_msgSend(v3, "items");
  v5 = -[SUTabBarController selectedIndex](self, "selectedIndex");
  if (v5 < objc_msgSend(v4, "count")
    && !-[SUTabBarController _isReloadingUnderneathTransientViewController](self, "_isReloadingUnderneathTransientViewController"))
  {
    v6 = objc_msgSend(v3, "isLocked");
    objc_msgSend(v3, "setLocked:", 0);
    objc_msgSend(v3, "setSelectedItem:", objc_msgSend(v4, "objectAtIndex:", -[SUTabBarController selectedIndex](self, "selectedIndex")));
    objc_msgSend(v3, "setLocked:", v6);
  }
}

- (void)_fixupViewControllers
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  void *v11;

  v3 = objc_msgSend(MEMORY[0x24BDF6BF8], "transitionSafetyDelegate");
  v4 = -[SUTabBarController moreNavigationController](self, "moreNavigationController");
  v5 = (void *)objc_msgSend((id)-[SUTabBarController allViewControllers](self, "allViewControllers"), "copy");
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4);
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = (void *)objc_msgSend(v5, "objectAtIndex:", i);
      if (v10 != (void *)v4 && i > v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (void *)objc_msgSend(v10, "viewControllers");
          if ((unint64_t)objc_msgSend(v11, "count") >= 2)
            objc_msgSend(v10, "setViewControllers:", objc_msgSend(v11, "subarrayWithRange:", 0, 1));
        }
      }
      objc_msgSend(v10, "setDelegate:", v3);
    }
  }

  -[SUTabBarController _applyMoreListConfiguration](self, "_applyMoreListConfiguration");
}

- (BOOL)_isReloadingUnderneathTransientViewController
{
  return self->_reloadingUnderneathTransientControllerCount > 0;
}

- (void)_longPressAction:(id)a3
{
  void *v6;
  id v7;

  v6 = (void *)objc_msgSend(a3, "view");
  objc_msgSend(a3, "removeTarget:action:", self, a2);
  objc_msgSend(v6, "removeGestureRecognizer:", a3);
  objc_msgSend(-[SUTabBarController selectedViewController](self, "selectedViewController"), "tabBarControllerDidLongPressTabBarItem:", self);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, a2);
  objc_msgSend(v6, "addGestureRecognizer:", v7);

}

- (void)_moveTransientViewController:(id)a3 toSectionWithIdentifier:(id)a4 asRoot:(BOOL)a5
{
  id v8;
  id v9;
  _BOOL4 i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  id v19;

  if (-[SUTabBarController viewControllerForSectionIdentifier:](self, "viewControllerForSectionIdentifier:", a4))
  {
    v8 = (id)-[SUTabBarController transientViewController](self, "transientViewController");
    v9 = a3;
    for (i = a3 != 0; v9 && v9 != v8; i = v9 != 0)
      v9 = (id)objc_msgSend(v9, "parentViewController");
    v18 = v9;
    if (i)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = (void *)objc_msgSend(v18, "topViewController");
      else
        v11 = v18;
      v19 = v11;
      v12 = v11;
      -[SUTabBarController setSelectedIdentifier:](self, "setSelectedIdentifier:", a4);
      -[SUTabBarController setTransientViewController:](self, "setTransientViewController:", 0);
      v13 = -[UITabBarController selectedNavigationController](self, "selectedNavigationController");
      v14 = v13;
      if (a5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = -[SUTabBarController _sectionForIdentifier:](self, "_sectionForIdentifier:", a4);
          objc_msgSend(v19, "setSection:", v15);
          objc_msgSend((id)objc_msgSend(v19, "_existingTabBarItem"), "setTitle:", objc_msgSend(v15, "title"));
        }
        if (v14 == (void *)-[SUTabBarController moreNavigationController](self, "moreNavigationController"))
        {
          v16 = (void *)objc_msgSend((id)objc_msgSend(v14, "viewControllers"), "mutableCopy");
          if ((unint64_t)objc_msgSend(v16, "count") >= 2)
            objc_msgSend(v16, "removeObjectsInRange:", 1, objc_msgSend(v16, "count") - 1);
          objc_msgSend(v16, "addObject:", v19);
          objc_msgSend(v14, "setViewControllers:", v16);

        }
        else
        {
          objc_msgSend(v14, "setViewControllers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v19));
        }
      }
      else
      {
        objc_msgSend(v13, "pushViewController:animated:", v19, 0);
      }

    }
  }
}

- (void)_moveView:(id)a3 toView:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a3, "frame");
  objc_msgSend(a4, "convertRect:fromView:", objc_msgSend(a3, "superview"), v6, v7, v8, v9);
  objc_msgSend(a3, "setFrame:");
  objc_msgSend(a4, "addSubview:", a3);
}

- (void)_reloadViewControllersFromSections:(id)a3 animated:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  SUNavigationController *v19;
  uint64_t v20;
  id v21;
  SUNavigationController *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSString *v32;
  id v33;

  v26 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = (id)objc_msgSend((id)-[SUTabBarController viewControllers](self, "viewControllers"), "mutableCopy");
  v25 = objc_msgSend(v33, "count");
  v7 = -[SUTabBarController moreNavigationController](self, "moreNavigationController");
  v23 = v7;
  if (v7)
    v27 = objc_msgSend((id)-[SUTabBarController allViewControllers](self, "allViewControllers"), "indexOfObjectIdenticalTo:", v7);
  else
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = (void *)-[SUTabBarController delegate](self, "delegate", v23);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    v8 = 0;
  v32 = -[SUNetworkObserver partnerIdentifier](+[SUNetworkObserver sharedInstance](SUNetworkObserver, "sharedInstance"), "partnerIdentifier");
  v9 = objc_msgSend(a3, "count");
  if (v9 >= 1)
  {
    v10 = v9;
    v11 = 0;
    v29 = 0;
    v30 = v9;
    v31 = v8;
    do
    {
      v12 = (void *)objc_msgSend(a3, "objectAtIndex:", v11);
      v13 = objc_msgSend(v12, "partnerHeader");
      if ((!v13 || -[NSString isEqualToString:](v32, "isEqualToString:", v13))
        && (!v8 || objc_msgSend(v8, "tabBarController:shouldShowSection:", self, v12)))
      {
        v14 = v6;
        v15 = objc_msgSend(v33, "count");
        if (v15 < 1)
          goto LABEL_17;
        v16 = v15;
        v17 = 0;
        while (1)
        {
          v18 = (void *)objc_msgSend(v33, "objectAtIndex:", v17);
          if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v18, "section"), "identifier")))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
          }
          if (v16 == ++v17)
            goto LABEL_17;
        }
        if (v27 != 0x7FFFFFFFFFFFFFFFLL
          && v11 < v27
          && !objc_msgSend((id)objc_msgSend(v18, "viewControllers"), "count"))
        {
          v20 = objc_msgSend(v24, "popToRootViewControllerAnimated:", 0);
          objc_msgSend((id)objc_msgSend(v24, "view"), "layoutIfNeeded");
          objc_msgSend(v18, "setViewControllers:", v20);
        }
        v19 = v18;
        objc_msgSend(v33, "removeObjectAtIndex:", v17);
        if (!v19)
        {
LABEL_17:
          v19 = -[SUNavigationController initWithSection:rootViewController:]([SUNavigationController alloc], "initWithSection:rootViewController:", v12, -[SUTabBarController _rootViewControllerForSection:](self, "_rootViewControllerForSection:", v12));
          -[SUNavigationController setClientInterface:](v19, "setClientInterface:", self->_clientInterface);
        }
        v6 = v14;
        if (objc_msgSend(v12, "isTransient"))
        {
          objc_msgSend(v14, "insertObject:atIndex:", v19, v29++);
        }
        else
        {
          objc_msgSend(v14, "addObject:", v19);
          objc_msgSend(v28, "addObject:", v19);
        }

        v10 = v30;
        v8 = v31;
      }
      ++v11;
    }
    while (v11 != v10);
  }
  if (!objc_msgSend(v6, "count"))
  {
    v21 = -[SUViewControllerFactory newPlaceholderViewController](-[SUClientInterface viewControllerFactory](self->_clientInterface, "viewControllerFactory"), "newPlaceholderViewController");
    objc_msgSend(v21, "setClientInterface:", self->_clientInterface);
    v22 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", v21);
    -[SUNavigationController setClientInterface:](v22, "setClientInterface:", self->_clientInterface);
    objc_msgSend(v6, "addObject:", v22);

  }
  -[SUTabBarController setViewControllers:animated:](self, "setViewControllers:animated:", v6, v26);
  -[SUTabBarController setCustomizableViewControllers:](self, "setCustomizableViewControllers:", v28);
  if (v25 >= 1)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUTabBarConfigurationChangedNotification"), self);
  if (objc_msgSend(v6, "count") == 1)
    -[SUTabBarController hideBarWithTransition:](self, "hideBarWithTransition:", 0);
  else
    -[SUTabBarController showBarWithTransition:](self, "showBarWithTransition:", 0);

}

- (void)_restoreArchivedContexts:(id)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  SUViewController *v14;
  id v15;

  v5 = objc_msgSend(a3, "count");
  if (v5)
    v6 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
  else
    v6 = 0;
  v7 = objc_msgSend(v6, "sectionIdentifier");
  if (v6 && !v7)
  {
    v8 = -[SUTabBarController moreNavigationController](self, "moreNavigationController");
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend((id)-[SUTabBarController allViewControllers](self, "allViewControllers"), "indexOfObjectIdenticalTo:", v8) != 0x7FFFFFFFFFFFFFFFLL)-[SUTabBarController setSelectedViewController:](self, "setSelectedViewController:", v9);
    }
    return;
  }
  if (!v7)
    return;
  -[SUTabBarController setSelectedIdentifier:](self, "setSelectedIdentifier:", v7);
  v10 = -[UITabBarController selectedNavigationController](self, "selectedNavigationController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return;
  v11 = (void *)objc_msgSend(v10, "viewControllers");
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = (void *)objc_msgSend(v10, "firstViewController");
  if (v10 == (id)-[SUTabBarController moreNavigationController](self, "moreNavigationController"))
  {
    objc_msgSend(v15, "addObject:", v12);
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
      v12 = 0;
    else
      v12 = (void *)objc_msgSend(v11, "objectAtIndex:", 1);
    if ((unint64_t)objc_msgSend(a3, "count") < 2)
      v6 = 0;
    else
      v6 = (void *)objc_msgSend(a3, "objectAtIndex:", 1);
    v13 = 2;
    if (!v12)
      goto LABEL_14;
    goto LABEL_13;
  }
  v13 = 1;
  if (v12)
  {
LABEL_13:
    objc_msgSend(v12, "restoreArchivableContext:", v6);
    objc_msgSend(v15, "addObject:", v12);
  }
LABEL_14:
  if (v13 < v5)
  {
    do
    {
      if (v5 - 1 == v13
        && self->_preloadedViewController
        && -[NSString isEqualToString:](self->_preloadedViewControllerKey, "isEqualToString:", CFSTR("SUSectionNavigationPath")))
      {
        v14 = self->_preloadedViewController;

        self->_preloadedViewController = 0;
      }
      else
      {
        v14 = -[SUTabBarController _viewControllerForContext:](self, "_viewControllerForContext:", objc_msgSend(a3, "objectAtIndex:", v13));
      }
      if (v14)
        objc_msgSend(v15, "addObject:", v14);
      ++v13;
    }
    while (v5 != v13);
  }
  objc_msgSend(v10, "setViewControllers:", v15);

}

- (void)_restoreOverlayContexts:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "copyViewController");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SUTabBarController presentOverlayBackgroundViewController:](self, "presentOverlayBackgroundViewController:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)_restoreArchivedTransientContexts:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  SUViewController *v7;
  SUNavigationController *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(a3, "count"))
  {
    v5 = 0;
    while (1)
    {
      v6 = objc_msgSend(a3, "objectAtIndex:", v5);
      if (v5 == objc_msgSend(a3, "count") - 1
        && self->_preloadedViewController
        && -[NSString isEqualToString:](self->_preloadedViewControllerKey, "isEqualToString:", CFSTR("SUTransientNavigationPath")))
      {
        break;
      }
      v7 = -[SUTabBarController _viewControllerForContext:](self, "_viewControllerForContext:", v6);
      if (v7)
        goto LABEL_9;
LABEL_10:
      if (++v5 >= (unint64_t)objc_msgSend(a3, "count"))
        goto LABEL_11;
    }
    v7 = self->_preloadedViewController;

    self->_preloadedViewController = 0;
    if (!v7)
      goto LABEL_10;
LABEL_9:
    objc_msgSend(v9, "addObject:", v7);
    goto LABEL_10;
  }
LABEL_11:
  if (objc_msgSend(v9, "count"))
  {
    v8 = -[SUNavigationController initWithSection:]([SUNavigationController alloc], "initWithSection:", objc_msgSend(-[UITabBarController selectedNavigationController](self, "selectedNavigationController"), "section"));
    -[SUNavigationController setClientInterface:](v8, "setClientInterface:", self->_clientInterface);
    -[SUNavigationController setViewControllers:](v8, "setViewControllers:", v9);
    -[SUTabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", v8, 0);

  }
}

- (id)_rootViewControllerForSection:(id)a3
{
  SUViewController *preloadedViewController;
  SUViewController *v6;
  void *v8;
  id v9;
  void *v10;

  if (-[NSString isEqualToString:](self->_preloadedViewControllerIdentifier, "isEqualToString:", objc_msgSend(a3, "identifier"))&& (preloadedViewController = self->_preloadedViewController) != 0)
  {
    v6 = preloadedViewController;

    self->_preloadedViewController = 0;
    return v6;
  }
  else
  {
    v8 = (void *)-[SUTabBarController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (id)objc_msgSend(v8, "tabBarController:rootViewControllerForSection:", self, a3);
    else
      v9 = -[SUViewControllerFactory newStorePageViewControllerWithSection:](-[SUClientInterface viewControllerFactory](self->_clientInterface, "viewControllerFactory"), "newStorePageViewControllerWithSection:", a3);
    v10 = v9;
    if (!objc_msgSend(v9, "clientInterface"))
      objc_msgSend(v10, "setClientInterface:", self->_clientInterface);
    objc_msgSend(v10, "setTitle:", objc_msgSend(a3, "title"));
    return v10;
  }
}

- (BOOL)_saveNavigationPathToDefaults
{
  id v2;

  v2 = -[SUTabBarController _archivedContextsForViewController:](self, "_archivedContextsForViewController:", -[UITabBarController selectedNavigationController](self, "selectedNavigationController"));
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setObject:forKey:", v2, CFSTR("SUSectionNavigationPath"));
  return 1;
}

- (BOOL)_saveTransientNavigationPathToDefaults
{
  uint64_t v3;
  id v4;

  v3 = -[SUTabBarController transientViewController](self, "transientViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[SUTabBarController _archivedContextsForViewController:](self, "_archivedContextsForViewController:", v3);
  else
    v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setObject:forKey:", v4, CFSTR("SUTransientNavigationPath"));
  return 1;
}

- (id)_sectionForIdentifier:(id)a3
{
  NSArray *sections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  sections = self->_sections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(sections);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "identifier"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)_sectionForType:(int64_t)a3
{
  NSArray *sections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  sections = self->_sections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(sections);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "type") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](sections, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)_transitionSafeHandlePartnerChange:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_sections, "count"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v7 &= 2u;
    if (v7)
    {
      v13 = 138412546;
      v14 = objc_opt_class();
      v15 = 2112;
      v16 = objc_msgSend(a3, "object");
      LODWORD(v12) = 22;
      v11 = &v13;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v13, v12);
        free(v9);
        v11 = (int *)v10;
        SSFileLog();
      }
    }
    -[SUTabBarController _beginReloadingUnderneathTransientViewController](self, "_beginReloadingUnderneathTransientViewController", v11);
    -[SUTabBarController _reloadViewControllersFromSections:animated:](self, "_reloadViewControllersFromSections:animated:", self->_sections, 1);
    -[SUTabBarController _endReloadingUnderneathTransientViewController](self, "_endReloadingUnderneathTransientViewController");
  }
}

- (id)_viewControllerForContext:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)-[SUTabBarController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (id)objc_msgSend(v5, "tabBarController:viewControllerForContext:", self, a3);
    if (!objc_msgSend(v6, "clientInterface"))
      objc_msgSend(v6, "setClientInterface:", self->_clientInterface);
  }
  else
  {
    v6 = (id)objc_msgSend(a3, "copyViewController");
    objc_msgSend(v6, "setClientInterface:", self->_clientInterface);
    objc_msgSend(v6, "restoreArchivableContext:", a3);
  }
  return v6;
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (NSArray)sections
{
  return self->_sections;
}

@end
