@implementation VUIPostPlayDataManager

+ (void)fetchPostPlayItemForCurrentMediaItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (fetchPostPlayItemForCurrentMediaItem_completion__onceToken[0] != -1)
    dispatch_once(fetchPostPlayItemForCurrentMediaItem_completion__onceToken, &__block_literal_global_91);
  if (!objc_msgSend(v5, "hasTrait:", *MEMORY[0x1E0DB1D78]))
  {
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isNetworkReachable");

      if (v11)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_43;
        v19[3] = &unk_1E9F9F9F0;
        v12 = &v20;
        v20 = v6;
        +[VUIPostPlayDataManager _fetchPostPlayItemFromJSForSeriesCanonicalID:andVideoCanonicalID:completion:](VUIPostPlayDataManager, "_fetchPostPlayItemFromJSForSeriesCanonicalID:andVideoCanonicalID:completion:", v8, v9, v19);
LABEL_15:

        goto LABEL_16;
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_45;
      v17[3] = &unk_1E9F9FA18;
      v12 = &v18;
      v18 = v6;
      v14 = v17;
    }
    else
    {
      v13 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Current Item has no canonical id; checking with storeID",
          buf,
          2u);
      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_47;
      v15[3] = &unk_1E9F9FA18;
      v12 = &v16;
      v16 = v6;
      v14 = v15;
    }
    +[VUIPostPlayDataManager _fetchContentFromLibraryForCurrentMediaItem:completion:](VUIPostPlayDataManager, "_fetchContentFromLibraryForCurrentMediaItem:completion:", v5, v14);
    goto LABEL_15;
  }
  v7 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Current Item is a Scene, no post play allowed", buf, 2u);
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0, 0, 0, 0);
LABEL_16:

}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIPostPlayDataManager");
  v1 = (void *)sLogObject_13;
  sLogObject_13 = (uint64_t)v0;

}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (*v17)(void);
  NSObject *v18;
  uint8_t v19[16];

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else if (v15)
  {
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v18 = sLogObject_13;
    if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find post play item from JS", v19, 2u);
    }
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v17();

}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  +[VUIPostPlayDataManager _metricsForPostPlayMediaItemFromLibrary:](VUIPostPlayDataManager, "_metricsForPostPlayMediaItemFromLibrary:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__VUIPostPlayDataManager_fetchPostPlayItemForCurrentMediaItem_completion___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  +[VUIPostPlayDataManager _metricsForPostPlayMediaItemFromLibrary:](VUIPostPlayDataManager, "_metricsForPostPlayMediaItemFromLibrary:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)_metricsForPostPlayMediaItemFromLibrary:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99E08];
      v26[0] = CFSTR("dialogId");
      v26[1] = CFSTR("dialogType");
      v27[0] = v5;
      v27[1] = CFSTR("PostPlay");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictionaryWithDictionary:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, CFSTR("showId"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("details"));

      }
      +[VUIMetricsMediaEvent clickMetricsDataFromTVPMediaItem:](VUIMetricsMediaEvent, "clickMetricsDataFromTVPMediaItem:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      v24[0] = CFSTR("actionType");
      v24[1] = CFSTR("targetType");
      v25[0] = CFSTR("play");
      v25[1] = CFSTR("lockup");
      v24[2] = CFSTR("targetId");
      v25[2] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addEntriesFromDictionary:", v13);

      objc_msgSend(v12, "addEntriesFromDictionary:", v9);
      +[VUIMetricsMediaEvent impressionsMetricsDataFromTVPMediaItem:](VUIMetricsMediaEvent, "impressionsMetricsDataFromTVPMediaItem:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("lockup"), CFSTR("impressionType"));
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("impressions"));

      v22[0] = CFSTR("VUIContentMetadataPostPlayItemMetricsClickDataKey");
      v18 = (void *)objc_msgSend(v12, "copy");
      v22[1] = CFSTR("VUIContentMetadataPostPlayItemMetricsImpressionsDataKey");
      v23[0] = v18;
      v19 = (void *)objc_msgSend(v16, "copy");
      v23[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (void)_fetchPostPlayItemFromJSForSeriesCanonicalID:(id)a3 andVideoCanonicalID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("showCanonicalId"));
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("canonicalId"));
  v11 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Fetching MediaEntity from JS for current TVPMediaItem", buf, 2u);
  }
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __102__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_completion___block_invoke;
    v15[3] = &unk_1E9F9BA70;
    v16 = v10;
    v17 = v9;
    objc_msgSend(v14, "evaluate:", v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0, 0, 0, 0);
  }

}

void __102__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PostPlayItemInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v13[0] = *(_QWORD *)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __102__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_completion___block_invoke_2;
  v11 = &unk_1E9F9BA48;
  v12 = v4;
  v5 = _Block_copy(&v8);
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getPostPlayItem"), v6);

}

