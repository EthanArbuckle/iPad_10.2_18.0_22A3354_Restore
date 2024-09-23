@implementation SSSearchInAppSectionBuilder

+ (id)supportedBundleId
{
  __CFString *v3;
  objc_super v5;

  if ((isMacOS() & 1) != 0)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___SSSearchInAppSectionBuilder;
    objc_msgSendSuper2(&v5, sel_supportedBundleId);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("com.apple.searchd.searchThroughSuggestions");
  }
  return v3;
}

- (id)buildSection
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[SSSearchInAppSectionBuilder shouldSkipSection](self, "shouldSkipSection"))
    return 0;
  v4 = (void *)objc_opt_new();
  -[SSSearchInAppSectionBuilder bundleIdentifiersForHiddenSections](self, "bundleIdentifiersForHiddenSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSSearchInAppSectionBuilder searchInAppInfo](self, "searchInAppInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  -[SSSectionBuilder queryContext](self, "queryContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchString");
  v12 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v13 = 0;
    do
    {
      if ((unint64_t)objc_msgSend(v4, "count") >= 4)
        break;
      objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13 + 1;
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "containsObject:", v14)
        && (SSScreenTimeStatusForBundleIDWithCompletionHandler(v14, 0) & 1) == 0)
      {
        +[SSSearchInAppResultBuilder buildResultWithAppName:appBundleId:searchString:searchInAppType:](SSSearchInAppResultBuilder, "buildResultWithAppName:appBundleId:searchString:searchInAppType:", v16, v14, v12, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

      }
      v13 = v15 + 1;
    }
    while (objc_msgSend(v10, "count") > v13);
  }
  objc_msgSend((id)objc_opt_class(), "cachedPreferredStoreBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && (SSScreenTimeStatusForBundleIDWithCompletionHandler(v18, 0) & 1) == 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v19, 1, 0);
    objc_msgSend(v20, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSSearchInAppResultBuilder buildResultWithAppName:appBundleId:searchString:searchInAppType:](SSSearchInAppResultBuilder, "buildResultWithAppName:appBundleId:searchString:searchInAppType:", v21, v19, v12, objc_msgSend(v19, "isEqual:", CFSTR("com.apple.AppStore")) ^ 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

  }
  v37 = (void *)v12;
  if (buildSection_onceToken != -1)
    dispatch_once(&buildSection_onceToken, &__block_literal_global_2);
  v36 = v19;
  if (buildSection_localizedMapsName
    && (SSScreenTimeStatusForBundleIDWithCompletionHandler(CFSTR("com.apple.Maps"), 0) & 1) == 0)
  {
    +[SSSearchInAppResultBuilder buildResultWithAppName:appBundleId:searchString:searchInAppType:](SSSearchInAppResultBuilder, "buildResultWithAppName:appBundleId:searchString:searchInAppType:", buildSection_localizedMapsName, CFSTR("com.apple.Maps"), v12, 0, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = v4;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[SSSectionBuilder queryContext](self, "queryContext", v36);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setQueryId:", objc_msgSend(v30, "queryIdent"));

        objc_msgSend(v29, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.searchThroughSuggestions"));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v24, "count"))
  {
    v31 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setIdentifier:", v33);

    objc_msgSend(v31, "setBundleIdentifier:", CFSTR("com.apple.searchd.searchThroughSuggestions"));
    objc_msgSend(v31, "setResults:", v24);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("FOUND_IN_APPS"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTitle:", v35);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

void __43__SSSearchInAppSectionBuilder_buildSection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Maps"), 1, 0);
  objc_msgSend(v2, "localizedName");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)buildSection_localizedMapsName;
  buildSection_localizedMapsName = v0;

}

+ (id)cachedPreferredStoreBundleIdentifier
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)s_cachedPreferredStoreBundleID;
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(v2, "updateCachedPreferredStoreBundleID");
  return v3;
}

+ (void)updateCachedPreferredStoreBundleID
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (updateCachedPreferredStoreBundleID_onceToken != -1)
    dispatch_once(&updateCachedPreferredStoreBundleID_onceToken, block);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_3;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  dispatch_async((dispatch_queue_t)updateCachedPreferredStoreBundleID_queue, v4);
}

void __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("SSMarketplaceKitUtilities fetching queue", v2);
  v4 = (void *)updateCachedPreferredStoreBundleID_queue;
  updateCachedPreferredStoreBundleID_queue = (uint64_t)v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSMarketplaceKitUtilities distributorPriorityListChangedNotifationName](_TtC17SpotlightServices25SSMarketplaceKitUtilities, "distributorPriorityListChangedNotifationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_2;
  v8[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, v8);

}

uint64_t __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = (void *)s_cachedPreferredStoreBundleID;
  s_cachedPreferredStoreBundleID = 0;

  objc_sync_exit(v2);
  return objc_msgSend(*(id *)(a1 + 32), "updateCachedPreferredStoreBundleID");
}

void __65__SSSearchInAppSectionBuilder_updateCachedPreferredStoreBundleID__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = s_cachedPreferredStoreBundleID;
  objc_sync_exit(v2);

  if (!v3)
  {
    +[SSMarketplaceKitUtilities distributorPriorityList](_TtC17SpotlightServices25SSMarketplaceKitUtilities, "distributorPriorityList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    v7 = (void *)s_cachedPreferredStoreBundleID;
    s_cachedPreferredStoreBundleID = (uint64_t)v5;
    v8 = v5;

    objc_sync_exit(v6);
  }
}

- (BOOL)shouldSkipSection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[SSSectionBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    SSDefaultsGetResources();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("9fb9d89e-6213-484c-9123-fbe1626207a7"));
    -[SSSectionBuilder queryContext](self, "queryContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logForTrigger:queryID:", v7, objc_msgSend(v8, "queryIdent"));

  }
  v9 = SSShowSearchInApps() ^ 1;
  if (v5)
    return 1;
  else
    return v9;
}

- (NSSet)bundleIdentifiersForHiddenSections
{
  return self->_bundleIdentifiersForHiddenSections;
}

- (void)setBundleIdentifiersForHiddenSections:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifiersForHiddenSections, a3);
}

- (NSArray)searchInAppInfo
{
  return self->_searchInAppInfo;
}

- (void)setSearchInAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInAppInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInAppInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersForHiddenSections, 0);
}

@end
