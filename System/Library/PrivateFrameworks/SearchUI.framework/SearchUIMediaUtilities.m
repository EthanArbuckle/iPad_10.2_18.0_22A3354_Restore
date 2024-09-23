@implementation SearchUIMediaUtilities

+ (id)fallbackPunchoutWithMetadata:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "mediaPunchouts", 0);
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
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
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

+ (id)mediaSearchForMetadata:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CBD9E8];
    v4 = a3;
    v5 = [v3 alloc];
    v6 = (int)objc_msgSend(v4, "mediaType");
    objc_msgSend(v4, "mediaName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artistName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v5, "initWithMediaType:sortOrder:mediaName:artistName:albumName:genreNames:moodNames:releaseDate:reference:mediaIdentifier:", v6, 0, v7, v8, v9, 0, 0, 0, 0, 0);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (BOOL)bundleIdentifierSupportsPlayIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedIntentsForApp:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBDA70], "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

+ (BOOL)bundleIdentifierSupportsOpenIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedIntentsForApp:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBDB58], "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

+ (id)supportedIntentsForApp:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);

  objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithApplicationRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedIntents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)predictionForMediaMetadata:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = predictionForMediaMetadata_completion__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&predictionForMediaMetadata_completion__onceToken, &__block_literal_global_17);
  v8 = (void *)predictionForMediaMetadata_completion__audioAppPredictorCache;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SearchUIMediaUtilities_predictionForMediaMetadata_completion___block_invoke_2;
  v10[3] = &unk_1EA1F7300;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "getObjectForKey:completionHandler:", v7, v10);

}

void __64__SearchUIMediaUtilities_predictionForMediaMetadata_completion___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)predictionForMediaMetadata_completion__audioAppPredictorCache;
  predictionForMediaMetadata_completion__audioAppPredictorCache = v0;

}

uint64_t __64__SearchUIMediaUtilities_predictionForMediaMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)mediaDestinationsForMediaMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(a1, "appsThatSupportSearchIntents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isHidden") & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v8);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v4, "mediaPunchouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v18, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "containsObject:", v19) & 1) == 0)
        {
          objc_msgSend(v18, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v20);

          if (!v21)
            continue;
          objc_msgSend(v18, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v15);
  }

  objc_msgSend(v4, "bundleIdentifiersToExclude");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "bundleIdentifiersToExclude");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v25);

  }
  v26 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v27 = v5;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k);
        v33 = (void *)objc_opt_new();
        objc_msgSend(v33, "setAppBundleIdentifier:", v32, (_QWORD)v35);
        objc_msgSend(v33, "setMediaMetadata:", v4);
        objc_msgSend(v26, "addObject:", v33);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v29);
  }

  return v26;
}

+ (id)cardSectionsForListenToCardSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mediaDestinationsForMediaMetadata:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v4, "cardSectionId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCardSectionId:", v14);

        objc_msgSend(v12, "image");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:", v15);

        v16 = (void *)MEMORY[0x1E0D8C660];
        objc_msgSend(v12, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "textWithString:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setLeadingText:", v18);

        objc_msgSend(v12, "command");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCommand:", v19);

        objc_msgSend(v5, "addObject:", v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count")
    || (objc_msgSend(v4, "fallbackCardSection"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v20,
        (isKindOfClass & 1) == 0))
  {
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_159);
  }
  else
  {
    objc_msgSend(v4, "fallbackCardSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  return v5;
}

uint64_t __61__SearchUIMediaUtilities_cardSectionsForListenToCardSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "leadingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v8);

  return v9;
}

+ (void)initializeQueuesAndNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SearchUIMediaUtilities_initializeQueuesAndNotifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeQueuesAndNotifications_onceToken != -1)
    dispatch_once(&initializeQueuesAndNotifications_onceToken, block);
}

void __58__SearchUIMediaUtilities_initializeQueuesAndNotifications__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *v5;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("searchUIMediaAppsFetchingQueue", v5);
  v3 = (void *)searchUI_mediaQueue;
  searchUI_mediaQueue = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_resetMediaApps, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_resetMediaApps, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

}

