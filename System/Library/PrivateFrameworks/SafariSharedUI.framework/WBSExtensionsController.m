@implementation WBSExtensionsController

- (NSString)profileServerID
{
  return self->_profileServerID;
}

- (id)extensionDataForExtension:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *extensionUniqueIdentifierToExtensionDataMap;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (!self->_extensionUniqueIdentifierToExtensionDataMap)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      extensionUniqueIdentifierToExtensionDataMap = self->_extensionUniqueIdentifierToExtensionDataMap;
      self->_extensionUniqueIdentifierToExtensionDataMap = v5;

    }
    objc_msgSend(v4, "sf_uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_extensionUniqueIdentifierToExtensionDataMap, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_extensionDataClass")), "initWithExtension:extensionsController:", v4, self);
        if (v8)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extensionUniqueIdentifierToExtensionDataMap, "setObject:forKeyedSubscript:", v8, v7);
        }
        else
        {
          v10 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = 138412290;
            v13 = v11;
            _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Extension with identifier %@ failed to initialize", (uint8_t *)&v12, 0xCu);

          }
          -[WBSExtensionsController _disableAndBlockExtension:](self, "_disableAndBlockExtension:", v4);
          v8 = 0;
        }
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)extensionWithComposedIdentifier:(id)a3
{
  id v4;
  NSArray *allDiscoveredExtensions;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    allDiscoveredExtensions = self->_allDiscoveredExtensions;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__WBSExtensionsController_extensionWithComposedIdentifier___block_invoke;
    v8[3] = &unk_1E54427A8;
    v8[4] = self;
    v9 = v4;
    -[NSArray safari_firstObjectPassingTest:](allDiscoveredExtensions, "safari_firstObjectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)enabledExtensions
{
  return (NSArray *)-[NSMutableSet allObjects](self->_enabledExtensions, "allObjects");
}

- (NSMutableArray)extensions
{
  return self->_extensions;
}

- (WKUserContentController)userContentController
{
  return self->_userContentController;
}

- (BOOL)hasDiscoveredExtensions
{
  return self->_hasDiscoveredExtensions;
}

uint64_t __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (WBSExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4
{
  id v6;
  id v7;
  WBSExtensionsController *v8;
  uint64_t v9;
  NSString *profileServerID;
  WBSExtensionsController *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[WBSExtensionsController init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    profileServerID = v8->_profileServerID;
    v8->_profileServerID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_userContentController, a4);
    v11 = v8;
  }

  return v8;
}

- (WBSExtensionsController)init
{
  WBSExtensionsController *v2;
  uint64_t v3;
  NSPointerArray *observers;
  void *v5;
  WBSExtensionsAnalyticsEventCoalescer *v6;
  WBSExtensionsAnalyticsEventCoalescer *analyticsEventCoalescer;
  uint64_t v8;
  NSMutableSet *enabledExtensions;
  uint64_t v10;
  NSMutableArray *extensions;
  WBSExtensionsController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WBSExtensionsController;
  v2 = -[WBSExtensionsController init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__extensionsWereGloballyEnabled, *MEMORY[0x1E0D8A398], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__extensionsWereGloballyDisabled, *MEMORY[0x1E0D8A390], 0);
    v6 = objc_alloc_init(WBSExtensionsAnalyticsEventCoalescer);
    analyticsEventCoalescer = v2->_analyticsEventCoalescer;
    v2->_analyticsEventCoalescer = v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    enabledExtensions = v2->_enabledExtensions;
    v2->_enabledExtensions = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v10;

    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__managedExtensionStateDidChange, *MEMORY[0x1E0D8A450], 0);
    v12 = v2;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

uint64_t __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)composedIdentifierForExtensionStateForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _developerIdentifierForExtension:](self, "_developerIdentifierForExtension:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_composedIdentifierForStateOfExtensionWithBundleIdentifier:developerIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_developerIdentifierForExtension:(id)a3
{
  -[WBSExtensionsController _developerIdentifierForExtension:untrustedCodeSigningDictionary:](self, "_developerIdentifierForExtension:untrustedCodeSigningDictionary:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);
  if (!v3)

}

void __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadExtensions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "extensionsControllerExtensionListDidChange:", *(_QWORD *)(a1 + 32), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversContentBlockerListDidChange");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;

}

- (void)_loadExtensions:(id)a3
{
  -[WBSExtensionsController _loadExtensions:skipEqualityCheck:](self, "_loadExtensions:skipEqualityCheck:", a3, 0);
}

- (BOOL)loadEnabledExtensionsWasCalled
{
  return self->_loadEnabledExtensionsWasCalled;
}

- (void)loadEnabledExtensions
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *extensionIdentifierToStateMap;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[WBSExtensionsController extensionsEnabled](self, "extensionsEnabled") && !self->_loadEnabledExtensionsWasCalled)
  {
    self->_loadEnabledExtensionsWasCalled = 1;
    if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", self->_profileServerID)&& (objc_msgSend((id)objc_opt_class(), "_extensionDefaults"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend((id)objc_opt_class(), "_skipLoadingEnabledExtensionsAtLaunchPreferenceKey"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v3, "BOOLForKey:", v4), v4, v3, v5))
    {
      v6 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A840B000, v6, OS_LOG_TYPE_INFO, "Skipping loading enabled extensions at launch because there aren't any", buf, 2u);
      }
    }
    else
    {
      -[WBSExtensionsController readExtensionsStateFromStorage](self, "readExtensionsStateFromStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
      extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
      self->_extensionIdentifierToStateMap = v8;

      if (self->_extensionIdentifierToStateMap)
      {
        -[WBSExtensionsController disableUnsignedExtensionsIfNecessary](self, "disableUnsignedExtensionsIfNecessary");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v12 = self->_extensionIdentifierToStateMap;
        v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v12);
              v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend((id)objc_opt_class(), "_extensionFromComposedIdentifier:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v11, "addObject:", v17);
              else
                objc_msgSend(v10, "addObject:", v16);

            }
            v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
          }
          while (v13);
        }

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v18 = v10;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v25 != v20)
                objc_enumerationMutation(v18);
              v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
              v23 = WBS_LOG_CHANNEL_PREFIXExtensions();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                v33 = v22;
                _os_log_impl(&dword_1A840B000, v23, OS_LOG_TYPE_INFO, "Extension with composed identifier %{private}@ was removed", buf, 0xCu);
              }
              -[WBSExtensionsController _updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:](self, "_updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:", v22);
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v19);
        }

        -[WBSExtensionsController _deleteStateForRemovedExtensionsSoon](self, "_deleteStateForRemovedExtensionsSoon");
        self->_loadingEnabledExtensionsAtStartup = 1;
        -[WBSExtensionsController _loadExtensions:](self, "_loadExtensions:", v11);
        self->_loadingEnabledExtensionsAtStartup = 0;

      }
    }
  }
}

- (void)_beginExtensionDiscovery
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _EXQueryController *v8;
  _EXQueryController *extensionKitQueryController;
  NSObject *v10;
  _QWORD block[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!self->_extensionMatchingContext
    && -[WBSExtensionsController _supportsExtensionDiscovery](self, "_supportsExtensionDiscovery")
    && !self->_extensionKitQueryController)
  {
    v3 = objc_alloc(MEMORY[0x1E0CAA560]);
    objc_msgSend((id)objc_opt_class(), "_extensionPointIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithExtensionPointIdentifier:", v4);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setExcludeLockedApps:", 1);
    v6 = objc_alloc(MEMORY[0x1E0CAA568]);
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_EXQueryController *)objc_msgSend(v6, "initWithQueries:delegate:", v7, self);
    extensionKitQueryController = self->_extensionKitQueryController;
    self->_extensionKitQueryController = v8;

    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__WBSExtensionsController__beginExtensionDiscovery__block_invoke;
    block[3] = &unk_1E54425B0;
    block[4] = self;
    dispatch_async(v10, block);

  }
}

- (void)findExtensions
{
  if (-[WBSExtensionsController extensionsEnabled](self, "extensionsEnabled"))
  {
    if (-[WBSExtensionsController _supportsExtensionDiscovery](self, "_supportsExtensionDiscovery"))
      -[WBSExtensionsController _beginExtensionDiscovery](self, "_beginExtensionDiscovery");
    else
      -[WBSExtensionsController _populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile](self, "_populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile");
  }
}

- (BOOL)_supportsExtensionDiscovery
{
  return +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", self->_profileServerID);
}

- (void)_finishedLoadingExtensions
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", self->_profileServerID))
  {
    objc_msgSend((id)objc_opt_class(), "_extensionDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_skipLoadingEnabledExtensionsAtLaunchPreferenceKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = -[WBSExtensionsController hasAnyEnabledExtensionsInStorage](self, "hasAnyEnabledExtensionsInStorage");
        v8 = CFSTR("YES");
        if (v7)
          v8 = CFSTR("NO");
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_1A840B000, v6, OS_LOG_TYPE_INFO, "Setting SkipLoadingEnabledExtensionsAtLaunch key to %@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "_extensionDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WBSExtensionsController hasAnyEnabledExtensionsInStorage](self, "hasAnyEnabledExtensionsInStorage");
      objc_msgSend((id)objc_opt_class(), "_skipLoadingEnabledExtensionsAtLaunchPreferenceKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBool:forKey:", !v10, v11);

    }
  }
}

