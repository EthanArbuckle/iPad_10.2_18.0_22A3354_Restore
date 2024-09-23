@implementation VUIFeatureManager

- (id)osFeatureFlagsJSON
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("pearl"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("hublot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("monaco"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("sports_register_init2"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("sports_tier_manager"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("sctie"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("ludicolo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("barrette_menu"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("tractor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("coral"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("garnet"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("dakar"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("chiolite"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("peppermint"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("swiftui_sports_scoreboard"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("stratocaster"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("cayman718"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("nebula"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("metate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("mocha"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("nyctosaurus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("diamond"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("sports_app_live_activities"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("jintasaur"));

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  return (id)sharedInstance_sharedSettings;
}

void __35__VUIFeatureManager_sharedInstance__block_invoke()
{
  VUIFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIFeatureManager);
  v1 = (void *)sharedInstance_sharedSettings;
  sharedInstance_sharedSettings = (uint64_t)v0;

}

- (VUIFeatureManager)init
{
  VUIFeatureManager *v2;
  VUIFeatureManager *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSDictionary *features;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIFeatureManager;
  v2 = -[VUIFeatureManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VUIFeatureManager _allFeatures](v2, "_allFeatures");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __25__VUIFeatureManager_init__block_invoke;
    v10[3] = &unk_1E9F2B798;
    v11 = v5;
    v6 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = objc_msgSend(v6, "copy");
    features = v3->_features;
    v3->_features = (NSDictionary *)v7;

  }
  return v3;
}

- (id)_allFeatures
{
  return (id)MEMORY[0x1E0C9AA70];
}

void __25__VUIFeatureManager_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  VUIFeatureFlag *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[VUIFeatureFlag initWithFeatureDict:]([VUIFeatureFlag alloc], "initWithFeatureDict:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
}

- (id)availableFeatures
{
  id v3;
  NSDictionary *features;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  features = self->_features;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__VUIFeatureManager_availableFeatures__block_invoke;
  v8[3] = &unk_1E9F2B7C0;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](features, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __38__VUIFeatureManager_availableFeatures__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isAvailableForOS"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)isFeatureEnabled:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSDictionary objectForKey:](self->_features, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "enabled");
  else
    v5 = 0;

  return v5;
}

- (void)setFeatureValue:(BOOL)a3 forFeature:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_features, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setEnabled:", v4);
    v5 = v6;
  }

}

+ (BOOL)isUniquelyiPadEnabled
{
  return _os_feature_enabled_impl()
      && _os_feature_enabled_impl()
      && +[VUIDevice isPad](VUIDevice, "isPad");
}

- (NSDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

@end
