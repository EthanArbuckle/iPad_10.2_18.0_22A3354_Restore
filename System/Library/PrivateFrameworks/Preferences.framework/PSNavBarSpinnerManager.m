@implementation PSNavBarSpinnerManager

- (PSNavBarSpinnerManager)init
{
  PSNavBarSpinnerManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *savedRecords;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSNavBarSpinnerManager;
  v2 = -[PSNavBarSpinnerManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    savedRecords = v2->_savedRecords;
    v2->_savedRecords = v3;

  }
  return v2;
}

+ (id)sharedSpinnerManager
{
  void *v2;
  PSNavBarSpinnerManager *v3;
  void *v4;

  v2 = (void *)sharedSpinnerManager___sharedManager;
  if (!sharedSpinnerManager___sharedManager)
  {
    v3 = objc_alloc_init(PSNavBarSpinnerManager);
    v4 = (void *)sharedSpinnerManager___sharedManager;
    sharedSpinnerManager___sharedManager = (uint64_t)v3;

    v2 = (void *)sharedSpinnerManager___sharedManager;
  }
  return v2;
}

- (void)startAnimatingInNavItem:(id)a3 forIdentifier:(id)a4 hideBackButton:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PSBarButtonSpinnerView *v14;
  void *v15;
  _QWORD v16[2];

  v5 = a5;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_savedRecords, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setNavigationItem:", v8);
    -[NSMutableDictionary setObject:forKey:](self->_savedRecords, "setObject:forKey:", v11, v9);
    objc_msgSend(v8, "rightBarButtonItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightItems:", v12);

    objc_msgSend(v8, "leftBarButtonItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftItems:", v13);

    objc_msgSend(v11, "setHidesBackButton:", objc_msgSend(v8, "hidesBackButton"));
    v14 = objc_alloc_init(PSBarButtonSpinnerView);
    if (v5)
      objc_msgSend(v8, "setHidesBackButton:animated:", 1, 1);
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", 0, 1);
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItems:animated:", v15, 1);

    -[PSBarButtonSpinnerView startAnimating](v14, "startAnimating");
  }

}

- (void)startAnimatingInNavItem:(id)a3 forIdentifier:(id)a4
{
  -[PSNavBarSpinnerManager startAnimatingInNavItem:forIdentifier:hideBackButton:](self, "startAnimatingInNavItem:forIdentifier:hideBackButton:", a3, a4, 1);
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
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_savedRecords, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "navigationItem");
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
    }
    else
    {
      _PSLoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "Error: Tried to remove a spinner for identifier %@but it wasn't there.", (uint8_t *)&v13, 0xCu);
      }

    }
    -[NSMutableDictionary removeObjectForKey:](self->_savedRecords, "removeObjectForKey:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedRecords, 0);
}

@end
