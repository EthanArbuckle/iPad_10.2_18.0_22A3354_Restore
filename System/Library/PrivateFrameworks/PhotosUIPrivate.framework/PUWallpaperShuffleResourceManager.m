@implementation PUWallpaperShuffleResourceManager

- (PUWallpaperShuffleResourceManager)initWithPosterMedia:(id)a3 style:(id)a4 assetDirectory:(id)a5 persistedStyle:(id)a6 photoLibrary:(id)a7 shuffleType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PUWallpaperShuffleResourceManager *v18;
  PUWallpaperShuffleResourceManager *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDictionary *initialPosterMediaByAssetUUIDs;
  NSMutableDictionary *v31;
  NSMutableDictionary *segmentationLoadingOperationsByAssetUUIDs;
  NSOperationQueue *v33;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v35;
  NSOperationQueue *v36;
  NSOperationQueue *requestOperationQueue;
  NSOperationQueue *v38;
  NSOperationQueue *v39;
  NSOperationQueue *exportOperationQueue;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v45 = a7;
  v50.receiver = self;
  v50.super_class = (Class)PUWallpaperShuffleResourceManager;
  v18 = -[PUWallpaperShuffleResourceManager init](&v50, sel_init);
  v19 = v18;
  if (v18)
  {
    v42 = v17;
    v43 = v16;
    v44 = v15;
    v18->_shuffleType = a8;
    objc_storeStrong((id *)&v18->_style, a4);
    objc_storeStrong((id *)&v19->_assetDirectory, a5);
    objc_storeStrong((id *)&v19->_persistedStyle, a6);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v21 = v14;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v27 = (void *)objc_msgSend(v26, "copy", v42, v43, v44);
          objc_msgSend(v26, "assetUUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, v28);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v23);
    }

    v29 = objc_msgSend(v20, "copy");
    initialPosterMediaByAssetUUIDs = v19->_initialPosterMediaByAssetUUIDs;
    v19->_initialPosterMediaByAssetUUIDs = (NSDictionary *)v29;

    objc_storeStrong((id *)&v19->_photoLibrary, a7);
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    segmentationLoadingOperationsByAssetUUIDs = v19->_segmentationLoadingOperationsByAssetUUIDs;
    v19->_segmentationLoadingOperationsByAssetUUIDs = v31;

    v33 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v33, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v33, "setName:", CFSTR("com.apple.photos.wallpaper-shuffle-loading"));
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v33;
    v35 = v33;

    v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v36, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v36, "setName:", CFSTR("com.apple.photos.wallpaper-shuffle-requests"));
    requestOperationQueue = v19->_requestOperationQueue;
    v19->_requestOperationQueue = v36;
    v38 = v36;

    v39 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v39, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v39, "setName:", CFSTR("com.apple.photos.wallpaper-shuffle-export"));
    exportOperationQueue = v19->_exportOperationQueue;
    v19->_exportOperationQueue = v39;

    v16 = v43;
    v15 = v44;
    v17 = v42;
  }

  return v19;
}

- (void)startPreloadingResourcesForPosterMedia:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  PUWallpaperShuffleSegmentationLoadingOperation *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  PUWallpaperShuffleResourceManager *v34;
  os_signpost_id_t v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t v41;
  os_signpost_id_t v42;
  mach_timebase_info v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  mach_timebase_info info;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "startPreloadingResourcesForPosterMedia", ", buf, 2u);
  }
  v35 = v6;
  v33 = v8;

  info = 0;
  mach_timebase_info(&info);
  v32 = mach_absolute_time();
  v9 = objc_msgSend(v4, "count");
  PLWallpaperGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v56 = v9;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_INFO, "Started preloading resources for %ld shuffle assets.", buf, 0xCu);
  }

  -[PUWallpaperShuffleResourceManager photoLibrary](self, "photoLibrary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager assetDirectory](self, "assetDirectory");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = self;
  -[PUWallpaperShuffleResourceManager segmentationLoadingOperationsByAssetUUIDs](self, "segmentationLoadingOperationsByAssetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v18, "assetUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v19);
        v20 = (PUWallpaperShuffleSegmentationLoadingOperation *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v20 = -[PUWallpaperShuffleSegmentationLoadingOperation initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:]([PUWallpaperShuffleSegmentationLoadingOperation alloc], "initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:", v18, v37, v38, 1);
          -[PUWallpaperShuffleSegmentationLoadingOperation setQueuePriority:](v20, "setQueuePriority:", -4);
          -[PUWallpaperShuffleSegmentationLoadingOperation setQualityOfService:](v20, "setQualityOfService:", 17);
          objc_msgSend(v18, "assetUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v21);

          objc_msgSend(v36, "addOperation:", v20);
        }
        objc_msgSend(v18, "assetUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v15);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v23 = v12;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v23, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "cancel");

        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v28);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v25);
  }

  -[PUWallpaperShuffleResourceManager operationQueue](v34, "operationQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __76__PUWallpaperShuffleResourceManager_startPreloadingResourcesForPosterMedia___block_invoke;
  v39[3] = &unk_1E58AA1F8;
  v40 = v33;
  v41 = v32;
  v42 = v35;
  v43 = info;
  v31 = v33;
  objc_msgSend(v30, "addBarrierBlock:", v39);

}

