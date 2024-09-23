@implementation SSQueryIntentManagerConfig

- (void)_clearConfig
{
  NSDictionary *baseConfig;
  SRResources *resources;
  NSSet *v5;
  NSSet *serverDomainDemotionExclusionSet;

  baseConfig = self->_baseConfig;
  self->_baseConfig = 0;

  resources = self->_resources;
  self->_resources = 0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  serverDomainDemotionExclusionSet = self->_serverDomainDemotionExclusionSet;
  self->_serverDomainDemotionExclusionSet = v5;

}

- (BOOL)getBoolParameter:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int)getIntParameter:(id)a3
{
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (id)_defaultOptions
{
  if (_defaultOptions_onceToken != -1)
    dispatch_once(&_defaultOptions_onceToken, &__block_literal_global_48);
  return (id)_defaultOptions__defaults;
}

void __45__SSQueryIntentManagerConfig__defaultOptions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[23];
  _QWORD v3[24];

  v3[23] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("IntentModelingEnabledMobile");
  v2[1] = CFSTR("IntentModelingEnabledDesktop");
  v3[0] = MEMORY[0x1E0C9AAB0];
  v3[1] = MEMORY[0x1E0C9AAA0];
  v2[2] = CFSTR("IntentModelingShowWebAsTypedBaseline");
  v2[3] = CFSTR("IntentModelingShowWebAsTypedLocal");
  v3[2] = MEMORY[0x1E0C9AAB0];
  v3[3] = MEMORY[0x1E0C9AAB0];
  v2[4] = CFSTR("IntentModelingShowWebAsTypedLocalStrong");
  v2[5] = CFSTR("IntentModelingShowWebAsTypedServer");
  v3[4] = MEMORY[0x1E0C9AAA0];
  v3[5] = MEMORY[0x1E0C9AAB0];
  v2[6] = CFSTR("IntentModelingLocalSuggestionQuotaBaseline");
  v2[7] = CFSTR("IntentModelingLocalSuggestionQuotaLocal");
  v3[6] = &unk_1E6E9A098;
  v3[7] = &unk_1E6E9A0B0;
  v2[8] = CFSTR("IntentModelingLocalSuggestionQuotaLocalStrong");
  v2[9] = CFSTR("IntentModelingLocalSuggestionQuotaServer");
  v3[8] = &unk_1E6E9A0B0;
  v3[9] = &unk_1E6E9A0B0;
  v2[10] = CFSTR("IntentModelingServerSuggestionQuotaBaseline");
  v2[11] = CFSTR("IntentModelingServerSuggestionQuotaLocal");
  v3[10] = &unk_1E6E9A098;
  v3[11] = &unk_1E6E9A0B0;
  v2[12] = CFSTR("IntentModelingServerSuggestionQuotaLocalStrong");
  v2[13] = CFSTR("IntentModelingServerSuggestionQuotaServer");
  v3[12] = &unk_1E6E9A0B0;
  v3[13] = &unk_1E6E9A098;
  v2[14] = CFSTR("IntentModelingServerSectionDisplayStrategyLocal");
  v2[15] = CFSTR("IntentModelingServerSectionDisplayStrategyLocalStrong");
  v3[14] = &unk_1E6E9A0C8;
  v3[15] = &unk_1E6E9A0E0;
  v2[16] = CFSTR("IntentModelingServerWeatherIntent");
  v2[17] = CFSTR("IntentModelingServerAppAccelerator");
  v3[16] = MEMORY[0x1E0C9AAB0];
  v3[17] = MEMORY[0x1E0C9AAA0];
  v2[18] = CFSTR("IntentModelingPhotosIntent");
  v2[19] = CFSTR("IntentModelingServerDomainsExcludedForDemotion");
  v3[18] = MEMORY[0x1E0C9AAB0];
  v3[19] = &stru_1E6E549F0;
  v2[20] = CFSTR("IntentModelingSuppressSuggestionsUpToPrefixLength");
  v2[21] = CFSTR("IntentModelingShowSuggestionsAsOfPrefixLength");
  v3[20] = &unk_1E6E9A098;
  v3[21] = &unk_1E6E9A098;
  v2[22] = CFSTR("IntentModelingMapsPoiIntent");
  v3[22] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 23);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_defaultOptions__defaults;
  _defaultOptions__defaults = v0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_105_0);
  objc_msgSend((id)sharedInstance_sharedInstance_4, "update");
  return (id)sharedInstance_sharedInstance_4;
}

