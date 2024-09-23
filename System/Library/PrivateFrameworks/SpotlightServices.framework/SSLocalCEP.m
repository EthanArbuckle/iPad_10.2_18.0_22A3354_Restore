@implementation SSLocalCEP

+ (id)getCEPValuesForCurrentLocale
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SSPlistDataReader *v12;
  uint64_t v13;
  void *v14;
  SSPlistDataReader *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C99820]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (v4)
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v3, v4, v20);
    else
      v8 = v3;
  }
  else
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_%@"), v3, v5, v4);
  }
  v9 = v8;
  if (objc_msgSend((id)getCEPValuesForCurrentLocale_sCannedLocale, "isEqual:", v8))
  {
    v10 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
  }
  else
  {
    objc_storeStrong((id *)&getCEPValuesForCurrentLocale_sCannedLocale, v9);
    if (!getCEPValuesForCurrentLocale_sCannedCepValues && getCEPValuesForCurrentLocale_onceToken != -1)
      dispatch_once(&getCEPValuesForCurrentLocale_onceToken, &__block_literal_global_18);
    v25 = "iOS";
    v26 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v27 = 0;
    v11 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
    getCEPValuesForCurrentLocale_sCannedCepForLocale = 0;

    v23 = 0uLL;
    v24 = 0;
    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      v12 = [SSPlistDataReader alloc];
      v21 = v23;
      v22 = v24;
      v13 = -[SSPlistDataReader initWithPlistContainer:obj:](v12, "initWithPlistContainer:obj:", getCEPValuesForCurrentLocale_sCannedCepValues, &v21);
      v14 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
      getCEPValuesForCurrentLocale_sCannedCepForLocale = v13;

    }
    if (!getCEPValuesForCurrentLocale_sCannedCepForLocale)
    {
      v26 = "global";
      if (_MDPlistContainerGetPlistObjectAtKeyArray())
      {
        v15 = [SSPlistDataReader alloc];
        v21 = v23;
        v22 = v24;
        v16 = -[SSPlistDataReader initWithPlistContainer:obj:](v15, "initWithPlistContainer:obj:", getCEPValuesForCurrentLocale_sCannedCepValues, &v21);
      }
      else
      {
        v16 = objc_opt_new();
      }
      v17 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
      getCEPValuesForCurrentLocale_sCannedCepForLocale = v16;

    }
    v10 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
  }
  v18 = v10;

  return v18;
}

void __42__SSLocalCEP_getCEPValuesForCurrentLocale__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  if (!getCEPValuesForCurrentLocale_sCannedCepValues)
  {
    v0 = objc_alloc(MEMORY[0x1E0C99D50]);
    SSDefaultsGetAssetPath(CFSTR("cep_query_independent_ratios.ios.json.mdplist"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v0, "initWithContentsOfFile:options:error:", v1, 8, 0);

    v3 = objc_retainAutorelease(v2);
    objc_msgSend(v3, "bytes");
    objc_msgSend(v3, "length");
    getCEPValuesForCurrentLocale_sCannedCepValues = _MDPlistContainerCreateWithBytesAndDeallocator();

  }
}

void __42__SSLocalCEP_getCEPValuesForCurrentLocale__block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (BOOL)isLowEngagementBundle:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "getCEPValuesForCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForBundle:", v4);
  v7 = v6;

  return v7 < 0.01;
}

+ (BOOL)isAllowlistedBundle:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isAllowlistedBundle__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isAllowlistedBundle__onceToken, &__block_literal_global_11);
  v5 = objc_msgSend((id)isAllowlistedBundle__allowlistedBundles, "containsObject:", v4);

  return v5;
}

void __34__SSLocalCEP_isAllowlistedBundle___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.mr-brightside.myParcel"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isAllowlistedBundle__allowlistedBundles;
  isAllowlistedBundle__allowlistedBundles = v0;

}

@end
