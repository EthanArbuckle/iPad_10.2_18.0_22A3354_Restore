@implementation RUINavBarSpinnerManager

- (RUINavBarSpinnerManager)init
{
  RUINavBarSpinnerManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *savedRecords;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RUINavBarSpinnerManager;
  v2 = -[RUINavBarSpinnerManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    savedRecords = v2->_savedRecords;
    v2->_savedRecords = v3;

  }
  return v2;
}

+ (id)sharedSpinnerManager
{
  void *v2;
  RUINavBarSpinnerManager *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)sharedSpinnerManager___sharedManager;
  if (!sharedSpinnerManager___sharedManager)
  {
    v3 = objc_alloc_init(RUINavBarSpinnerManager);
    v4 = (void *)sharedSpinnerManager___sharedManager;
    sharedSpinnerManager___sharedManager = (uint64_t)v3;

    if (+[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV"))
      v5 = 19;
    else
      v5 = 100;
    objc_msgSend((id)sharedSpinnerManager___sharedManager, "setActivityIndicatorViewStyle:", v5);
    v2 = (void *)sharedSpinnerManager___sharedManager;
  }
  return v2;
}

- (void)startAnimatingInNavItem:(id)a3 title:(id)a4 forIdentifier:(id)a5 hideBackButton:(BOOL)a6 hideLeftItems:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  RUIBarButtonSpinnerView *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  RUIBarButtonSpinnerView *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v7 = a7;
  v8 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[NSMutableDictionary objectForKey:](self->_savedRecords, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v29 = v8;
    v30 = v7;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = self->_savedRecords;
    v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_savedRecords, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "navigationItem");
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22 == v12)
          {
            if (_isInternalInstall())
            {
              _RUILoggingFacility();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v37 = v12;
                v38 = 2112;
                v39 = v14;
                _os_log_impl(&dword_209E87000, v28, OS_LOG_TYPE_DEFAULT, "Adding a second spinner to navigation item %@, identifer %@", buf, 0x16u);
              }

            }
            goto LABEL_25;
          }

        }
        v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v18)
          continue;
        break;
      }
    }

    v16 = (NSMutableDictionary *)objc_opt_new();
    -[NSMutableDictionary setNavigationItem:](v16, "setNavigationItem:", v12);
    -[NSMutableDictionary setObject:forKey:](self->_savedRecords, "setObject:forKey:", v16, v14);
    objc_msgSend(v12, "rightBarButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setRightItems:](v16, "setRightItems:", v23);

    objc_msgSend(v12, "leftBarButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setLeftItems:](v16, "setLeftItems:", v24);

    -[NSMutableDictionary setHidesBackButton:](v16, "setHidesBackButton:", objc_msgSend(v12, "hidesBackButton"));
    v25 = -[RUIBarButtonSpinnerView initWithActivityIndicatorStyle:]([RUIBarButtonSpinnerView alloc], "initWithActivityIndicatorStyle:", -[RUINavBarSpinnerManager activityIndicatorViewStyle](self, "activityIndicatorViewStyle"));
    if (v29)
      objc_msgSend(v12, "setHidesBackButton:animated:", 1, 1);
    if (v30)
      objc_msgSend(v12, "setLeftBarButtonItems:animated:", 0, 1);
    v35 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItems:animated:", v26, 1);

    if (v13)
    {
      objc_msgSend(v12, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setTitle:](v16, "setTitle:", v27);

      -[NSMutableDictionary setSpinningTitle:](v16, "setSpinningTitle:", v13);
      objc_msgSend(v12, "setTitle:", v13);
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[RUIBarButtonSpinnerView startAnimating](v25, "startAnimating");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_msgSend(MEMORY[0x24BDE57D8], "flush");

    goto LABEL_25;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v14;
      _os_log_impl(&dword_209E87000, &v16->super.super, OS_LOG_TYPE_DEFAULT, "Duplicate spinner for identifier %@", buf, 0xCu);
    }
LABEL_25:

  }
}

- (void)stopAnimatingForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_savedRecords, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_savedRecords, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightBarButtonItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "stopAnimating");
      objc_msgSend(v6, "leftItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeftBarButtonItems:animated:", v10, 1);

      objc_msgSend(v6, "rightItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItems:animated:", v11, 1);

      objc_msgSend(v7, "setHidesBackButton:animated:", objc_msgSend(v6, "hidesBackButton"), 1);
      objc_msgSend(v6, "spinningTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v6, "title");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTitle:", v13);
LABEL_8:

      }
    }
    else if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_209E87000, v13, OS_LOG_TYPE_DEFAULT, "Error: Tried to remove a spinner for identifier %@but it wasn't there.", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_8;
    }
    -[NSMutableDictionary removeObjectForKey:](self->_savedRecords, "removeObjectForKey:", v4);

  }
}

- (int64_t)activityIndicatorViewStyle
{
  return self->_activityIndicatorViewStyle;
}

- (void)setActivityIndicatorViewStyle:(int64_t)a3
{
  self->_activityIndicatorViewStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedRecords, 0);
}

@end
