@implementation WFIntentActionProvider

- (WFIntentActionProvider)init
{
  return -[WFIntentActionProvider initWithOptions:](self, "initWithOptions:", 0);
}

- (WFIntentActionProvider)initWithOptions:(unint64_t)a3
{
  WFIntentActionProvider *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  WFIntentActionProvider *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFIntentActionProvider;
  v4 = -[WFIntentActionProvider init](&v11, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.intentsactionprovider", v5, v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v4->_options = a3;
    v9 = v4;

  }
  return v4;
}

- (id)createAllAvailableActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];

  -[WFIntentActionProvider observeInstalledApplicationsChangesIfNeeded](self, "observeInstalledApplicationsChangesIfNeeded");
  v3 = (void *)objc_opt_new();
  -[WFIntentActionProvider schemasByBundleIdentifier](self, "schemasByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__WFIntentActionProvider_createAllAvailableActions__block_invoke;
    v12[3] = &unk_1E7AF55D0;
    v12[4] = v4;
    v12[5] = self;
    v12[6] = v3;
    objc_msgSend(v5, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v8, v12);

    if (-[WFIntentActionProvider shouldConsiderSystemIntents](self, "shouldConsiderSystemIntents"))
    {
      -[WFIntentActionProvider cachedSystemIntentActions](self, "cachedSystemIntentActions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionSet:", v9);

    }
    v10 = v3;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)availableActionIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];

  v3 = (void *)objc_opt_new();
  -[WFIntentActionProvider schemasByBundleIdentifier](self, "schemasByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__WFIntentActionProvider_availableActionIdentifiers__block_invoke;
  v9[3] = &unk_1E7AF55A8;
  v9[4] = v3;
  v9[5] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (-[WFIntentActionProvider shouldConsiderSystemIntents](self, "shouldConsiderSystemIntents"))
  {
    -[WFIntentActionProvider cachedSystemIntentActions](self, "cachedSystemIntentActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_49311);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "unionSet:", v6);
  }
  v7 = v3;

  return v7;
}

- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke;
  v4[3] = &unk_1E7AF5668;
  v4[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4, a4);
}

- (id)createActionsForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__WFIntentActionProvider_createActionsForBundleIdentifier___block_invoke;
  v13[3] = &unk_1E7AF55D0;
  v13[4] = self;
  v14 = v4;
  v8 = v5;
  v15 = v8;
  v9 = v4;
  objc_msgSend(v6, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v7, v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

- (id)schemasByBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[WFIntentActionProvider cachedSchemasByBundleIdentifier](self, "cachedSchemasByBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableSchemasWithError:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFIntentActionProvider setCachedSchemasByBundleIdentifier:](self, "setCachedSchemasByBundleIdentifier:", v5);

  }
  return -[WFIntentActionProvider cachedSchemasByBundleIdentifier](self, "cachedSchemasByBundleIdentifier");
}

- (id)schemaForBundleIdentifier:(id)a3 ignoreCache:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (a4
    || (-[WFIntentActionProvider cachedSchemasByBundleIdentifier](self, "cachedSchemasByBundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadSchemasForBundleIdentifiers:error:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFIntentActionProvider cachedSchemasByBundleIdentifier](self, "cachedSchemasByBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSSet)cachedSystemIntentActions
{
  NSSet *v3;
  NSSet *cachedSystemIntentActions;

  if (!self->_cachedSystemIntentActions
    && -[WFIntentActionProvider shouldConsiderSystemIntents](self, "shouldConsiderSystemIntents"))
  {
    WFLoadAllSystemIntentActions(self);
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    cachedSystemIntentActions = self->_cachedSystemIntentActions;
    self->_cachedSystemIntentActions = v3;

  }
  return self->_cachedSystemIntentActions;
}

- (BOOL)shouldConsiderSystemIntents
{
  return self->_options & 1;
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 schema:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = (id)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v7, "_classNamesForClass:", objc_opt_class());
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WFIntentActionProvider shouldCreateActionForIntentClassName:actionIdentifier:bundleIdentifier:inSchema:](self, "shouldCreateActionForIntentClassName:actionIdentifier:bundleIdentifier:inSchema:", v12, v13, v6, v7))
        {
          objc_msgSend(v15, "addObject:", v13);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v15;
}

