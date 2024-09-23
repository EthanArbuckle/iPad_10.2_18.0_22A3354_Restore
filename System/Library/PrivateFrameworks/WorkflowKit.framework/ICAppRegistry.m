@implementation ICAppRegistry

- (ICAppRegistry)init
{
  ICAppRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *observersByIdentifier;
  uint64_t v5;
  NSLock *registryLock;
  uint64_t v7;
  NSLock *observersLock;
  NSObject *v9;
  id v10;
  ICAppRegistry *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICAppRegistry;
  v2 = -[ICAppRegistry init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    observersByIdentifier = v2->_observersByIdentifier;
    v2->_observersByIdentifier = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    registryLock = v2->_registryLock;
    v2->_registryLock = (NSLock *)v5;

    v7 = objc_opt_new();
    observersLock = v2->_observersLock;
    v2->_observersLock = (NSLock *)v7;

    objc_initWeak(&location, v2);
    v2->_urlTypesToken = -1;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __21__ICAppRegistry_init__block_invoke;
    v13[3] = &unk_1E7AF5AF8;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch("com.apple.LaunchServices.ApplicationsChanged", &v2->_urlTypesToken, v9, v13);

    v11 = v2;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[ICAppRegistry urlTypesToken](self, "urlTypesToken"));
  v3.receiver = self;
  v3.super_class = (Class)ICAppRegistry;
  -[ICAppRegistry dealloc](&v3, sel_dealloc);
}

