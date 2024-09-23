@implementation BFFNavBarSpinnerManager

- (BFFNavBarSpinnerManager)init
{
  BFFNavBarSpinnerManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *savedRightItems;
  NSMutableDictionary *v5;
  NSMutableDictionary *savedLeftItems;
  NSMutableDictionary *v7;
  NSMutableDictionary *navigationItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BFFNavBarSpinnerManager;
  v2 = -[BFFNavBarSpinnerManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    savedRightItems = v2->_savedRightItems;
    v2->_savedRightItems = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    savedLeftItems = v2->_savedLeftItems;
    v2->_savedLeftItems = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    navigationItems = v2->_navigationItems;
    v2->_navigationItems = v7;

  }
  return v2;
}

+ (id)sharedSpinnerManager
{
  void *v2;
  BFFNavBarSpinnerManager *v3;
  void *v4;

  v2 = (void *)sharedSpinnerManager___sharedManager;
  if (!sharedSpinnerManager___sharedManager)
  {
    v3 = objc_alloc_init(BFFNavBarSpinnerManager);
    v4 = (void *)sharedSpinnerManager___sharedManager;
    sharedSpinnerManager___sharedManager = (uint64_t)v3;

    v2 = (void *)sharedSpinnerManager___sharedManager;
  }
  return v2;
}

- (void)startAnimatingInNavigationItemOfViewController:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BFFBarButtonSpinnerView *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _BYLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BFFNavBarSpinnerManager startAnimatingInNavigationItemOfViewController:forIdentifier:].cold.1((uint64_t)v7, v8, v9);

  -[NSMutableDictionary objectForKey:](self->_navigationItems, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && v8)
  {
    -[NSMutableDictionary setObject:forKey:](self->_navigationItems, "setObject:forKey:", v8, v7);
    objc_msgSend(v8, "rightBarButtonItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableDictionary setObject:forKey:](self->_savedRightItems, "setObject:forKey:", v11, v7);
    objc_msgSend(v8, "leftBarButtonItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMutableDictionary setObject:forKey:](self->_savedLeftItems, "setObject:forKey:", v12, v7);
    v13 = objc_alloc_init(BFFBarButtonSpinnerView);
    v27[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItems:animated:", v14, 1);
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", 0, 1);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[BFFBarButtonSpinnerView startAnimating](v13, "startAnimating");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_msgSend(v6, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "userInterfaceStyle") == 2)
    {
      v26 = v12;
      objc_msgSend(v6, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "backgroundColor");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v6, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "backgroundColor");
        v24 = v14;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v25 = v11;
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v20 == v21;
        v14 = v24;
        v11 = v25;
        v12 = v26;
        if (!v22)
          goto LABEL_17;
        goto LABEL_16;
      }

      v12 = v26;
    }

LABEL_16:
    -[BFFBarButtonSpinnerView customView](v13, "customView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOverrideUserInterfaceStyle:", 2);

LABEL_17:
  }

}

- (void)stopAnimatingForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_navigationItems, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BFFNavBarSpinnerManager stopAnimatingForIdentifier:].cold.1((uint64_t)v4, v7);

    -[NSMutableDictionary objectForKey:](self->_navigationItems, "objectForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject rightBarButtonItems](v7, "rightBarButtonItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "stopAnimating");
    -[NSMutableDictionary objectForKey:](self->_savedRightItems, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_savedLeftItems, "objectForKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLeftBarButtonItems:animated:](v7, "setLeftBarButtonItems:animated:", v11, 1);
    -[NSObject setRightBarButtonItems:animated:](v7, "setRightBarButtonItems:animated:", v10, 1);
    -[NSMutableDictionary removeObjectForKey:](self->_savedRightItems, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_savedLeftItems, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_navigationItems, "removeObjectForKey:", v4);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_214875000, v7, OS_LOG_TYPE_DEFAULT, "Unbalanced nav bar spinner animation for \"%@\"!", (uint8_t *)&v12, 0xCu);
  }

}

- (BOOL)isAnimatingForIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_navigationItems, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItems, 0);
  objc_storeStrong((id *)&self->_savedLeftItems, 0);
  objc_storeStrong((id *)&self->_savedRightItems, 0);
}

- (void)startAnimatingInNavigationItemOfViewController:(NSObject *)a3 forIdentifier:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = (uint64_t)a2;
  v9 = 138412546;
  v10 = a1;
  v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_214875000, a3, OS_LOG_TYPE_DEBUG, "Starting spinner for \"%@\" on nav item \"%@\", (uint8_t *)&v9, 0x16u);

}

- (void)stopAnimatingForIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_214875000, a2, OS_LOG_TYPE_DEBUG, "Stopping spinner for \"%@\", (uint8_t *)&v2, 0xCu);
}

@end
