@implementation PXStoryPhotoKitMusicCurationProvider

- (PXStoryPhotoKitMusicCurationProvider)init
{
  PXStoryPhotoKitMusicCurationProvider *v2;
  uint64_t v3;
  OS_dispatch_queue *stateQueue;
  uint64_t v5;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *stateQueue_cache;
  NSMutableDictionary *v9;
  NSMutableDictionary *stateQueue_requests;
  objc_class *v11;
  id v12;
  const char *v13;
  os_log_t v14;
  OS_os_log *log;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXStoryPhotoKitMusicCurationProvider;
  v2 = -[PXStoryPhotoKitMusicCurationProvider init](&v17, sel_init);
  if (v2)
  {
    px_dispatch_queue_create_serial();
    v3 = objc_claimAutoreleasedReturnValue();
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v3;

    px_dispatch_queue_create_serial();
    v5 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stateQueue_cache = v2->_stateQueue_cache;
    v2->_stateQueue_cache = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stateQueue_requests = v2->_stateQueue_requests;
    v2->_stateQueue_requests = v9;

    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");

    v14 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v13);
    log = v2->_log;
    v2->_log = (OS_os_log *)v14;

  }
  return v2;
}

- (NSArray)recentlyUsedFlexSongIDs
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5573;
  v11 = __Block_byref_object_dispose__5574;
  v12 = 0;
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PXStoryPhotoKitMusicCurationProvider_recentlyUsedFlexSongIDs__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedFlexSongIDs___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5573;
  v11 = __Block_byref_object_dispose__5574;
  v12 = 0;
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PXStoryPhotoKitMusicCurationProvider_recentlyUsedAppleMusicSongIDs__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedAppleMusicSongIDs___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)requestMusicCurationForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  PXStoryMusicCurationProviderOptions *v16;
  PXStoryMusicCurationProviderOptions *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  os_signpost_id_t spid;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  void (**v42)(id, void *);
  os_signpost_id_t v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[PXStoryPhotoKitMusicCurationProvider log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, self);
  v13 = v11;
  v14 = v13;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 134217984;
    v45 = objc_msgSend(v9, "logContext");
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PXStoryMusicCurationManagerResultDelivery", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
  }
  spid = v12;

  if (v9)
    v16 = (PXStoryMusicCurationProviderOptions *)objc_msgSend(v9, "copy");
  else
    v16 = objc_alloc_init(PXStoryMusicCurationProviderOptions);
  v17 = v16;
  -[PXStoryMusicCurationProviderOptions categories](v16, "categories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
    -[PXStoryMusicCurationProviderOptions categories](v17, "categories");
  else
    PXAllMusicCurationCategories();
  v19 = objc_claimAutoreleasedReturnValue();
  -[PXStoryMusicCurationProviderOptions setCategories:](v17, "setCategories:", v19);

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v20, "isAppleMusicAllowed");

  if ((v19 & 1) == 0)
  {
    -[PXStoryMusicCurationProviderOptions categories](v17, "categories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PXAppleMusicCurationCategories();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PXSetSubtract(v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMusicCurationProviderOptions setCategories:](v17, "setCategories:", v23);

  }
  PLStoryGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMusicCurationProviderOptions categories](v17, "categories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = (uint64_t)v25;
    v46 = 2112;
    v47 = v26;
    _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Received request for music curation for asset container: %@; categories: %@",
      buf,
      0x16u);

  }
  -[PXStoryPhotoKitMusicCurationProvider _cachedResultForAssetContainer:options:](self, "_cachedResultForAssetContainer:options:", v8, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isComplete");
  PLStoryGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (v28)
  {
    if (v30)
    {
      objc_msgSend(v8, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v31;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Cached music curation result found for asset container: %@.", buf, 0xCu);

    }
    v10[2](v10, v27);
    v32 = v14;
    v33 = v32;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      v34 = objc_msgSend(v9, "logContext");
      *(_DWORD *)buf = 134218242;
      v45 = v34;
      v46 = 2114;
      v47 = v27;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryMusicCurationManagerResultDelivery", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
    }
    v35 = 0;
  }
  else
  {
    if (v30)
    {
      objc_msgSend(v8, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v36;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) No music curation result found. Starting new request for asset container: %@", buf, 0xCu);

    }
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __100__PXStoryPhotoKitMusicCurationProvider_requestMusicCurationForAssetContainer_options_resultHandler___block_invoke;
    v39[3] = &unk_1E51170B8;
    v40 = v14;
    v43 = spid;
    v41 = v9;
    v42 = v10;
    -[PXStoryPhotoKitMusicCurationProvider _performRequestForAssetContainer:options:resultHandler:](self, "_performRequestForAssetContainer:options:resultHandler:", v8, v17, v39);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v40;
  }

  return v35;
}