- (void)stopPreloadingResourcesWithTimeout:(double)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  dispatch_time_t v29;
  NSObject *v30;
  uint64_t v31;
  uint32_t denom;
  uint32_t numer;
  NSObject *v34;
  NSObject *v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD v38[4];
  NSObject *v39;
  _QWORD v40[4];
  NSObject *v41;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "stopPreloadingResourcesWithTimeout", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v10 = mach_absolute_time();
  v11 = dispatch_group_create();
  PLWallpaperGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "operationCount");
    -[PUWallpaperShuffleResourceManager requestOperationQueue](self, "requestOperationQueue");
    v15 = v6;
    v16 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "operationCount");
    *(_DWORD *)buf = 134217984;
    v44 = (const char *)(v18 + v14);
    _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_INFO, "Cancelling %lu shuffle operations...", buf, 0xCu);

    v10 = v16;
    v6 = v15;

  }
  dispatch_group_enter(v11);
  -[PUWallpaperShuffleResourceManager requestOperationQueue](self, "requestOperationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cancelAllOperations");

  -[PUWallpaperShuffleResourceManager requestOperationQueue](self, "requestOperationQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke;
  v40[3] = &unk_1E58ABD10;
  v22 = v11;
  v41 = v22;
  objc_msgSend(v20, "addBarrierBlock:", v40);

  dispatch_group_enter(v22);
  -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cancelAllOperations");

  -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v21;
  v38[1] = 3221225472;
  v38[2] = __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_2;
  v38[3] = &unk_1E58ABD10;
  v25 = v22;
  v39 = v25;
  objc_msgSend(v24, "addBarrierBlock:", v38);

  dispatch_group_enter(v25);
  -[PUWallpaperShuffleResourceManager exportOperationQueue](self, "exportOperationQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cancelAllOperations");

  -[PUWallpaperShuffleResourceManager exportOperationQueue](self, "exportOperationQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v21;
  v36[1] = 3221225472;
  v36[2] = __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_3;
  v36[3] = &unk_1E58ABD10;
  v28 = v25;
  v37 = v28;
  objc_msgSend(v27, "addBarrierBlock:", v36);

  v29 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_group_wait(v28, v29))
  {
    PLWallpaperGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_FAULT, "Timed out waiting for shuffle operations", buf, 2u);
    }

  }
  v31 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v34 = v8;
  v35 = v34;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v35, OS_SIGNPOST_INTERVAL_END, v6, "stopPreloadingResourcesWithTimeout", ", buf, 2u);
  }

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "stopPreloadingResourcesWithTimeout";
    v45 = 2048;
    v46 = (float)((float)((float)((float)(v31 - v10) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)stopPreloadingResources
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperShuffleResourceManager requestOperationQueue](self, "requestOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  -[PUWallpaperShuffleResourceManager exportOperationQueue](self, "exportOperationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllOperations");

}

- (void)setStyle:(id)a3
{
  PIParallaxStyle *v5;
  PIParallaxStyle *v6;
  PIParallaxStyle *v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  PIParallaxStyle *v11;
  id v12;
  id location;

  v5 = (PIParallaxStyle *)a3;
  v6 = self->_style;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PIParallaxStyle isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_style, a3);
      objc_initWeak(&location, self);
      -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __46__PUWallpaperShuffleResourceManager_setStyle___block_invoke;
      v10[3] = &unk_1E58AB210;
      objc_copyWeak(&v12, &location);
      v11 = v5;
      objc_msgSend(v9, "addBarrierBlock:", v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_handleSetStyle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  -[PUWallpaperShuffleResourceManager style](self, "style");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v7)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:");

    if (!v6)
      goto LABEL_6;
  }
  -[PUWallpaperShuffleResourceManager _preloadNextMedia](self, "_preloadNextMedia");
LABEL_6:

}

