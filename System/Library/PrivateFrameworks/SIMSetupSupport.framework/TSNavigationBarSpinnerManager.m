@implementation TSNavigationBarSpinnerManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_9);
  return (id)sharedManager_manager;
}

void __46__TSNavigationBarSpinnerManager_sharedManager__block_invoke()
{
  TSNavigationBarSpinnerManager *v0;
  void *v1;

  v0 = objc_alloc_init(TSNavigationBarSpinnerManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (TSNavigationBarSpinnerManager)init
{
  TSNavigationBarSpinnerManager *v2;
  id v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSNavigationBarSpinnerManager;
  v2 = -[TSNavigationBarSpinnerManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[TSNavigationBarSpinnerManager setNavigationItems:](v2, "setNavigationItems:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[TSNavigationBarSpinnerManager setPreviousLeftBarButtonItems:](v2, "setPreviousLeftBarButtonItems:", v4);

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[TSNavigationBarSpinnerManager setPreviousRightBarButtonItems:](v2, "setPreviousRightBarButtonItems:", v5);

  }
  return v2;
}

- (void)startSpinnerInNavigationItem:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TSSpinnerNavigationBarItem *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TSNavigationBarSpinnerManager navigationItems](self, "navigationItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[TSNavigationBarSpinnerManager navigationItems](self, "navigationItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v7);

    objc_msgSend(v6, "leftBarButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[TSNavigationBarSpinnerManager previousLeftBarButtonItems](self, "previousLeftBarButtonItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leftBarButtonItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v7);

    }
    objc_msgSend(v6, "rightBarButtonItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[TSNavigationBarSpinnerManager previousRightBarButtonItems](self, "previousRightBarButtonItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rightBarButtonItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, v7);

    }
    v17 = objc_alloc_init(TSSpinnerNavigationBarItem);
    v19[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItems:animated:", v18, 1);

    objc_msgSend(v6, "setLeftBarButtonItems:animated:", 0, 1);
    -[TSSpinnerNavigationBarItem startAnimating](v17, "startAnimating");

  }
}

- (void)stopSpinnerForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TSNavigationBarSpinnerManager navigationItems](self, "navigationItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[TSNavigationBarSpinnerManager stopSpinnerInNavigationItem:withIdentifier:](self, "stopSpinnerInNavigationItem:withIdentifier:", v6, v4);
}

- (void)stopSpinnerInNavigationItem:(id)a3 withIdentifier:(id)a4
{
  id v6;
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
  id v22;

  v22 = a3;
  v6 = a4;
  -[TSNavigationBarSpinnerManager navigationItems](self, "navigationItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v22, "rightBarButtonItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stopAnimating");
    -[TSNavigationBarSpinnerManager previousLeftBarButtonItems](self, "previousLeftBarButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[TSNavigationBarSpinnerManager previousLeftBarButtonItems](self, "previousLeftBarButtonItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLeftBarButtonItems:animated:", v14, 1);

    }
    -[TSNavigationBarSpinnerManager previousRightBarButtonItems](self, "previousRightBarButtonItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[TSNavigationBarSpinnerManager previousRightBarButtonItems](self, "previousRightBarButtonItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setRightBarButtonItems:animated:", v18, 1);

    }
    -[TSNavigationBarSpinnerManager navigationItems](self, "navigationItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v6);

    -[TSNavigationBarSpinnerManager previousLeftBarButtonItems](self, "previousLeftBarButtonItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v6);

    -[TSNavigationBarSpinnerManager previousRightBarButtonItems](self, "previousRightBarButtonItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectForKey:", v6);

  }
}

- (NSMutableDictionary)navigationItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNavigationItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)previousLeftBarButtonItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreviousLeftBarButtonItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)previousRightBarButtonItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPreviousRightBarButtonItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_previousLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_navigationItems, 0);
}

@end