- (void)applyNegativeFeedbackToSong:(id)a3 forAssetContainer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLStoryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Received request to apply negative feedback for song: %@ in asset container: %@", (uint8_t *)&v10, 0x16u);
  }

  -[PXStoryPhotoKitMusicCurationProvider _removeRejectedSong:fromCachedResultForAssetContainer:](self, "_removeRejectedSong:fromCachedResultForAssetContainer:", v6, v7);
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPhotoKitMusicCurationProvider _saveNegativeFeedbackForSongIdentifier:assetContainer:](self, "_saveNegativeFeedbackForSongIdentifier:assetContainer:", v9, v7);

}

- (void)updateAudioAsset:(id)a3 forAssetContainer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLStoryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurationManager) Received request to update song: %@ in asset container: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PXStoryPhotoKitMusicCurationProvider _replaceSongWithSong:inCachedResultForAssetContainer:](self, "_replaceSongWithSong:inCachedResultForAssetContainer:", v6, v7);
}

- (id)_performRequestForAssetContainer:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _PXStoryMusicCurationProviderRequest *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id location;
  _QWORD block[5];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__5573;
  v55 = __Block_byref_object_dispose__5574;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5573;
  v49 = __Block_byref_object_dispose__5574;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5573;
  v43 = __Block_byref_object_dispose__5574;
  v44 = 0;
  RequestCacheKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke;
  block[3] = &unk_1E51196F0;
  v36 = &v51;
  block[4] = self;
  v14 = v11;
  v35 = v14;
  v37 = &v45;
  v38 = &v39;
  dispatch_sync(v12, block);

  v15 = (void *)v52[5];
  if (!v15)
  {
    objc_initWeak(&location, self);
    v16 = [_PXStoryMusicCurationProviderRequest alloc];
    v17 = v46[5];
    v18 = v40[5];
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_2;
    v29[3] = &unk_1E51170E0;
    objc_copyWeak(&v32, &location);
    v30 = v8;
    v31 = v9;
    v19 = -[_PXStoryMusicCurationProviderRequest initWithAssetContainer:options:recentlyUsedFlexSongIDs:recentlyUsedAppleMusicSongIDs:completion:](v16, "initWithAssetContainer:options:recentlyUsedFlexSongIDs:recentlyUsedAppleMusicSongIDs:completion:", v30, v31, v17, v18, v29);
    v20 = (void *)v52[5];
    v52[5] = v19;

    -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_3;
    v26[3] = &unk_1E513FD98;
    v26[4] = self;
    v27 = v14;
    v28 = &v51;
    dispatch_sync(v21, v26);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    v15 = (void *)v52[5];
  }
  objc_msgSend(v15, "appendResultHandler:", v10);
  -[PXStoryPhotoKitMusicCurationProvider workQueue](self, "workQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_4;
  v25[3] = &unk_1E51482E0;
  v25[4] = &v51;
  dispatch_async(v22, v25);

  objc_msgSend((id)v52[5], "progress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v23;
}

- (void)_handleMusicCurationResult:(id)a3 forAssetContainer:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PXStoryPhotoKitMusicCurationProvider *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__PXStoryPhotoKitMusicCurationProvider__handleMusicCurationResult_forAssetContainer_options___block_invoke;
  v15[3] = &unk_1E513DD48;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (id)_cachedResultForAssetContainer:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  PXMusicCurationConcreteResult *v14;
  void *v15;
  PXMusicCurationConcreteResult *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *);
  void *v21;
  id v22;
  id v23;
  PXStoryPhotoKitMusicCurationProvider *v24;
  id v25;

  v6 = a3;
  objc_msgSend(a4, "categories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __79__PXStoryPhotoKitMusicCurationProvider__cachedResultForAssetContainer_options___block_invoke;
  v21 = &unk_1E513DD48;
  v10 = v7;
  v22 = v10;
  v11 = v8;
  v23 = v11;
  v24 = self;
  v12 = v6;
  v25 = v12;
  dispatch_sync(v9, &v18);

  v13 = objc_msgSend(v11, "count", v18, v19, v20, v21);
  if (v13 == objc_msgSend(v10, "count"))
  {
    v14 = [PXMusicCurationConcreteResult alloc];
    v15 = (void *)objc_msgSend(v11, "copy");
    v16 = -[PXMusicCurationConcreteResult initWithSongsByCategory:](v14, "initWithSongsByCategory:", v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_removeRejectedSong:(id)a3 fromCachedResultForAssetContainer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PXStoryPhotoKitMusicCurationProvider__removeRejectedSong_fromCachedResultForAssetContainer___block_invoke;
  block[3] = &unk_1E51457C8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_replaceSongWithSong:(id)a3 inCachedResultForAssetContainer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PXStoryPhotoKitMusicCurationProvider stateQueue](self, "stateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke;
  block[3] = &unk_1E51457C8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_saveNegativeFeedbackForSongIdentifier:(id)a3 assetContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;

    if (v9)
    {
      -[PXStoryPhotoKitMusicCurationProvider workQueue](self, "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke;
      v13[3] = &unk_1E5148D08;
      v11 = v9;
      v14 = v11;
      v15 = v6;
      dispatch_async(v10, v13);

      v12 = v14;
      goto LABEL_9;
    }
  }
  else
  {

  }
  PLStoryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Failed to save negative feedback for asset container of unsupported type: %@", buf, 0xCu);
  }
  v11 = 0;
LABEL_9:

}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableDictionary)stateQueue_cache
{
  return self->_stateQueue_cache;
}