- (void)_beginMatchingExtensionsWithAttributesCompletedWithMatchingExtensions:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *allDiscoveredExtensions;
  id v7;

  v4 = a3;
  self->_hasDiscoveredExtensions = 1;
  v7 = v4;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  self->_allDiscoveredExtensions = v5;

  self->_hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce = 1;
  if (self->_loadEnabledExtensionsWasCalled || self->_forceExtensionLoadingAfterDiscovery)
    -[WBSExtensionsController loadSuitableDiscoveredExtensions](self, "loadSuitableDiscoveredExtensions");

}

- (void)loadSuitableDiscoveredExtensions
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  _QWORD v9[5];

  if (-[WBSExtensionsController extensionsEnabled](self, "extensionsEnabled") && !self->_loadingDiscoveredExtensions)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_loadingDiscoveredExtensions = 1;
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke;
    v9[3] = &unk_1E54425B0;
    v9[4] = self;
    v4 = MEMORY[0x1A85D45E4](v9);
    v5 = (void *)v4;
    if (self->_extensionIdentifierToStateMap)
    {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }
    else
    {
      dispatch_get_global_queue(25, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_2;
      block[3] = &unk_1E5441BC8;
      block[4] = self;
      v8 = v5;
      dispatch_async(v6, block);

    }
  }
}

void __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "readExtensionsStateFromStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WBSExtensionsController_loadSuitableDiscoveredExtensions__block_invoke_3;
  block[3] = &unk_1E5441AD8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)readExtensionsStateFromStorage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[WBSExtensionsController _urlForExtensionSettings](self, "_urlForExtensionSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__2;
    v27 = __Block_byref_object_dispose__2;
    v3 = MEMORY[0x1E0C809B0];
    v28 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke;
    v22[3] = &unk_1E54426B8;
    v22[4] = &v23;
    v4 = (void *)MEMORY[0x1A85D45E4](v22);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    v21 = 0;
    v19[0] = v3;
    v19[1] = 3221225472;
    v19[2] = __57__WBSExtensionsController_readExtensionsStateFromStorage__block_invoke_2;
    v19[3] = &unk_1E5442690;
    v6 = v4;
    v20 = v6;
    objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", v2, 1, &v21, v19);
    v7 = v21;
    if (v7)
    {
      v8 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSExtensionsController readExtensionsStateFromStorage].cold.2();
      }

      v9 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v9 = (id)v24[5];
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __51__WBSExtensionsController__beginExtensionDiscovery__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "resume");
}

- (WBSExtensionsController)initWithProfileServerID:(id)a3 userContentController:(id)a4 forceExtensionLoadingAfterDiscovery:(BOOL)a5
{
  WBSExtensionsController *v6;
  WBSExtensionsController *v7;
  WBSExtensionsController *v8;

  v6 = -[WBSExtensionsController initWithProfileServerID:userContentController:](self, "initWithProfileServerID:userContentController:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_forceExtensionLoadingAfterDiscovery = a5;
    v8 = v6;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSExtensionsController;
  -[WBSExtensionsController dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[NSPointerArray addPointer:](self->_observers, "addPointer:");
  -[NSPointerArray compact](self->_observers, "compact");
  if (-[NSPointerArray count](self->_observers, "count") == 1)
    -[WBSExtensionsController _beginExtensionDiscovery](self, "_beginExtensionDiscovery");
  if (self->_extensions)
    objc_msgSend(v4, "extensionsControllerExtensionListDidChange:", self);

}

- (void)removeObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[NSPointerArray compact](self->_observers, "compact");
  -[NSPointerArray allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v6);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v5);
  -[NSPointerArray compact](self->_observers, "compact");
  if (!-[NSPointerArray count](self->_observers, "count"))
    -[WBSExtensionsController _endExtensionDiscovery](self, "_endExtensionDiscovery");

}

- (BOOL)_supportsCodeSigningChecks
{
  return +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", self->_profileServerID);
}

- (id)_extensionsControllerForDefaultProfile
{
  void *v2;
  void *v3;

  -[WBSExtensionsController allProfileExtensionsControllers](self, "allProfileExtensionsControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_firstObjectPassingTest:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __65__WBSExtensionsController__extensionsControllerForDefaultProfile__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "profileServerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v2);

  return v3;
}

- (void)_populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __102__WBSExtensionsController__populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile__block_invoke;
  v2[3] = &unk_1E5442588;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __102__WBSExtensionsController__populateAllExtensionsIfNecessaryUsingExtensionsControllerForDefaultProfile__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[147])
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_extensionsControllerForDefaultProfile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce"))
    {
      objc_msgSend(v2, "allDiscoveredExtensions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_beginMatchingExtensionsWithAttributesCompletedWithMatchingExtensions:", v3);

    }
    WeakRetained = v4;
  }

}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[5];

  v5 = a3;
  objc_msgSend(v5, "extensionIdentities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke;
  v12[3] = &unk_1E54425D8;
  v12[4] = self;
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_25);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke_3;
  block[3] = &unk_1E54413C0;
  block[4] = self;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

id __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentity:error:", a2, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __69__WBSExtensionsController_queryControllerDidUpdate_resultDifference___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extensionDiscoveryHasNewResults:", *(_QWORD *)(a1 + 40));
}

- (void)_extensionDiscoveryHasNewResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Discovered these extensions: %@", buf, 0xCu);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WBSExtensionsController allProfileExtensionsControllers](self, "allProfileExtensionsControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_beginMatchingExtensionsWithAttributesCompletedWithMatchingExtensions:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend((id)objc_opt_class(), "_didDiscoverExtensions:", objc_msgSend(v4, "count") != 0);
}

- (void)_endExtensionDiscovery
{
  _EXQueryController *extensionKitQueryController;
  _EXQueryController *v4;

  extensionKitQueryController = self->_extensionKitQueryController;
  if (extensionKitQueryController)
  {
    -[_EXQueryController suspend](extensionKitQueryController, "suspend");
    v4 = self->_extensionKitQueryController;
    self->_extensionKitQueryController = 0;

  }
}

+ (id)_extensionDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

- (id)lastSeenBaseURIForExtension:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LastSeenBaseURI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)lastSeenBaseURIForExtension:(id)a3 updatingWithCurrentBaseURI:(id)a4
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

  v6 = a3;
  v7 = a4;
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LastSeenBaseURI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("LastSeenBaseURI"));

  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:", v9, v14);

  return v12;
}

- (void)moveLocalStorageForExtension:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[WBSExtensionsController extensionDataForExtension:](self, "extensionDataForExtension:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safariExtensionBaseURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController lastSeenBaseURIForExtension:updatingWithCurrentBaseURI:](self, "lastSeenBaseURIForExtension:updatingWithCurrentBaseURI:", v15, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "host"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "host"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v11, "isEqualToString:", v12),
        v12,
        v11,
        !v13))
  {
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CEF7C0], *MEMORY[0x1E0CEF7C8], 0);
      -[WBSExtensionsController moveLocalStorageForExtension:completionHandler:]::dataTypes = objc_claimAutoreleasedReturnValue();
    }
    -[WBSExtensionsController websiteDataStore](self, "websiteDataStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_renameOrigin:to:forDataOfTypes:completionHandler:", v10, v8, -[WBSExtensionsController moveLocalStorageForExtension:completionHandler:]::dataTypes, v6);

  }
  else
  {
    v6[2](v6);
  }

}

+ (Class)_extensionDataClass
{
  return (Class)objc_opt_class();
}