+ (void)prewarmMediaLibrary
{
  objc_msgSend(a1, "initializeQueuesAndNotifications");
  objc_msgSend(a1, "resetMediaApps");
}

+ (id)appsThatSupportSearchIntents
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  objc_msgSend(a1, "initializeQueuesAndNotifications");
  v3 = (void *)appsThatSupportSearch;
  if (!appsThatSupportSearch)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2;
    v11 = __Block_byref_object_dispose__2;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__SearchUIMediaUtilities_appsThatSupportSearchIntents__block_invoke;
    v6[3] = &unk_1EA1F7388;
    v6[4] = &v7;
    v6[5] = a1;
    dispatch_sync((dispatch_queue_t)searchUI_mediaQueue, v6);
    v4 = (void *)appsThatSupportSearch;
    if (!appsThatSupportSearch)
      v4 = (void *)v8[5];
    objc_storeStrong((id *)&appsThatSupportSearch, v4);
    _Block_object_dispose(&v7, 8);

    v3 = (void *)appsThatSupportSearch;
  }
  return (id)objc_msgSend(v3, "copy");
}

void __54__SearchUIMediaUtilities_appsThatSupportSearchIntents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!appsThatSupportSearch)
  {
    objc_msgSend(*(id *)(a1 + 40), "generateAppsThatSupportSearchIntents");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)resetMediaApps
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SearchUIMediaUtilities_resetMediaApps__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)searchUI_mediaQueue, block);
}

void __40__SearchUIMediaUtilities_resetMediaApps__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "generateAppsThatSupportSearchIntents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__SearchUIMediaUtilities_resetMediaApps__block_invoke_2;
  v3[3] = &unk_1EA1F62F0;
  v4 = v1;
  v2 = v1;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v3);

}

void __40__SearchUIMediaUtilities_resetMediaApps__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)&appsThatSupportSearch, *(id *)(a1 + 32));
}

+ (id)generateAppsThatSupportSearchIntents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)searchUI_mediaQueue);
  v13 = (id)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithApplicationRecord:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "supportedIntents");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CBDB58], "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "containsObject:", v9);

        if (v10)
        {
          objc_msgSend(v6, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v11);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

  return v13;
}

+ (id)localAudioCache
{
  if (localAudioCache_onceToken != -1)
    dispatch_once(&localAudioCache_onceToken, &__block_literal_global_164);
  return (id)localAudioCache_localAudioCache;
}

void __41__SearchUIMediaUtilities_localAudioCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)localAudioCache_localAudioCache;
  localAudioCache_localAudioCache = v0;

}

+ (BOOL)isNowPlayingMedia:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "isCurrentMedia:", v4);
  objc_msgSend(a1, "backingItemForMediaMetadataCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || _searchUIPlayState == 1)
  {
    v9 = objc_msgSend(a1, "isPlaying");
  }
  else
  {
    objc_msgSend(a1, "musicStatusCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "playbackState") == 1;

  }
  return v5 & v9;
}

+ (BOOL)isCoreSpotlightMedia:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("x-media-library://"));
}

+ (void)pausePlayback
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__SearchUIMediaUtilities_pausePlayback__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "dispatchOnMusicQueueIfNecessary:", v2);
}

void __39__SearchUIMediaUtilities_pausePlayback__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "musicPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pause");

}

+ (void)resumePlayback
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__SearchUIMediaUtilities_resumePlayback__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "dispatchOnMusicQueueIfNecessary:", v2);
}

void __40__SearchUIMediaUtilities_resumePlayback__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "musicPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");

}

