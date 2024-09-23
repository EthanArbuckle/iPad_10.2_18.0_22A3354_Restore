@implementation VGOEMApplicationFinder

void __45__VGOEMApplicationFinder_findOEMApplications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[VGOEMApplicationFinder findOEMApplications]_block_invoke";
      v31 = 1024;
      v32 = 219;
      _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  VGGetOEMApplicationLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VGGetOEMApplicationLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A329000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FindOEMApplications", (const char *)&unk_20A357DD6, buf, 2u);
  }

  if (GEOConfigGetBOOL())
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(WeakRetained, "allowlist", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x20BD23858]();
          objc_msgSend(WeakRetained, "_applicationRecordForBundleIdentifier:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 |= objc_msgSend(WeakRetained, "_addOEMApplicationForApplicationRecordIfNeeded:", v14);

          objc_autoreleasePoolPop(v13);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x20BD23858]();
    objc_msgSend(v6, "nextObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v9 = 0;
      do
      {
        v9 |= objc_msgSend(WeakRetained, "_addOEMApplicationForApplicationRecordIfNeeded:", v18);
        objc_autoreleasePoolPop(v16);
        v16 = (void *)MEMORY[0x20BD23858]();
        objc_msgSend(v6, "nextObject");
        v19 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v19;
      }
      while (v19);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    objc_autoreleasePoolPop(v16);
  }

  VGGetOEMApplicationLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A329000, v21, OS_SIGNPOST_INTERVAL_END, v3, "FindOEMApplications", (const char *)&unk_20A357DD6, buf, 2u);
  }

  if ((v9 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "applications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject OEMAppsUpdated:](v15, "OEMAppsUpdated:", v23);

LABEL_28:
  }

}

- (id)_applicationRecordForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4
    && (!GEOConfigGetBOOL()
     || (-[VGOEMApplicationFinder allowlist](self, "allowlist"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "objectForKeyedSubscript:", v4),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v6,
         v5,
         v6)))
  {
    -[VGOEMApplicationFinder applications](self, "applications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      VGGetOEMApplicationLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_DEBUG, "Won't create an LSAppRecord for bundleId: %@ as we already have this app saved.", buf, 0xCu);
      }
      v10 = 0;
    }
    else
    {
      v14 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v14);
      v9 = v14;
      if (v10)
      {
        v11 = v10;
      }
      else
      {
        VGGetOEMApplicationLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v16 = v4;
          v17 = 2112;
          v18 = v9;
          _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_ERROR, "Failed making LSApplicationRecord for '%@': %@. App is not installed", buf, 0x16u);
        }

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)applications
{
  return self->_applications;
}

- (NSDictionary)allowlist
{
  NSDictionary *allowlist;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  uint64_t v18;
  NSObject *v19;
  VGOEMApplicationFinder *v21;
  NSDictionary *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  allowlist = self->_allowlist;
  if (allowlist)
    return allowlist;
  v21 = self;
  -[VGOEMApplicationFinder _allowlistPayload](self, "_allowlistPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (!v6)
    goto LABEL_16;
  v7 = v6;
  v8 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v5;
        GEOConfigGetString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        GEOConfigGetString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v15, v13);

            v5 = v11;
            goto LABEL_14;
          }
        }

        v5 = v11;
      }
      VGGetOEMApplicationLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v10;
        _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_ERROR, "Encountered a bundle that is malformed: %@", buf, 0xCu);
      }
LABEL_14:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  }
  while (v7);
LABEL_16:

  v16 = v21->_allowlist;
  v21->_allowlist = v22;
  v17 = v22;

  v18 = -[NSDictionary count](v21->_allowlist, "count");
  if (!v18)
  {
    VGGetOEMApplicationLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A329000, v19, OS_LOG_TYPE_ERROR, "Error parsing manifest resource. Not having any allowlisted apps is a grave error.", buf, 2u);
    }

  }
  allowlist = v21->_allowlist;
  return allowlist;
}

