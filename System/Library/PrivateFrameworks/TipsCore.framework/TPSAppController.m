@implementation TPSAppController

- (id)collectionForIdentifier:(id)a3
{
  id v4;
  TPSCollection *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("SavedTips")))
  {
    v5 = self->_savedTipsCollection;
  }
  else
  {
    -[TPSAppController collectionMap](self, "collectionMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v5 = (TPSCollection *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSDictionary)collectionMap
{
  return self->_collectionMap;
}

- (TPSCollection)featuredCollection
{
  return self->_featuredCollection;
}

- (NSArray)collections
{
  return self->_collections;
}

- (id)tipsForCollectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("SavedTips")) & 1) == 0)
  {
    -[TPSAppController collectionMap](self, "collectionMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_3;
LABEL_27:
    v11 = 0;
    v12 = 0;
    v7 = 0;
    goto LABEL_30;
  }
  -[TPSAppController savedTipsCollection](self, "savedTipsCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_27;
LABEL_3:
  objc_msgSend(v5, "tipIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v26 = v5;
    v27 = v4;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[TPSAppController tipMap](self, "tipMap", v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "isIntro"))
        {
          if (!v12)
            v12 = v17;
        }
        else if (objc_msgSend(v17, "isOutro"))
        {
          if (!v11)
            v11 = v17;
        }
        else if (v17)
        {
          objc_msgSend(v7, "addObject:", v17);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);

    v4 = v27;
    if (v12)
    {
      +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "collectionStatusForCollectionIdentifier:", v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "firstViewedDate");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20
        || (v21 = (void *)v20, v22 = -[TPSAppController alwaysShowIntro](self, "alwaysShowIntro"),
                               v21,
                               v22))
      {
        objc_msgSend(v7, "insertObject:atIndex:", v12, 0);
      }

    }
    if (v11)
      objc_msgSend(v7, "addObject:", v11);
    v5 = v26;
  }
  else
  {

    v11 = 0;
    v12 = 0;
  }

LABEL_30:
  v24 = (void *)objc_msgSend(v7, "copy");

  return v24;
}

- (NSDictionary)tipMap
{
  return self->_tipMap;
}

void __42__TPSAppController_updateSavedTipsContent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[TPSSavedTipsManager sharedInstance](TPSSavedTipsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "savedTipsCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v7, "savedTipsCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTipIdentifiers:", v3);
    }
    else
    {
      objc_msgSend(v7, "createSavedTipsCollection:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSavedTipsCollection:", v8);
    }

  }
  else
  {
    objc_msgSend(v5, "setSavedTipsCollection:", 0);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "appControllerUserUpdatedSavedTips:", *(_QWORD *)(a1 + 32));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

