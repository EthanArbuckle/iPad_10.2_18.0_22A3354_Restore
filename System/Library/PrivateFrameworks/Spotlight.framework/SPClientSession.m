@implementation SPClientSession

void __33__SPClientSession_contentFilters__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)sCloudController;
  if ((objc_msgSend(v2, "hasProperNetworkConditionsToPlayMedia") & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "canShowCloudVideo") ^ 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "canShowCloudMusic") ^ 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (SPClientSession)init
{
  SPClientSession *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPClientSession;
  v2 = -[SPClientSession init](&v7, sel_init);
  if (v2)
  {
    dispatch_async((dispatch_queue_t)sUnBlockMainQueue, &__block_literal_global_155);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)siriSettingsDidChange, (CFStringRef)*MEMORY[0x24BE094A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)siriSettingsDidChange, CFSTR("AFOutputLanguageDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (runningInSpotlight)
      v5 = -1;
    v2->_maxUISuggestions = v5;
  }
  return v2;
}

void __29__SPClientSession_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sCloudController;
  sCloudController = v0;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_58);

}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  NSObject *v8;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE849B0]))
  {
    runningInSpotlight = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    runningInSpotlight = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  }
  sClientRankAndBlend = _os_feature_enabled_impl();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("unblock main queue", v8);
  v7 = (void *)sUnBlockMainQueue;
  sUnBlockMainQueue = (uint64_t)v6;

  dispatch_async((dispatch_queue_t)sUnBlockMainQueue, &__block_literal_global_1);
}

- (void)activate
{
  void *v3;
  void *v4;
  id v5;

  SSScreenTimeStatusClearCache();
  if (sClientRankAndBlend)
  {
    +[SPFederatedQueryTask activate](SPFederatedQueryTask, "activate");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE84960], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activate:", &__block_literal_global_72);

  }
  +[SPPARSession spotlightPARSession](SPPARSession, "spotlightPARSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParsecFeedbackListener:", v5);

  self->_contentFilter = -[SPClientSession contentFilters](self, "contentFilters");
}

- (int64_t)contentFilters
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  int64_t v6;
  _QWORD block[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = sUnBlockMainQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SPClientSession_contentFilters__block_invoke;
  block[3] = &unk_24F01B9A0;
  v10 = &v16;
  v11 = &v12;
  v9 = v2;
  v4 = v2;
  dispatch_async(v3, block);
  v5 = dispatch_time(0, 200000000);
  v6 = 0;
  if (!dispatch_group_wait(v4, v5))
    v6 = *((unsigned __int8 *)v13 + 24) | (2 * *((unsigned __int8 *)v17 + 24));

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

uint64_t __27__SPClientSession_activate__block_invoke()
{
  return 0;
}

- (void)setMaxUISuggestions:(int64_t)a3
{
  self->_maxUISuggestions = a3;
}

void __29__SPClientSession_initialize__block_invoke_2()
{

}

- (id)queryTaskWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  NSObject *v38;
  os_log_type_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __objc2_class **v43;
  void *v44;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!(objc_msgSend(v5, "length") | v7))
  {
    v27 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v4, "searchEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCEB8];
  SPDomains();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "allowInternet") & 1) == 0)
  {
    objc_msgSend(v12, "removeObject:", &unk_24F0250B8);
    objc_msgSend(v12, "removeObject:", &unk_24F0250D0);
  }
  if ((objc_msgSend(v9, "isPhotosEntitySearch") & 1) != 0 || objc_msgSend(v9, "isContactEntitySearch"))
  {
    objc_msgSend(v12, "removeAllObjects");
    objc_msgSend(v12, "addObject:", &unk_24F0250E8);
  }
  v46 = v12;
  objc_msgSend(v4, "setSearchDomains:", v12);
  SPGetDisabledDomains();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabledDomains:", v14);

  v15 = v4;
  if (_os_feature_enabled_impl())
  {
    SPLogForSPLogCategoryDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v16, v17, "[ProtectedApps] on", buf, 2u);
    }

  }
  v47 = v5;
  v18 = (void *)MEMORY[0x24BDBCEF0];
  MEMORY[0x22E2A1990](0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDBCEF0];
  SPGetDisabledAppSet();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "containsObject:", CFSTR("com.apple.DocumentsApp")))
  {
    objc_msgSend(v20, "removeObject:", CFSTR("com.apple.DocumentsApp"));
    objc_msgSend(v20, "addObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    objc_msgSend(v20, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    objc_msgSend(v20, "addObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    objc_msgSend(v20, "addObject:", CFSTR("com.apple.FileProvider.LocalStorage"));
    SPLogForSPLogCategoryDefault();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v24, v25))
    {
      *(_WORD *)buf = 0;
      v26 = "[ProtectedApps] Files app disabled";
LABEL_17:
      _os_log_impl(&dword_2279CC000, v24, v25, v26, buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v20, "removeObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    objc_msgSend(v20, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    objc_msgSend(v20, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    objc_msgSend(v20, "removeObject:", CFSTR("com.apple.FileProvider.LocalStorage"));
    SPLogForSPLogCategoryDefault();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v24, v25))
    {
      *(_WORD *)buf = 0;
      v26 = "[ProtectedApps] Files app enabled";
      goto LABEL_17;
    }
  }

  objc_msgSend(v20, "allObjects");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  v30 = MEMORY[0x24BDBD1A8];
  if (v28)
    v31 = v28;
  else
    v31 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v15, "setDisabledBundles:", v31);

  objc_msgSend(v23, "allObjects");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = v32;
  else
    v34 = v30;
  objc_msgSend(v15, "setDisabledApps:", v34);

  SPLogForSPLogCategoryDefault();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v35, v36))
  {
    objc_msgSend(v15, "disabledBundles");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v37;
    _os_log_impl(&dword_2279CC000, v35, v36, "[ProtectedApps] Disabled bundles in query context: %@", buf, 0xCu);

  }
  SPLogForSPLogCategoryDefault();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v38, v39))
  {
    objc_msgSend(v15, "disabledApps");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v40;
    _os_log_impl(&dword_2279CC000, v38, v39, "[ProtectedApps] Disabled apps in query context: %@", buf, 0xCu);

  }
  if (v7)
  {
    if ((objc_msgSend(v9, "isAppEntitySearch") & 1) != 0
      || (objc_msgSend(v9, "isPhotosEntitySearch") & 1) != 0
      || objc_msgSend(v9, "isContactEntitySearch"))
    {
      v41 = 50;
    }
    else
    {
      v41 = 13;
    }
  }
  else
  {
    v41 = 13;
  }
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84988]), "initWithSearchQueryContext:", v15);
  objc_msgSend(v42, "setMaxCount:", v41);
  objc_msgSend(v42, "setGrouped:", 1);
  objc_msgSend(v42, "setContentFilters:", self->_contentFilter);
  objc_msgSend(v42, "setInfinitePatience:", self->_infinitePatience);
  if (sClientRankAndBlend)
    v43 = &off_24F01A2F8;
  else
    v43 = off_24F01A308;
  v27 = (void *)objc_msgSend(objc_alloc(*v43), "initForSession:withQuery:", self, v42);
  objc_msgSend(v27, "setWhyQuery:", objc_msgSend(v15, "whyQuery"));
  objc_msgSend(v27, "setQueryKind:", objc_msgSend(v15, "queryKind"));
  objc_msgSend(v27, "setMaxUISuggestions:", -[SPClientSession maxUISuggestions](self, "maxUISuggestions"));
  -[SPClientSession currentQueryContext](self, "currentQueryContext");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPreviousQueryContext:", v44);

  -[SPClientSession setCurrentQueryContext:](self, "setCurrentQueryContext:", v15);
  v5 = v47;
