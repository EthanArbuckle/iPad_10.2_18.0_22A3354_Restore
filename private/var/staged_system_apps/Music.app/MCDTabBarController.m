@implementation MCDTabBarController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDTabBarController;
  -[MCDTabBarController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTabBarController tabBar](self, "tabBar"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CPTabBar"));

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("carLastSelectedTabIdentifier")));

  v11.receiver = self;
  v11.super_class = (Class)MCDTabBarController;
  -[MCDTabBarController setViewControllers:animated:](&v11, "setViewControllers:animated:", v6, v4);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTabBarController viewControllerForIdentifier:](self, "viewControllerForIdentifier:", v8));
    if (v9)
    {
      -[MCDTabBarController setSelectedViewController:](self, "setSelectedViewController:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      -[MCDTabBarController setTitle:](self, "setTitle:", v10);

    }
    else
    {
      -[MCDTabBarController setSelectedIndex:](self, "setSelectedIndex:", 0);
    }

  }
}

- (id)viewControllerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTabBarController viewControllers](self, "viewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "musicTabIdentifier"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