- (NSDictionary)appsDictionary
{
  void *v3;
  int v4;
  id v6;

  -[ICAppRegistry registryLock](self, "registryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tryLock");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("ICAppRegistry Locking Exception"), CFSTR("The registry must be locked while the apps dictionary is being accessed."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return self->_appsDictionary;
}

- (NSArray)apps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAppRegistry registryLock](self, "registryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!self->_isFilled)
    -[ICAppRegistry fillRegistry](self, "fillRegistry");
  -[ICAppRegistry appsDictionary](self, "appsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAppRegistry registryLock](self, "registryLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return (NSArray *)v5;
}

- (ICApp)currentApp
{
  ICApp *currentApp;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  ICApp *v10;
  ICApp *v11;

  currentApp = self->_currentApp;
  if (!currentApp)
  {
    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (void *)*MEMORY[0x1E0DC7FD8];
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    -[ICAppRegistry appWithIdentifier:](self, "appWithIdentifier:", v9);
    v10 = (ICApp *)objc_claimAutoreleasedReturnValue();

    v11 = self->_currentApp;
    self->_currentApp = v10;

    currentApp = self->_currentApp;
  }
  return currentApp;
}

- (id)_appsWithIdentifiers:(id)a3
{
  id v4;
  NSDictionary *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  ICApp *v40;
  NSDictionary *appsDictionary;
  NSDictionary *v42;
  void *v43;
  NSDictionary *v45;
  id v46;
  void *v47;
  ICAppRegistry *v48;
  _QWORD v49[4];
  NSDictionary *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48 = self;
  -[ICAppRegistry appsDictionary](self, "appsDictionary");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v60 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        -[NSDictionary objectForKey:](v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    getWFInterchangeLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[ICAppRegistry _appsWithIdentifiers:]";
      v67 = 2112;
      v68 = v6;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, "%s Loading apps: %@", buf, 0x16u);
    }

    v15 = (void *)-[NSDictionary mutableCopy](v5, "mutableCopy");
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = (id)objc_opt_new();
    v18 = v17;
    v45 = v5;
    v46 = v7;

    v47 = v6;
    if (v48->_isFilled)
    {
      v19 = 0;
    }
    else
    {
      v20 = v18;
      +[ICAppDefinitionRegistry registeredDefinitions](ICAppDefinitionRegistry, "registeredDefinitions", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_opt_new();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v22 = v6;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v56 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
            objc_msgSend(v21, "objectForKey:", v27);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v28;
            if (v28)
            {
              (*(void (**)(uint64_t))(v28 + 16))(v28);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKey:", v30, v27);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        }
        while (v24);
      }

      v6 = v47;
      v18 = v20;
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v31 = v6;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v52 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
          objc_msgSend(v19, "objectForKey:", v36, v45);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v37)
          {
            v38 = v18;
            getWFInterchangeLogObject();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v66 = "-[ICAppRegistry _appsWithIdentifiers:]";
              v67 = 2114;
              v68 = v36;
              _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_ERROR, "%s Failed to load a definition for %{public}@", buf, 0x16u);
            }

            v18 = v38;
          }
          v40 = -[ICApp initWithIdentifier:definition:]([ICApp alloc], "initWithIdentifier:definition:", v36, v37);
          objc_msgSend(v18, "setObject:forKey:", v40, v36);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v33);
    }

    v5 = v18;
    appsDictionary = v48->_appsDictionary;
    v48->_appsDictionary = v5;

    v7 = v46;
    v6 = v47;
  }
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __38__ICAppRegistry__appsWithIdentifiers___block_invoke;
  v49[3] = &unk_1E7AEDCB8;
  v50 = v5;
  v42 = v5;
  objc_msgSend(v7, "if_map:", v49);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)appsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICAppRegistry registryLock](self, "registryLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ICAppRegistry _appsWithIdentifiers:](self, "_appsWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAppRegistry registryLock](self, "registryLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (id)appWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAppRegistry appsWithIdentifiers:](self, "appsWithIdentifiers:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (id)appWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICAppRegistry apps](self, "apps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN allBundleIdentifiers"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)appWithURLScheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ICAppRegistry apps](self, "apps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%@ IN schemes.scheme"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDictionary)actions
{
  void *v3;
  int v4;
  id v6;

  -[ICAppRegistry registryLock](self, "registryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tryLock");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("ICAppRegistry Locking Exception"), CFSTR("The registry must be locked while the actions dictionary is being accessed."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return self->_actions;
}

- (NSArray)allActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAppRegistry registryLock](self, "registryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!self->_isFilled)
    -[ICAppRegistry fillRegistry](self, "fillRegistry");
  -[ICAppRegistry actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAppRegistry registryLock](self, "registryLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return (NSArray *)v5;
}

- (id)actionsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[ICAppRegistry registryLock](self, "registryLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ICAppRegistry actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICAppRegistry registryLock](self, "registryLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40__ICAppRegistry_actionsWithIdentifiers___block_invoke;
    v18[3] = &unk_1E7AEDCE0;
    v19 = v6;
    objc_msgSend(v4, "if_map:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_2;
    v17[3] = &unk_1E7AF8178;
    v17[4] = self;
    objc_msgSend(v4, "if_map:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAppRegistry _appsWithIdentifiers:](self, "_appsWithIdentifiers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAppRegistry registryLock](self, "registryLock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unlock");

    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_3;
    v15[3] = &unk_1E7AEDCE0;
    v16 = v11;
    v13 = v11;
    objc_msgSend(v4, "if_map:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)updateRegistry
{
  void *v3;
  void *v4;
  NSDictionary *appsDictionary;
  id v6;
  void *v7;
  id v8;

  -[ICAppRegistry registryLock](self, "registryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (self->_isFilled)
  {
    -[ICAppRegistry fillRegistry](self, "fillRegistry");
    -[ICAppRegistry registryLock](self, "registryLock");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");
  }
  else
  {
    -[ICAppRegistry appsDictionary](self, "appsDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    appsDictionary = self->_appsDictionary;
    self->_appsDictionary = 0;

    if (objc_msgSend(v8, "count"))
      v6 = -[ICAppRegistry _appsWithIdentifiers:](self, "_appsWithIdentifiers:", v8);
    -[ICAppRegistry registryLock](self, "registryLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

  }
}

- (void)fillRegistry
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *actions;
  NSDictionary *v10;
  NSDictionary *appsDictionary;
  NSDictionary *v12;
  ICApp *currentApp;
  id v14;
  id v15;
  _QWORD v16[4];
  NSDictionary *v17;
  NSDictionary *v18;

  -[ICAppRegistry registryLock](self, "registryLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tryLock");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("ICAppRegistry Locking Exception"), CFSTR("The registry must be locked while it is being filled."), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  self->_isFilled = 1;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  +[ICAppDefinitionRegistry registeredDefinitions](ICAppDefinitionRegistry, "registeredDefinitions");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __29__ICAppRegistry_fillRegistry__block_invoke;
  v16[3] = &unk_1E7AEDD08;
  v7 = v5;
  v17 = v7;
  v8 = v6;
  v18 = v8;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v16);
  actions = self->_actions;
  self->_actions = v8;
  v10 = v8;

  appsDictionary = self->_appsDictionary;
  self->_appsDictionary = v7;
  v12 = v7;

  currentApp = self->_currentApp;
  self->_currentApp = 0;

}

- (void)addInstallStatusObserver:(id)a3 forAppIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[ICAppRegistry appsWithIdentifiers:](self, "appsWithIdentifiers:", v7);
  -[ICAppRegistry observersLock](self, "observersLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lock");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        -[ICAppRegistry observersByIdentifier](self, "observersByIdentifier", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v17, v15);
        }
        objc_msgSend(v17, "addObject:", v6);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[ICAppRegistry observersLock](self, "observersLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

}

- (void)removeInstallStatusObserver:(id)a3 forAppIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ICAppRegistry observersLock](self, "observersLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[ICAppRegistry observersByIdentifier](self, "observersByIdentifier", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count") == 1 && objc_msgSend(v16, "containsObject:", v6))
          objc_msgSend(v15, "removeObjectForKey:", v14);
        else
          objc_msgSend(v16, "removeObject:", v6);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[ICAppRegistry observersLock](self, "observersLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

}

- (void)refreshInstalledApps
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICAppRegistry_refreshInstalledApps__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICAppRegistry;
  -[ICAppRegistry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAppRegistry apps](self, "apps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isFilled
{
  return self->_isFilled;
}

- (NSLock)registryLock
{
  return self->_registryLock;
}

- (void)setRegistryLock:(id)a3
{
  objc_storeStrong((id *)&self->_registryLock, a3);
}

- (void)setAppsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_appsDictionary, a3);
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSLock)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(id)a3
{
  objc_storeStrong((id *)&self->_observersLock, a3);
}

- (NSMutableDictionary)observersByIdentifier
{
  return self->_observersByIdentifier;
}

- (void)setObserversByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_observersByIdentifier, a3);
}