- (id)actionIdentifiersRequiringBundledActionProviderMappedByApp
{
  if (actionIdentifiersRequiringBundledActionProviderMappedByApp_onceToken != -1)
    dispatch_once(&actionIdentifiersRequiringBundledActionProviderMappedByApp_onceToken, &__block_literal_global_136);
  return (id)actionIdentifiersRequiringBundledActionProviderMappedByApp_map;
}

- (id)actionIdentifiersRequiringBundledActionProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WFIntentActionProvider_actionIdentifiersRequiringBundledActionProvider__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  if (actionIdentifiersRequiringBundledActionProvider_onceToken != -1)
    dispatch_once(&actionIdentifiersRequiringBundledActionProvider_onceToken, block);
  return (id)actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider;
}

- (BOOL)shouldCreateActionForIntentClassName:(id)a3 actionIdentifier:(id)a4 bundleIdentifier:(id)a5 inSchema:(id)a6
{
  NSString *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  char v26;

  v10 = (NSString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobilemail.MSGetMailIntent")) & 1) != 0)
    goto LABEL_8;
  if (!objc_msgSend(v11, "hasSuffix:", CFSTR("Intent")))
    goto LABEL_8;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.WorkflowKit.ShortcutsIntents")) & 1) != 0)
    goto LABEL_8;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.ActionKit.BundledIntentHandler")) & 1) != 0)
    goto LABEL_8;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.shortcuts")) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHidden");

  if ((v15 & 1) != 0
    || (-[WFIntentActionProvider actionIdentifiersRequiringBundledActionProvider](self, "actionIdentifiersRequiringBundledActionProvider"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v17 = objc_msgSend(v16, "containsObject:", v11), v16, (v17 & 1) != 0))
  {
LABEL_8:
    v18 = 0;
  }
  else if (v13)
  {
    objc_msgSend(v13, "intentCodableDescriptionWithIntentClassName:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_parameterCombinationsForClassName:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resolvableParameterCombinationsWithParameterCombinations:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    NSClassFromString(v10);
    INIntentSchemaGetIntentDescriptionWithFacadeClass();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v20, "isConfigurable");
    if (v23)
      v26 = 1;
    else
      v26 = v25;
    if (v24)
      v18 = 0;
    else
      v18 = v26;

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (void)observeInstalledApplicationsChangesIfNeeded
{
  id v3;

  if (!-[WFIntentActionProvider isObservingInstalledApplicationsChanges](self, "isObservingInstalledApplicationsChanges"))
  {
    -[WFIntentActionProvider setObservingInstalledApplicationsChanges:](self, "setObservingInstalledApplicationsChanges:", 1);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  }
}

- (void)installedApplicationsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFIntentActionProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__WFIntentActionProvider_installedApplicationsDidChange___block_invoke;
  v7[3] = &unk_1E7AF92C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleApplicationDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  NSObject *obj;
  uint64_t v31;
  WFIntentActionProvider *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  NSObject *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFIntentActionProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("bundleIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFActionRegistryLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[WFIntentActionProvider handleApplicationDidChangeNotification:]";
      v43 = 2114;
      v44 = v8;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_INFO, "%s Installed applications changed: %{public}@", buf, 0x16u);
    }

    -[WFIntentActionProvider cachedSchemasByBundleIdentifier](self, "cachedSchemasByBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");

    v36 = (void *)v11;
    if (v11)
    {
      v29 = v4;
      v34 = (void *)objc_opt_new();
      v33 = (void *)objc_opt_new();
      v35 = objc_opt_new();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v28 = v8;
      obj = v8;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v12)
      {
        v13 = v12;
        v31 = *(_QWORD *)v38;
        v32 = self;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            v16 = (void *)objc_opt_new();
            objc_msgSend(v36, "objectForKey:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[WFIntentActionProvider actionIdentifiersForBundleIdentifier:schema:](self, "actionIdentifiersForBundleIdentifier:schema:", v15, v17);
              v18 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v18;
            }
            -[WFIntentActionProvider schemaForBundleIdentifier:ignoreCache:](self, "schemaForBundleIdentifier:ignoreCache:", v15, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_opt_new();
            if (v19)
            {
              -[WFIntentActionProvider actionIdentifiersForBundleIdentifier:schema:](self, "actionIdentifiersForBundleIdentifier:schema:", v15, v19);
              v21 = objc_claimAutoreleasedReturnValue();

              v20 = (void *)v21;
            }
            v22 = (void *)objc_msgSend(v16, "mutableCopy");
            objc_msgSend(v22, "minusSet:", v20);
            v23 = (void *)objc_msgSend(v20, "mutableCopy");
            objc_msgSend(v23, "minusSet:", v16);
            v24 = (void *)objc_msgSend(v20, "mutableCopy");
            objc_msgSend(v24, "intersectSet:", v16);
            objc_msgSend(v34, "unionSet:", v22);
            objc_msgSend(v33, "unionSet:", v23);
            -[NSObject unionSet:](v35, "unionSet:", v24);
            objc_msgSend(v36, "setValue:forKey:", v19, v15);

            self = v32;
          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        }
        while (v13);
      }

      -[WFIntentActionProvider setCachedSchemasByBundleIdentifier:](self, "setCachedSchemasByBundleIdentifier:", v36);
      getWFActionRegistryLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v42 = "-[WFIntentActionProvider handleApplicationDidChangeNotification:]";
        v43 = 2114;
        v44 = v35;
        v45 = 2114;
        v46 = v33;
        v47 = 2114;
        v48 = v34;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_INFO, "%s Updated: %{public}@, Added: %{public}@, Removed: %{public}@", buf, 0x2Au);
      }

      v8 = v28;
      v4 = v29;
      if (objc_msgSend(v34, "count") || objc_msgSend(v33, "count") || -[NSObject count](v35, "count"))
      {
        -[WFActionProvider delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "actionProviderDidChange:updatedActions:removedActions:addedActions:", self, v35, v34, v33);

      }
    }

    v27 = v8;
  }
  else
  {

    getWFActionRegistryLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[WFIntentActionProvider handleApplicationDidChangeNotification:]";
      _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, "%s Got an application did change notification, but couldn't extract bundle identifiers out of it", buf, 0xCu);
    }
  }

}