void __44__SSQueryIntentManagerConfig_sharedInstance__block_invoke()
{
  SSQueryIntentManagerConfig *v0;
  void *v1;

  v0 = objc_alloc_init(SSQueryIntentManagerConfig);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (void)_updateInternalConfig:(id)a3
{
  void *v4;
  NSSet *v5;
  NSSet *serverDomainDemotionExclusionSet;
  NSObject *v7;
  NSSet *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  NSSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("IntentModelingServerDomainsExcludedForDemotion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[SSQueryIntentManagerConfig _parseServerDomainExclusionSet:](SSQueryIntentManagerConfig, "_parseServerDomainExclusionSet:", v4);
      v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
      serverDomainDemotionExclusionSet = self->_serverDomainDemotionExclusionSet;
      self->_serverDomainDemotionExclusionSet = v5;

      SSGeneralLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_serverDomainDemotionExclusionSet;
        v9 = 138412546;
        v10 = CFSTR("IntentModelingServerDomainsExcludedForDemotion");
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_1B86C5000, v7, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] Processed value for %@ = %@", (uint8_t *)&v9, 0x16u);
      }

    }
  }

}

- (void)updateWithResources:(id)a3 defaults:(id)a4
{
  id v7;
  id v8;
  SRResources *resources;
  NSObject *v10;
  const __CFString *v11;
  NSDictionary *baseConfig;
  NSObject *v13;
  NSDictionary *v14;
  NSObject *v15;
  NSDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  SRResources **p_resources;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *v29;
  NSDate *v30;
  NSDate *expirationDate;
  id v32;
  SSQueryIntentManagerConfig *v33;
  id v34;
  id *location;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  resources = self->_resources;
  location = (id *)&self->_resources;
  if (v7 && !resources)
  {
    objc_storeStrong(location, a3);
    SSGeneralLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (const __CFString *)*location;
      *(_DWORD *)buf = 138412290;
      v42 = v11;
      _os_log_impl(&dword_1B86C5000, v10, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] Resources: %@", buf, 0xCu);
    }

    resources = (SRResources *)*location;
  }
  if (resources && -[SRResources hasUpdates](resources, "hasUpdates"))
  {
    baseConfig = self->_baseConfig;
    self->_baseConfig = 0;

    SSGeneralLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B86C5000, v13, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] hasUpdates, clearing config", buf, 2u);
    }

  }
  v14 = self->_baseConfig;
  if (!v14)
  {
    SSGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] Init config", buf, 2u);
    }

    if (!v8)
    {
      -[SSQueryIntentManagerConfig _defaultOptions](self, "_defaultOptions");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v8;
    v33 = self;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
    v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSDictionary allKeys](v16, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    v34 = v7;
    if (!v17)
    {
      v19 = 0;
      goto LABEL_32;
    }
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v38;
    p_resources = &self->_resources;
    while (1)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (*p_resources)
        {
          -[SRResources objectForKey:](*p_resources, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          v24 = objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            -[NSDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v24, v23);
            v19 = (void *)v24;
            v25 = CFSTR("Override");
            goto LABEL_26;
          }
          v19 = 0;
        }
        v25 = CFSTR("Loaded");
LABEL_26:
        SSGeneralLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v25;
          v43 = 2112;
          v44 = v23;
          v45 = 2112;
          v46 = v27;
          _os_log_impl(&dword_1B86C5000, v26, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] %@ value for %@ = %@", buf, 0x20u);

          p_resources = (SRResources **)location;
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (!v18)
      {
LABEL_32:

        self = v33;
        v28 = v33->_baseConfig;
        v33->_baseConfig = v16;
        v29 = v16;

        -[SSQueryIntentManagerConfig _updateInternalConfig:](v33, "_updateInternalConfig:", v29);
        v14 = v33->_baseConfig;
        v7 = v34;
        v8 = v32;
        break;
      }
    }
  }
  objc_storeStrong((id *)&self->_config, v14);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
  v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v30;

}