- (int)urlTypesToken
{
  return self->_urlTypesToken;
}

- (void)setUrlTypesToken:(int)a3
{
  self->_urlTypesToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByIdentifier, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_appsDictionary, 0);
  objc_storeStrong((id *)&self->_registryLock, 0);
  objc_storeStrong((id *)&self->_currentApp, 0);
}

void __37__ICAppRegistry_refreshInstalledApps__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "registryLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(*(id *)(a1 + 32), "appsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "registryLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  objc_msgSend(*(id *)(a1 + 32), "observersLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(*(id *)(a1 + 32), "observersByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDictionary:copyItems:", v8, 1);

  objc_msgSend(*(id *)(a1 + 32), "observersLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICAppRegistry_refreshInstalledApps__block_invoke_2;
  block[3] = &unk_1E7AF55D0;
  v14 = v9;
  v15 = v4;
  v16 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __37__ICAppRegistry_refreshInstalledApps__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  uint64_t v12;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __37__ICAppRegistry_refreshInstalledApps__block_invoke_3;
  v10 = &unk_1E7AEDD30;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v11 = v3;
  v12 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v7);
  objc_msgSend(*(id *)(a1 + 40), "allValues", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_resetInstalledStatus);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("ICAppRegistryInstalledAppsDidChangeNotification"), *(_QWORD *)(a1 + 48));

}

