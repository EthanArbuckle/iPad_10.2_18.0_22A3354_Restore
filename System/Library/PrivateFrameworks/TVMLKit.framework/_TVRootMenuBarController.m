@implementation _TVRootMenuBarController

- (_TVRootMenuBarController)init
{
  _TVRootMenuBarController *v2;
  _TVRootMenuBarController *v3;
  uint64_t v4;
  IKAppTabBar *appTabBar;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVRootMenuBarController;
  v2 = -[_TVRootMenuBarController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_TVRootMenuBarController setDelegate:](v2, "setDelegate:", v2);
    v3->_previousSelectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BE51948]), "initWithTabBarController:", v3);
    appTabBar = v3->_appTabBar;
    v3->_appTabBar = (IKAppTabBar *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_TVRootMenuBarController setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_TVRootMenuBarController;
  -[_TVRootMenuBarController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVRootMenuBarController;
  -[_TVRootMenuBarController viewDidLoad](&v4, sel_viewDidLoad);
  -[_TVRootMenuBarController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    return 30;
  if (TVShouldConstrainToPortait())
    return 2;
  return 26;
}

- (void)setAppNavigationControllersDelegate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVRootMenuBarController setAppNavigationControllerDelegate:](self, "setAppNavigationControllerDelegate:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_TVRootMenuBarController viewControllers](self, "viewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "setAppNavigationControllerDelegate:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (UINavigationController)currentNavigationController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[_TVRootMenuBarController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_TVRootMenuBarController selectedIndex](self, "selectedIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (UINavigationController *)v6;
}

- (IKAppNavigationController)appNavigationController
{
  return 0;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v18 = CFSTR("TVAppRootViewControllerCurrentNavigationControllerUserInfoKey");
  v19[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification"), self, v6);

  -[_TVRootMenuBarController viewControllers](self, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObjectIdenticalTo:", v5);

  v10 = -[_TVRootMenuBarController previousSelectedIndex](self, "previousSelectedIndex");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v13 = v5;
    objc_msgSend(v13, "viewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v13, "visibleViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v13, "visibleViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "scrollToTop");
    }

    goto LABEL_11;
  }
  -[_TVRootMenuBarController setPreviousSelectedIndex:](self, "setPreviousSelectedIndex:", v9);
  -[_TVRootMenuBarController appTabBar](self, "appTabBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onSelect");

  v12 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    -[_TVRootMenuBarController tabBarController:didSelectViewController:].cold.1(v9, v12);
LABEL_12:

}

- (unint64_t)numberOfTabsInTabBar:(id)a3
{
  return -[NSArray count](self->_appTabBarItems, "count", a3);
}

- (id)tabBar:(id)a3 tabItemAtIndex:(unint64_t)a4
{
  return -[NSArray objectAtIndex:](self->_appTabBarItems, "objectAtIndex:", a4);
}

- (id)tabBar:(id)a3 setTabItems:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  _TVRootMenuBarController *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _TVAppNavigationController_iOS *v48;
  _TVAppNavigationController_iOS *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v79;
  _TVRootMenuBarController *v80;
  id obj;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  unint64_t v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[_TVRootMenuBarController previousSelectedIndex](self, "previousSelectedIndex");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (v7 = v6, v6 >= -[NSArray count](self->_appTabBarItems, "count")))
  {
    v87 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_appTabBarItems, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE51878]);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = -[_TVRootMenuBarController selectedIndex](self, "selectedIndex");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (v10 = v9, v9 >= objc_msgSend(v5, "count")))
    v10 = 0;
  v96 = v10;
  v98 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v80 = self;
  v11 = self->_appTabBarItems;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v110;
    v15 = *MEMORY[0x24BE51878];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v110 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setObject:forKey:", v17, v18);

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
    }
    while (v13);
  }

  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v20 = v80;
  -[_TVRootMenuBarController viewControllers](v80, "viewControllers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v106;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v106 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
        objc_msgSend(v26, "tvIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v26, v27);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
    }
    while (v23);
  }

  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v86 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v5;
  v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
  if (v89)
  {
    v85 = v28;
    v99 = 0;
    v97 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v88 = 0;
    v32 = 0;
    v84 = *(_QWORD *)v102;
    v83 = *MEMORY[0x24BE51878];
    v79 = *MEMORY[0x24BE51890];
    v92 = *MEMORY[0x24BE51898];
    v91 = *MEMORY[0x24BE51880];
    v95 = 0x7FFFFFFFFFFFFFFFLL;
    v82 = *MEMORY[0x24BE51888];
    v90 = v19;
    do
    {
      v33 = 0;
      v34 = v99;
      v35 = v97;
      v36 = v29;
      do
      {
        if (*(_QWORD *)v102 != v84)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v33);
        objc_msgSend(v37, "objectForKeyedSubscript:", v83, v79);
        v38 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v38;
        objc_msgSend(v98, "objectForKey:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = v32;
        if (v39)
        {
          objc_msgSend(v98, "objectForKey:", v32);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v30;
          v42 = objc_msgSend(v40, "mutableCopy");

          v31 = (void *)v42;
          v30 = v41;
          v32 = v100;
        }
        else
        {
          v40 = v31;
          v31 = (void *)objc_msgSend(v37, "mutableCopy");
        }

        objc_msgSend(v19, "objectForKey:", v32);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v94 = v36;
        if (v43)
        {
          objc_msgSend(v19, "objectForKey:", v32);
          v44 = objc_claimAutoreleasedReturnValue();

          v30 = (void *)v44;
        }
        else
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_navigationControllerForTabIdentifier:", v32);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = v30;
          v48 = (_TVAppNavigationController_iOS *)v46;

          v49 = v48;
          if (!v48)
            v49 = objc_alloc_init(_TVAppNavigationController_iOS);
          objc_opt_class();
          v30 = v49;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[_TVAppNavigationController setAppNavigationControllerDelegate:](v49, "setAppNavigationControllerDelegate:", v80->_appNavigationControllerDelegate);
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v49, v79);
          }
          -[UIViewController tv_setIdentifier:](v49, "tv_setIdentifier:", v32);
        }
        v50 = v91;
        objc_msgSend(v37, "objectForKey:", v92);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = v51;
        if (objc_msgSend(v51, "length"))
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", v92);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v51, v92);
          objc_msgSend(v30, "setTitle:", v51);
          if (v52 && (objc_msgSend(v52, "isEqualToString:", v51) & 1) == 0)
          {
            objc_msgSend(v30, "tabBarItem");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setTitle:", v51);

            v32 = v100;
          }

          v50 = v91;
        }
        v93 = v33;
        v54 = v37;
        objc_msgSend(v37, "objectForKey:", v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v55, "length"))
        {
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v55, v50);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "tabBarItem");
          v57 = v30;
          v58 = v31;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "tv_resourceName");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "imageForResource:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "_imageThatSuppressesAccessibilityHairlineThickening");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setImage:", v63);

          v19 = v90;
          v31 = v58;
          v30 = v57;

          v32 = v100;
        }
        v97 = v55;
        objc_msgSend(v54, "objectForKey:", v82);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v29, "length"))
        {
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, v82);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v29);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "tabBarItem");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "tv_resourceName");
          v67 = v30;
          v68 = v31;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "imageForResource:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "_imageThatSuppressesAccessibilityHairlineThickening");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setSelectedImage:", v71);

          v19 = v90;
          v31 = v68;
          v30 = v67;

          v32 = v100;
        }
        objc_msgSend(v85, "addObject:", v31);
        objc_msgSend(v86, "addObject:", v30);
        v72 = objc_msgSend(v87, "isEqualToString:", v32);
        if (v72)
          v73 = v88 + v93;
        else
          v73 = v96;
        v74 = v95;
        if (v72)
          v74 = v88 + v93;
        v95 = v74;
        v96 = v73;
        v33 = v93 + 1;
        v34 = v99;
        v35 = v97;
        v36 = v29;
      }
      while (v89 != v93 + 1);
      v88 += v89;
      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
    }
    while (v89);

    v20 = v80;
    v28 = v85;
    v75 = v95;
  }
  else
  {
    v75 = 0x7FFFFFFFFFFFFFFFLL;
  }

  -[_TVRootMenuBarController setViewControllers:](v20, "setViewControllers:", v86);
  -[_TVRootMenuBarController setAppTabBarItems:](v20, "setAppTabBarItems:", v28);
  -[_TVRootMenuBarController setPreviousSelectedIndex:](v20, "setPreviousSelectedIndex:", v75);
  -[_TVRootMenuBarController setSelectedIndex:](v20, "setSelectedIndex:", v96);
  -[_TVRootMenuBarController tabBar](v20, "tabBar");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setNeedsLayout");

  +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "hide");

  return v28;
}