- (void)setDepthEnabledForAllMedia:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  if (self->_depthEnabledForAllMedia != a3)
  {
    self->_depthEnabledForAllMedia = a3;
    objc_initWeak(&location, self);
    -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__PUWallpaperShuffleResourceManager_setDepthEnabledForAllMedia___block_invoke;
    v6[3] = &unk_1E58AA4A0;
    objc_copyWeak(&v7, &location);
    v8 = a3;
    objc_msgSend(v5, "addBarrierBlock:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_preloadNextMedia
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperShuffleResourceManager nextLayerStackOperation](self, "nextLayerStackOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUWallpaperShuffleResourceManager nextLayerStackOperation](self, "nextLayerStackOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "posterMedia");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[PUWallpaperShuffleResourceManager preloadResourceForPosterMedia:](self, "preloadResourceForPosterMedia:", v5);
  }
}

- (void)requestResourceForPosterMedia:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD aBlock[4];
  NSObject *v48;
  PUWallpaperShuffleResourceManager *v49;
  id v50;
  id v51;
  uint64_t v52;
  os_signpost_id_t v53;
  int64_t v54;
  mach_timebase_info v55;
  mach_timebase_info info;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLWallpaperGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "requestResourceForPosterMedia", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v12 = mach_absolute_time();
  -[PUWallpaperShuffleResourceManager style](self, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bakedStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PUWallpaperShuffleResourceManager shuffleType](self, "shuffleType");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke;
  aBlock[3] = &unk_1E589EBA0;
  v52 = v12;
  v55 = info;
  v53 = v9;
  v54 = v15;
  v43 = v11;
  v48 = v43;
  v49 = self;
  v42 = v14;
  v50 = v42;
  v16 = v7;
  v51 = v16;
  v41 = _Block_copy(aBlock);
  -[PUWallpaperShuffleResourceManager nextLayerStackOperation](self, "nextLayerStackOperation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "posterMedia");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assetUUID");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v6, "assetUUID");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 == v21)
  {

  }
  else
  {
    v22 = objc_msgSend(v19, "isEqual:", v21);

    if ((v22 & 1) == 0)
    {

LABEL_10:
      -[PUWallpaperShuffleResourceManager cancelPreloading](self, "cancelPreloading");
      PLWallpaperGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v20;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "assetUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v30;
        _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_INFO, "Shuffle asset was NOT preloaded %{public}@", buf, 0xCu);

      }
      v31 = v20;
      v32 = v41;
      -[PUWallpaperShuffleResourceManager _loadResourceForPosterMedia:isPreloading:completion:](self, "_loadResourceForPosterMedia:isPreloading:completion:", v31, 0, v41);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperShuffleResourceManager setCurrentLayerStackOperation:](self, "setCurrentLayerStackOperation:", v33);

      goto LABEL_21;
    }
  }
  v23 = v16;
  objc_msgSend(v17, "style");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager style](self, "style");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v24 == v25)
  {

  }
  else
  {
    v26 = v25;
    v27 = objc_msgSend(v24, "isEqual:", v25);

    v16 = v23;
    if ((v27 & 1) == 0)
      goto LABEL_10;
  }
  v34 = objc_msgSend(v17, "isFinished");
  PLWallpaperGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
  v29 = v20;
  if (v34)
  {
    v32 = v41;
    if (v36)
    {
      objc_msgSend(v29, "assetUUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v37;
      _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_INFO, "Shuffle asset was preloaded %{public}@", buf, 0xCu);

    }
    (*((void (**)(void *, void *))v41 + 2))(v41, v17);
  }
  else
  {
    v32 = v41;
    if (v36)
    {
      objc_msgSend(v29, "assetUUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v38;
      _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_INFO, "Shuffle asset is still preloading %{public}@", buf, 0xCu);

    }
    -[PUWallpaperShuffleResourceManager requestOperationQueue](self, "requestOperationQueue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke_34;
    v44[3] = &unk_1E58AB968;
    v46 = v41;
    v40 = v17;
    v45 = v40;
    objc_msgSend(v39, "addBarrierBlock:", v44);

    -[PUWallpaperShuffleResourceManager setCurrentLayerStackOperation:](self, "setCurrentLayerStackOperation:", v40);
    -[PUWallpaperShuffleResourceManager setNextLayerStackOperation:](self, "setNextLayerStackOperation:", 0);

    v16 = v23;
  }
LABEL_21:

}