+ (void)playMedia:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  char v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(v4, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "mediaType");
  if (v5)
  {
    v7 = v6;
    if (objc_msgSend(a1, "isCurrentMedia:", v4))
    {
      v8 = objc_msgSend(a1, "isPlaying");
      if (v7 == 100)
      {
        if ((v8 & 1) == 0)
        {
          +[SearchUIVoicemailUtilities resumeVoicemail](_TtC8SearchUI26SearchUIVoicemailUtilities, "resumeVoicemail");
          goto LABEL_22;
        }
LABEL_7:
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __36__SearchUIMediaUtilities_playMedia___block_invoke;
        v21[3] = &unk_1EA1F73D0;
        v22 = v5;
        +[SearchUIVoicemailUtilities playVoicemailWithIdentifier:completionHandler:](_TtC8SearchUI26SearchUIVoicemailUtilities, "playVoicemailWithIdentifier:completionHandler:", v22, v21);

        goto LABEL_22;
      }
      if ((v8 & 1) == 0)
      {
        objc_msgSend(a1, "resumePlayback");
        goto LABEL_22;
      }
    }
    else if (v7 == 100)
    {
      goto LABEL_7;
    }
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v9);

    if (v10)
    {
      objc_msgSend(v4, "mediaIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _searchUIPlayState = 1;
      if (objc_msgSend(a1, "isCoreSpotlightMedia:", v11))
      {
        objc_msgSend(a1, "playCoreSpotlightMedia:", v4);
      }
      else if (v7)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __36__SearchUIMediaUtilities_playMedia___block_invoke_173;
        v17[3] = &unk_1EA1F73F8;
        v18 = v11;
        v19 = v4;
        v20 = a1;
        +[SearchUIMusicUtilities playMusicItemWithMediaMetadata:completionHandler:](SearchUIMusicUtilities, "playMusicItemWithMediaMetadata:completionHandler:", v19, v17);

      }
    }
    else
    {
      v12 = (void *)objc_opt_new();
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setApplicationBundleIdentifier:", v13);

      +[SearchUICommandHandler handlerForCommand:environment:](SearchUICommandHandler, "handlerForCommand:environment:", v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
        v15 = 3;
      else
        v15 = 2;
      objc_msgSend(v14, "performCommand:triggerEvent:environment:", v12, v15, 0);
      SearchUIGeneralLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[SearchUIMediaUtilities playMedia:].cold.1((uint64_t)v5, v4, v16);

      objc_msgSend(a1, "resetPlayer");
    }
  }
LABEL_22:

}

void __36__SearchUIMediaUtilities_playMedia___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __36__SearchUIMediaUtilities_playMedia___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

void __36__SearchUIMediaUtilities_playMedia___block_invoke_173(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __36__SearchUIMediaUtilities_playMedia___block_invoke_173_cold_1(a1, (uint64_t)v3, v4);

    objc_msgSend(*(id *)(a1 + 48), "resetPlayer");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "updateBackingItemForMediaMetadata:", *(_QWORD *)(a1 + 40));
  }

}

+ (void)resetPlayer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__SearchUIMediaUtilities_resetPlayer__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "dispatchOnMusicQueueIfNecessary:", v2);
}

void __37__SearchUIMediaUtilities_resetPlayer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setIsPlaying:", 0);
  objc_msgSend(*(id *)(a1 + 32), "musicPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

  objc_msgSend(*(id *)(a1 + 32), "setCurrentMedia:", 0);
  _searchUIPlayState = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SearchUIMusicDidResetNotification"), 0);

}

+ (void)playCoreSpotlightMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localAudioCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke;
  v8[3] = &unk_1EA1F7470;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  objc_msgSend(v6, "getObjectForKey:completionHandler:", v5, v8);

}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  void *v13;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "persistentID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v5, *MEMORY[0x1E0CC1ED0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addFilterPredicate:", v6);

    }
    else
    {
      v4 = 0;
    }
    v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_2;
    v9[3] = &unk_1EA1F60F0;
    v10 = v4;
    v13 = v7;
    v11 = v3;
    v12 = *(id *)(a1 + 32);
    v8 = v4;
    objc_msgSend(v7, "dispatchOnMusicQueueIfNecessary:", v9);

  }
}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 56), "musicPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "setQueueWithQuery:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v3, "setQueueWithItemCollection:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 56), "musicPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_3;
  v8[3] = &unk_1EA1F7448;
  v7 = *(_OWORD *)(a1 + 48);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v5, "prepareToPlayWithCompletionHandler:", v8);

}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4;
  v8[3] = &unk_1EA1F7420;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnMusicQueueIfNecessary:", v8);

}