LABEL_38:

  return v27;
}

- (void)setLastSections:(id)a3 forQuery:(id)a4
{
  SPSearchQuery *v6;
  NSArray *v7;
  NSArray *lastSections;
  NSArray *v9;
  SPSearchQuery *lastQuery;

  v6 = (SPSearchQuery *)a4;
  v7 = (NSArray *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_sectionsLock);
  lastSections = self->_lastSections;
  self->_lastSections = v7;
  v9 = v7;

  lastQuery = self->_lastQuery;
  self->_lastQuery = v6;

  os_unfair_lock_unlock(&self->_sectionsLock);
}

- (id)copyStaleSectionsForQuery:(id)a3
{
  id v4;
  os_unfair_lock_s *p_sectionsLock;
  NSArray *v6;
  SPSearchQuery *v7;
  NSArray *v8;

  v4 = a3;
  p_sectionsLock = &self->_sectionsLock;
  os_unfair_lock_lock(&self->_sectionsLock);
  v6 = self->_lastSections;
  v7 = self->_lastQuery;
  os_unfair_lock_unlock(p_sectionsLock);
  if (v4 && -[SPSearchQuery plausiblyMatchesQuery:](v7, "plausiblyMatchesQuery:", v4))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_setSearchDomains:(id)a3
{
  NSArray *v4;
  NSObject *v5;
  _BYTE *v6;
  os_log_type_t v7;
  void *v8;
  NSArray *v9;
  NSObject *p_super;
  NSArray *v11;
  NSArray *searchDomains;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSArray *v14;
  NSArray *v15;
  os_log_type_t v16;
  NSArray *v17;
  char v18;
  int v20;
  NSArray *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (_BYTE *)MEMORY[0x24BE84B00];
  v7 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v5, v7))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_impl(&dword_2279CC000, v5, v7, "Setting search domains %@", (uint8_t *)&v20, 0xCu);
  }

  v8 = (void *)-[NSArray copy](self->_searchDomains, "copy");
  if (v4)
  {
    v9 = v4;
    p_super = &self->_searchDomains->super;
    self->_searchDomains = v9;
  }
  else
  {
    SPDomains();
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    searchDomains = self->_searchDomains;
    self->_searchDomains = v11;

    if (!self->_observersAdded)
    {
      self->_observersAdded = 1;
      notify_register_check("com.apple.spotlightui.prefschanged", &self->_prefsToken);
      v20 = 0;
      notify_check(self->_prefsToken, &v20);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_SpotlightInternetDomainsChangedCallback, (CFStringRef)*MEMORY[0x24BE84B08], 0, CFNotificationSuspensionBehaviorDrop);
    }
    SPDomains();
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_searchDomains;
    self->_searchDomains = v14;

    SPLogForSPLogCategoryDefault();
    p_super = objc_claimAutoreleasedReturnValue();
    v16 = *v6 ^ 1;
    if (os_log_type_enabled(p_super, v16))
    {
      v17 = self->_searchDomains;
      v20 = 138412290;
      v21 = v17;
      _os_log_impl(&dword_2279CC000, p_super, v16, "Setting search domains to %@", (uint8_t *)&v20, 0xCu);
    }
  }

  v18 = -[NSArray isEqual:](self->_searchDomains, "isEqual:", v8);
  return v18 ^ 1;
}

