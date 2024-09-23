@implementation WLKUserEnvironment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedBrands, 0);
  objc_storeStrong((id *)&self->_countryIdentifier, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_consentedBrands, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_opt_new();
  -[WLKUserEnvironment _queryParametersV3](self, "_queryParametersV3");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKUserEnvironment _queryPostV3](self, "_queryPostV3");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v4, CFSTR("params"));
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v5, CFSTR("post"));
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_DSID, CFSTR("account"));
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_languageIdentifier, CFSTR("language"));
  v6 = objc_msgSend(v3, "wlk_deepHash");

  return v6;
}

- (id)_queryPostV3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("Installed"));
  v4 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("Subscribed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("Test"));
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("SubscriptionInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v4;
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v4, CFSTR("ibids"));
  v36 = v3;
  v33 = (void *)v6;
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v6, CFSTR("tbids"));
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v12);
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v14, "wlk_setObjectUnlessNil:forKey:", v13, CFSTR("bundleId"));
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          if (_queryPostV3_onceToken != -1)
            dispatch_once(&_queryPostV3_onceToken, &__block_literal_global_109);
          objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", _queryPostV3_JSONEscapeSet);
          v16 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "wlk_setObjectUnlessNil:forKey:", v16, CFSTR("subInfo"));
          v15 = (void *)v16;
        }
        v17 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v8, "addObject:", v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v36, "wlk_setObjectUnlessNilOrEmpty:forKey:", v18, CFSTR("sbids"));

  v19 = (void *)objc_msgSend(v36, "copy");
  objc_msgSend(v35, "wlk_setObjectUnlessNilOrEmpty:forKey:", v19, CFSTR("entitlementInfo"));

  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[WLKFeatureEnablement tvAppEnabledFeatures](WLKFeatureEnablement, "tvAppEnabledFeatures");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "jsonRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v25);
  }

  v29 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v20, "wlk_setObjectUnlessNilOrEmpty:forKey:", v29, CFSTR("clientFeatures"));

  v30 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v35, "wlk_setObjectUnlessNilOrEmpty:forKey:", v30, CFSTR("featureFlags"));

  v31 = (void *)objc_msgSend(v35, "copy");
  return v31;
}

+ (id)currentEnvironment
{
  WLKUserEnvironment *v3;

  if (__currentEnvironmentForTesting)
    return (id)__currentEnvironmentForTesting;
  v3 = objc_alloc_init(WLKUserEnvironment);
  return v3;
}