- (BOOL)isObservingInstalledApplicationsChanges
{
  return self->_observingInstalledApplicationsChanges;
}

- (void)setObservingInstalledApplicationsChanges:(BOOL)a3
{
  self->_observingInstalledApplicationsChanges = a3;
}

- (NSDictionary)cachedSchemasByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedSchemasByBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setCachedSystemIntentActions:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSystemIntentActions, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedSystemIntentActions, 0);
  objc_storeStrong((id *)&self->_cachedSchemasByBundleIdentifier, 0);
}

uint64_t __57__WFIntentActionProvider_installedApplicationsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleApplicationDidChangeNotification:", *(_QWORD *)(a1 + 40));
}

void __73__WFIntentActionProvider_actionIdentifiersRequiringBundledActionProvider__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_new();
  v3 = (void *)actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider;
  actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider = v2;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifiersRequiringBundledActionProviderMappedByApp", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider;
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

void __84__WFIntentActionProvider_actionIdentifiersRequiringBundledActionProviderMappedByApp__block_invoke()
{
  void *v0;

  v0 = (void *)actionIdentifiersRequiringBundledActionProviderMappedByApp_map;
  actionIdentifiersRequiringBundledActionProviderMappedByApp_map = (uint64_t)&unk_1E7B8DF90;

}