- (NSArray)disabledBundleIds
{
  void *v3;
  void *v4;
  int check;

  if (self->_observersAdded)
  {
    check = 0;
    notify_check(self->_prefsToken, &check);
    if (check)
      -[SPClientSession _setSearchDomains:](self, "_setSearchDomains:", 0);
  }
  MEMORY[0x22E2A1990](0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)preheat
{
  id v2;

  if (sClientRankAndBlend)
  {
    +[SPFederatedQueryTask preheat](SPFederatedQueryTask, "preheat");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE84960], "sharedConnection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preheat");

  }
}

- (void)deactivate
{
  id v2;

  if (sClientRankAndBlend)
  {
    +[SPFederatedQueryTask deactivate](SPFederatedQueryTask, "deactivate");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE84960], "sharedConnection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deactivate");

  }
}

- (void)finishRanking:(id)a3 blendingDuration:(double)a4 spotlightQueryIntent:(int)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
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
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v38;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(obj);
        v32 = v7;
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
        v9 = (void *)objc_opt_new();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v31 = v8;
        objc_msgSend(v8, "results");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v34;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v34 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v15, "duplicatedItems");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "sp_copyForFeedback");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v17 = 0;
              }
              v18 = objc_alloc(MEMORY[0x24BE84F60]);
              objc_msgSend(v15, "objectForFeedback");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v18, "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v19, 0, v17, 0);

              objc_msgSend(v9, "addObject:", v20);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v12);
        }

        v21 = objc_alloc(MEMORY[0x24BE84FC8]);
        objc_msgSend(v31, "objectForFeedback");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithResults:section:localSectionPosition:personalizationScore:", v9, v22, 0, 0.0);

        objc_msgSend(v29, "addObject:", v23);
        v7 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v30);
  }

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F40]), "initWithSections:blendingDuration:", v29, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v24, "setSpotlightQueryIntent:", a5);
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "didRankSections:", v24);

}

+ (void)retrieveFirstTimeExperienceTextWithReply:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = v3;
  if (sClientRankAndBlend)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke;
    v6[3] = &unk_24F01BA10;
    v7 = v3;
    +[SPParsecQuery getFTEStringsWithReply:](SPParsecQuery, "getFTEStringsWithReply:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE84960], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "retrieveFirstTimeExperienceTextWithReply:", v4);

  }
}

void __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[SPQueryTask queryQueue](SPQueryTask, "queryQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke_2;
  block[3] = &unk_24F01B9E8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = *(id *)(a1 + 32);
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_async(v13, block);

}

void __60__SPClientSession_retrieveFirstTimeExperienceTextWithReply___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("FTE_STRING");
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    v2 = *(const __CFString **)(a1 + 32);
  else
    v2 = &stru_24F01C208;
  v12[0] = v2;
  v11[1] = CFSTR("FTE_LEARN_MORE_LINK");
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    v3 = *(const __CFString **)(a1 + 40);
  else
    v3 = &stru_24F01C208;
  v12[1] = v3;
  v11[2] = CFSTR("FTE_CONTINUE_LINK");
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
    v4 = *(const __CFString **)(a1 + 48);
  else
    v4 = &stru_24F01C208;
  v11[3] = CFSTR("FTE_DOMAINS");
  v5 = *(_QWORD *)(a1 + 56);
  if (!v5)
    v5 = MEMORY[0x24BDBD1A8];
  v12[2] = v4;
  v12[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v7, v8))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_2279CC000, v7, v8, "[FTE] Received FTE dictionary in client: %@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (BOOL)infinitePatience
{
  return self->_infinitePatience;
}

- (void)setInfinitePatience:(BOOL)a3
{
  self->_infinitePatience = a3;
}

- (int64_t)maxUISuggestions
{
  return self->_maxUISuggestions;
}

- (SPSearchQueryContext)currentQueryContext
{
  return (SPSearchQueryContext *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentQueryContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentQueryContext, 0);
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_lastSections, 0);
  objc_storeStrong((id *)&self->_searchDomains, 0);
}

@end