- (id)_queryParametersV3
{
  id v3;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[WLKUserEnvironment protocolVersion](self, "protocolVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", v4, CFSTR("v"));
  -[WLKUserEnvironment platform](self, "platform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", v5, CFSTR("pfm"));

  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_countryIdentifier, CFSTR("region"));
  -[WLKUserEnvironment storeFrontIdentifier](self, "storeFrontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", v6, CFSTR("sfh"));

  if (-[WLKUserEnvironment internalBuild](self, "internalBuild"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("ib"));
  WLKRestrictionsMaximumEffectiveMovieRanking();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WLKRestrictionsCountryCode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), v8, objc_msgSend(v7, "longValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mr"));

  }
  WLKRestrictionsMaximumEffectiveTVShowRanking();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), v8, objc_msgSend(v10, "longValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("tvr"));

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (WLKUserEnvironment)init
{
  WLKUserEnvironment *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSNumber *DSID;
  uint64_t v8;
  NSString *storeFrontIdentifier;
  void *v10;
  uint64_t v11;
  NSDictionary *entitlements;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *restrictions;
  void *v18;
  uint64_t v19;
  NSString *languageIdentifier;
  void *v21;
  uint64_t v22;
  NSString *countryIdentifier;
  void *v24;
  uint64_t v25;
  NSArray *deniedBrands;
  void *v27;
  uint64_t v28;
  NSArray *consentedBrands;
  void *v30;
  NSArray *v31;
  NSArray *v32;
  void *v33;
  void **p_platform;
  void *v35;
  const __CFString *v36;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)WLKUserEnvironment;
  v2 = -[WLKUserEnvironment init](&v39, sel_init);
  if (v2)
  {
    v2->_protocolVersion = WLKCurrentProtocolVersion();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ams_localiTunesAccount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "ams_DSID");
    v6 = objc_claimAutoreleasedReturnValue();
    DSID = v2->_DSID;
    v2->_DSID = (NSNumber *)v6;

    objc_msgSend(v4, "ams_storefront");
    v8 = objc_claimAutoreleasedReturnValue();
    storeFrontIdentifier = v2->_storeFrontIdentifier;
    v2->_storeFrontIdentifier = (NSString *)v8;

    +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = objc_claimAutoreleasedReturnValue();
    entitlements = v2->_entitlements;
    v2->_entitlements = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0CB3940];
    WLKRestrictionsMaximumEffectiveMovieRanking();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WLKRestrictionsMaximumEffectiveTVShowRanking();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    restrictions = v2->_restrictions;
    v2->_restrictions = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v19 = objc_claimAutoreleasedReturnValue();
    languageIdentifier = v2->_languageIdentifier;
    v2->_languageIdentifier = (NSString *)v19;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v22 = objc_claimAutoreleasedReturnValue();
    countryIdentifier = v2->_countryIdentifier;
    v2->_countryIdentifier = (NSString *)v22;

    if (os_variant_has_internal_content())
      v2->_internalBuild = 1;
    if (v2->_DSID)
    {
      +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deniedBrands");
      v25 = objc_claimAutoreleasedReturnValue();
      deniedBrands = v2->_deniedBrands;
      v2->_deniedBrands = (NSArray *)v25;

      +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "consentedBrands");
      v28 = objc_claimAutoreleasedReturnValue();
      consentedBrands = v2->_consentedBrands;
      v2->_consentedBrands = (NSArray *)v28;

      +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_consented = objc_msgSend(v30, "optedIn");
    }
    else
    {
      v31 = v2->_deniedBrands;
      v32 = (NSArray *)MEMORY[0x1E0C9AA60];
      v2->_deniedBrands = (NSArray *)MEMORY[0x1E0C9AA60];

      v30 = v2->_consentedBrands;
      v2->_consentedBrands = v32;
    }

    v33 = (void *)MGCopyAnswer();
    p_platform = (void **)&v2->_platform;
    objc_storeStrong((id *)&v2->_platform, v33);
    if ((objc_msgSend(v33, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
      || objc_msgSend(v33, "isEqualToString:", CFSTR("iPod")))
    {
      v35 = *p_platform;
      *p_platform = CFSTR("iphone");

    }
    if ((objc_msgSend(v33, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
    {
      v36 = CFSTR("ipad");
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0)
    {
      v36 = CFSTR("atv");
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
    {
      v36 = CFSTR("watch");
    }
    else
    {
      if (!objc_msgSend(v33, "isEqualToString:", CFSTR("Mac")))
      {
LABEL_21:

        return v2;
      }
      v36 = CFSTR("desktop");
    }
    v37 = *p_platform;
    *p_platform = (void *)v36;

    goto LABEL_21;
  }
  return v2;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)platform
{
  return self->_platform;
}

- (BOOL)internalBuild
{
  return self->_internalBuild;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

+ (void)setCurrentEnvironmentForTesting:(id)a3
{
  objc_storeStrong((id *)&__currentEnvironmentForTesting, a3);
}

- (BOOL)isEqual:(id)a3
{
  WLKUserEnvironment *v4;
  BOOL v5;

  v4 = (WLKUserEnvironment *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[WLKUserEnvironment isEqualToEnvironment:](self, "isEqualToEnvironment:", v4);
  }

  return v5;
}

- (BOOL)isEqualToEnvironment:(id)a3
{
  id v4;
  void *v5;
  unint64_t protocolVersion;
  NSNumber *DSID;
  void *v8;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  NSString *platform;
  int v13;
  NSString *storeFrontIdentifier;
  void *v15;
  NSString *p_isa;
  NSNumber *v17;
  int v18;
  NSString *languageIdentifier;
  void *v20;
  NSString *v21;
  NSString *v22;
  int v23;
  NSString *countryIdentifier;
  void *v25;
  NSString *v26;
  NSString *v27;
  NSDictionary *entitlements;
  NSString *restrictions;
  void *v30;
  NSArray *consentedBrands;
  void *v32;
  NSArray *deniedBrands;
  int consented;
  void *v35;
  void *v37;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    protocolVersion = self->_protocolVersion;
    if (protocolVersion == objc_msgSend(v4, "protocolVersion"))
    {
      DSID = self->_DSID;
      objc_msgSend(v5, "DSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = DSID;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {

      }
      else
      {
        LOBYTE(platform) = 0;
        if (!v9 || !v10)
        {
          p_isa = (NSString *)&v10->super.super.isa;
LABEL_47:

          goto LABEL_48;
        }
        v13 = -[NSNumber isEqual:](v9, "isEqual:", v10);

        if (!v13)
        {
          LOBYTE(platform) = 0;
LABEL_49:

          goto LABEL_50;
        }
      }
      storeFrontIdentifier = self->_storeFrontIdentifier;
      objc_msgSend(v5, "storeFrontIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      p_isa = storeFrontIdentifier;
      v17 = v15;
      v9 = v17;
      if (p_isa == (NSString *)v17)
      {

      }
      else
      {
        LOBYTE(platform) = 0;
        if (!p_isa || !v17)
        {
          v21 = (NSString *)&v17->super.super.isa;
LABEL_46:

          goto LABEL_47;
        }
        v18 = -[NSString isEqual:](p_isa, "isEqual:", v17);

        if (!v18)
        {
          LOBYTE(platform) = 0;
LABEL_48:

          goto LABEL_49;
        }
      }
      languageIdentifier = self->_languageIdentifier;
      objc_msgSend(v5, "languageIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = languageIdentifier;
      v22 = v20;
      p_isa = v22;
      if (v21 == v22)
      {

      }
      else
      {
        LOBYTE(platform) = 0;
        if (!v21 || !v22)
        {
          v26 = v22;
          goto LABEL_45;
        }
        v23 = -[NSString isEqual:](v21, "isEqual:", v22);

        if (!v23)
        {
          LOBYTE(platform) = 0;
          goto LABEL_47;
        }
      }
      countryIdentifier = self->_countryIdentifier;
      objc_msgSend(v5, "countryIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = countryIdentifier;
      v27 = v25;
      v21 = v27;
      if (v26 == v27)
      {

      }
      else
      {
        LOBYTE(platform) = 0;
        if (!v26 || !v27)
        {
          v30 = v27;
LABEL_44:

          goto LABEL_45;
        }
        LODWORD(platform) = -[NSString isEqual:](v26, "isEqual:", v27);

        if (!(_DWORD)platform)
          goto LABEL_46;
      }
      entitlements = self->_entitlements;
      objc_msgSend(v5, "entitlements");
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (WLKEqualObjects(entitlements, v26))
      {
        restrictions = self->_restrictions;
        objc_msgSend(v5, "restrictions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (WLKEqualObjects(restrictions, v30))
        {
          consentedBrands = self->_consentedBrands;
          objc_msgSend(v5, "consentedBrands");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (WLKEqualObjects(consentedBrands, v32))
          {
            deniedBrands = self->_deniedBrands;
            objc_msgSend(v5, "deniedBrands");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (WLKEqualObjects(deniedBrands, v37)
              && (consented = self->_consented, consented == objc_msgSend(v5, "consented")))
            {
              platform = self->_platform;
              objc_msgSend(v5, "platform");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(platform) = WLKEqualObjects(platform, v35);

            }
            else
            {
              LOBYTE(platform) = 0;
            }

          }
          else
          {
            LOBYTE(platform) = 0;
          }

        }
        else
        {
          LOBYTE(platform) = 0;
        }
        goto LABEL_44;
      }
      LOBYTE(platform) = 0;
LABEL_45:

      goto LABEL_46;
    }
  }
  LOBYTE(platform) = 0;
LABEL_50:

  return (char)platform;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSNumber *DSID;
  NSString *storeFrontIdentifier;
  const __CFString *languageIdentifier;
  NSString *countryIdentifier;
  const __CFString *v11;
  NSDictionary *entitlements;
  NSString *restrictions;
  NSArray *consentedBrands;
  void *v15;
  NSString *platform;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[12];
  _QWORD v22[13];

  v22[12] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("protocol version:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_protocolVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DSID = self->_DSID;
  storeFrontIdentifier = self->_storeFrontIdentifier;
  v22[0] = v6;
  v22[1] = DSID;
  v21[1] = CFSTR("dsid");
  v21[2] = CFSTR("storefront");
  languageIdentifier = (const __CFString *)self->_languageIdentifier;
  countryIdentifier = self->_countryIdentifier;
  if (!languageIdentifier)
    languageIdentifier = &stru_1E68AA228;
  v22[2] = storeFrontIdentifier;
  v22[3] = languageIdentifier;
  v21[3] = CFSTR("language");
  v21[4] = CFSTR("country");
  if (countryIdentifier)
    v11 = (const __CFString *)countryIdentifier;
  else
    v11 = &stru_1E68AA228;
  entitlements = self->_entitlements;
  restrictions = self->_restrictions;
  v22[4] = v11;
  v22[5] = entitlements;
  v21[5] = CFSTR("entitlements");
  v21[6] = CFSTR("restrictions");
  consentedBrands = self->_consentedBrands;
  v22[6] = restrictions;
  v22[7] = consentedBrands;
  v21[7] = CFSTR("cbrids");
  v21[8] = CFSTR("dbrids");
  v22[8] = self->_deniedBrands;
  v21[9] = CFSTR("gac");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_consented);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  platform = self->_platform;
  v22[9] = v15;
  v22[10] = platform;
  v21[10] = CFSTR("platform");
  v21[11] = CFSTR("hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WLKUserEnvironment hash](self, "hash"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_entitlementsQuery
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("Installed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("Subscribed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("Test"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_entitlements, "objectForKeyedSubscript:", CFSTR("SubscriptionInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          if (_entitlementsQuery_onceToken != -1)
            dispatch_once(&_entitlementsQuery_onceToken, &__block_literal_global_29);
          objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", _entitlementsQuery_JSONEscapeSet);
          v12 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v10, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

          v11 = (void *)v12;
        }
        else
        {
          objc_msgSend(v5, "addObject:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("ibids"));

  }
  if (objc_msgSend(obj, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("sbids"));

  }
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("tbids"));

  }
  return v14;
}

void __40__WLKUserEnvironment__entitlementsQuery__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(v0, "removeCharactersInString:", CFSTR(":,"));
  v2 = (void *)_entitlementsQuery_JSONEscapeSet;
  _entitlementsQuery_JSONEscapeSet = (uint64_t)v0;

}

- (id)_consentQuery
{
  void *v3;
  void *v4;
  id v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = -[WLKUserEnvironment consented](self, "consented");
    if (v6)
      v7 = CFSTR("true");
    else
      v7 = CFSTR("false");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("gac"));
    if (v6)
    {
      -[WLKUserEnvironment consentedBrands](self, "consentedBrands");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("cbrids"));

      }
      -[WLKUserEnvironment deniedBrands](self, "deniedBrands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("dbrids"));

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __34__WLKUserEnvironment__queryPostV3__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(v0, "removeCharactersInString:", CFSTR(":,"));
  v2 = (void *)_queryPostV3_JSONEscapeSet;
  _queryPostV3_JSONEscapeSet = (uint64_t)v0;

}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_storeStrong((id *)&self->_DSID, a3);
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontIdentifier, a3);
}

- (void)setEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_entitlements, a3);
}

- (NSString)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_restrictions, a3);
}

- (NSArray)consentedBrands
{
  return self->_consentedBrands;
}

- (void)setConsentedBrands:(id)a3
{
  objc_storeStrong((id *)&self->_consentedBrands, a3);
}

- (BOOL)consented
{
  return self->_consented;
}

- (void)setConsented:(BOOL)a3
{
  self->_consented = a3;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_languageIdentifier, a3);
}

- (NSString)countryIdentifier
{
  return self->_countryIdentifier;
}

- (void)setCountryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_countryIdentifier, a3);
}

- (NSArray)deniedBrands
{
  return self->_deniedBrands;
}

- (void)setDeniedBrands:(id)a3
{
  objc_storeStrong((id *)&self->_deniedBrands, a3);
}

- (void)setInternalBuild:(BOOL)a3
{
  self->_internalBuild = a3;
}

@end