- (id)_loadResourceForPosterMedia:(id)a3 isPreloading:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PUWallpaperShuffleSegmentationLoadingOperation *v17;
  PUWallpaperShuffleLayerStackLoadingOperation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PUWallpaperShuffleLayerStackLoadingOperation *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PUWallpaperShuffleLayerStackLoadingOperation *v39;
  PUWallpaperShuffleSegmentationLoadingOperation *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id from;
  _QWORD v51[4];
  id v52;
  id v53;
  id location;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v6 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v8 = a5;
  -[PUWallpaperShuffleResourceManager initialPosterMediaByAssetUUIDs](self, "initialPosterMediaByAssetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "assetUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = v46;
  if (v11)
    v13 = (void *)v11;
  v45 = v13;

  -[PUWallpaperShuffleResourceManager segmentationLoadingOperationsByAssetUUIDs](self, "segmentationLoadingOperationsByAssetUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "assetUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (PUWallpaperShuffleSegmentationLoadingOperation *)v16;
  if (v16)
  {
    if (v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v40 = [PUWallpaperShuffleSegmentationLoadingOperation alloc];
  -[PUWallpaperShuffleResourceManager assetDirectory](self, "assetDirectory");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager photoLibrary](self, "photoLibrary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PUWallpaperShuffleSegmentationLoadingOperation initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:](v40, "initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:", v45, v41, v42, v6);

  if (!v6)
  {
LABEL_5:
    -[PUWallpaperShuffleSegmentationLoadingOperation setQueuePriority:](v17, "setQueuePriority:", 8, v45);
    -[PUWallpaperShuffleSegmentationLoadingOperation setQualityOfService:](v17, "setQualityOfService:", 25);
  }
LABEL_6:
  v18 = [PUWallpaperShuffleLayerStackLoadingOperation alloc];
  objc_msgSend(v46, "editConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager assetDirectory](self, "assetDirectory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager style](self, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager persistedStyle](self, "persistedStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PUWallpaperShuffleLayerStackLoadingOperation initWithPosterMedia:editConfiguration:assetDirectory:style:persistedStyle:isPreloading:](v18, "initWithPosterMedia:editConfiguration:assetDirectory:style:persistedStyle:isPreloading:", v45, v19, v20, v21, v22, v6);

  objc_initWeak(&location, v23);
  v24 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke;
  v51[3] = &unk_1E58A4AC8;
  objc_copyWeak(&v53, &location);
  v25 = v8;
  v52 = v25;
  -[PUWallpaperShuffleLayerStackLoadingOperation setCompletionBlock:](v23, "setCompletionBlock:", v51);
  if (!v6)
  {
    -[PUWallpaperShuffleLayerStackLoadingOperation setQueuePriority:](v23, "setQueuePriority:", 8);
    -[PUWallpaperShuffleLayerStackLoadingOperation setQualityOfService:](v23, "setQualityOfService:", 25);
  }
  if (v16 && -[PXAsyncOperation isFinished](v17, "isFinished"))
  {
    PLWallpaperGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v46, "assetUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v27;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_INFO, "Shuffle poster media already segmented: %{public}@", buf, 0xCu);

    }
    -[PUWallpaperShuffleSegmentationLoadingOperation segmentationItem](v17, "segmentationItem");
    v28 = objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleLayerStackLoadingOperation setSegmentationItem:](v23, "setSegmentationItem:", v28);

    -[PUWallpaperShuffleSegmentationLoadingOperation segmentationItem](v17, "segmentationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v28) = v29 == 0;

    if ((v28 & 1) != 0)
    {
      -[PUWallpaperShuffleSegmentationLoadingOperation error](v17, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperShuffleLayerStackLoadingOperation setError:](v23, "setError:", v30);
    }
    else
    {
      -[PUWallpaperShuffleSegmentationLoadingOperation segmentationItem](v17, "segmentationItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperShuffleLayerStackLoadingOperation setSegmentationItem:](v23, "setSegmentationItem:", v30);
    }

    if (!-[PUWallpaperShuffleLayerStackLoadingOperation tryLoadLayerStackFromDirectory](v23, "tryLoadLayerStackFromDirectory"))
    {
      -[PUWallpaperShuffleResourceManager requestOperationQueue](self, "requestOperationQueue");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addOperation:", v23);

      v39 = v23;
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (-[PUWallpaperShuffleSegmentationLoadingOperation tryLoadSegmentationFromDirectory](v17, "tryLoadSegmentationFromDirectory", v45)&& -[PUWallpaperShuffleLayerStackLoadingOperation tryLoadLayerStackFromDirectory](v23, "tryLoadLayerStackFromDirectory"))
  {
    PLWallpaperGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v46, "assetUUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v32;
      _os_log_impl(&dword_1AAB61000, v31, OS_LOG_TYPE_INFO, "Shuffle poster media was loaded from directory: %{public}@", buf, 0xCu);

    }
    -[PUWallpaperShuffleSegmentationLoadingOperation segmentationItem](v17, "segmentationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleLayerStackLoadingOperation setSegmentationItem:](v23, "setSegmentationItem:", v33);

LABEL_26:
    (*((void (**)(id, PUWallpaperShuffleLayerStackLoadingOperation *))v25 + 2))(v25, v23);
    v39 = 0;
    goto LABEL_28;
  }
  -[PUWallpaperShuffleResourceManager requestOperationQueue](self, "requestOperationQueue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    -[PUWallpaperShuffleResourceManager segmentationLoadingOperationsByAssetUUIDs](self, "segmentationLoadingOperationsByAssetUUIDs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "assetUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v17, v36);

    objc_msgSend(v34, "addOperation:", v17);
  }
  objc_initWeak((id *)buf, v17);
  objc_initWeak(&from, v23);
  v37 = (void *)MEMORY[0x1E0CB34C8];
  v47[0] = v24;
  v47[1] = 3221225472;
  v47[2] = __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke_37;
  v47[3] = &unk_1E589EBC8;
  objc_copyWeak(&v48, (id *)buf);
  objc_copyWeak(&v49, &from);
  objc_msgSend(v37, "blockOperationWithBlock:", v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addDependency:", v17);
  -[PUWallpaperShuffleLayerStackLoadingOperation addDependency:](v23, "addDependency:", v38);
  objc_msgSend(v34, "addOperation:", v38);
  objc_msgSend(v34, "addOperation:", v23);
  v39 = v23;

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)buf);

LABEL_28:
  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);

  return v39;
}

- (void)cancelPreloading
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperShuffleResourceManager nextLayerStackOperation](self, "nextLayerStackOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[PUWallpaperShuffleResourceManager nextLayerStackOperation](self, "nextLayerStackOperation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "posterMedia");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "Canceling preloading for shuffle asset %{public}@", (uint8_t *)&v9, 0xCu);

    }
    -[PUWallpaperShuffleResourceManager nextLayerStackOperation](self, "nextLayerStackOperation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

    -[PUWallpaperShuffleResourceManager setNextLayerStackOperation:](self, "setNextLayerStackOperation:", 0);
  }
}