- (id)selectedTabItemForTabBar:(id)a3
{
  void *v4;
  void *v5;

  if (-[_TVRootMenuBarController selectedIndex](self, "selectedIndex", a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_appTabBarItems, "objectAtIndex:", -[_TVRootMenuBarController selectedIndex](self, "selectedIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE51878]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)tabBar:(id)a3 setSelectedTabItem:(id)a4
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _TVRootMenuBarController *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_appTabBarItems;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v16 = self;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    v12 = *MEMORY[0x24BE51878];
    while (2)
    {
      v13 = 0;
      v14 = v10 + v8;
      v15 = v9;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "objectForKey:", v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isEqualToString:", v5))
        {
          -[_TVRootMenuBarController setSelectedIndex:](v16, "setSelectedIndex:", v10 + v13);
          -[_TVRootMenuBarController setPreviousSelectedIndex:](v16, "setPreviousSelectedIndex:", v10 + v13);
          goto LABEL_11;
        }
        ++v13;
        v15 = v9;
      }
      while (v8 != v13);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v10 = v14;
      if (v8)
        continue;
      break;
    }
LABEL_11:

  }
}

- (id)transientTabItemForTabBar:(id)a3
{
  return 0;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v6 = a4;
  -[_TVRootMenuBarController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modalRootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v9) & 1) == 0)
  {

    goto LABEL_5;
  }
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_isDismissing");

  if ((v11 & 1) != 0)
  {
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)_TVRootMenuBarController;
    -[_TVRootMenuBarController dismissViewControllerAnimated:completion:](&v13, sel_dismissViewControllerAnimated_completion_, v4, v6);
    goto LABEL_6;
  }
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hideAllAnimated:withCompletion:", v4, v6);

LABEL_6:
}

- (IKAppTabBar)appTabBar
{
  return self->_appTabBar;
}

- (NSArray)appTabBarItems
{
  return self->_appTabBarItems;
}

- (void)setAppTabBarItems:(id)a3
{
  objc_storeStrong((id *)&self->_appTabBarItems, a3);
}

- (unint64_t)previousSelectedIndex
{
  return self->_previousSelectedIndex;
}

- (void)setPreviousSelectedIndex:(unint64_t)a3
{
  self->_previousSelectedIndex = a3;
}

- (_TVAppNavigationControllerDelegate)appNavigationControllerDelegate
{
  return self->_appNavigationControllerDelegate;
}

- (void)setAppNavigationControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_appNavigationControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNavigationControllerDelegate, 0);
  objc_storeStrong((id *)&self->_appTabBarItems, 0);
  objc_storeStrong((id *)&self->_appTabBar, 0);
}

- (void)tabBarController:(uint64_t)a1 didSelectViewController:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_222D98000, a2, OS_LOG_TYPE_DEBUG, "Selected menu item at index %ld", (uint8_t *)&v2, 0xCu);
}

@end