void __33__TPSAppController_updateContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t (*__ptr32 *v9)();
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  TPSCollectionSection *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[7];
  _QWORD block[4];
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint8_t buf[4];
  id v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setLastFetchError:", v6);
  v8 = MEMORY[0x1E0C809B0];
  v9 = &off_19A99A000;
  if (!v6)
  {
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "language");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "language");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqualToString:", v13);
    objc_msgSend(v5, "collectionMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tipMap");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featuredCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orderedCollections");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(WeakRetained, "featuredCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "isEqual:", v16))
      {
        objc_msgSend(WeakRetained, "collections");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "isEqualToArray:", v17))
        {
          objc_msgSend(WeakRetained, "tipMap");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v38) = objc_msgSend(v39, "isEqualToDictionary:", v18);

          v9 = &off_19A99A000;
          +[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stop");

          v8 = MEMORY[0x1E0C809B0];
          if ((v38 & 1) != 0)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_14:
          +[TPSLogger default](TPSLogger, "default", v38);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19A906000, v21, OS_LOG_TYPE_DEFAULT, "Difference found with cache content, refreshing...", buf, 2u);
          }

          +[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v13;
          objc_msgSend(v22, "setLanguageCode:", v13);

          objc_msgSend(*(id *)(a1 + 32), "contentWillUpdate");
          objc_msgSend(v5, "assetSizes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setAssetSizes:", v23);

          objc_msgSend(WeakRetained, "setCollectionMap:", v15);
          objc_msgSend(v5, "collectionSectionMap");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setCollectionSectionMap:", v24);

          objc_msgSend(WeakRetained, "setTipMap:", v39);
          +[TPSCommonDefines checklistCollectionIdentifier](TPSCommonDefines, "checklistCollectionIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setChecklistCollection:", v26);

          objc_msgSend(WeakRetained, "setFeaturedCollection:", v41);
          objc_msgSend(WeakRetained, "setCollections:", v40);
          objc_msgSend(v5, "collectionSections");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setCollectionSections:", v27);

          objc_msgSend(v5, "userGuides");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setUserGuides:", v28);

          v9 = &off_19A99A000;
          if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
          {
            objc_msgSend(WeakRetained, "collectionSections");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
            {
              objc_msgSend(v5, "orderedCollections");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "count"))
              {
                v31 = -[TPSCollectionSection initWithIdentifier:text:collections:]([TPSCollectionSection alloc], "initWithIdentifier:text:collections:", CFSTR("Blank"), &stru_1E39608B8, v30);
                v51[0] = v31;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "setCollectionSections:", v32);

                v8 = MEMORY[0x1E0C809B0];
                v9 = &off_19A99A000;
              }

            }
          }
          block[0] = v8;
          block[1] = *((_QWORD *)v9 + 39);
          block[2] = __33__TPSAppController_updateContent__block_invoke_22;
          block[3] = &unk_1E395C090;
          v44 = v15;
          v33 = v13;
          v35 = *(_QWORD *)(a1 + 32);
          v34 = *(_QWORD *)(a1 + 40);
          v45 = v33;
          v46 = v35;
          v47 = WeakRetained;
          v48 = v34;
          dispatch_async(MEMORY[0x1E0C80D38], block);
          objc_msgSend(*(id *)(a1 + 32), "updateSavedTipsContent");

          goto LABEL_22;
        }

        v8 = MEMORY[0x1E0C809B0];
      }

    }
    +[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stop");

    goto LABEL_14;
  }
  +[TPSLogger default](TPSLogger, "default");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v6;
    _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_DEFAULT, "Tips feed load failed with %@", buf, 0xCu);
  }

  if (+[TPSNetworkPathMonitor isNetworkError:](TPSNetworkPathMonitor, "isNetworkError:", v6))
  {
    +[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "start");
LABEL_23:

  }
  objc_msgSend(WeakRetained, "setUpdatingContent:", 0, v38);
  objc_msgSend(WeakRetained, "setContentHasLoaded:", 1);
  v42[0] = v8;
  v42[1] = *((_QWORD *)v9 + 39);
  v42[2] = __33__TPSAppController_updateContent__block_invoke_24;
  v42[3] = &unk_1E395C0B8;
  v37 = *(_QWORD *)(a1 + 32);
  v36 = *(_QWORD *)(a1 + 40);
  v42[5] = WeakRetained;
  v42[6] = v36;
  v42[4] = v37;
  dispatch_async(MEMORY[0x1E0C80D38], v42);

}

- (NSArray)collectionSections
{
  return self->_collectionSections;
}

- (void)updateSavedTipsContent
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TPSAppController_updateSavedTipsContent__block_invoke;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setUserGuides:(id)a3
{
  objc_storeStrong((id *)&self->_userGuides, a3);
}

- (void)setTipMap:(id)a3
{
  objc_storeStrong((id *)&self->_tipMap, a3);
}

- (void)setSavedTipsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_savedTipsCollection, a3);
}

- (void)setLastFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_lastFetchError, a3);
}

- (void)setFeaturedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_featuredCollection, a3);
}

- (void)setContentHasLoaded:(BOOL)a3
{
  self->_contentHasLoaded = a3;
}

- (void)setCollections:(id)a3
{
  objc_storeStrong((id *)&self->_collections, a3);
}

- (void)setCollectionSections:(id)a3
{
  objc_storeStrong((id *)&self->_collectionSections, a3);
}

- (void)setCollectionSectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionSectionMap, a3);
}

- (void)setCollectionMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionMap, a3);
}

- (void)setChecklistCollection:(id)a3
{
  objc_storeStrong((id *)&self->_checklistCollection, a3);
}

- (void)setAssetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_assetSizes, a3);
}