- (BOOL)expired
{
  void *v3;
  BOOL v4;

  if (!self->_expirationDate)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", self->_expirationDate) == 1;

  return v4;
}

- (void)update
{
  -[SSQueryIntentManagerConfig update:](self, "update:", 0);
}

- (void)update:(BOOL)a3
{
  void *v4;

  if (a3 || -[SSQueryIntentManagerConfig expired](self, "expired"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sConfigLock);
    SSDefaultsGetResources();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSQueryIntentManagerConfig updateWithResources:defaults:](self, "updateWithResources:defaults:", v4, 0);

    os_unfair_lock_unlock((os_unfair_lock_t)&sConfigLock);
  }
}

+ (id)_getParsecDomainMapping
{
  if (_getParsecDomainMapping_onceToken != -1)
    dispatch_once(&_getParsecDomainMapping_onceToken, &__block_literal_global_114);
  return (id)_getParsecDomainMapping__domainMapping;
}

void __53__SSQueryIntentManagerConfig__getParsecDomainMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];
  _QWORD v3[19];

  v3[18] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("stocks");
  v2[1] = CFSTR("sports");
  v3[0] = CFSTR("com.apple.parsec.stocks");
  v3[1] = CFSTR("com.apple.parsec.sports");
  v2[2] = CFSTR("maps");
  v2[3] = CFSTR("movies");
  v3[2] = CFSTR("com.apple.parsec.maps");
  v3[3] = CFSTR("com.apple.parsec.movies");
  v2[4] = CFSTR("kg");
  v2[5] = CFSTR("web");
  v3[4] = CFSTR("com.apple.parsec.kg");
  v3[5] = CFSTR("com.apple.parsec.web_index");
  v2[6] = CFSTR("dictionary");
  v2[7] = CFSTR("weather");
  v3[6] = CFSTR("com.apple.parsec.dictionary");
  v3[7] = CFSTR("com.apple.parsec.weather");
  v2[8] = CFSTR("webimages");
  v2[9] = CFSTR("webanswers");
  v3[8] = CFSTR("com.apple.parsec.web_images");
  v3[9] = CFSTR("com.apple.parsec.web_answer.passage");
  v2[10] = CFSTR("apps");
  v2[11] = CFSTR("news");
  v3[10] = CFSTR("com.apple.parsec.itunes.iosSoftware");
  v3[11] = CFSTR("com.apple.parsec.news");
  v2[12] = CFSTR("flights");
  v2[13] = CFSTR("itunes.album");
  v3[12] = CFSTR("com.apple.parsec.flights");
  v3[13] = CFSTR("com.apple.parsec.itunes.album");
  v2[14] = CFSTR("itunes.artist");
  v2[15] = CFSTR("itunes.book");
  v3[14] = CFSTR("com.apple.parsec.itunes.artist");
  v3[15] = CFSTR("com.apple.parsec.itunes.book");
  v2[16] = CFSTR("itunes.podcast");
  v2[17] = CFSTR("itunes.song");
  v3[16] = CFSTR("com.apple.parsec.itunes.podcast");
  v3[17] = CFSTR("com.apple.parsec.itunes.song");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_getParsecDomainMapping__domainMapping;
  _getParsecDomainMapping__domainMapping = v0;

}

+ (id)_parseServerDomainExclusionSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    +[SSQueryIntentManagerConfig _getParsecDomainMapping](SSQueryIntentManagerConfig, "_getParsecDomainMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          if (*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13))
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v4, "addObject:", v14);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  return v4;
}

- (NSDictionary)config
{
  return self->_config;
}

- (NSSet)serverDomainDemotionExclusionSet
{
  return self->_serverDomainDemotionExclusionSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDomainDemotionExclusionSet, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_baseConfig, 0);
  objc_storeStrong((id *)&self->_resources, 0);
}

@end