- (BOOL)_addOEMApplicationForApplicationRecordIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  VGOEMApplication *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSSet *requiredIntents;
  int v21;
  void *v22;
  __int16 v23;
  NSSet *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VGOEMApplicationFinder applications](self, "applications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD9BE0], "appInfoWithApplicationRecord:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "supportedIntents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[NSSet isSubsetOfSet:](self->_requiredIntents, "isSubsetOfSet:", v10);
      if (v8)
      {
        v11 = -[VGOEMApplication initWithIdentifier:applicationRecord:]([VGOEMApplication alloc], "initWithIdentifier:applicationRecord:", v5, v4);
        -[VGOEMApplicationFinder allowlist](self, "allowlist");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VGOEMApplication setAllowedFormulaIDs:](v11, "setAllowedFormulaIDs:", v13);

        -[VGOEMApplicationFinder disabledAppIdentifiers](self, "disabledAppIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VGOEMApplication setEnabled:](v11, "setEnabled:", objc_msgSend(v14, "containsObject:", v5) ^ 1);

        VGGetOEMApplicationLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v21 = 138412290;
          v22 = v5;
          _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "Added application: %@", (uint8_t *)&v21, 0xCu);
        }

        -[VGOEMApplicationFinder applications](self, "applications");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, v5);

      }
      else
      {
        -[VGOEMApplicationFinder allowlist](self, "allowlist");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
LABEL_12:

          goto LABEL_13;
        }
        VGGetOEMApplicationLog();
        v11 = (VGOEMApplication *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
        {
          requiredIntents = self->_requiredIntents;
          v21 = 138412546;
          v22 = v5;
          v23 = 2112;
          v24 = requiredIntents;
          _os_log_impl(&dword_20A329000, &v11->super, OS_LOG_TYPE_ERROR, "allowlisted application '%@' doesn't support our required intents: %@", (uint8_t *)&v21, 0x16u);
        }
      }

      goto LABEL_12;
    }
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)findOEMApplications
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__VGOEMApplicationFinder_findOEMApplications__block_invoke;
  v4[3] = &unk_24C2FB268;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (VGOEMApplicationFinder)init
{
  VGOEMApplicationFinder *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *applications;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  NSSet *requiredIntents;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VGOEMApplicationFinder;
  v2 = -[VGOEMApplicationFinder init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("VGOEMApplicationFinderQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    applications = v2->_applications;
    v2->_applications = (NSMutableDictionary *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObjects:", v10, v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    requiredIntents = v2->_requiredIntents;
    v2->_requiredIntents = (NSSet *)v13;

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v2);

    _GEOConfigAddDelegateListenerForKey();
  }
  return v2;
}

- (id)_allowlistPayload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = (void *)MEMORY[0x20BD23858](self, a2);
  VGAllowlistPayload();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GEOConfigGetString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = v5;
  }
  else
  {
    VGGetOEMApplicationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "No allowlisted apps. Returning.", v9, 2u);
    }

    v6 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

- (NSSet)disabledAppIdentifiers
{
  NSSet *disabledAppIdentifiers;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  disabledAppIdentifiers = self->_disabledAppIdentifiers;
  if (!disabledAppIdentifiers)
  {
    GEOConfigGetString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_disabledAppIdentifiers;
    self->_disabledAppIdentifiers = v7;

    disabledAppIdentifiers = self->_disabledAppIdentifiers;
  }
  return disabledAppIdentifiers;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *var1;
  void *v4;
  NSObject *queue;
  _QWORD v7[4];
  id v8[3];
  id location;

  var1 = a3.var1;
  v4 = *(void **)&a3.var0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__VGOEMApplicationFinder_valueChangedForGEOConfigKey___block_invoke;
  v7[3] = &unk_24C2FB908;
  objc_copyWeak(v8, &location);
  v8[1] = v4;
  v8[2] = var1;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __54__VGOEMApplicationFinder_valueChangedForGEOConfigKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[VGOEMApplicationFinder valueChangedForGEOConfigKey:]_block_invoke";
      v24 = 1024;
      v25 = 137;
      _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_17;
  }
  if (*(_DWORD *)(a1 + 40) == (_DWORD)VirtualGarageConfig_EVRoutingDisabledApplications
    && *(_QWORD *)(a1 + 48) == (_QWORD)off_253DA4088)
  {
    objc_msgSend(WeakRetained, "setDisabledAppIdentifiers:", 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "applications", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v3, "applications");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "disabledAppIdentifiers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setEnabled:", objc_msgSend(v13, "containsObject:", v10) ^ 1);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applications");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject OEMAppsUpdated:](v14, "OEMAppsUpdated:", v16);