uint64_t __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  void *v5;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    SearchUIGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4_cold_1(v2, v3);

    return objc_msgSend(*(id *)(a1 + 48), "resetPlayer");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "musicPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "play");

    return objc_msgSend(*(id *)(a1 + 48), "updateBackingItemForMediaMetadata:", *(_QWORD *)(a1 + 40));
  }
}

+ (void)updateBackingItemForMediaMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(a1, "musicStatusCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SearchUIMediaUtilities_updateBackingItemForMediaMetadata___block_invoke;
  v9[3] = &unk_1EA1F7420;
  v11 = v4;
  v12 = a1;
  v10 = v6;
  v7 = v4;
  v8 = v6;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v9);

}

void __60__SearchUIMediaUtilities_updateBackingItemForMediaMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "backingItemForMediaMetadataCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = 2;
  }
  else
  {
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v5 = 0;
  }

  _searchUIPlayState = v5;
}

+ (void)getMusicUserDisclosureApprovalStatusWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (getMusicUserDisclosureApprovalStatusWithCompletionHandler__onceToken != -1)
    dispatch_once(&getMusicUserDisclosureApprovalStatusWithCompletionHandler__onceToken, &__block_literal_global_178);
  v4 = (void *)getMusicUserDisclosureApprovalStatusWithCompletionHandler__musicDisclosureStatusCache;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__SearchUIMediaUtilities_getMusicUserDisclosureApprovalStatusWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1EA1F74B8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "getObjectForKey:completionHandler:", v5, v7);

}

void __84__SearchUIMediaUtilities_getMusicUserDisclosureApprovalStatusWithCompletionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getMusicUserDisclosureApprovalStatusWithCompletionHandler__musicDisclosureStatusCache;
  getMusicUserDisclosureApprovalStatusWithCompletionHandler__musicDisclosureStatusCache = v0;

}

uint64_t __84__SearchUIMediaUtilities_getMusicUserDisclosureApprovalStatusWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue"));
}

+ (id)musicStatusCache
{
  if (musicStatusCache_onceToken != -1)
    dispatch_once(&musicStatusCache_onceToken, &__block_literal_global_182);
  return (id)musicStatusCache_musicStatusCache;
}

void __42__SearchUIMediaUtilities_musicStatusCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)musicStatusCache_musicStatusCache;
  musicStatusCache_musicStatusCache = v0;

}

+ (void)canPlayAppleMusicWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "musicStatusCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SearchUIMediaUtilities_canPlayAppleMusicWithCompletionHandler___block_invoke;
  v7[3] = &unk_1EA1F74B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getObjectForKey:completionHandler:", &stru_1EA1FB118, v7);

}

uint64_t __65__SearchUIMediaUtilities_canPlayAppleMusicWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue"));
}

+ (id)musicPlayerQueue
{
  if (musicPlayerQueue_onceToken != -1)
    dispatch_once(&musicPlayerQueue_onceToken, &__block_literal_global_186);
  return (id)musicPlayerQueue_musicPlayerQueue;
}

void __42__SearchUIMediaUtilities_musicPlayerQueue__block_invoke()
{
  void *v0;
  id v1;
  const char *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SearchUIMusicPlayerQueueIdentifier.%@"), v6);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v1, "UTF8String");
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(v2, v3);
  v5 = (void *)musicPlayerQueue_musicPlayerQueue;
  musicPlayerQueue_musicPlayerQueue = (uint64_t)v4;

}