- (void)_loadExtensions:(id)a3 skipEqualityCheck:(BOOL)a4
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *extensionIdentifierToStateMap;
  NSMutableSet *v12;
  NSMutableSet *blockedExtensions;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  NSMutableArray *extensions;
  NSArray *v33;
  NSArray *allDiscoveredExtensions;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  uint64_t v48;
  void *v49;
  __int128 v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  if (v54 && (!WBSIsEqual() || a4))
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      v77 = v8;
      v78 = 2113;
      v79 = v54;
      _os_log_impl(&dword_1A840B000, v6, OS_LOG_TYPE_INFO, "Loading extensions in class %@: %{private}@ ", buf, 0x16u);

    }
    if (!self->_extensionIdentifierToStateMap)
    {
      -[WBSExtensionsController readExtensionsStateFromStorage](self, "readExtensionsStateFromStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");
      extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
      self->_extensionIdentifierToStateMap = v10;

    }
    v12 = (NSMutableSet *)-[NSMutableSet mutableCopy](self->_replacedExtensions, "mutableCopy");
    blockedExtensions = self->_blockedExtensions;
    self->_blockedExtensions = v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v14 = self->_extensions;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v69 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if ((objc_msgSend(v54, "containsObject:", v18) & 1) == 0)
          {
            v19 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v18, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v77 = v20;
              _os_log_impl(&dword_1A840B000, v19, OS_LOG_TYPE_INFO, "Extension with identifier %@ was removed", buf, 0xCu);

            }
            -[WBSExtensionsController unloadExtensionIfNecessary:](self, "unloadExtensionIfNecessary:", v18);
            -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSExtensionsController _updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:](self, "_updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:", v21);

            -[WBSExtensionsController _removeSafariExtensionDataForExtension:](self, "_removeSafariExtensionDataForExtension:", v18);
            objc_msgSend(v52, "addObject:", v18);
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v22 = v54;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v23)
    {
      v25 = *(_QWORD *)v65;
      *(_QWORD *)&v24 = 138412290;
      v50 = v24;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v65 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if ((-[NSMutableArray containsObject:](self->_extensions, "containsObject:", v27, v50) & 1) == 0)
            objc_msgSend(v51, "addObject:", v27);
          v28 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v27, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v50;
            v77 = v29;
            _os_log_impl(&dword_1A840B000, v28, OS_LOG_TYPE_INFO, "Extension with identifier %@ was added", buf, 0xCu);

          }
          buf[0] = 0;
          -[WBSExtensionsController _validateAndLoadExtensionIfNecessary:attemptRetryOnFailure:isExtensionNewlyInstalled:](self, "_validateAndLoadExtensionIfNecessary:attemptRetryOnFailure:isExtensionNewlyInstalled:", v27, 1, buf);
          if (buf[0])
            objc_msgSend(v53, "addObject:", v27);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      }
      while (v23);
    }

    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __61__WBSExtensionsController__loadExtensions_skipEqualityCheck___block_invoke;
    v63[3] = &unk_1E5442640;
    v63[4] = self;
    objc_msgSend(v22, "safari_filterObjectsUsingBlock:", v63);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (NSMutableArray *)objc_msgSend(v30, "mutableCopy");
    extensions = self->_extensions;
    self->_extensions = v31;

    if (!self->_allDiscoveredExtensions)
    {
      self->_hasDiscoveredExtensions = 1;
      v33 = (NSArray *)-[NSMutableArray copy](self->_extensions, "copy");
      allDiscoveredExtensions = self->_allDiscoveredExtensions;
      self->_allDiscoveredExtensions = v33;

    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v35 = v51;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v60;
      v38 = *MEMORY[0x1E0D8A380];
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v60 != v37)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k);
          if ((-[NSMutableSet containsObject:](self->_blockedExtensions, "containsObject:", v40) & 1) == 0)
          {
            -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSExtensionsController _updateExtensionStateAfterExtensionWasAddedWithComposedIdentifier:](self, "_updateExtensionStateAfterExtensionWasAddedWithComposedIdentifier:", v41);

            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "postNotificationName:object:", v38, v40);

          }
        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
      }
      while (v36);
    }

    if (objc_msgSend(v35, "count"))
      -[WBSExtensionsController _updateExtensionNewTabPageIfNecessary](self, "_updateExtensionNewTabPageIfNecessary");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v43 = v52;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v56;
      v46 = *MEMORY[0x1E0D8A388];
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v56 != v45)
            objc_enumerationMutation(v43);
          v48 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * m);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "postNotificationName:object:", v46, v48);

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
      }
      while (v44);
    }

    -[WBSExtensionsController _showNewExtensionBannerIfNecessaryForExtensions:](self, "_showNewExtensionBannerIfNecessaryForExtensions:", v53);
    -[WBSExtensionsController _finishedLoadingExtensions](self, "_finishedLoadingExtensions");

  }
  else
  {
    -[WBSExtensionsController _finishedLoadingExtensions](self, "_finishedLoadingExtensions");
  }

}

uint64_t __61__WBSExtensionsController__loadExtensions_skipEqualityCheck___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "containsObject:", a2) ^ 1;
}

- (void)_validateAndLoadExtensionIfNecessary:(id)a3 attemptRetryOnFailure:(BOOL)a4 isExtensionNewlyInstalled:(BOOL *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char isKindOfClass;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((-[NSMutableSet containsObject:](self->_enabledExtensions, "containsObject:", v8) & 1) == 0)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v30 = v10;
      _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "Loading extension with identifier: %{private}@", buf, 0xCu);

    }
    -[WBSExtensionsController extensionDataForExtension:](self, "extensionDataForExtension:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[WBSExtensionsController _extensionsControllerForDefaultProfile](self, "_extensionsControllerForDefaultProfile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_computeCodeSigningDictionaryOnDiskForExtension:attemptRetryOnFailure:", v8, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[WBSExtensionsController _developerIdentifierForExtension:untrustedCodeSigningDictionary:](self, "_developerIdentifierForExtension:untrustedCodeSigningDictionary:", v8, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[WBSExtensionsController _isExtensionBlockedByBlocklist:developerIdentifier:](self, "_isExtensionBlockedByBlocklist:developerIdentifier:", v8, v14))
        {
          -[WBSExtensionsController _extensionsControllerForDefaultProfile](self, "_extensionsControllerForDefaultProfile");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_validateContainingAppOfExtensionIfNecessary:attemptRetryOnFailure:", v8, v6);

          -[WBSExtensionsController _replaceExtensionsObsoletedByExtension:developerIdentifier:](self, "_replaceExtensionsObsoletedByExtension:developerIdentifier:", v8, v14);
          -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = v16 == 0;

          if ((_DWORD)v15)
          {
            v17 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v8, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v30 = v18;
              _os_log_impl(&dword_1A840B000, v17, OS_LOG_TYPE_INFO, "Extension with identifier %@ was installed", buf, 0xCu);

            }
            if (a5)
              *a5 = 1;
          }
          if (self->_loadEnabledExtensionsWasCalled)
          {
            -[WBSExtensionsController _updateExtensionStateIfThisVersionOfSafariIsNotSupported:](self, "_updateExtensionStateIfThisVersionOfSafariIsNotSupported:", v8);
            -[WBSExtensionsController _updateExtensionStateIfPermissionsIncreased:](self, "_updateExtensionStateIfPermissionsIncreased:", v8);
            -[WBSExtensionsController _updateExtensionStateWithPrivacyPreservingProfileIdentifierIfNeeded:](self, "_updateExtensionStateWithPrivacyPreservingProfileIdentifierIfNeeded:", v8);
            if (-[WBSExtensionsController _extensionShouldBeEnabled:](self, "_extensionShouldBeEnabled:", v8))
            {
              -[NSMutableSet addObject:](self->_enabledExtensions, "addObject:", v8);
              -[WBSExtensionsController _grantRequestedPermissionsIfNecessaryForExtension:](self, "_grantRequestedPermissionsIfNecessaryForExtension:", v11);
              objc_msgSend(v8, "_extensionBundle");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "resourceURL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "absoluteURL");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v21 = v11;
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)
                v23 = v21;
              else
                v23 = 0;
              v24 = v23;

              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v21, "resourcesDirectoryURL");
                v25 = objc_claimAutoreleasedReturnValue();

                v28 = (void *)v25;
              }

              -[WBSExtensionsController _addExtensionToBaseURIMap:withResourceURL:](self, "_addExtensionToBaseURIMap:withResourceURL:", v8, v28);
              -[WBSExtensionsController _loadEnabledExtension:](self, "_loadEnabledExtension:", v8);
              -[WBSExtensionsController _updateExtensionsCrashReporterMessage](self, "_updateExtensionsCrashReporterMessage");
              -[WBSExtensionsController _connectToExtensionForValidation:untrustedCodeSigningDictionary:attemptRetryOnFailure:](self, "_connectToExtensionForValidation:untrustedCodeSigningDictionary:attemptRetryOnFailure:", v8, v13, v6);
              if (a5)
                *a5 = 0;

            }
          }
        }

      }
    }
    else
    {
      v26 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v27;
        _os_log_impl(&dword_1A840B000, v26, OS_LOG_TYPE_INFO, "Failed to load data for extension with identifier %@", buf, 0xCu);

      }
      -[WBSExtensionsController _disableAndBlockExtension:](self, "_disableAndBlockExtension:", v8);
    }

  }
}

