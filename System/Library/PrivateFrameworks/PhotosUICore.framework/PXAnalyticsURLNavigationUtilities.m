@implementation PXAnalyticsURLNavigationUtilities

+ (void)sendNavigationStartEventForURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    v38 = v3;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v6;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v6, "queryItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (!v8)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_18;
    }
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", PXDeeplinkURLPathComponentQueryKeySource);

        if (v16)
        {
          objc_msgSend(v14, "value");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v11;
          v11 = (void *)v17;
        }
        else
        {
          objc_msgSend(v14, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", PXDeeplinkURLPathComponentQueryKeyIdentifier);

          if (!v20)
            continue;
          objc_msgSend(v14, "value");
          v21 = objc_claimAutoreleasedReturnValue();
          v18 = v10;
          v10 = (void *)v21;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v9)
      {
LABEL_18:

        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("notification")) & 1) != 0)
        {
          v23 = 3;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("widget")))
        {
          v23 = 4;
        }
        else
        {
          v23 = 5;
        }
        v22 = v36;
        v24 = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v25, CFSTR("URLNavigationKind"));

        v26 = 0x1E0D09000;
        if (v10 && objc_msgSend(v11, "isEqualToString:", PXDeeplinkURLPathComponentSourceWidget))
        {
          v27 = -[NSObject mutableCopy](v36, "mutableCopy");
          objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
          v24 = v10;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F8]), "initWithPhotoLibraryURL:", v37);
          objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v28, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setFetchLimit:", 1);
          v30 = (void *)MEMORY[0x1E0CD13B8];
          v43 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "fetchAssetCollectionsWithLocalIdentifiers:options:", v31, v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, CFSTR("widgetType"));
          if (v33)
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D09818]);
          objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.widget.open"), v27);

          v26 = 0x1E0D09000uLL;
        }
        objc_msgSend(*(id *)(v26 + 2320), "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.URLNavigationDidStart"), v22);

        v3 = v38;
        goto LABEL_29;
      }
    }
  }
  PLUIGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v3;
    _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_INFO, "Navigation Analytics: Destination URL has empty path, returning early without logging: %@", buf, 0xCu);
  }
LABEL_29:

}

+ (void)sendNavigationEndEventForURL:(id)a3
{
  dispatch_time_t v3;

  v3 = dispatch_time(0, 500000000);
  dispatch_after(v3, MEMORY[0x1E0C80D38], &__block_literal_global_203702);
}

uint64_t __66__PXAnalyticsURLNavigationUtilities_sendNavigationEndEventForURL___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.URLNavigationDidFinish"), MEMORY[0x1E0C9AA70]);
}

@end