+ (id)musicPlayer
{
  id v3;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
  {
    if (musicPlayer_onceToken != -1)
      dispatch_once(&musicPlayer_onceToken, &__block_literal_global_190);
    objc_msgSend(MEMORY[0x1E0CC2480], "applicationQueuePlayer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SearchUIMediaUtilities_musicPlayer__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (musicPlayer_onceToken_192 != -1)
      dispatch_once(&musicPlayer_onceToken_192, block);
    v3 = (id)musicPlayer_musicPlayerController;
  }
  return v3;
}

uint64_t __37__SearchUIMediaUtilities_musicPlayer__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CC2478], "setShouldUseSystemMusicAppOnMacOS:", 0);
}

void __37__SearchUIMediaUtilities_musicPlayer__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SearchUIMusicPlayerIdentifier.%@"), v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CC2480]);
  objc_msgSend(*(id *)(a1 + 32), "musicPlayerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithClientIdentifier:queue:", v3, v5);
  v7 = (void *)musicPlayer_musicPlayerController;
  musicPlayer_musicPlayerController = v6;

}

+ (SFMediaMetadata)currentMedia
{
  return (SFMediaMetadata *)(id)_searchUIMediaUtilitiesCurrentMedia;
}

+ (void)setCurrentMedia:(id)a3
{
  objc_storeStrong((id *)&_searchUIMediaUtilitiesCurrentMedia, a3);
}

+ (BOOL)isPlaying
{
  return _searchUIMediaUtilitiesIsPlaying;
}

+ (void)setIsPlaying:(BOOL)a3
{
  _searchUIMediaUtilitiesIsPlaying = a3;
}

+ (BOOL)isCurrentMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "backingItemForMediaMetadataCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "currentMedia");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v6, "isEqual:", v4);

  if (!(_DWORD)v7 && v5 && _searchUIPlayState != 1)
  {
    objc_msgSend(a1, "musicStatusCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nowPlayingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v7) = objc_msgSend(a1, "isMediaItem:equalToMediaItem:", v8, v5);
  }

  return (char)v7;
}

+ (id)backingItemForMediaMetadataCache
{
  if (backingItemForMediaMetadataCache_onceToken != -1)
    dispatch_once(&backingItemForMediaMetadataCache_onceToken, &__block_literal_global_195);
  return (id)backingItemForMediaMetadataCache_backingItemForMediaMetadata;
}

void __58__SearchUIMediaUtilities_backingItemForMediaMetadataCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)backingItemForMediaMetadataCache_backingItemForMediaMetadata;
  backingItemForMediaMetadataCache_backingItemForMediaMetadata = v0;

}

+ (BOOL)isMediaItem:(id)a3 equalToMediaItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v14 = objc_msgSend(v5, "isEqual:", v6);
  }
  else
  {
    objc_msgSend(v8, "modelObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

  }
  if (v5 == v6)
    v15 = 1;
  else
    v15 = v14;

  return v15;
}

+ (void)dispatchOnMusicQueueIfNecessary:(id)a3
{
  NSObject *v3;
  dispatch_block_t block;

  block = a3;
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
  {
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", block);
  }
  else
  {
    +[SearchUIMediaUtilities musicPlayerQueue](SearchUIMediaUtilities, "musicPlayerQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, block);

  }
}

+ (void)playMedia:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_2(&dword_1DAD39000, a3, v6, "Music app is not installed for media: %@ with type: %@", (uint8_t *)&v7);

}

void __36__SearchUIMediaUtilities_playMedia___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_2(&dword_1DAD39000, a3, (uint64_t)a3, "Failed to play voicemail: %@ error: %@", (uint8_t *)&v4);
}

void __36__SearchUIMediaUtilities_playMedia___block_invoke_173_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "mediaType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_1DAD39000, a3, OS_LOG_TYPE_ERROR, "Failed to play media: %@ with type: %@ error: %@", (uint8_t *)&v7, 0x20u);

}

void __49__SearchUIMediaUtilities_playCoreSpotlightMedia___block_invoke_4_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Music player failed to prepare with error %@", (uint8_t *)&v3, 0xCu);
}

@end