- (BOOL)_extensionShouldBeEnabled:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *extensionIdentifierToStateMap;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_extensionIdentifierToStateMap)
  {
    -[WBSExtensionsController readExtensionsStateFromStorage](self, "readExtensionsStateFromStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v6;

  }
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D8A5C0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A5C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(v8, "safari_BOOLForKey:", v9);
  else
    v11 = -[WBSExtensionsController _extensionShouldBeAutomaticallyEnabled:](self, "_extensionShouldBeAutomaticallyEnabled:", v4);
  LODWORD(v12) = v11;
  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "managedExtensionStateForComposedIdentifier:", v13);

  if (v15 == 1)
    v16 = (char)v12;
  else
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = 138477827;
      v22 = v13;
      _os_log_impl(&dword_1A840B000, v19, OS_LOG_TYPE_INFO, "Enabling extension %{private}@ due to managed extension configuration", (uint8_t *)&v21, 0xCu);
    }
    v12 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v9);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D8A608]);
    -[WBSExtensionsController _setExtensionState:forExtension:](self, "_setExtensionState:forExtension:", v12, v4);
    goto LABEL_20;
  }
  if (v15 == 2)
    v17 = (int)v12;
  else
    v17 = 0;
  if (v17 == 1)
  {
    v18 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v21 = 138477827;
      v22 = v13;
      _os_log_impl(&dword_1A840B000, v18, OS_LOG_TYPE_INFO, "Disabling extension %{private}@ due to managed extension configuration", (uint8_t *)&v21, 0xCu);
    }
    v12 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v9);
    -[WBSExtensionsController _setExtensionState:forExtension:](self, "_setExtensionState:forExtension:", v12, v4);
LABEL_20:

    LOBYTE(v12) = v16 ^ 1;
  }

  return (char)v12;
}

- (BOOL)_extensionShouldBeAutomaticallyEnabled:(id)a3
{
  return 0;
}

- (id)_extensionStateForExtension:(id)a3
{
  void *v4;
  void *v5;

  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_writeExtensionsStateToStorage
{
  -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:](self, "writeExtensionsStateToStorageWithCompletionHandler:", 0);
}

- (void)writeExtensionsStateToStorageWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "writeExtensionsStateToStorageWithCompletionHandler:", buf, 2u);
  }
  -[WBSExtensionsController _urlForExtensionSettings](self, "_urlForExtensionSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke;
    v30[3] = &unk_1E5442668;
    v30[4] = self;
    v31 = v4;
    v8 = (void *)MEMORY[0x1A85D45E4](v30);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    v29 = 0;
    v24 = v7;
    v25 = 3221225472;
    v26 = __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_37;
    v27 = &unk_1E5442690;
    v10 = v8;
    v28 = v10;
    objc_msgSend(v9, "coordinateWritingItemAtURL:options:error:byAccessor:", v6, 8, &v29, &v24);
    v11 = v29;
    if (v11)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "safari_privacyPreservingDescription", v24, v25, v26, v27);
        objc_claimAutoreleasedReturnValue();
        -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:].cold.2();
      }

    }
    if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", self->_profileServerID, v24, v25, v26, v27))
    {
      objc_msgSend((id)objc_opt_class(), "_extensionDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[WBSExtensionsController hasAnyEnabledExtensionsInStorage](self, "hasAnyEnabledExtensionsInStorage");
      objc_msgSend((id)objc_opt_class(), "_skipLoadingEnabledExtensionsAtLaunchPreferenceKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBool:forKey:", !v14, v15);

    }
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

void __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v9[0] = 0;
  v5 = objc_msgSend(v4, "writeToURL:error:", v3, v9);
  v6 = v9[0];
  if ((v5 & 1) == 0)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_cold_1();
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

uint64_t __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadExtensionStateFromStorage
{
  NSMutableDictionary *v3;
  NSMutableDictionary *extensionIdentifierToStateMap;
  id v5;

  -[WBSExtensionsController readExtensionsStateFromStorage](self, "readExtensionsStateFromStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  self->_extensionIdentifierToStateMap = v3;

}

- (void)_setExtensionIdentifierToStateMap:(id)a3 forExtensionWithComposedIdentifier:(id)a4
{
  -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:completionHandler:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:completionHandler:", a3, a4, 0);
}

- (void)_setExtensionIdentifierToStateMap:(id)a3 forExtensionWithComposedIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *extensionIdentifierToStateMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  char v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  if (!extensionIdentifierToStateMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v11;

    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  }
  -[NSMutableDictionary safari_dictionaryForKey:](extensionIdentifierToStateMap, "safari_dictionaryForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToDictionary:", v15);

  if ((v14 & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extensionIdentifierToStateMap, "setObject:forKeyedSubscript:", v15, v8);
    -[WBSExtensionsController writeExtensionsStateToStorageWithCompletionHandler:](self, "writeExtensionsStateToStorageWithCompletionHandler:", v9);
  }

}

- (void)_updateExtensionStateAfterExtensionWasAddedWithComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = *MEMORY[0x1E0D8A368];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A368]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    v8 = *MEMORY[0x1E0D8A360];
  }
  else
  {
    v8 = *MEMORY[0x1E0D8A360];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A360]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_9;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v8);

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);
  -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:", v5, v12);
LABEL_9:

}

- (void)_resetExtensionsState
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *extensionIdentifierToStateMap;
  NSMutableSet *enabledExtensions;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary copy](self->_extensionIdentifierToStateMap, "copy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  self->_extensionIdentifierToStateMap = v4;

  -[WBSExtensionsController _writeExtensionsStateToStorage](self, "_writeExtensionsStateToStorage");
  enabledExtensions = self->_enabledExtensions;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__WBSExtensionsController__resetExtensionsState__block_invoke;
  v15[3] = &unk_1E54426E0;
  v15[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](enabledExtensions, "enumerateObjectsUsingBlock:", v15);
  -[NSMutableSet removeAllObjects](self->_enabledExtensions, "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        -[WBSExtensionsController _deleteStorageForExtensionWithComposedIdentifier:](self, "_deleteStorageForExtensionWithComposedIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

void __48__WBSExtensionsController__resetExtensionsState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138477827;
    v8 = v5;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_INFO, "Unloading extension with identifier %{private}@ because we are resetting extensions state", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "unloadExtensionIfNecessary:", v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0D8A300], v3);

}

- (void)resetExtensionsStateAndReloadExtensions
{
  NSMutableArray *v3;
  NSMutableArray *extensions;
  NSMutableArray *v5;

  -[WBSExtensionsController _resetExtensionsState](self, "_resetExtensionsState");
  v5 = self->_extensions;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  extensions = self->_extensions;
  self->_extensions = v3;

  -[WBSExtensionsController _loadExtensions:](self, "_loadExtensions:", v5);
}

- (BOOL)hasAnyEnabledExtensionsInStorage
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_extensionIdentifierToStateMap;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = *MEMORY[0x1E0D8A5C0];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "safari_BOOLForKey:", v6);

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasAnyEnabledExtensions
{
  return -[NSMutableSet count](self->_enabledExtensions, "count") != 0;
}

- (NSDictionary)extensionIdentifierToBaseURIMap
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_extensionIdentifierToBaseURIMap, "copy");
}

- (BOOL)extensionIsEnabled:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (-[NSMutableSet containsObject:](self->_enabledExtensions, "containsObject:", v4) & 1) != 0
    || -[WBSExtensionsController _extensionShouldBeEnabled:](self, "_extensionShouldBeEnabled:", v4);

  return v5;
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4
{
  -[WBSExtensionsController setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:](self, "setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:", a3, a4, 1, 0);
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 skipSavingToStorage:(BOOL)a5
{
  -[WBSExtensionsController setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:](self, "setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:", a3, a4, 1, a5);
}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 dueToUserGesture:(BOOL)a5 skipSavingToStorage:(BOOL)a6
{
  int v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(_QWORD);
  id v26;
  _QWORD v27[4];
  id v28;
  WBSExtensionsController *v29;
  _QWORD v30[4];
  id v31;
  WBSExtensionsController *v32;
  id v33;
  char v34;
  BOOL v35;
  BOOL v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_extensionIdentifierToStateMap, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  if (objc_msgSend(v16, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5C0]) != v8)
  {
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke;
    v30[3] = &unk_1E5442708;
    v34 = v8;
    v35 = a5;
    v31 = v16;
    v32 = self;
    v33 = v11;
    v36 = a6;
    v18 = (void (**)(_QWORD))MEMORY[0x1A85D45E4](v30);
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_2;
    v27[3] = &unk_1E54413C0;
    v19 = v10;
    v28 = v19;
    v29 = self;
    v20 = (void *)MEMORY[0x1A85D45E4](v27);
    if (v8)
    {
      v24[0] = v17;
      v24[1] = 3221225472;
      v24[2] = __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_43;
      v24[3] = &unk_1E5442730;
      v25 = v18;
      v26 = v20;
      -[WBSExtensionsController _enableExtension:completionHandler:](self, "_enableExtension:completionHandler:", v19, v24);

      v21 = v25;
    }
    else
    {
      v18[2](v18);
      v22 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v19, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v38 = v23;
        _os_log_impl(&dword_1A840B000, v22, OS_LOG_TYPE_INFO, "Extension with identifier %{private}@ was disabled by the user", buf, 0xCu);

      }
      -[WBSExtensionsController unloadExtensionIfNecessary:](self, "unloadExtensionIfNecessary:", v19);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", *MEMORY[0x1E0D8A300], v19);
    }

    -[WBSExtensionsController _notifyObserversContentBlockerListDidChange](self, "_notifyObserversContentBlockerListDidChange");
  }

}