void __59__WFIntentActionProvider_createActionsForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WFHandleCustomIntentAction *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  WFHandleCustomIntentAction *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "schemaForBundleIdentifier:ignoreCache:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v2, "_classNamesForClass:", objc_opt_class());
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    v6 = 0x1E0CB3000uLL;
    v18 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v19 = v4;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BB3598]();
        objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 40), v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "shouldCreateActionForIntentClassName:actionIdentifier:bundleIdentifier:inSchema:", v8, v10, *(_QWORD *)(a1 + 40), v2))
        {
          v11 = [WFHandleCustomIntentAction alloc];
          objc_msgSend(*(id *)(a1 + 32), "defaultActionDefinition");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v2;
          v14 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "stringLocalizer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v14;
          v2 = v13;
          v16 = -[WFHandleCustomIntentAction initWithIdentifier:definition:serializedParameters:schema:intent:className:bundleIdentifier:stringLocalizer:](v11, "initWithIdentifier:definition:serializedParameters:schema:intent:className:bundleIdentifier:stringLocalizer:", v10, v12, 0, v13, 0, v8, v17, v15);

          if (v16)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);

          v5 = v18;
          v4 = v19;
          v6 = 0x1E0CB3000;
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

}

void __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  id v41;
  void *v42;
  void *v44;
  _QWORD v45[6];
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  objc_msgSend(v41, "actionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v42;
  if ((unint64_t)objc_msgSend(v42, "count") >= 2)
  {
    objc_msgSend(v42, "subarrayWithRange:", 0, objc_msgSend(v42, "count") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "lastObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "shouldConsiderSystemIntents")
      && (WFSupportedSystemIntentClasses(),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "containsObject:", v44),
          v5,
          v6)
      && (WFGetSystemIntentActionForBundleIdentifierAndIntentClassName(v39, v44, *(void **)(a1 + 32)),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v41, "setResult:", v7);

    }
    else if (objc_msgSend(v44, "hasSuffix:", CFSTR("Intent")))
    {
      objc_msgSend(v41, "serializedParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }
      v10 = v9;

      v37 = v10;
      objc_msgSend(v10, "objectForKey:", CFSTR("AppIntentDescriptor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(v41, "serializedParameters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("SerializedIntentDescriptor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithSerializedRepresentation:", v36);
        }
        else
        {

          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD980]), "initWithIntentClassName:launchableAppBundleId:", v44, v39);
          v36 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resolvedIntentMatchingDescriptor:", v13);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)objc_opt_new();
        objc_msgSend(v38, "extensionBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v38, "extensionBundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v17);

        }
        objc_msgSend(v38, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v38, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v19);

        }
        objc_msgSend(v38, "intentClassName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        if (v21)
        {
          objc_msgSend(v38, "intentClassName");
          v22 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v22;
        }
        objc_msgSend(v15, "addObject:", v39);
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = v15;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        if (!v23)
        {

          v26 = 0;
          v24 = 0;
          goto LABEL_40;
        }
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v27 = *(_QWORD *)v57;
LABEL_25:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v57 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v28);
          objc_msgSend(*(id *)(a1 + 32), "schemaForBundleIdentifier:ignoreCache:", v29, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = v30;
          if (objc_msgSend(*(id *)(a1 + 32), "shouldCreateActionForIntentClassName:actionIdentifier:bundleIdentifier:inSchema:", v44, v2, v29, v30))
          {
            if (v30)
            {
              v31 = v29;

              v24 = v31;
              goto LABEL_38;
            }
            if (!v24)
              v24 = v29;
            v25 = 1;
          }
          if (v23 == ++v28)
          {
            v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
            if (v23)
              goto LABEL_25;

            if ((v25 & 1) == 0)
            {
LABEL_40:

              break;
            }
LABEL_38:
            v50 = 0;
            v51 = &v50;
            v52 = 0x3032000000;
            v53 = __Block_byref_object_copy__49306;
            v54 = __Block_byref_object_dispose__49307;
            v55 = 0;
            objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke_125;
            v45[3] = &unk_1E7AF5640;
            v49 = &v50;
            v34 = *(_QWORD *)(a1 + 32);
            v45[4] = v2;
            v45[5] = v34;
            v35 = v41;
            v46 = v35;
            v26 = v30;
            v47 = v26;
            v48 = v38;
            objc_msgSend(v32, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v33, v45);

            objc_msgSend(v35, "setResult:", v51[5]);
            _Block_object_dispose(&v50, 8);

            goto LABEL_40;
          }
        }
      }

    }
    v3 = v42;
  }

}

