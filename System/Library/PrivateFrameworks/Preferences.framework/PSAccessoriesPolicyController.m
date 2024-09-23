@implementation PSAccessoriesPolicyController

- (PSAccessoriesPolicyController)initWithAppBundleID:(id)a3
{
  id v5;
  PSAccessoriesPolicyController *v6;
  DASession *v7;
  DASession *appSession;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSAccessoriesPolicyController;
  v6 = -[PSAccessoriesPolicyController init](&v13, sel_init);
  v7 = (DASession *)objc_alloc_init((Class)getDADaemonSessionClass());
  appSession = v6->_appSession;
  v6->_appSession = v7;

  objc_storeStrong((id *)&v6->_bundleID, a3);
  -[DASession activate](v6->_appSession, "activate");
  objc_initWeak(&location, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PSAccessoriesPolicyController_initWithAppBundleID___block_invoke;
  v10[3] = &unk_1E4A67D68;
  objc_copyWeak(&v11, &location);
  -[DASession setEventHandler:](v6->_appSession, "setEventHandler:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

void __53__PSAccessoriesPolicyController_initWithAppBundleID___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleSessionEvent:", v3);

}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v27 = v7;
    v28 = v6;
    objc_msgSend(getDADaemonSessionClass(), "getDevicesWithFlags:session:error:", 8, self->_appSession, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "appAccessInfoMap");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "allKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", self->_bundleID);

          if (v18)
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v12);
    }

    objc_storeStrong((id *)&self->_devices, v9);
    if (objc_msgSend(v9, "count"))
    {
      v19 = objc_msgSend(v10, "count");
      v7 = v27;
      v6 = v28;
      if (v19 == 1)
        v20 = (uint64_t)NSClassFromString(CFSTR("ASAccessoryInfoViewController"));
      else
        v20 = objc_opt_class();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, 0, sel_numberOfAccessories_, v20, 2, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProperty:forKey:", v27, CFSTR("bundleID"));
      if (v19 == 1)
      {
        objc_msgSend(v10, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setProperty:forKey:", v22, CFSTR("device"));

      }
      v23 = (void *)MEMORY[0x1E0CEA638];
      PSPreferencesFrameworkBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "imageNamed:inBundle:", CFSTR("Accessory"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
        objc_msgSend(v21, "setProperty:forKey:", v25, CFSTR("iconImage"));

    }
    else
    {
      v21 = 0;
      v7 = v27;
      v6 = v28;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)numberOfAccessories:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_devices;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "appAccessInfoMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", self->_bundleID);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "state");

        if (v12 == 25)
          ++v7;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)handleSessionEvent:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(objc_msgSend(a3, "eventType") - 41) <= 1)
  {
    objc_msgSend(getDADaemonSessionClass(), "getDevicesWithFlags:session:error:", 8, self->_appSession, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_devices, v4);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_devices;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "appAccessInfoMap", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", self->_bundleID);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "state");

          if (v13 == 25)
            ++v8;
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    (*((void (**)(void))self->_accessChangedHandler + 2))();
  }
}

- (id)accessChangedHandler
{
  return self->_accessChangedHandler;
}

- (void)setAccessChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessChangedHandler, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_appSession, 0);
}

@end