- (void)preloadResourceForPosterMedia:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  NSObject *v18;
  uint64_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  _BYTE buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUWallpaperShuffleResourceManager cancelPreloading](self, "cancelPreloading");
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "assetUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "Preloading shuffle asset %{public}@", buf, 0xCu);

  }
  PLWallpaperGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "preloadResourceForPosterMedia", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  mach_timebase_info((mach_timebase_info_t)buf);
  v11 = mach_absolute_time();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __67__PUWallpaperShuffleResourceManager_preloadResourceForPosterMedia___block_invoke;
  v17 = &unk_1E589EBF0;
  v18 = v10;
  v19 = v11;
  v20 = v8;
  v21 = *(_QWORD *)buf;
  v12 = v10;
  -[PUWallpaperShuffleResourceManager _loadResourceForPosterMedia:isPreloading:completion:](self, "_loadResourceForPosterMedia:isPreloading:completion:", v4, 1, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperShuffleResourceManager setNextLayerStackOperation:](self, "setNextLayerStackOperation:", v13, v14, v15, v16, v17);

}

- (void)exportResourcesForFinalPosterMedia:(id)a3 options:(unint64_t)a4 assetDirectory:(id)a5 progressHandler:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  PUWallpaperExportProgress *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  PUWallpaperShuffleSegmentationLoadingOperation *v27;
  PUWallpaperShuffleSegmentationLoadingOperation *v28;
  void *v29;
  PUWallpaperExportProgress *v30;
  id v31;
  PUWallpaperShuffleResourceExportOperation *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PUWallpaperExportProgress *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  PUWallpaperExportProgress *v45;
  id v46;
  id v47;
  NSObject *v48;
  PUWallpaperExportProgress *v49;
  uint64_t v50;
  os_signpost_id_t v51;
  NSObject *v52;
  id v53;
  id v54;
  id obj;
  uint64_t v56;
  id v58;
  void *v59;
  PUWallpaperExportProgress *v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  PUWallpaperExportProgress *v66;
  NSObject *v67;
  id v68;
  id v69;
  uint64_t v70;
  os_signpost_id_t v71;
  mach_timebase_info v72;
  _QWORD v73[4];
  PUWallpaperExportProgress *v74;
  _QWORD v75[4];
  PUWallpaperExportProgress *v76;
  id v77;
  id v78;
  id v79;
  id location;
  _QWORD v81[4];
  id v82;
  PUWallpaperExportProgress *v83;
  id v84;
  id v85;
  _QWORD v86[4];
  PUWallpaperExportProgress *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  mach_timebase_info info;
  uint8_t v94[128];
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v54 = a6;
  v53 = a7;
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUWallpaperShuffleResourceManager style](self, "style");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [PUWallpaperExportProgress alloc];
  PXMap();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[PUWallpaperExportProgress initWithAssetUUIDs:progressHandler:](v13, "initWithAssetUUIDs:progressHandler:", v14, v54);

  v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PLWallpaperGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "exportResourcesForFinalPosterMedia", ", buf, 2u);
  }
  v51 = v16;
  v52 = v18;

  info = 0;
  mach_timebase_info(&info);
  v50 = mach_absolute_time();
  PLWallpaperGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "operations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v96 = v20;
    v97 = 2114;
    v98 = v22;
    _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_INFO, "Starting shuffle export with current operations in the queue %p:\n%{public}@", buf, 0x16u);

  }
  -[PUWallpaperShuffleResourceManager assetDirectory](self, "assetDirectory");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v12;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v11;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (v62)
  {
    v56 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v90 != v56)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(v24, "assetUUID", v50);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUWallpaperShuffleResourceManager segmentationLoadingOperationsByAssetUUIDs](self, "segmentationLoadingOperationsByAssetUUIDs");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v25);
        v27 = (PUWallpaperShuffleSegmentationLoadingOperation *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v28 = [PUWallpaperShuffleSegmentationLoadingOperation alloc];
          -[PUWallpaperShuffleResourceManager photoLibrary](self, "photoLibrary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[PUWallpaperShuffleSegmentationLoadingOperation initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:](v28, "initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:", v24, v63, v29, 0);

          objc_msgSend(v64, "addObject:", v27);
        }
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_42;
        v86[3] = &unk_1E589EC58;
        v30 = v60;
        v87 = v30;
        v31 = v25;
        v88 = v31;
        -[PUWallpaperShuffleSegmentationLoadingOperation setDownloadProgressHandler:](v27, "setDownloadProgressHandler:", v86);
        v32 = objc_alloc_init(PUWallpaperShuffleResourceExportOperation);
        -[PUWallpaperShuffleResourceExportOperation setSourceDirectory:](v32, "setSourceDirectory:", v63);
        -[PUWallpaperShuffleResourceExportOperation setExportDirectory:](v32, "setExportDirectory:", v61);
        -[PUWallpaperShuffleResourceManager initialPosterMediaByAssetUUIDs](self, "initialPosterMediaByAssetUUIDs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v31);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        if (v34)
          v36 = (void *)v34;
        else
          v36 = v24;
        -[PUWallpaperShuffleResourceExportOperation setPosterMedia:](v32, "setPosterMedia:", v36);

        objc_msgSend(v24, "editConfiguration");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUWallpaperShuffleResourceExportOperation setEditConfiguration:](v32, "setEditConfiguration:", v37);

        -[PUWallpaperShuffleResourceExportOperation setStyle:](v32, "setStyle:", v59);
        -[PUWallpaperShuffleResourceManager persistedStyle](self, "persistedStyle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUWallpaperShuffleResourceExportOperation setPersistedStyle:](v32, "setPersistedStyle:", v38);

        -[PUWallpaperShuffleResourceExportOperation setOptions:](v32, "setOptions:", a4);
        objc_initWeak((id *)buf, v32);
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_2;
        v81[3] = &unk_1E58A9F58;
        objc_copyWeak(&v85, (id *)buf);
        v82 = v58;
        v39 = v30;
        v83 = v39;
        v40 = v31;
        v84 = v40;
        -[PUWallpaperShuffleResourceExportOperation setCompletionBlock:](v32, "setCompletionBlock:", v81);
        objc_initWeak(&location, v27);
        v41 = (void *)MEMORY[0x1E0CB34C8];
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_3;
        v75[3] = &unk_1E589EC80;
        objc_copyWeak(&v78, (id *)buf);
        objc_copyWeak(&v79, &location);
        v76 = v39;
        v42 = v40;
        v77 = v42;
        objc_msgSend(v41, "blockOperationWithBlock:", v75);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addDependency:", v27);
        -[PUWallpaperShuffleResourceExportOperation addDependency:](v32, "addDependency:", v43);
        objc_msgSend(v64, "addObject:", v43);
        objc_msgSend(v64, "addObject:", v32);

        objc_destroyWeak(&v79);
        objc_destroyWeak(&v78);
        objc_destroyWeak(&location);

        objc_destroyWeak(&v85);
        objc_destroyWeak((id *)buf);

      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    }
    while (v62);
  }

  -[PUWallpaperShuffleResourceManager exportOperationQueue](self, "exportOperationQueue");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_4;
  v73[3] = &unk_1E58ABD10;
  v45 = v60;
  v74 = v45;
  objc_msgSend(v44, "addBarrierBlock:", v73);
  objc_msgSend(v44, "addOperations:waitUntilFinished:", v64, 0);
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_5;
  v65[3] = &unk_1E589ECA8;
  v66 = v45;
  v67 = v52;
  v69 = v53;
  v70 = v50;
  v71 = v51;
  v72 = info;
  v68 = v58;
  v46 = v58;
  v47 = v53;
  v48 = v52;
  v49 = v45;
  objc_msgSend(v44, "addBarrierBlock:", v65);

}