void __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke_125(uint64_t a1)
{
  WFHandleCustomIntentAction *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = [WFHandleCustomIntentAction alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaultActionDefinition");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "serializedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "stringLocalizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFHandleCustomIntentAction initWithIdentifier:definition:serializedParameters:schema:intent:resolvedIntentDescriptor:stringLocalizer:](v2, "initWithIdentifier:definition:serializedParameters:schema:intent:resolvedIntentDescriptor:stringLocalizer:", v3, v11, v4, v5, 0, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __52__WFIntentActionProvider_availableActionIdentifiers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actionIdentifiersForBundleIdentifier:schema:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

}

uint64_t __52__WFIntentActionProvider_availableActionIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __51__WFIntentActionProvider_createAllAvailableActions__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__WFIntentActionProvider_createAllAvailableActions__block_invoke_2;
  v3[3] = &unk_1E7AF55A8;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __51__WFIntentActionProvider_createAllAvailableActions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  WFHandleCustomIntentAction *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  WFHandleCustomIntentAction *v18;
  WFHandleCustomIntentAction *v19;
  id obj;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v5 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "_classNamesForClass:", objc_opt_class());
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v21)
  {
    v6 = *(_QWORD *)v24;
    v7 = 0x1E0CB3000uLL;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BB3598]();
        objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("%@.%@"), v22, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "shouldCreateActionForIntentClassName:actionIdentifier:bundleIdentifier:inSchema:", v9, v11, v22, v5))
        {
          v12 = v6;
          v13 = v5;
          v14 = [WFHandleCustomIntentAction alloc];
          objc_msgSend(*(id *)(a1 + 32), "defaultActionDefinition");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "stringLocalizer");
          v16 = a1;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v14;
          v5 = v13;
          v19 = -[WFHandleCustomIntentAction initWithIdentifier:definition:serializedParameters:schema:intent:className:bundleIdentifier:stringLocalizer:](v18, "initWithIdentifier:definition:serializedParameters:schema:intent:className:bundleIdentifier:stringLocalizer:", v11, v15, 0, v13, 0, v9, v22, v17);

          a1 = v16;
          if (v19)
            objc_msgSend(*(id *)(v16 + 40), "addObject:", v19);

          v6 = v12;
          v7 = 0x1E0CB3000;
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v21 != v8);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v21);
  }

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    WFDisableAppTrustChecking();
}

+ (id)disabledPlatformsForIntentWithTypeName:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  const __CFString **v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("sirikit.intents.custom.com.apple.mobilecal.EKUICreateEventIntent"))
    goto LABEL_6;
  if (!v3)
  {
LABEL_14:
    v10 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_15;
  }
  v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("sirikit.intents.custom.com.apple.mobilecal.EKUICreateEventIntent"));

  if ((v5 & 1) == 0)
  {
    v6 = v4;
    if (v6 != CFSTR("sirikit.intents.custom.com.apple.mobilesafari.OpenURLsIntent"))
    {
      v7 = v6;
      v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("sirikit.intents.custom.com.apple.mobilesafari.OpenURLsIntent"));

      if (!v8)
      {
        v11 = v7;
        if (v11 == CFSTR("sirikit.intents.custom.com.apple.weather.WeatherIntent")
          || (v12 = v11,
              v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("sirikit.intents.custom.com.apple.weather.WeatherIntent")), v12, v13))
        {
          v19 = CFSTR("Watch");
          v9 = &v19;
          goto LABEL_7;
        }
        v14 = v12;
        if (v14 == CFSTR("sirikit.intent.payments.SendPaymentIntent")
          || (v15 = v14,
              v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("sirikit.intent.payments.SendPaymentIntent")), v15, v16))
        {
          v18 = CFSTR("Desktop");
          v9 = &v18;
          goto LABEL_7;
        }
        goto LABEL_14;
      }
    }
  }
LABEL_6:
  v20 = CFSTR("Watch");
  v9 = &v20;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v10;
}

@end