- (NSMutableDictionary)stateQueue_requests
{
  return self->_stateQueue_requests;
}

- (NSArray)stateQueue_recentlyUsedFlexSongIDs
{
  return self->_stateQueue_recentlyUsedFlexSongIDs;
}

- (void)setStateQueue_recentlyUsedFlexSongIDs:(id)a3
{
  objc_storeStrong((id *)&self->_stateQueue_recentlyUsedFlexSongIDs, a3);
}

- (NSArray)stateQueue_recentlyUsedAppleMusicSongIDs
{
  return self->_stateQueue_recentlyUsedAppleMusicSongIDs;
}

- (void)setStateQueue_recentlyUsedAppleMusicSongIDs:(id)a3
{
  objc_storeStrong((id *)&self->_stateQueue_recentlyUsedAppleMusicSongIDs, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_stateQueue_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_stateQueue_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_stateQueue_requests, 0);
  objc_storeStrong((id *)&self->_stateQueue_cache, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

void __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = *MEMORY[0x1E0CD1D28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  objc_msgSend(v3, "setIncludePendingMemories:", 1);
  objc_msgSend(v3, "setIncludeRejectedMemories:", 1);
  objc_msgSend(v3, "setIncludeLocalMemories:", 1);
  objc_msgSend(v3, "setIncludeStoryMemories:", 1);
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD13B8];
  v31 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetCollectionsWithType:localIdentifiers:options:", 4, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CD17F0];
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "userFeedbackProperties");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "userFeedback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "negativeUserFeedbackForMemoryMusicWithSongIdentifier:existingFeedback:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke_142;
    v22[3] = &unk_1E5148D08;
    v15 = v9;
    v23 = v15;
    v16 = v14;
    v24 = v16;
    v21 = 0;
    LOBYTE(v12) = objc_msgSend(v2, "performChangesAndWait:error:", v22, &v21);
    v17 = v21;
    if ((v12 & 1) == 0)
    {
      PLStoryGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v26 = v5;
        v27 = 2112;
        v28 = v19;
        v29 = 2112;
        v30 = v17;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Failed to save negative feedback for song identifier %@ in memory %@ error: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    PLStoryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v26 = v5;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Failed to find memory %@ when saving negative feedback for song %@", buf, 0x16u);
    }
  }

}