LABEL_17:
  }

}

- (BOOL)_removeOEMApplicationForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VGOEMApplicationFinder applications](self, "applications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    VGGetOEMApplicationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "Removed application: %@", (uint8_t *)&v10, 0xCu);
    }

    -[VGOEMApplicationFinder applications](self, "applications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

  }
  return v6 != 0;
}

- (void)applicationsDidInstall:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VGGetVirtualGarageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__VGOEMApplicationFinder_applicationsDidInstall___block_invoke;
  v10[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __49__VGOEMApplicationFinder_applicationsDidInstall___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[VGOEMApplicationFinder applicationsDidInstall:]_block_invoke";
      v23 = 1024;
      v24 = 266;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_15;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v4)
  {
LABEL_15:

    goto LABEL_16;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      v10 = objc_opt_respondsToSelector();
      if ((v10 & 1) != 0)
      {
        v11 = (void *)MEMORY[0x20BD23858](v10);
        objc_msgSend(v9, "bundleIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_applicationRecordForBundleIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(WeakRetained, "_addOEMApplicationForApplicationRecordIfNeeded:", v13);

        objc_autoreleasePoolPop(v11);
      }
    }
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v5);

  if ((v6 & 1) != 0)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 3);
    objc_msgSend(WeakRetained, "applications");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject OEMAppsUpdated:](v3, "OEMAppsUpdated:", v15);

    goto LABEL_15;
  }
LABEL_16:

}

- (void)applicationsDidUninstall:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VGGetVirtualGarageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__VGOEMApplicationFinder_applicationsDidUninstall___block_invoke;
  v10[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __51__VGOEMApplicationFinder_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[VGOEMApplicationFinder applicationsDidUninstall:]_block_invoke";
      v22 = 1024;
      v23 = 291;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_15;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v4)
  {
LABEL_15:

    goto LABEL_16;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      v10 = objc_opt_respondsToSelector();
      if ((v10 & 1) != 0)
      {
        v11 = (void *)MEMORY[0x20BD23858](v10);
        objc_msgSend(v9, "bundleIdentifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(WeakRetained, "_removeOEMApplicationForBundleIdentifier:", v12);

        objc_autoreleasePoolPop(v11);
      }
    }
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v5);

  if ((v6 & 1) != 0)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 3);
    objc_msgSend(WeakRetained, "applications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject OEMAppsUpdated:](v3, "OEMAppsUpdated:", v14);

    goto LABEL_15;
  }
LABEL_16:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  GEOConfigRemoveDelegateListenerForAllKeys();
  v4.receiver = self;
  v4.super_class = (Class)VGOEMApplicationFinder;
  -[VGOEMApplicationFinder dealloc](&v4, sel_dealloc);
}

- (VGOEMApplicationFinderUpdates)delegate
{
  return (VGOEMApplicationFinderUpdates *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDisabledAppIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_disabledAppIdentifiers, a3);
}

- (void)setAllowlist:(id)a3
{
  objc_storeStrong((id *)&self->_allowlist, a3);
}

- (void)setApplications:(id)a3
{
  objc_storeStrong((id *)&self->_applications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_allowlist, 0);
  objc_storeStrong((id *)&self->_disabledAppIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requiredIntents, 0);
}

@end