void __102__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __102__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_completion___block_invoke_3;
  v8 = &unk_1E9F99D58;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = v3;
  if (objc_msgSend(v4, "isMainThread", v6[0], 3221225472))
    v7((uint64_t)v6);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __102__VUIPostPlayDataManager__fetchPostPlayItemFromJSForSeriesCanonicalID_andVideoCanonicalID_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  VUIRouterDataSource *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v16 = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "PostPlay JS Fetch Complete: %@", (uint8_t *)&v16, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", CFSTR("playable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", CFSTR("postPlayViewEntity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", CFSTR("metrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vui_dictionaryForKey:", CFSTR("routerDataSource"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4)
  {
    +[VUIPostPlayDataManager _generateMediaInfoFromJSResponse:canAutoPlay:](VUIPostPlayDataManager, "_generateMediaInfoFromJSResponse:canAutoPlay:", v4, objc_msgSend(*(id *)(a1 + 32), "vui_BOOLForKey:defaultValue:", CFSTR("canAutoPlay"), 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tvpPlaylist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "trackList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v13;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Found Next Media Item for Post Play: <%@>", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      v13 = 0;
    }

    v15 = 0;
  }
  else
  {
    if (v7)
      v15 = -[VUIRouterDataSource initWithRouterData:appContext:]([VUIRouterDataSource alloc], "initWithRouterData:appContext:", v7, 0);
    else
      v15 = 0;
    v13 = 0;
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)_fetchPostPlayItemFromLibraryContentForStoreID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aggregateMediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaEntityFetchRequest episodesFetchRequest](VUIMediaEntityFetchRequest, "episodesFetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAdamIdPredicate:", v5);
  v10 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Fetching MediaEntity from Library for current TVPMediaItem", buf, 2u);
  }
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke;
  v15[3] = &unk_1E9F9FAB8;
  v16 = v5;
  v17 = v6;
  v12 = v5;
  v13 = v6;
  v14 = (id)objc_msgSend(v8, "enqueueFetchRequests:completionHandler:", v11, v15);

}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  _QWORD block[2];
  uint64_t (*v35)(uint64_t);
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[8];
  _QWORD v42[2];
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaEntities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v22 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_ERROR))
        __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      v35 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_67;
      v36 = &unk_1E9F98E68;
      v37 = *(id *)(a1 + 40);
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        v35((uint64_t)block);
      else
        dispatch_async(MEMORY[0x1E0C80D38], block);
      v8 = v37;
      goto LABEL_21;
    }
    objc_msgSend(v6, "showIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      +[VUIMediaEntityFetchRequest episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:](VUIMediaEntityFetchRequest, "episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Fetching Series for current MediaEntity", buf, 2u);
      }
      objc_msgSend(v6, "mediaLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_58;
      v38[3] = &unk_1E9F9FA90;
      v39 = *(id *)(a1 + 32);
      v40 = *(id *)(a1 + 40);
      v13 = (id)objc_msgSend(v11, "enqueueFetchRequests:completionHandler:", v12, v38);

LABEL_21:
      goto LABEL_24;
    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v43 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2;
    v44 = &unk_1E9F98E68;
    v45 = *(id *)(a1 + 40);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v43((uint64_t)v42);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v42);

  }
  else
  {
    v14 = sLogObject_13;
    if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_ERROR))
      __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v31 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_68;
    v32 = &unk_1E9F98E68;
    v33 = *(id *)(a1 + 40);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v30[0], 3221225472))
      v31((uint64_t)v30);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v30);
    v6 = v33;
  }