void __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  if (*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
  {
    v2 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }
  v7 = (id)v3;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D8A608]);
  if (v2)

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  if (!*(_BYTE *)(a1 + 58))
    objc_msgSend(*(id *)(a1 + 40), "writeExtensionsStateToStorageWithCompletionHandler:", 0);
  +[WBSCloudExtensionStateManager sharedManager](WBSCloudExtensionStateManager, "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localExtensionStateDidChange");

}

void __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138477827;
    v6 = v3;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Extension with identifier %{private}@ was enabled by the user", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "_validateAndLoadExtensionIfNecessary:attemptRetryOnFailure:isExtensionNewlyInstalled:", *(_QWORD *)(a1 + 32), 1, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D8A300], *(_QWORD *)(a1 + 32));

}

uint64_t __87__WBSExtensionsController_setExtension_isEnabled_dueToUserGesture_skipSavingToStorage___block_invoke_43(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSSet)extensionStateKeysToCopy
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0D8A360];
  v8[0] = *MEMORY[0x1E0D8A5C0];
  v8[1] = v3;
  v4 = *MEMORY[0x1E0D8A5B8];
  v8[2] = *MEMORY[0x1E0D8A368];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E0D8A5E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (void)copyEnabledExtensionStateFromExtensionsController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *extensionIdentifierToStateMap;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  -[WBSExtensionsController extensionStateKeysToCopy](self, "extensionStateKeysToCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v10[4];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke;
  v11[3] = &unk_1E5442780;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
  extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
  self->_extensionIdentifierToStateMap = v8;

  -[WBSExtensionsController _writeExtensionsStateToStorage](self, "_writeExtensionsStateToStorage");
}

id __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke_2;
  v6[3] = &unk_1E5442758;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(a3, "safari_mapAndFilterKeysUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __77__WBSExtensionsController_copyEnabledExtensionStateFromExtensionsController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)unloadAndDeleteStateForAllExtensions
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_5(&dword_1A840B000, "Unable to delete profile data for all extensions at %{public}@ with error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)test_enableExtension:(id)a3 withResourceURL:(id)a4
{
  id v6;
  NSArray *allDiscoveredExtensions;
  NSArray *v8;
  NSArray *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMutableSet addObject:](self->_enabledExtensions, "addObject:", v10);
  -[NSMutableArray addObject:](self->_extensions, "addObject:", v10);
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  if (!allDiscoveredExtensions)
  {
    self->_allDiscoveredExtensions = (NSArray *)MEMORY[0x1E0C9AA60];

    allDiscoveredExtensions = self->_allDiscoveredExtensions;
  }
  -[NSArray arrayByAddingObject:](allDiscoveredExtensions, "arrayByAddingObject:", v10);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v9 = self->_allDiscoveredExtensions;
  self->_allDiscoveredExtensions = v8;

  -[WBSExtensionsController _addExtensionToBaseURIMap:withResourceURL:](self, "_addExtensionToBaseURIMap:withResourceURL:", v10, v6);
  -[WBSExtensionsController _loadEnabledExtension:](self, "_loadEnabledExtension:", v10);
  -[WBSExtensionsController _updateExtensionsCrashReporterMessage](self, "_updateExtensionsCrashReporterMessage");

}

- (void)_updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RemovedDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("RemovedDate"));

      -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:", v5, v8);
      -[WBSExtensionsController _deleteStateForRemovedExtensionsSoon](self, "_deleteStateForRemovedExtensionsSoon");
    }
  }

}

- (void)_deleteStateForExtensionWithComposedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary safari_dictionaryForKey:](self->_extensionIdentifierToStateMap, "safari_dictionaryForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_extensionIdentifierToStateMap)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RemovedDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138477827;
        v12 = v4;
        _os_log_impl(&dword_1A840B000, v8, OS_LOG_TYPE_INFO, "Deleting state for removed extension with composed identifier %{private}@", (uint8_t *)&v11, 0xCu);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extensionIdentifierToStateMap, "setObject:forKeyedSubscript:", 0, v4);
      +[WBSCloudExtensionStateManager sharedManager](WBSCloudExtensionStateManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localExtensionStateDidChange");

      -[WBSExtensionsController _writeExtensionsStateToStorage](self, "_writeExtensionsStateToStorage");
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138477827;
        v12 = v4;
        _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Not deleting state for removed extension with composed identifier %{private}@ since it was installed again", (uint8_t *)&v11, 0xCu);
      }
    }
  }

}

- (void)_deleteStateForRemovedExtensions
{
  *(_DWORD *)buf = 134217984;
  *(double *)(buf + 4) = a3;
  _os_log_debug_impl(&dword_1A840B000, a2, OS_LOG_TYPE_DEBUG, "Scheduling a timer to delete state for removed extensions in %f seconds", buf, 0xCu);
}

- (void)_deleteStateForRemovedExtensionsAfterDelay:(double)a3
{
  NSTimer *v5;
  NSTimer *deleteStateForRemovedExtensionsTimer;

  -[NSTimer invalidate](self->_deleteStateForRemovedExtensionsTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__deleteStateForRemovedExtensionsTimerFired_, 0, 0, a3);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  deleteStateForRemovedExtensionsTimer = self->_deleteStateForRemovedExtensionsTimer;
  self->_deleteStateForRemovedExtensionsTimer = v5;

  -[NSTimer setTolerance:](self->_deleteStateForRemovedExtensionsTimer, "setTolerance:", 1.0);
}

- (void)_deleteStateForRemovedExtensionsSoon
{
  -[WBSExtensionsController _deleteStateForRemovedExtensionsAfterDelay:](self, "_deleteStateForRemovedExtensionsAfterDelay:", 1.0);
}

- (void)_removeSafariExtensionDataForExtension:(id)a3
{
  id v4;

  objc_msgSend(a3, "sf_uniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extensionUniqueIdentifierToExtensionDataMap, "setObject:forKeyedSubscript:", 0, v4);

}

- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 outResourceData:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  objc_msgSend(v6, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController extensionWithBaseURIHost:](self, "extensionWithBaseURIHost:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = -[WBSExtensionsController validateAndReadResourceWithExtensionURL:inExtension:outResourceData:](self, "validateAndReadResourceWithExtensionURL:inExtension:outResourceData:", v7, v9, a4);
  else
    v10 = 0;

  return v10;
}

- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 inExtension:(id)a4 outResourceData:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  -[WBSExtensionsController _extensionsControllerForDefaultProfile](self, "_extensionsControllerForDefaultProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionDataForExtension:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bundleCodeRef");

  v13 = -[WBSExtensionsController validateAndReadResourceWithExtensionURL:inExtension:codeRef:outResourceData:](self, "validateAndReadResourceWithExtensionURL:inExtension:codeRef:outResourceData:", v8, v9, v12, a5);
  return v13;
}

- (BOOL)validateAndReadResourceWithExtensionURL:(id)a3 inExtension:(id)a4 codeRef:(__SecCode *)a5 outResourceData:(id *)a6
{
  id v8;
  id v9;
  id v10;
  SafariShared::ExtensionURLTranslator *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isFileURL"))
  {
    v10 = v8;
  }
  else
  {
    v11 = (SafariShared::ExtensionURLTranslator *)objc_msgSend(v8, "safari_isSafariExtensionURL");
    if (!(_DWORD)v11)
    {
      v16 = 0;
      goto LABEL_13;
    }
    SafariShared::ExtensionURLTranslator::shared(v11);
    SafariShared::ExtensionURLTranslator::fileURLForExtensionURL();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v10;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a6)
    *a6 = objc_retainAutorelease(v13);
  if (!v14)
  {
    v15 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      objc_claimAutoreleasedReturnValue();
      -[WBSExtensionsController validateAndReadResourceWithExtensionURL:inExtension:codeRef:outResourceData:].cold.1();
    }

  }
  v16 = 1;
LABEL_13:

  return v16;
}