void __37__ICAppRegistry_refreshInstalledApps__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);
  v8 = objc_msgSend(v7, "isInstalled");
  objc_msgSend(v7, "updateInstalledStatus");
  if (v8 != objc_msgSend(v7, "isInstalled"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "appRegistry:installStatusChangedForApp:", *(_QWORD *)(a1 + 40), v7, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

void __29__ICAppRegistry_fillRegistry__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  ICApp *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ICApp *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICApp initWithIdentifier:definition:]([ICApp alloc], "initWithIdentifier:definition:", v5, v34);
  v35 = v5;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v33 = v6;
  -[ICApp schemes](v6, "schemes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v7)
  {
    v8 = v7;
    v37 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v10, "actions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v43 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              v17 = *(void **)(a1 + 40);
              objc_msgSend(v16, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
              {
                v20 = *(void **)(a1 + 40);
                objc_msgSend(v16, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKey:", v16, v21);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v13);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v8);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[ICApp documentActions](v33, "documentActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
        v28 = *(void **)(a1 + 40);
        objc_msgSend(v27, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          v31 = *(void **)(a1 + 40);
          objc_msgSend(v27, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v27, v32);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v24);
  }

}

uint64_t __40__ICAppRegistry_actionsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
}

id __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "stringByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "legacyAppIdentifierForBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *k;
  void *v22;
  void *v23;
  char v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v6, "schemes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v28)
    {
      v9 = *(_QWORD *)v38;
      v26 = *(_QWORD *)v38;
      v27 = v6;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v11, "actions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v34;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v34 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                objc_msgSend(v17, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqualToString:", v5);

                if ((v19 & 1) != 0)
                {
                  v7 = v17;

                  v6 = v27;
                  goto LABEL_29;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
              if (v14)
                continue;
              break;
            }
          }

          v9 = v26;
        }
        v6 = v27;
        v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v28);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "documentActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v7)
    {
      v20 = *(_QWORD *)v30;
      while (2)
      {
        for (k = 0; k != v7; k = (char *)k + 1)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v8);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)k);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v5);

          if ((v24 & 1) != 0)
          {
            v7 = v22;
            goto LABEL_29;
          }
        }
        v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_29:

  }
  return v7;
}

uint64_t __38__ICAppRegistry__appsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
}

void __21__ICAppRegistry_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState");

  if (v3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__14524;
    v16 = __Block_byref_object_dispose__14525;
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getUIApplicationDidBecomeActiveNotification();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __21__ICAppRegistry_init__block_invoke_117;
    v10[3] = &unk_1E7AEDC90;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    v10[4] = &v12;
    objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v13[5];
    v13[5] = v7;

    objc_destroyWeak(&v11);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "refreshInstalledApps");

  }
}

void __21__ICAppRegistry_init__block_invoke_117(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "refreshInstalledApps");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ICAppRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken_14653 != -1)
    dispatch_once(&sharedRegistry_onceToken_14653, block);
  return (id)sharedRegistry_sharedRegistry_14654;
}

+ (id)legacyAppIdentifierForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(&unk_1E7B8DD10, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

+ (id)bundleIdentifierForLegacyAppIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(&unk_1E7B8DD38, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "arrayByAddingObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x1E0CA5870]);
          v14 = (void *)objc_msgSend(v13, "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0, (_QWORD)v20);
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "applicationState");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isInstalled");

            if ((v17 & 1) != 0)
            {
              v18 = v12;

              goto LABEL_14;
            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
    }

    objc_msgSend(v7, "firstObject");
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  }
  else
  {
    v18 = v3;
  }

  return v18;
}

void __31__ICAppRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRegistry_sharedRegistry_14654;
  sharedRegistry_sharedRegistry_14654 = (uint64_t)v1;

}

@end