LABEL_24:

}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  VUIMediaInfo *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  VUIMediaInfo *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  id v40;
  VUIMediaInfo *v41;
  _QWORD block[2];
  uint64_t (*v43)(uint64_t);
  void *v44;
  VUIMediaInfo *v45;
  id v46;
  id v47;
  BOOL v48;
  _QWORD v49[4];
  id v50;
  uint8_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[8];
  uint8_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t v65[4];
  void *v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "grouping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    *(_QWORD *)buf = 0;
    v60 = buf;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__17;
    v63 = __Block_byref_object_dispose__17;
    v64 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__17;
    v57 = __Block_byref_object_dispose__17;
    v58 = 0;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_59;
    v49[3] = &unk_1E9F9FA68;
    v51 = buf;
    v52 = &v53;
    v50 = *(id *)(a1 + 32);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v49);
    v11 = (void *)v54[5];
    if (!v11)
    {
      v31 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "No Next Episode for Post Play", v65, 2u);
      }
      v20 = 0;
      v21 = 0;
      LOBYTE(v18) = 0;
      goto LABEL_26;
    }
    objc_msgSend(v11, "episodeIndexInSeries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(*((id *)v60 + 5), "episodeIndexInSeries");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (!v14)
      {
        objc_msgSend((id)v54[5], "episodeIndexInSeries");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "longValue");
        objc_msgSend(*((id *)v60 + 5), "episodeIndexInSeries");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16 == objc_msgSend(v17, "longValue") + 1;

        goto LABEL_13;
      }
    }
    objc_msgSend(*((id *)v60 + 5), "seasonIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v54[5], "seasonIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqual:", v23) & 1) != 0
      && (objc_msgSend((id)v54[5], "episodeNumber"), (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(*((id *)v60 + 5), "episodeNumber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;

      if (!v26)
      {
        objc_msgSend((id)v54[5], "episodeNumber");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "longValue");
        objc_msgSend(*((id *)v60 + 5), "episodeNumber");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v28 == objc_msgSend(v29, "longValue") + 1;

LABEL_13:
        if (v18)
          v30 = 6;
        else
          v30 = 7;
        goto LABEL_21;
      }
    }
    else
    {

    }
    LOBYTE(v18) = 0;
    v30 = 7;
LABEL_21:
    v32 = [VUIMediaInfo alloc];
    v67[0] = v54[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[VUIMediaInfo initWithPlaybackContext:vuiMediaItems:](v32, "initWithPlaybackContext:vuiMediaItems:", v30, v33);

    -[VUIMediaInfo setIntent:](v21, "setIntent:", 1);
    -[VUIMediaInfo tvpPlaylist](v21, "tvpPlaylist");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      objc_msgSend(v34, "trackList");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = sLogObject_13;
      if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v65 = 138412290;
        v66 = v20;
        _os_log_impl(&dword_1D96EE000, v37, OS_LOG_TYPE_DEFAULT, "Found Next Episode for Post Play: <%@>", v65, 0xCu);
      }
    }
    else
    {
      v20 = 0;
    }

LABEL_26:
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(buf, 8);
    v10 = MEMORY[0x1E0C809B0];
    goto LABEL_27;
  }
  v19 = sLogObject_13;
  if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Failed to find Series for current MediaEntity", buf, 2u);
  }
  v20 = 0;
  v21 = 0;
  LOBYTE(v18) = 0;
LABEL_27:
  block[0] = v10;
  block[1] = 3221225472;
  v43 = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_65;
  v44 = &unk_1E9F9E8A0;
  v38 = *(id *)(a1 + 40);
  v46 = v20;
  v47 = v38;
  v45 = v21;
  v48 = v18;
  v39 = (void *)MEMORY[0x1E0CB3978];
  v40 = v20;
  v41 = v21;
  if (objc_msgSend(v39, "isMainThread"))
    v43((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_59(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10[2];
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "mediaEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2_60;
  v9[3] = &unk_1E9F9FA40;
  v11 = *(_QWORD *)(a1 + 48);
  v12 = a4;
  v8 = *(_OWORD *)(a1 + 32);
  v7 = (id)v8;
  *(_OWORD *)v10 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_2_60(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  int v17;
  id v18;

  v18 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "seasonIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "seasonIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "episodeIndexInSeries");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "episodeIndexInSeries");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue") + 1;

        if (v10 == v12)
        {
          *a4 = 1;
          **(_BYTE **)(a1 + 56) = 1;
        }
      }
      else
      {

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isLocal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if (v14)
      {
        *a4 = 1;
        **(_BYTE **)(a1 + 56) = 1;
      }
    }
    v15 = v18;
    objc_msgSend(v15, "storeID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

    if (v17)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  }
}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_fetchContentFromLibraryForCurrentMediaItem:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v5 = a4;
  objc_msgSend(a3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__VUIPostPlayDataManager__fetchContentFromLibraryForCurrentMediaItem_completion___block_invoke;
    v11[3] = &unk_1E9F9FA18;
    v12 = v5;
    +[VUIPostPlayDataManager _fetchPostPlayItemFromLibraryContentForStoreID:completion:](VUIPostPlayDataManager, "_fetchPostPlayItemFromLibraryContentForStoreID:completion:", v8, v11);

  }
  else
  {
    v9 = sLogObject_13;
    if (os_log_type_enabled((os_log_t)sLogObject_13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Failed to find StoreID for currentMediaItem", v10, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
  }

}

uint64_t __81__VUIPostPlayDataManager__fetchContentFromLibraryForCurrentMediaItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_generateMediaInfoFromJSResponse:(id)a3 canAutoPlay:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  VUIMediaInfo *v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("videosPlayables"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("contentMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIVideosPlayable videosPlayablesFromDictionaries:andMetadataDictionary:](VUIVideosPlayable, "videosPlayablesFromDictionaries:andMetadataDictionary:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    if (v4)
      v9 = 6;
    else
      v9 = 7;
    v10 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:]([VUIMediaInfo alloc], "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", v9, v8, 0, 0);
    -[VUIMediaInfo setIntent:](v10, "setIntent:", 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Failed to receive a VUIMediaEntityFetchResponse for current TVPMediaItem", a5, a6, a7, a8, 0);
}

void __84__VUIPostPlayDataManager__fetchPostPlayItemFromLibraryContentForStoreID_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Failed to find MediaEntity for current TVPMediaItem", a5, a6, a7, a8, 0);
}

@end