- (void)_addExtensionToBaseURIMap:(id)a3 withResourceURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *extensionIdentifierToBaseURIMap;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id WeakRetained;
  id v17;

  v17 = a3;
  v6 = a4;
  -[WBSExtensionsController _generateBaseURIForExtension:](self, "_generateBaseURIForExtension:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController extensionDataForExtension:](self, "extensionDataForExtension:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::ExtensionURLTranslator::shared((SafariShared::ExtensionURLTranslator *)objc_msgSend(v8, "setSafariExtensionBaseURI:", v7));
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::ExtensionURLTranslator::addExtension();

  objc_msgSend(v17, "sf_uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  extensionIdentifierToBaseURIMap = self->_extensionIdentifierToBaseURIMap;
  if (extensionIdentifierToBaseURIMap)
  {
    v12 = (void *)-[NSMutableDictionary mutableCopy](extensionIdentifierToBaseURIMap, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v10);
  v14 = (NSMutableDictionary *)objc_msgSend(v13, "copy");
  v15 = self->_extensionIdentifierToBaseURIMap;
  self->_extensionIdentifierToBaseURIMap = v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "extensionBaseURIMapChangedForExtensionsController:", self);

}

- (id)extensionWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSArray *allDiscoveredExtensions;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableArray *extensions;
  _QWORD v14[4];
  id v15;
  WBSExtensionsController *v16;
  _QWORD v17[4];
  id v18;
  WBSExtensionsController *v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    allDiscoveredExtensions = self->_allDiscoveredExtensions;
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__WBSExtensionsController_extensionWithUUID___block_invoke;
    v17[3] = &unk_1E54427A8;
    v8 = v4;
    v18 = v8;
    v19 = self;
    -[NSArray safari_firstObjectPassingTest:](allDiscoveredExtensions, "safari_firstObjectPassingTest:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      extensions = self->_extensions;
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __45__WBSExtensionsController_extensionWithUUID___block_invoke_2;
      v14[3] = &unk_1E54427A8;
      v15 = v8;
      v16 = self;
      -[NSMutableArray safari_firstObjectPassingTest:](extensions, "safari_firstObjectPassingTest:", v14);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __45__WBSExtensionsController_extensionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "sf_uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "containsObject:", v3) ^ 1;
  else
    v5 = 0;

  return v5;
}

uint64_t __45__WBSExtensionsController_extensionWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "sf_uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "containsObject:", v3) ^ 1;
  else
    v5 = 0;

  return v5;
}

uint64_t __59__WBSExtensionsController_extensionWithComposedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "containsObject:", v3) ^ 1;
  else
    v5 = 0;

  return v5;
}

- (id)extensionWithBundleIdentifier:(id)a3
{
  id v4;
  NSArray *allDiscoveredExtensions;
  void *v6;
  _QWORD v8[4];
  id v9;
  WBSExtensionsController *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    allDiscoveredExtensions = self->_allDiscoveredExtensions;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__WBSExtensionsController_extensionWithBundleIdentifier___block_invoke;
    v8[3] = &unk_1E54427A8;
    v9 = v4;
    v10 = self;
    -[NSArray safari_firstObjectPassingTest:](allDiscoveredExtensions, "safari_firstObjectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __57__WBSExtensionsController_extensionWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "containsObject:", v3) ^ 1;
  else
    v5 = 0;

  return v5;
}

- (void)_extensionsWereGloballyEnabled
{
  -[WBSExtensionsController loadEnabledExtensions](self, "loadEnabledExtensions");
  -[WBSExtensionsController findExtensions](self, "findExtensions");
}

- (void)_extensionsWereGloballyDisabled
{
  NSMutableSet *enabledExtensions;
  NSMutableSet *v4;
  NSMutableSet *v5;
  NSMutableArray *v6;
  NSMutableArray *extensions;
  NSMutableDictionary *extensionUniqueIdentifierToExtensionDataMap;
  _QWORD v9[5];

  -[WBSExtensionsController _endExtensionDiscovery](self, "_endExtensionDiscovery");
  enabledExtensions = self->_enabledExtensions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__WBSExtensionsController__extensionsWereGloballyDisabled__block_invoke;
  v9[3] = &unk_1E54426E0;
  v9[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](enabledExtensions, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  v5 = self->_enabledExtensions;
  self->_enabledExtensions = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  extensions = self->_extensions;
  self->_extensions = v6;

  extensionUniqueIdentifierToExtensionDataMap = self->_extensionUniqueIdentifierToExtensionDataMap;
  self->_extensionUniqueIdentifierToExtensionDataMap = 0;

  self->_hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce = 0;
}

void __58__WBSExtensionsController__extensionsWereGloballyDisabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138477827;
    v7 = v5;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_INFO, "Unloading extension with identifier %{private}@ because extensions were globally disabled", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "unloadExtensionIfNecessary:", v3);

}

- (void)_setExtensionState:(id)a3 forExtension:(id)a4
{
  -[WBSExtensionsController _setExtensionState:forExtension:completionHandler:](self, "_setExtensionState:forExtension:completionHandler:", a3, a4, 0);
}

- (void)_setExtensionState:(id)a3 forExtension:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:completionHandler:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:completionHandler:", v10, v9, v8);

}

+ (BOOL)hasBlockedPromptAppearedForExtensionWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D8A240];
  objc_msgSend(v4, "arrayForKey:", *MEMORY[0x1E0D8A240]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v3);
  if ((v7 & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(v6, "arrayByAddingObject:", v3);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    else
    {
      v10[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v6, v5);
  }

  return v7;
}

+ (void)removeExtensionBundleIDFromArrayOfBlocklistedExtensions:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D8A240];
  objc_msgSend(v3, "arrayForKey:", *MEMORY[0x1E0D8A240]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if ((objc_msgSend(v6, "containsObject:", v7) & 1) != 0)
  {
    objc_msgSend(v6, "removeObject:", v7);
    objc_msgSend(v3, "setObject:forKey:", v6, v4);
  }

}

- (void)_disableAndBlockExtension:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "identifier");
    objc_claimAutoreleasedReturnValue();
    -[WBSExtensionsController _disableAndBlockExtension:].cold.1();
  }

  -[WBSExtensionsController setExtension:isEnabled:](self, "setExtension:isEnabled:", v4, 0);
  -[WBSExtensionsController _blockExtension:](self, "_blockExtension:", v4);

}

- (void)_blockExtension:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableSet *blockedExtensions;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSMutableArray **p_extensions;
  NSMutableArray *extensions;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "identifier");
    objc_claimAutoreleasedReturnValue();
    -[WBSExtensionsController _blockExtension:].cold.1();
  }

  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:](self, "_updateExtensionStateAfterExtensionWasRemovedWithComposedIdentifier:", v6);

  blockedExtensions = self->_blockedExtensions;
  if (!blockedExtensions)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_blockedExtensions;
    self->_blockedExtensions = v8;

    blockedExtensions = self->_blockedExtensions;
  }
  if ((-[NSMutableSet containsObject:](blockedExtensions, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_blockedExtensions, "addObject:", v4);
    -[WBSExtensionsController _removeSafariExtensionDataForExtension:](self, "_removeSafariExtensionDataForExtension:", v4);
    extensions = self->_extensions;
    p_extensions = &self->_extensions;
    if (-[NSMutableArray count](extensions, "count"))
    {
      v12 = (void *)-[NSMutableArray mutableCopy](*p_extensions, "mutableCopy");
      objc_msgSend(v12, "removeObject:", v4);
      objc_storeStrong((id *)p_extensions, v12);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", *MEMORY[0x1E0D8A388], v4);

    }
  }

}

- (WKWebsiteDataStore)websiteDataStore
{
  void *v2;

  if (self->_profileServerID)
  {
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreForProfileWithIdentifier:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (WKWebsiteDataStore *)v2;
}

- (void)unloadExtensionIfNecessary:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  NSMutableDictionary *v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  void *v27;
  int v28;
  SafariShared::ExtensionURLTranslator *v29;
  NSURL *v30;
  SafariShared::ExtensionURLTranslator *v31;
  id WeakRetained;
  void *v33;
  void *v34;
  uint64_t v35;
  NSMutableDictionary *extensionIdentifierToBaseURIMap;
  void *v37;
  id v38;
  WBSExtensionsController *v39;
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
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v39 = self;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v38, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v56 = v5;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_INFO, "Unloading extension with identifier: %{private}@", buf, 0xCu);

  }
  v6 = v38;
  objc_msgSend(v38, "_kill:", 9);
  if ((-[NSMutableSet containsObject:](v39->_enabledExtensions, "containsObject:", v38) & 1) != 0)
  {
    -[WBSExtensionsController _unloadPreviouslyEnabledExtension:](v39, "_unloadPreviouslyEnabledExtension:", v38);
    -[WBSExtensionsController extensionDataForExtension:](v39, "extensionDataForExtension:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSExtensionsController userContentController](v39, "userContentController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_userContentController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == v8;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v37, "injectedStyleSheets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v7, "_removeUserStyleSheet:", v15);
          objc_msgSend(v10, "_removeUserStyleSheet:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v12);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v37, "injectedScripts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v7, "_removeUserScript:", v20);
          objc_msgSend(v10, "_removeUserScript:", v20);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v17);
    }

    objc_msgSend(v37, "setInjectedStyleSheets:", 0);
    objc_msgSend(v37, "setInjectedScripts:", 0);
    objc_msgSend(v38, "sf_uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = v39->_baseURIHostToExtensionIdentifier;
    v23 = (id)-[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v41;
      while (2)
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)k);
          -[NSMutableDictionary objectForKeyedSubscript:](v39->_baseURIHostToExtensionIdentifier, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqual:", v21);

          if (v28)
          {
            v23 = v26;
            goto LABEL_31;
          }
        }
        v23 = (id)-[NSMutableDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v23)
          continue;
        break;
      }
    }