- (NSArray)tips
{
  void *v2;
  void *v3;

  -[TPSAppController tipMap](self, "tipMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (TPSCollection)savedTipsCollection
{
  return self->_savedTipsCollection;
}

void __34__TPSAppController_sharedInstance__block_invoke()
{
  TPSAppController *v0;
  void *v1;

  v0 = objc_alloc_init(TPSAppController);
  v1 = (void *)sharedInstance_gTPSAppController;
  sharedInstance_gTPSAppController = (uint64_t)v0;

}

- (TPSAppController)init
{
  TPSAppController *v2;
  void *v3;
  int v4;
  TPSFullTipContentManager *v5;
  TPSFullTipContentManager *fullTipContentManager;
  uint64_t v7;
  NSHashTable *delegates;
  uint64_t v9;
  NSUUID *networkMonitorToken;
  void *v11;
  NSUUID *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TPSAppController;
  v2 = -[TPSAppController init](&v20, sel_init);
  if (v2)
  {
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tipsAccessAllowed");

    if (v4)
    {
      v5 = objc_alloc_init(TPSFullTipContentManager);
      fullTipContentManager = v2->_fullTipContentManager;
      v2->_fullTipContentManager = v5;

      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
      v7 = objc_claimAutoreleasedReturnValue();
      delegates = v2->_delegates;
      v2->_delegates = (NSHashTable *)v7;

      v2->_alwaysShowIntro = +[TPSDefaultsManager showCollectionIntro](TPSDefaultsManager, "showCollectionIntro");
      objc_initWeak(&location, v2);
      v9 = objc_opt_new();
      networkMonitorToken = v2->_networkMonitorToken;
      v2->_networkMonitorToken = (NSUUID *)v9;

      +[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v2->_networkMonitorToken;
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __24__TPSAppController_init__block_invoke;
      v17 = &unk_1E395C068;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v11, "addObserverForKey:using:", v12, &v14);

      -[TPSAppController reloadAppGroupDefaults](v2, "reloadAppGroupDefaults", v14, v15, v16, v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)reloadAppGroupDefaults
{
  NSUserDefaults *v3;
  NSUserDefaults *appGroupDefaults;
  id v5;

  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadAppGroupDefaults");
  v3 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue();
  appGroupDefaults = self->_appGroupDefaults;
  self->_appGroupDefaults = v3;

}

- (NSArray)userGuides
{
  return self->_userGuides;
}

- (BOOL)contentHasLoaded
{
  return self->_contentHasLoaded;
}

- (TPSCollection)checklistCollection
{
  return self->_checklistCollection;
}

- (void)updateContent
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  id v10;
  id location;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[TPSAppController updatingContent](self, "updatingContent"))
  {
    -[TPSAppController setUpdatingContent:](self, "setUpdatingContent:", 1);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    -[TPSAppController delegateEnumerator](self, "delegateEnumerator");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = (id)v17[5];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v13;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "appController:loadingContent:", self, -[TPSAppController updatingContent](self, "updatingContent"));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
      }
      while (v4);
    }

    objc_initWeak(&location, self);
    -[TPSAppController fullTipContentManager](self, "fullTipContentManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__TPSAppController_updateContent__block_invoke;
    v9[3] = &unk_1E395C0E0;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    v9[5] = &v16;
    objc_msgSend(v8, "contentWithCompletionHandler:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v16, 8);

  }
}

- (BOOL)updatingContent
{
  return self->_updatingContent;
}

- (void)setUpdatingContent:(BOOL)a3
{
  self->_updatingContent = a3;
}

- (TPSFullTipContentManager)fullTipContentManager
{
  return self->_fullTipContentManager;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TPSAppController delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)delegateEnumerator
{
  void *v2;
  void *v3;
  void *v4;

  -[TPSAppController delegates](self, "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_2 != -1)
    dispatch_once(&sharedInstance_predicate_2, &__block_literal_global_10);
  return (id)sharedInstance_gTPSAppController;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[TPSAppController fullTipContentManager](self, "fullTipContentManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  +[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAppController networkMonitorToken](self, "networkMonitorToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserverForKey:", v5);

  v6.receiver = self;
  v6.super_class = (Class)TPSAppController;
  -[TPSAppController dealloc](&v6, sel_dealloc);
}

void __24__TPSAppController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "networkStateDidChange:", a2);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TPSAppController delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)tipsForCollection:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "tipIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[TPSAppController tipMap](self, "tipMap", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)assetConfigurationForAssets:(id)a3 language:(id)a4 userInterfaceStyle:(int64_t)a5 assetFileInfoManager:(id)a6
{
  TPSAssetsConfiguration *v6;
  id v10;
  id v11;
  id v12;

  v6 = 0;
  if (a3 && a4)
  {
    v10 = a6;
    v11 = a4;
    v12 = a3;
    v6 = -[TPSAssetsConfiguration initWithAssets:language:userInterfaceStyle:assetFileInfoManager:]([TPSAssetsConfiguration alloc], "initWithAssets:language:userInterfaceStyle:assetFileInfoManager:", v12, v11, a5, v10);

  }
  return v6;
}

- (void)removeAllContent
{
  -[TPSAppController setCollectionMap:](self, "setCollectionMap:", 0);
  -[TPSAppController setCollectionSectionMap:](self, "setCollectionSectionMap:", 0);
  -[TPSAppController setTipMap:](self, "setTipMap:", 0);
  -[TPSAppController setChecklistCollection:](self, "setChecklistCollection:", 0);
  -[TPSAppController setFeaturedCollection:](self, "setFeaturedCollection:", 0);
  -[TPSAppController setCollections:](self, "setCollections:", 0);
  -[TPSAppController setCollectionSections:](self, "setCollectionSections:", 0);
  -[TPSAppController setUserGuides:](self, "setUserGuides:", 0);
}

void __33__TPSAppController_updateContent__block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLanguage:", v5);

  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activatedCollections:", v4);

  objc_msgSend(*(id *)(a1 + 48), "delegateEnumerator");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "appControllerContentUpdated:", *(_QWORD *)(a1 + 56), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

void __33__TPSAppController_updateContent__block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegateEnumerator");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "appController:loadingContent:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "updatingContent", (_QWORD)v11));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)contentForVariant:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TPSAppController fullTipContentManager](self, "fullTipContentManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentForVariant:completionHandler:", v7, v6);

}

- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TPSAppController fullTipContentManager](self, "fullTipContentManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithAssetsConfiguration:completionHandler:", v7, v6);

}

- (id)mainUserGuide
{
  void *v2;
  void *v3;

  -[TPSAppController userGuides](self, "userGuides");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userGuideWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    v16 = 0;
    -[TPSAppController userGuides](self, "userGuides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__TPSAppController_userGuideWithIdentifier___block_invoke;
    v8[3] = &unk_1E395C108;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __44__TPSAppController_userGuideWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", *(_QWORD *)(a1 + 32));

  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;

}

- (id)collectionIdentifierForTipIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[TPSAppController tipForIdentifier:](self, "tipForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionIdentifierToUseForCollectionIdentifiers:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v6)
LABEL_3:
    v6 = CFSTR("Unknown");

  return v6;
}

- (id)tipForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TPSAppController tipMap](self, "tipMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tipForIdentifier:(id)a3 includingCorrelation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[TPSAppController tipForIdentifier:](self, "tipForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && v4)
  {
    -[TPSAppController tipForCorrelationIdentifier:](self, "tipForCorrelationIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)tipForCorrelationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[TPSAppController tipMap](self, "tipMap", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "correlationID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if ((v12 & 1) != 0)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tipForVariantIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TPSAppController tipMap](self, "tipMap", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "variantID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)collectionStatusForCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionStatusForCollectionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createSavedTipsCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TPSMetadata *v8;
  TPSAssets *v9;
  TPSAssets *v10;
  TPSCollection *v11;

  v3 = a3;
  +[TPSCommonDefines tipsCoreFrameworkBundle](TPSCommonDefines, "tipsCoreFrameworkBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVED_COLLECTION_TITLE"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVED_COLLECTION_TEXT"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = -[TPSMetadata initWithDictionary:]([TPSMetadata alloc], "initWithDictionary:", v7);
  v9 = -[TPSAssets initWithSymbolId:symbolColor:symbolSize:alt:gradientColorStrings:]([TPSAssets alloc], "initWithSymbolId:symbolColor:symbolSize:alt:gradientColorStrings:", CFSTR("bookmark.fill"), 0, 0, 0, 0);
  v10 = -[TPSAssets initWithSymbolId:symbolColor:symbolSize:alt:gradientColorStrings:]([TPSAssets alloc], "initWithSymbolId:symbolColor:symbolSize:alt:gradientColorStrings:", CFSTR("bookmark"), 0, 0, 0, &unk_1E3978638);
  v11 = -[TPSCollection initWithIdentifier:title:text:metadata:tocAssets:collectionAssets:tipIdentifiers:]([TPSCollection alloc], "initWithIdentifier:title:text:metadata:tocAssets:collectionAssets:tipIdentifiers:", CFSTR("SavedTips"), v5, v6, v8, v9, v10, v3);

  return v11;
}

- (id)collectionSectionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TPSAppController collectionSectionMap](self, "collectionSectionMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessoriesSection:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E3978650, "containsObject:", v3);

  return v4;
}

- (BOOL)isExploreHardwareSection:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E3978668, "containsObject:", v3);

  return v4;
}