- (id)segmentationItemLoadingOperationForPosterMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUWallpaperShuffleSegmentationLoadingOperation *v7;
  PUWallpaperShuffleSegmentationLoadingOperation *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PUWallpaperShuffleResourceManager segmentationLoadingOperationsByAssetUUIDs](self, "segmentationLoadingOperationsByAssetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (PUWallpaperShuffleSegmentationLoadingOperation *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [PUWallpaperShuffleSegmentationLoadingOperation alloc];
    -[PUWallpaperShuffleResourceManager assetDirectory](self, "assetDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperShuffleResourceManager photoLibrary](self, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUWallpaperShuffleSegmentationLoadingOperation initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:](v8, "initWithPosterMedia:assetDirectory:photoLibrary:isPreloading:", v4, v9, v10, 0);

    -[PUWallpaperShuffleResourceManager operationQueue](self, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v7);

  }
  return v7;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (BOOL)depthEnabledForAllMedia
{
  return self->_depthEnabledForAllMedia;
}

- (NSDictionary)initialPosterMediaByAssetUUIDs
{
  return self->_initialPosterMediaByAssetUUIDs;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (PIParallaxStyle)persistedStyle
{
  return self->_persistedStyle;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSOperationQueue)requestOperationQueue
{
  return self->_requestOperationQueue;
}

- (NSOperationQueue)exportOperationQueue
{
  return self->_exportOperationQueue;
}

- (NSMutableDictionary)segmentationLoadingOperationsByAssetUUIDs
{
  return self->_segmentationLoadingOperationsByAssetUUIDs;
}

- (PUWallpaperShuffleLayerStackLoadingOperation)currentLayerStackOperation
{
  return self->_currentLayerStackOperation;
}

- (void)setCurrentLayerStackOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayerStackOperation, a3);
}