void __94__PXStoryPhotoKitMusicCurationProvider__saveNegativeFeedbackForSongIdentifier_assetContainer___block_invoke_142(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserFeedback:", *(_QWORD *)(a1 + 40));

}

void __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stateQueue_cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v2, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        AssetContainerFromCacheKey(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

        if ((_DWORD)v7)
        {
          objc_msgSend(v2, "objectForKeyedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          v19 = &v18;
          v20 = 0x2020000000;
          v21 = 0x7FFFFFFFFFFFFFFFLL;
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke_2;
          v15[3] = &unk_1E5117108;
          v16 = *(id *)(a1 + 48);
          v17 = &v18;
          objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
          if (v19[3] != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectsAtIndexes:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(v11, "mutableCopy");

            objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v19[3], *(_QWORD *)(a1 + 48));
            PXAudioAssetFetchResultWithArray(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v6);

          }
          _Block_object_dispose(&v18, 8);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v3);
  }

}

void __93__PXStoryPhotoKitMusicCurationProvider__replaceSongWithSong_inCachedResultForAssetContainer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __94__PXStoryPhotoKitMusicCurationProvider__removeRejectedSong_fromCachedResultForAssetContainer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stateQueue_cache");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        AssetContainerFromCacheKey(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

        if ((_DWORD)v8)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 48)))
          {
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectsAtIndexes:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v12, "mutableCopy");

            objc_msgSend(v13, "removeObject:", *(_QWORD *)(a1 + 48));
            PXAudioAssetFetchResultWithArray(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v7);

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

void __79__PXStoryPhotoKitMusicCurationProvider__cachedResultForAssetContainer_options___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(a1[6], "stateQueue_cache", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        CacheKey(a1[7], v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v10, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __93__PXStoryPhotoKitMusicCurationProvider__handleMusicCurationResult_forAssetContainer_options___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "songsByCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "stateQueue_cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CacheKey(a1[6], v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(a1[5], "stateQueue_requests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  RequestCacheKey(a1[6], a1[7]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

}

void __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "stateQueue_requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedFlexSongIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedAppleMusicSongIDs");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleMusicCurationResult:forAssetContainer:options:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "stateQueue_requests");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

uint64_t __95__PXStoryPhotoKitMusicCurationProvider__performRequestForAssetContainer_options_resultHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "start");
}

void __100__PXStoryPhotoKitMusicCurationProvider_requestMusicCurationForAssetContainer_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "logContext");
    v8 = 134218242;
    v9 = v7;
    v10 = 2114;
    v11 = v3;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryMusicCurationManagerResultDelivery", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __73__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedAppleMusicSongIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateQueue_recentlyUsedAppleMusicSongIDs:", *(_QWORD *)(a1 + 40));
}

void __69__PXStoryPhotoKitMusicCurationProvider_recentlyUsedAppleMusicSongIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedAppleMusicSongIDs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __67__PXStoryPhotoKitMusicCurationProvider_setRecentlyUsedFlexSongIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateQueue_recentlyUsedFlexSongIDs:", *(_QWORD *)(a1 + 40));
}

void __63__PXStoryPhotoKitMusicCurationProvider_recentlyUsedFlexSongIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "stateQueue_recentlyUsedFlexSongIDs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5635 != -1)
    dispatch_once(&sharedInstance_onceToken_5635, &__block_literal_global_5636);
  return (id)sharedInstance_sharedInstance_5637;
}

void __54__PXStoryPhotoKitMusicCurationProvider_sharedInstance__block_invoke()
{
  PXStoryPhotoKitMusicCurationProvider *v0;
  void *v1;

  v0 = objc_alloc_init(PXStoryPhotoKitMusicCurationProvider);
  v1 = (void *)sharedInstance_sharedInstance_5637;
  sharedInstance_sharedInstance_5637 = (uint64_t)v0;

}

@end