- (BOOL)isAppleWatchSection:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E3978680, "containsObject:", v3);

  return v4;
}

- (void)tipViewed:(id)a3 collectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[TPSAppController fullTipContentManager](self, "fullTipContentManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markTipViewed:", v6);

    -[TPSAppController delegateEnumerator](self, "delegateEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "appControllerTipViewed:tipIdentifier:collectionIdentifier:", self, v6, v7);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)collectionIdentifierViewed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewedCollection:", v6);

    -[TPSAppController fullTipContentManager](self, "fullTipContentManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeNotificationForIdentifier:", v6);

  }
}

- (void)removeNotificationForIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[TPSAppController fullTipContentManager](self, "fullTipContentManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeNotificationForIdentifier:", v5);

  }
}

- (void)networkStateDidChange:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[TPSAppController updateContent](self, "updateContent");
    -[TPSAppController delegateEnumerator](self, "delegateEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "appControllerNetworkStateDidChangeToReachable:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)alwaysShowIntro
{
  return self->_alwaysShowIntro;
}

- (void)setAlwaysShowIntro:(BOOL)a3
{
  self->_alwaysShowIntro = a3;
}

- (BOOL)appInBackground
{
  return self->_appInBackground;
}

- (void)setAppInBackground:(BOOL)a3
{
  self->_appInBackground = a3;
}

- (NSUserDefaults)appGroupDefaults
{
  return self->_appGroupDefaults;
}

- (void)setAppGroupDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_appGroupDefaults, a3);
}

- (void)setFullTipContentManager:(id)a3
{
  objc_storeStrong((id *)&self->_fullTipContentManager, a3);
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (NSError)lastFetchError
{
  return self->_lastFetchError;
}

- (NSDictionary)collectionSectionMap
{
  return self->_collectionSectionMap;
}

- (TPSSavedTipsManager)savedTipsManager
{
  return self->_savedTipsManager;
}

- (void)setSavedTipsManager:(id)a3
{
  objc_storeStrong((id *)&self->_savedTipsManager, a3);
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (NSUUID)networkMonitorToken
{
  return self->_networkMonitorToken;
}

- (void)setNetworkMonitorToken:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitorToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorToken, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_savedTipsManager, 0);
  objc_storeStrong((id *)&self->_tipMap, 0);
  objc_storeStrong((id *)&self->_collectionSectionMap, 0);
  objc_storeStrong((id *)&self->_collectionMap, 0);
  objc_storeStrong((id *)&self->_lastFetchError, 0);
  objc_storeStrong((id *)&self->_userGuides, 0);
  objc_storeStrong((id *)&self->_collectionSections, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_savedTipsCollection, 0);
  objc_storeStrong((id *)&self->_featuredCollection, 0);
  objc_storeStrong((id *)&self->_checklistCollection, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_fullTipContentManager, 0);
  objc_storeStrong((id *)&self->_appGroupDefaults, 0);
}

- (BOOL)hasLocalVariant:(id)a3
{
  id v4;
  TPSAppController *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_correlationID);
  if (v6)
  {
    v7 = -[TPSAppController tipForCorrelationIdentifier:](v5, sel_tipForCorrelationIdentifier_, v6);

    LOBYTE(v6) = v7 != 0;
  }

  return (char)v6;
}

- (void)logSharedTipDisplayed:(id)a3 isEligible:(BOOL)a4
{
  TPSTip *v6;
  TPSAppController *v7;

  v6 = (TPSTip *)a3;
  v7 = self;
  TPSAppController.logSharedTipDisplayed(tip:isEligible:)(v6, a4);

}

- (void)logInvalidSharedTipDisplayed:(id)a3
{
  id v4;
  TPSAppController *v5;

  v4 = a3;
  v5 = self;
  _sSo16TPSAppControllerC8TipsCoreE28logInvalidSharedTipDisplayed3tipySo6TPSTipC_tF_0(v4);

}

@end