LABEL_31:

    -[NSMutableDictionary removeObjectForKey:](v39->_baseURIHostToExtensionIdentifier, "removeObjectForKey:", v23);
    -[NSMutableDictionary objectForKeyedSubscript:](v39->_extensionIdentifierToBaseURIMap, "objectForKeyedSubscript:", v21);
    v29 = (SafariShared::ExtensionURLTranslator *)objc_claimAutoreleasedReturnValue();
    v30 = (NSURL *)v29;
    if (v29)
    {
      v31 = (SafariShared::ExtensionURLTranslator *)SafariShared::ExtensionURLTranslator::shared(v29);
      SafariShared::ExtensionURLTranslator::removeExtension(v31, v30);
      WeakRetained = objc_loadWeakRetained((id *)&v39->_delegate);
      -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](v39, "composedIdentifierForExtensionStateForExtension:", v38);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "extensionsController:closeOpenExtensionTabsWithBaseURI:composedIdentifier:", v39, v30, v33);

      v34 = (void *)-[NSMutableDictionary mutableCopy](v39->_extensionIdentifierToBaseURIMap, "mutableCopy");
      objc_msgSend(v34, "removeObjectForKey:", v21);
      v35 = objc_msgSend(v34, "copy");
      extensionIdentifierToBaseURIMap = v39->_extensionIdentifierToBaseURIMap;
      v39->_extensionIdentifierToBaseURIMap = (NSMutableDictionary *)v35;

      objc_msgSend(WeakRetained, "extensionBaseURIMapChangedForExtensionsController:", v39);
    }

    -[NSMutableSet removeObject:](v39->_enabledExtensions, "removeObject:", v38);
    -[WBSExtensionsController _updateExtensionsCrashReporterMessage](v39, "_updateExtensionsCrashReporterMessage");

    v6 = v38;
  }

}

- (void)closeLocalExtensionContentInPrivateTabsForExtension:(id)a3
{
  id v4;
  id WeakRetained;
  NSMutableDictionary *extensionIdentifierToBaseURIMap;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (self->_loadEnabledExtensionsWasCalled)
  {
    v10 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    extensionIdentifierToBaseURIMap = self->_extensionIdentifierToBaseURIMap;
    objc_msgSend(v10, "sf_uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](extensionIdentifierToBaseURIMap, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "extensionsController:closeOpenExtensionTabsInPrivateBrowsingWithBaseURI:composedIdentifier:", self, v8, v9);

    }
    v4 = v10;
  }

}

- (void)_postExtensionWasEnabledRemotelyNotificationIfNecessary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_extensionIdentifierToStateMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "safari_BOOLForKey:", *MEMORY[0x1E0D8A608]))
  {
    v6 = *MEMORY[0x1E0D8A568];
    v12[0] = v4;
    v7 = *MEMORY[0x1E0D8A570];
    v11[0] = v6;
    v11[1] = v7;
    -[WBSExtensionsController profileServerID](self, "profileServerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D8A610], 0, v9);

  }
}

- (void)remotelyEnabledExtensionBannerWasShownForComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_extensionIdentifierToStateMap, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D8A608]);
    v7 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extensionIdentifierToStateMap, "setObject:forKeyedSubscript:", v7, v8);

    -[WBSExtensionsController _writeExtensionsStateToStorage](self, "_writeExtensionsStateToStorage");
  }

}

+ (id)_bundleIdentifierFromComposedIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(" ("));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_extensionFromComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "_bundleIdentifierFromComposedIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:excludingDisabledExtensions:error:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "extensionPointIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_extensionPointIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
        v9 = v6;
      else
        v9 = 0;
      v10 = v9;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_generateBaseURIForExtension:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *baseURIHostToExtensionIdentifier;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (!self->_baseURIHostToExtensionIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    baseURIHostToExtensionIdentifier = self->_baseURIHostToExtensionIdentifier;
    self->_baseURIHostToExtensionIdentifier = v5;

  }
  -[WBSExtensionsController extensionDataForExtension:](self, "extensionDataForExtension:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseURIHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sf_uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_baseURIHostToExtensionIdentifier, "setObject:forKeyedSubscript:", v9, v8);

  v10 = (void *)MEMORY[0x1E0C99E98];
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "extensionURLScheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@://%@/"), v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_URLWithDataAsString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)extensionWithBaseURIHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_baseURIHostToExtensionIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController extensionWithUUID:](self, "extensionWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)temporarySiteAccessTimeInterval
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", *MEMORY[0x1E0D8A2A0]);
  v4 = v3;

  result = 86400.0;
  if (v4 < 86400.0 && v4 > 0.0)
    return v4;
  return result;
}

- (void)didShowPerSiteAccessPermissionForExtension:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = *MEMORY[0x1E0D8A370];
  if ((objc_msgSend(v5, "safari_BOOLForKey:", *MEMORY[0x1E0D8A370]) & 1) == 0)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v6);
    -[WBSExtensionsController _setExtensionState:forExtension:](self, "_setExtensionState:forExtension:", v5, v7);
  }

}

- (BOOL)hasShownPerSiteAccessPermissionForExtension:(id)a3
{
  void *v3;
  char v4;

  -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x1E0D8A370]);

  return v4;
}

- (id)cloudExtensionStateForStateManager:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *extensionIdentifierToStateMap;
  void *v8;
  BOOL v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  _QWORD v14[5];

  v4 = a3;
  if (!self->_extensionIdentifierToStateMap)
  {
    -[WBSExtensionsController readExtensionsStateFromStorage](self, "readExtensionsStateFromStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v6;

  }
  -[WBSExtensionsController profileServerID](self, "profileServerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v8);

  v10 = self->_extensionIdentifierToStateMap;
  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke;
    v14[3] = &unk_1E5442780;
    v14[4] = self;
    -[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](v10, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v14);
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v10;
  }
  v12 = v11;

  return v12;
}

id __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "extensionWithComposedIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "safari_containingAppAdamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v7, "safari_containingAppIsTestFlightApp") & 1) != 0)
    {
      objc_msgSend(v7, "safari_correspondingMacOSExtensionBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D8A5F0]);

      objc_msgSend(v7, "safari_correspondingMacOSContainingAppBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D8A5E8]);

      if (v9)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D8A578]);
      objc_msgSend(*(id *)(a1 + 32), "extensionDataForExtension:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D8A5B0]);

      v14 = v8;
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke_cold_1((uint64_t)v5, v16);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)hasExtensionWithComposedIdentifier:(id)a3
{
  id v4;
  NSArray *allDiscoveredExtensions;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__WBSExtensionsController_hasExtensionWithComposedIdentifier___block_invoke;
  v8[3] = &unk_1E54427A8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(allDiscoveredExtensions) = -[NSArray safari_containsObjectPassingTest:](allDiscoveredExtensions, "safari_containsObjectPassingTest:", v8);

  return (char)allDiscoveredExtensions;
}

uint64_t __62__WBSExtensionsController_hasExtensionWithComposedIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (void)setExtensionWithComposedIdentifier:(id)a3 isEnabledInCloud:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSArray *allDiscoveredExtensions;
  id v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  WBSExtensionsController *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  allDiscoveredExtensions = self->_allDiscoveredExtensions;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __79__WBSExtensionsController_setExtensionWithComposedIdentifier_isEnabledInCloud___block_invoke;
  v17 = &unk_1E54427A8;
  v18 = self;
  v8 = v6;
  v19 = v8;
  -[NSArray safari_firstObjectPassingTest:](allDiscoveredExtensions, "safari_firstObjectPassingTest:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WBSExtensionsController extensionIsEnabled:](self, "extensionIsEnabled:", v9, v14, v15, v16, v17, v18) == v4)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v21 = v8;
      _os_log_impl(&dword_1A840B000, v13, OS_LOG_TYPE_INFO, "Skipping changing state of %{private}@ because it is current state", buf, 0xCu);
    }
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("OFF");
      if (v4)
        v11 = CFSTR("ON");
      *(_DWORD *)buf = 138478083;
      v21 = v8;
      v22 = 2113;
      v23 = v11;
      _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Setting extension %{private}@ to %{private}@ from cloud data", buf, 0x16u);
    }
    -[WBSExtensionsController setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:](self, "setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:", v9, v4, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("WBSWebExtensionDisplayListNeedsUpdateNotification"), 0);

  }
}