- (PUWallpaperShuffleLayerStackLoadingOperation)nextLayerStackOperation
{
  return self->_nextLayerStackOperation;
}

- (void)setNextLayerStackOperation:(id)a3
{
  objc_storeStrong((id *)&self->_nextLayerStackOperation, a3);
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_nextLayerStackOperation, 0);
  objc_storeStrong((id *)&self->_currentLayerStackOperation, 0);
  objc_storeStrong((id *)&self->_segmentationLoadingOperationsByAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_exportOperationQueue, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_persistedStyle, 0);
  objc_storeStrong((id *)&self->_initialPosterMediaByAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportDownloadProgress:forAssetUUID:", *(_QWORD *)(a1 + 40));
}

void __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "posterMedia");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "reportProcessingProgress:forAssetUUID:", *(_QWORD *)(a1 + 48), 1.0);

}

void __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v2, "segmentationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "segmentationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSegmentationItem:", v4);
  }
  else
  {
    objc_msgSend(v2, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setError:", v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "reportDownloadProgress:forAssetUUID:", *(_QWORD *)(a1 + 40), 1.0);
}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "begin");
}

void __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "finish");
  v2 = mach_absolute_time();
  v3 = *(_QWORD *)(a1 + 64);
  v5 = *(_DWORD *)(a1 + 80);
  v4 = *(_DWORD *)(a1 + 84);
  v6 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 72);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v7, OS_SIGNPOST_INTERVAL_END, v8, "exportResourcesForFinalPosterMedia", ", buf, 2u);
  }

  v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "exportResourcesForFinalPosterMedia";
    v14 = 2048;
    v15 = (float)((float)((float)((float)(v2 - v3) * (float)v5) / (float)v4) / 1000000.0);
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  px_dispatch_on_main_queue();

}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetUUID");
}

void __67__PUWallpaperShuffleResourceManager_preloadResourceForPosterMedia___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = mach_absolute_time();
  v6 = *(_DWORD *)(a1 + 56);
  v5 = *(_DWORD *)(a1 + 60);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v9, OS_SIGNPOST_INTERVAL_END, v10, "preloadResourceForPosterMedia", ", (uint8_t *)&v16, 2u);
  }

  v11 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "preloadResourceForPosterMedia";
    v18 = 2048;
    v19 = (float)((float)((float)((float)(v4 - v7) * (float)v6) / (float)v5) / 1000000.0);
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v16, 0x16u);
  }
  objc_msgSend(v3, "layerStack");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if ((objc_msgSend(v3, "isCancelled") & 1) != 0)
      goto LABEL_8;
    PLWallpaperGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "posterMedia");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assetUUID");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = *(double *)&v15;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Failed to preload shuffle asset %{public}@, error: %{public}@", (uint8_t *)&v16, 0x16u);

    }
  }

