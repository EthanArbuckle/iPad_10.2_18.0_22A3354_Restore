@implementation STStatusItemsManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__STStatusItemsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, block);
  return (id)qword_1ED907EE8;
}

void __38__STStatusItemsManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DB0A78], "standardDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithDefaults:", v4);
  v3 = (void *)qword_1ED907EE8;
  qword_1ED907EE8 = v2;

}

- (STStatusItemsManager)initWithDefaults:(id)a3
{
  id v5;
  STStatusItemsManager *v6;
  uint64_t v7;
  STBundleManager *bundleManager;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STStatusItemsManager;
  v6 = -[STStatusItemsManager init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB08A8]), "initWithBundleRecordClass:", objc_opt_class());
    bundleManager = v6->_bundleManager;
    v6->_bundleManager = (STBundleManager *)v7;

    objc_storeStrong((id *)&v6->_systemStatusDefaults, a3);
    -[STStatusItemsManager _registerForInternalDefaultsChanges](v6, "_registerForInternalDefaultsChanges");
    -[STBundleManager addObserver:](v6->_bundleManager, "addObserver:", v6);
    -[STStatusItemsManager _updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords](v6, "_updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords");
  }

  return v6;
}

- (id)resolvedStatusItemFromStatusItems:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemsManager validStatusItemsForStatusItems:](self, "validStatusItemsForStatusItems:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)validStatusItemsForStatusItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  if (qword_1ED907EF8 != -1)
    dispatch_once(&qword_1ED907EF8, &__block_literal_global_3);
  v5 = (id)qword_1ED907EF0;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "intersectSet:", v4);
  if (!self->_allowAllStatusItems)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", qword_1ED907EF0);
  objc_msgSend(v7, "unionSet:", v6);
  if (!objc_msgSend(v7, "count"))
  {

LABEL_6:
    v7 = v6;
  }

  return v7;
}

void __55__STStatusItemsManager_validStatusItemsForStatusItems___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[14];

  v8[13] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DB0E50];
  v8[0] = *MEMORY[0x1E0DB0E58];
  v8[1] = v0;
  v1 = *MEMORY[0x1E0DB0E68];
  v8[2] = *MEMORY[0x1E0DB0E60];
  v8[3] = v1;
  v2 = *MEMORY[0x1E0DB0E80];
  v8[4] = *MEMORY[0x1E0DB0E78];
  v8[5] = v2;
  v3 = *MEMORY[0x1E0DB0E90];
  v8[6] = *MEMORY[0x1E0DB0E88];
  v8[7] = v3;
  v4 = *MEMORY[0x1E0DB0EA0];
  v8[8] = *MEMORY[0x1E0DB0E98];
  v8[9] = v4;
  v8[10] = CFSTR("com.apple.mediaremoted.status-item.call-to-action.video-route");
  v8[11] = CFSTR("com.apple.mediaremoted.status-item.call-to-action.audio-route");
  v8[12] = CFSTR("com.apple.sharing.status-item.call-to-action.ask-to-airdrop");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED907EF0;
  qword_1ED907EF0 = v6;

}

- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_visualDescriptors, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB0A38], "visualDescriptorForStatusItemWithIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)_registerForInternalDefaultsChanges
{
  STSystemStatusDefaults *systemStatusDefaults;
  uint64_t v4;
  id v5;
  BSDefaultObserver *v6;
  BSDefaultObserver *internalDefaultsObserver;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_internalDefaultsObserver)
  {
    self->_allowAllStatusItems = -[STSystemStatusDefaults shouldEnableUnknownStatusItems](self->_systemStatusDefaults, "shouldEnableUnknownStatusItems");
    objc_initWeak(&location, self);
    systemStatusDefaults = self->_systemStatusDefaults;
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__STStatusItemsManager__registerForInternalDefaultsChanges__block_invoke;
    v8[3] = &unk_1E8E18430;
    objc_copyWeak(&v9, &location);
    -[STSystemStatusDefaults observeDefault:onQueue:withBlock:](systemStatusDefaults, "observeDefault:onQueue:withBlock:", CFSTR("shouldEnableUnknownStatusItems"), v4, v8);
    v6 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
    internalDefaultsObserver = self->_internalDefaultsObserver;
    self->_internalDefaultsObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __59__STStatusItemsManager__registerForInternalDefaultsChanges__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = MEMORY[0x1D17DFB20]("-[STStatusItemsManager _registerForInternalDefaultsChanges]_block_invoke");
    if (v3)
      v3 = objc_msgSend(v4[3], "shouldEnableUnknownStatusItems");
    v2 = v4;
    if (*((unsigned __int8 *)v4 + 40) != v3)
      *((_BYTE *)v4 + 40) = v3;
  }

}

- (void)recordBundlesChangedForBundleManager:(id)a3
{
  STBundleManager *v4;
  id v5;
  id location;

  v4 = (STBundleManager *)a3;
  objc_initWeak(&location, self);
  if (self->_bundleManager == v4)
  {
    objc_copyWeak(&v5, &location);
    BSDispatchMain();
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);

}

void __61__STStatusItemsManager_recordBundlesChangedForBundleManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords");

}

- (void)_updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords
{
  NSDictionary *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  NSDictionary *visualDescriptors;
  uint64_t v21;
  STStatusItemsManager *v22;
  uint64_t v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  -[STBundleManager recordIdentifiers](self->_bundleManager, "recordIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  STSystemStatusLogBundleLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v4;
    _os_log_impl(&dword_1D02C7000, v5, OS_LOG_TYPE_DEFAULT, "Bundle manager reports status item bundle identifiers changed: %{public}@", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v21 = *(_QWORD *)v31;
    v22 = self;
    do
    {
      v9 = 0;
      v23 = v7;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        -[STBundleManager bundleRecordForRecordIdentifier:](self->_bundleManager, "bundleRecordForRecordIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v9;
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v11, "statusItemIdentifiers");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v27 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(v11, "visualDescriptorForStatusItemWithIdentifier:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  -[NSDictionary setValue:forKey:](v3, "setValue:forKey:", v18, v17);
                  STSystemStatusLogBundleLoading();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v35 = v17;
                    v36 = 2114;
                    v37 = v18;
                    _os_log_debug_impl(&dword_1D02C7000, v19, OS_LOG_TYPE_DEBUG, "Status item identifier %{public}@ associated with visual descriptor %{public}@", buf, 0x16u);
                  }
                }
                else
                {
                  STSystemStatusLogBundleLoading();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138477827;
                    v35 = v17;
                    _os_log_error_impl(&dword_1D02C7000, v19, OS_LOG_TYPE_ERROR, "No valid visual descriptor for status item '%{private}@'", buf, 0xCu);
                  }
                }

              }
              v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
            }
            while (v14);
            v8 = v21;
            self = v22;
            v7 = v23;
          }
          v9 = v25;
        }
        else
        {
          STSystemStatusLogBundleLoading();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v35 = v10;
            _os_log_error_impl(&dword_1D02C7000, v12, OS_LOG_TYPE_ERROR, "Bundle %{private}@ is of unexpected type, expected 'StatusItems'", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v7);
  }

  visualDescriptors = self->_visualDescriptors;
  self->_visualDescriptors = v3;

}

- (NSString)description
{
  return (NSString *)-[STStatusItemsManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusItemsManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemsManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemsManager _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusItemsManager _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[STStatusItemsManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "appendDictionarySection:withName:skipIfEmpty:", self->_visualDescriptors, CFSTR("registeredVisualDescriptors"), 0);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_systemStatusDefaults, 0);
  objc_storeStrong((id *)&self->_visualDescriptors, 0);
  objc_storeStrong((id *)&self->_bundleManager, 0);
}

@end