uint64_t __79__WBSExtensionsController_setExtensionWithComposedIdentifier_isEnabledInCloud___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (void)_updateExtensionStateIfPermissionsIncreased:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *extensionIdentifierToStateMap;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  v20 = v4;
  if (!self->_extensionIdentifierToStateMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    extensionIdentifierToStateMap = self->_extensionIdentifierToStateMap;
    self->_extensionIdentifierToStateMap = v5;

    v4 = v20;
  }
  -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_extensionIdentifierToStateMap, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[WBSExtensionsController _updatedExtensionStateForCurrentPermissions:previousExtensionState:](self, "_updatedExtensionStateForCurrentPermissions:previousExtensionState:", v20, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:", v13, v7);
  if ((objc_msgSend(v13, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5C0]) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "managedExtensionStateForComposedIdentifier:", v7);

    if (v15 != 1)
    {
      if (-[WBSExtensionsController _shouldDisableExtensionIfAdditionalPermissionsAreRequired:previousExtensionState:](self, "_shouldDisableExtensionIfAdditionalPermissionsAreRequired:previousExtensionState:", v20, v12))
      {
        -[WBSExtensionsController setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:](self, "setExtension:isEnabled:dueToUserGesture:skipSavingToStorage:", v20, 0, 0, 0);
        objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "postNotificationName:object:", CFSTR("com.apple.mobilesafari.MobileSafariChangedExtensionSettings"), 0);

        -[WBSExtensionsController _displayNameForExtension:](self, "_displayNameForExtension:", v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sf_uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSExtensionsController _showPromptForExtensionDisabledBecauseItHasRequestedAdditionalPermissions:extensionIdentifier:](self, "_showPromptForExtensionDisabledBecauseItHasRequestedAdditionalPermissions:extensionIdentifier:", v17, v19);

      }
    }
  }

}

- (void)_updateExtensionStateWithPrivacyPreservingProfileIdentifierIfNeeded:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[WBSExtensionsController profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDefault");

  if ((v5 & 1) == 0)
  {
    -[WBSExtensionsController _extensionStateForExtension:](self, "_extensionStateForExtension:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WBSExtensionsController extensionDataForExtension:](self, "extensionDataForExtension:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D8A378];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D8A378]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
      objc_msgSend(v8, "setPrivacyPreservingProfileIdentifier:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPrivacyPreservingProfileIdentifier:", v10);
      objc_msgSend(v10, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v9);

      -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSExtensionsController _setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:](self, "_setExtensionIdentifierToStateMap:forExtensionWithComposedIdentifier:", v7, v11);
    }

  }
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; profile server ID = %@>"),
                       objc_opt_class(),
                       self,
                       self->_profileServerID);
}

+ (id)_composedIdentifierForStateOfExtensionWithBundleIdentifier:(id)a3 developerIdentifier:(id)a4
{
  return 0;
}

- (id)_developerIdentifierForExtension:(id)a3 untrustedCodeSigningDictionary:(id)a4
{
  return 0;
}

- (id)_displayNameForExtension:(id)a3
{
  return 0;
}

- (id)_displayShortNameForExtension:(id)a3
{
  return 0;
}

- (id)_displayVersionForExtension:(id)a3
{
  return 0;
}

+ (id)extensionIdentifierToBaseURIMapBundleParameterKey
{
  return 0;
}

+ (id)_extensionPointIdentifier
{
  return 0;
}

+ (id)extensionsCrashReporterMessageBundleParameterKey
{
  return 0;
}

+ (id)extensionURLScheme
{
  return 0;
}

+ (id)_skipLoadingEnabledExtensionsAtLaunchPreferenceKey
{
  return 0;
}

- (id)_updatedExtensionStateForCurrentPermissions:(id)a3 previousExtensionState:(id)a4
{
  return (id)objc_msgSend(a4, "mutableCopy", a3);
}

- (id)_urlForExtensionSettings
{
  return 0;
}

- (id)_urlForWebKitExtensionsDirectory
{
  return 0;
}

- (NSArray)allProfileExtensionsControllers
{
  return 0;
}

- (WBProfile)profile
{
  return 0;
}

- (id)_versionNumberForExtension:(id)a3
{
  return 0;
}

- (BOOL)_shouldDisableExtensionIfAdditionalPermissionsAreRequired:(id)a3 previousExtensionState:(id)a4
{
  return 1;
}

- (id)_computeCodeSigningDictionaryOnDiskForExtension:(id)a3 attemptRetryOnFailure:(BOOL)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)_enableExtension:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)_isExtensionBlockedByBlocklist:(id)a3 developerIdentifier:(id)a4
{
  return 0;
}

- (id)profileServerIDForStateManager:(id)a3
{
  void *v3;
  void *v4;

  -[WBSExtensionsController profile](self, "profile", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierForExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_managedExtensionStateDidChange
{
  NSMutableSet *enabledExtensions;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  enabledExtensions = self->_enabledExtensions;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__WBSExtensionsController__managedExtensionStateDidChange__block_invoke;
  v17[3] = &unk_1E54427D0;
  v17[4] = self;
  -[NSMutableSet safari_mapAndFilterObjectsUsingBlock:](enabledExtensions, "safari_mapAndFilterObjectsUsingBlock:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v14;
    *(_QWORD *)&v6 = 138477827;
    v12 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = (id)WBS_LOG_CHANNEL_PREFIXManagedExtensions();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[WBSExtensionsController composedIdentifierForExtensionStateForExtension:](self, "composedIdentifierForExtensionStateForExtension:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v12;
          v19 = v11;
          _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Unloading extension %{private}@ due to managed extension configuration", buf, 0xCu);

        }
        -[WBSExtensionsController unloadExtensionIfNecessary:](self, "unloadExtensionIfNecessary:", v9);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v5);
  }

  if (self->_loadEnabledExtensionsWasCalled || self->_forceExtensionLoadingAfterDiscovery)
    -[WBSExtensionsController _loadExtensions:skipEqualityCheck:](self, "_loadExtensions:skipEqualityCheck:", self->_allDiscoveredExtensions, 1, v12, (_QWORD)v13);
  -[WBSExtensionsController _updateManagedWebsiteAccessForAllExtensions](self, "_updateManagedWebsiteAccessForAllExtensions", v12);
  -[WBSExtensionsController _updateManagedPrivateBrowsingStateForAllExtensions](self, "_updateManagedPrivateBrowsingStateForAllExtensions");

}

id __58__WBSExtensionsController__managedExtensionStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_extensionShouldBeEnabled:", v3))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (WBSExtensionsControllerDelegate)delegate
{
  return (WBSExtensionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)loadingEnabledExtensionsAtStartup
{
  return self->_loadingEnabledExtensionsAtStartup;
}

- (void)setProfileServerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)allDiscoveredExtensions
{
  return self->_allDiscoveredExtensions;
}

- (BOOL)extensionsEnabled
{
  return self->_extensionsEnabled;
}

- (WBSExtensionsAnalyticsEventCoalescer)analyticsEventCoalescer
{
  return self->_analyticsEventCoalescer;
}

- (NSArray)composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions
{
  return self->_composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions;
}

- (BOOL)hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce
{
  return self->_hasPopulatedAllExtensionsFromExtensionDiscoveryAtLeastOnce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions, 0);
  objc_storeStrong((id *)&self->_analyticsEventCoalescer, 0);
  objc_storeStrong((id *)&self->_allDiscoveredExtensions, 0);
  objc_storeStrong((id *)&self->_profileServerID, 0);
  objc_storeStrong((id *)&self->_extensionKitQueryController, 0);
  objc_storeStrong((id *)&self->_userContentController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deleteStateForRemovedExtensionsTimer, 0);
  objc_storeStrong((id *)&self->_blockedExtensions, 0);
  objc_storeStrong((id *)&self->_replacedExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_enabledExtensions, 0);
  objc_storeStrong((id *)&self->_baseURIHostToExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifierToBaseURIMap, 0);
  objc_storeStrong((id *)&self->_extensionIdentifierToStateMap, 0);
  objc_storeStrong((id *)&self->_extensionUniqueIdentifierToExtensionDataMap, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)writeExtensionsStateToStorageWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A840B000, a1, a3, "Could not get extension settings URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)writeExtensionsStateToStorageWithCompletionHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to coordinate writing extension state %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __78__WBSExtensionsController_writeExtensionsStateToStorageWithCompletionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Unable to save extension state: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)readExtensionsStateFromStorage
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Failed to coordinate reading extension state %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)validateAndReadResourceWithExtensionURL:inExtension:codeRef:outResourceData:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_0();
  v2 = v1;
  *(_DWORD *)v3 = 138543619;
  *(_QWORD *)(v3 + 4) = v1;
  *(_WORD *)(v3 + 12) = 2113;
  *(_QWORD *)(v3 + 14) = v4;
  OUTLINED_FUNCTION_2_5(&dword_1A840B000, "Couldn't find resource %{public}@ for extension with identifier %{private}@", v5, v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)_disableAndBlockExtension:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Disabling and blocking extension with identifier: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_blockExtension:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Blocking extension with identifier: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __62__WBSExtensionsController_cloudExtensionStateForStateManager___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_1A840B000, a2, OS_LOG_TYPE_ERROR, "Not saving state for extension %{private}@ because we could not compute its containing app's Adam ID and it's not a TestFlight app", (uint8_t *)&v2, 0xCu);
}

@end