LABEL_8:
}

void __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_loadWeakRetained(&to);
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  objc_destroyWeak(&to);
}

void __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke_37(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "segmentationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "segmentationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSegmentationItem:", v4);
  }
  else
  {
    objc_msgSend(WeakRetained, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setError:", v4);
  }

}

void __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = mach_absolute_time();
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(_DWORD *)(a1 + 88);
  v6 = *(_DWORD *)(a1 + 92);
  v8 = *(id *)(a1 + 32);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 72);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v9, OS_SIGNPOST_INTERVAL_END, v10, "requestResourceForPosterMedia", ", buf, 2u);
  }

  v11 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "requestResourceForPosterMedia";
    v43 = 2048;
    v44 = (float)((float)((float)((float)(v4 - v5) * (float)v7) / (float)v6) / 1000000.0);
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  objc_msgSend(v3, "segmentationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layerStack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 && (objc_msgSend(v3, "isCancelled") & 1) == 0)
  {
    PLWallpaperGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "posterMedia");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "assetUUID");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v17;
      v43 = 2114;
      v44 = *(double *)&v18;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to load shuffle asset %{public}@, error: %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v3, "editConfiguration");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 80) != 1)
  {
    objc_msgSend(v13, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(*(id *)(a1 + 40), "depthEnabledForAllMedia"), objc_msgSend(*(id *)(a1 + 40), "depthEnabledForAllMedia"));
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setIsDepthEnabled:", objc_msgSend(*(id *)(a1 + 40), "depthEnabledForAllMedia"));
    v13 = (void *)v20;
  }
  if (v13 && !v19)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0D75200]);
    objc_msgSend(v13, "layout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "portraitLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "normalizedVisibleFrame");
    PXRectFlippedVertically();
    objc_msgSend(v19, "setNormalizedVisibleFrame:");

    objc_msgSend(v13, "layout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "landscapeLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "normalizedVisibleFrame");
    PXRectFlippedVertically();
    objc_msgSend(v19, "setNormalizedLandscapeVisibleFrame:");

    objc_msgSend(v13, "portraitLayerStack");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIsDepthEnabled:", objc_msgSend(v25, "depthEnabled"));

    objc_msgSend(v13, "landscapeLayerStack");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIsLandscapeDepthEnabled:", objc_msgSend(v26, "depthEnabled"));

    objc_msgSend(v13, "portraitLayerStack");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "parallaxDisabled"))
    {
      objc_msgSend(v19, "setIsPerspectiveZoomEnabled:", 0);
    }
    else
    {
      objc_msgSend(v13, "layout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "portraitLayout");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "canApplyParallax"))
      {
        objc_msgSend(v13, "layout");
        v37 = v14;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "landscapeLayout");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIsPerspectiveZoomEnabled:", objc_msgSend(v31, "canApplyParallax"));

        v14 = v37;
      }
      else
      {
        objc_msgSend(v19, "setIsPerspectiveZoomEnabled:", 0);
      }

    }
  }
  objc_msgSend(v12, "adjustedStyleForHeadroom:", *(_QWORD *)(a1 + 48));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStyle:", v32);

  v40 = *(id *)(a1 + 56);
  v38 = v12;
  v39 = v13;
  v33 = v14;
  v34 = v19;
  v35 = v13;
  v36 = v12;
  px_dispatch_on_main_queue();

}

uint64_t __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke_32(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

void __64__PUWallpaperShuffleResourceManager_setDepthEnabledForAllMedia___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSetDepthEnabledForAllMedia:", *(unsigned __int8 *)(a1 + 40));

}

void __46__PUWallpaperShuffleResourceManager_setStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSetStyle:", *(_QWORD *)(a1 + 32));

}

void __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __76__PUWallpaperShuffleResourceManager_startPreloadingResourcesForPosterMedia___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = mach_absolute_time();
  v4 = *(_DWORD *)(a1 + 56);
  v3 = *(_DWORD *)(a1 + 60);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v7, OS_SIGNPOST_INTERVAL_END, v8, "startPreloadingResourcesForPosterMedia", ", (uint8_t *)&v10, 2u);
  }

  v9 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "startPreloadingResourcesForPosterMedia";
    v12 = 2048;
    v13 = (float)((float)((float)((float)(v2 - v5) * (float)v4) / (float)v3) / 1000000.0);
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v10, 0x16u);
  }
}

@end
