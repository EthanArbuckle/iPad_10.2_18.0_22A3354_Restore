@implementation WLKFeatureEnablement

+ (id)_utsFeatureFlags
{
  id v2;
  WLKFeature *v3;
  WLKFeature *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(WLKFeature);
  -[WLKFeature setName:](v3, "setName:", CFSTR("catch_up_to_live"));
  -[WLKFeature setDomain:](v3, "setDomain:", CFSTR("TVApp"));
  -[WLKFeature setEnabled:](v3, "setEnabled:", 1);
  objc_msgSend(v2, "addObject:", v3);
  if (_os_feature_enabled_impl())
  {
    v4 = objc_alloc_init(WLKFeature);
    -[WLKFeature setName:](v4, "setName:", CFSTR("capella_preview"));
    -[WLKFeature setDomain:](v4, "setDomain:", CFSTR("TVApp"));
    -[WLKFeature setEnabled:](v4, "setEnabled:", 1);
    objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

void __44__WLKFeatureEnablement_tvAppEnabledFeatures__block_invoke(uint64_t a1)
{
  id v2;
  WLKFeature *v3;
  WLKFeature *v4;
  void *v5;
  void *v6;
  WLKFeature *v7;
  WLKFeature *v8;
  WLKFeature *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  WLKFeature *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  WLKFeature *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = objc_alloc_init(WLKFeature);
  -[WLKFeature setName:](v3, "setName:", CFSTR("expanse"));
  -[WLKFeature setDomain:](v3, "setDomain:", CFSTR("TVApp"));
  -[WLKFeature setEnabled:](v3, "setEnabled:", 1);
  v23 = v3;
  objc_msgSend(v2, "addObject:", v3);
  v4 = objc_alloc_init(WLKFeature);
  -[WLKFeature setName:](v4, "setName:", CFSTR("syndication"));
  -[WLKFeature setDomain:](v4, "setDomain:", CFSTR("TVApp"));
  -[WLKFeature setEnabled:](v4, "setEnabled:", 1);
  objc_msgSend(v2, "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_utsFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_canvasFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  v7 = objc_alloc_init(WLKFeature);
  -[WLKFeature setName:](v7, "setName:", CFSTR("teatro"));
  -[WLKFeature setDomain:](v7, "setDomain:", CFSTR("TVApp"));
  -[WLKFeature setEnabled:](v7, "setEnabled:", 1);
  objc_msgSend(v2, "addObject:", v7);

  v8 = objc_alloc_init(WLKFeature);
  -[WLKFeature setName:](v8, "setName:", CFSTR("aether"));
  -[WLKFeature setDomain:](v8, "setDomain:", CFSTR("TVApp"));
  -[WLKFeature setEnabled:](v8, "setEnabled:", 1);
  objc_msgSend(v2, "addObject:", v8);

  if (_os_feature_enabled_impl())
  {
    v9 = objc_alloc_init(WLKFeature);
    -[WLKFeature setName:](v9, "setName:", CFSTR("FederatedV2"));
    -[WLKFeature setDomain:](v9, "setDomain:", CFSTR("TVApp"));
    -[WLKFeature setEnabled:](v9, "setEnabled:", 1);
    objc_msgSend(v2, "addObject:", v9);

  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v22, "objectForKey:", CFSTR("FeatureEnablementAdditionalFlags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
        v16 = objc_alloc_init(WLKFeature);
        -[WLKFeature setName:](v16, "setName:", v15);
        -[WLKFeature setDomain:](v16, "setDomain:", CFSTR("TVApp"));
        -[WLKFeature setEnabled:](v16, "setEnabled:", 1);
        objc_msgSend(v2, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v12);
  }
  objc_msgSend(v2, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = (void *)tvAppEnabledFeatures_appFeatures;
  tvAppEnabledFeatures_appFeatures = v19;

  WLKNetworkingLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = tvAppEnabledFeatures_appFeatures;
    _os_log_impl(&dword_1B515A000, v21, OS_LOG_TYPE_DEFAULT, "Enabled features: %@", buf, 0xCu);
  }

}

+ (id)_canvasFeatureFlags
{
  id v2;
  WLKFeature *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(WLKFeature);
    -[WLKFeature setName:](v3, "setName:", CFSTR("tahoma_keynote"));
    -[WLKFeature setDomain:](v3, "setDomain:", CFSTR("TVApp"));
    -[WLKFeature setEnabled:](v3, "setEnabled:", 1);
    objc_msgSend(v2, "addObject:", v3);

  }
  return v2;
}

+ (id)tvAppEnabledFeatures
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WLKFeatureEnablement_tvAppEnabledFeatures__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tvAppEnabledFeatures_onceToken != -1)
    dispatch_once(&tvAppEnabledFeatures_onceToken, block);
  return (id)tvAppEnabledFeatures_appFeatures;
}

@end
