@implementation PGWallpaperSuggestionAssetGater

- (PGWallpaperSuggestionAssetGater)initWithType:(unint64_t)a3 loggingConnection:(id)a4
{
  id v7;
  PGWallpaperSuggestionAssetGater *v8;
  PGWallpaperSuggestionAssetGater *v9;
  uint64_t v10;
  VCPMediaAnalysisService *mediaAnalysisService;
  uint64_t v12;
  PFWallpaperCompoundDeviceConfiguration *deviceWallpaperLayoutConfiguration;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGWallpaperSuggestionAssetGater;
  v8 = -[PGWallpaperSuggestionAssetGater init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v8->_enableSettlingEffect = 1;
    objc_msgSend(MEMORY[0x1E0D475C0], "analysisService");
    v10 = objc_claimAutoreleasedReturnValue();
    mediaAnalysisService = v9->_mediaAnalysisService;
    v9->_mediaAnalysisService = (VCPMediaAnalysisService *)v10;

    objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    deviceWallpaperLayoutConfiguration = v9->_deviceWallpaperLayoutConfiguration;
    v9->_deviceWallpaperLayoutConfiguration = (PFWallpaperCompoundDeviceConfiguration *)v12;

    objc_storeStrong((id *)&v9->_loggingConnection, a4);
    *(_OWORD *)&v9->_settlingEffectGatingStatistics.numberOfEliminationsThruFRC = 0u;
    *(_OWORD *)&v9->_settlingEffectGatingStatistics.numberOfEliminationsThruStabilization = 0u;
    *(_OWORD *)&v9->_settlingEffectGatingStatistics.numberOfEliminationsThruResourceAvailability = 0u;
    *(_OWORD *)&v9->_currentGatingStatistics.numberOfFailuresFromMediaAnalysisRequests = 0u;
    *(_OWORD *)&v9->_currentGatingStatistics.numberOfFailuresFromNilResult = 0u;
    *(_OWORD *)&v9->_currentGatingStatistics.numberOfAssetsGated = 0u;
  }

  return v9;
}

- (id)_gateAsset:(id)a3 wallpaperProperties:(id *)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  PGWallpaperAssetGaterResult *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int numberOfFailuresFromNilResult;
  int numberOfInvalidAnalysisVersion;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *loggingConnection;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int numberOfTimeoutsFromMediaAnalysisRequests;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(PGWallpaperAssetGaterResult);
  ++self->_currentGatingStatistics.numberOfAssetsGated;
  self->_isLastGatingCallingMediaAnalysis = 0;
  -[PGWallpaperSuggestionAssetGater existingWallpaperPropertiesWithAsset:](self, "existingWallpaperPropertiesWithAsset:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[PGWallpaperSuggestionAssetGater gatingResultWithWallpaperProperties:](self, "gatingResultWithWallpaperProperties:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v13, "passesAnyGating")
      || -[PGWallpaperSuggestionAssetGater cacheExistsForAsset:](self, "cacheExistsForAsset:", v8))
    {
      ++self->_currentGatingStatistics.numberOfValidWallpaperPropertiesRequested;
      if (objc_msgSend(v13, "passesAnyGating"))
        ++self->_currentGatingStatistics.numberOfSuccessFromCache;
      else
        ++self->_currentGatingStatistics.numberOfFailuresFromCache;
      goto LABEL_25;
    }

  }
  else
  {
    v13 = v10;
  }
  numberOfInvalidAnalysisVersion = self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
  numberOfFailuresFromNilResult = self->_currentGatingStatistics.numberOfFailuresFromNilResult;
  numberOfTimeoutsFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfTimeoutsFromMediaAnalysisRequests;
  -[PGWallpaperSuggestionAssetGater requestAndPersistWallpaperPropertiesForAsset:progressBlock:](self, "requestAndPersistWallpaperPropertiesForAsset:progressBlock:", v8, v9);
  v16 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v16;
  v17 = self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
  v18 = self->_currentGatingStatistics.numberOfTimeoutsFromMediaAnalysisRequests;
  if (!v16
    && v17 == numberOfInvalidAnalysisVersion
    && self->_currentGatingStatistics.numberOfFailuresFromNilResult == numberOfFailuresFromNilResult)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "Error in requestAndPersistWallpaperPropertiesForAsset, unknown failure", buf, 2u);
    }
  }
  else if (v16)
  {
    -[PGWallpaperSuggestionAssetGater gatingResultWithWallpaperProperties:](self, "gatingResultWithWallpaperProperties:", v16);
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v20;
  }
  if (!objc_msgSend(v13, "passesAnyGating") || self->_coversTracks)
    -[PGWallpaperSuggestionAssetGater clearCacheOfAsset:](self, "clearCacheOfAsset:", v8);
  v21 = objc_msgSend(v13, "passesAnyGating");
  v22 = 76;
  if (v21)
    v22 = 72;
  ++*(_DWORD *)((char *)&self->super.isa + v22);
  if (v17 == numberOfInvalidAnalysisVersion)
    self->_isLastGatingCallingMediaAnalysis = 1;
  if (v18 != numberOfTimeoutsFromMediaAnalysisRequests)
    objc_msgSend(v13, "setDidTimeout:", 1);
LABEL_25:
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v13;
}

- (id)gateAsset:(id)a3 progressBlock:(id)a4
{
  return -[PGWallpaperSuggestionAssetGater _gateAsset:wallpaperProperties:progressBlock:](self, "_gateAsset:wallpaperProperties:progressBlock:", a3, 0, a4);
}

- (id)gateAsset:(id)a3 hasPetFace:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *loggingConnection;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  -[PGWallpaperSuggestionAssetGater _gateAsset:wallpaperProperties:progressBlock:](self, "_gateAsset:wallpaperProperties:progressBlock:", v6, &v22, &__block_literal_global_29994);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  v9 = v8;
  if (a4)
  {
    if (v8)
    {
LABEL_3:
      *a4 = -[PGWallpaperSuggestionAssetGater _hasPetFaceWithWallpaperProperties:](self, "_hasPetFaceWithWallpaperProperties:", v9);
      goto LABEL_13;
    }
    objc_msgSend(v6, "photoAnalysisWallpaperProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wallpaperPropertiesData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v21;
      v13 = v12;
      if (v9)
      {

        goto LABEL_3;
      }
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        v19 = loggingConnection;
        objc_msgSend(v6, "localIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        v25 = 2112;
        v26 = v13;
        _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed deserializing wallpaper properties on asset %@: %@", buf, 0x16u);

      }
    }
    *a4 = 0;
    v15 = self->_loggingConnection;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      objc_msgSend(v6, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] No wallpaper properties available for asset %@, pet face check is going to fail.", buf, 0xCu);

    }
    v9 = 0;
  }
LABEL_13:

  return v7;
}

- (void)logCurrentGatingStatisticsWithPrefix:(id)a3
{
  id v4;
  NSObject *loggingConnection;
  int numberOfAssetsGated;
  int numberOfMediaAnalysisRequest;
  int numberOfValidWallpaperPropertiesRequested;
  int numberOfInvalidAnalysisVersion;
  int numberOfFailuresFromNilResult;
  int numberOfSuccessFromCache;
  int numberOfFailuresFromCache;
  int numberOfSuccessFromMediaAnalysisRequests;
  int numberOfFailuresFromMediaAnalysisRequests;
  int numberOfTimeoutsFromMediaAnalysisRequests;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ AssetGater Statistics:", (uint8_t *)&v16, 0xCu);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfAssetsGated = self->_currentGatingStatistics.numberOfAssetsGated;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfAssetsGated;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfAssetsGated: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfMediaAnalysisRequest = self->_currentGatingStatistics.numberOfMediaAnalysisRequest;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfMediaAnalysisRequest;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfMediaAnalysisRequest: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfValidWallpaperPropertiesRequested = self->_currentGatingStatistics.numberOfValidWallpaperPropertiesRequested;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfValidWallpaperPropertiesRequested;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfValidWallpaperPropertiesRequested: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfInvalidAnalysisVersion = self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfInvalidAnalysisVersion;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfInvalidAnalysisVersion: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfFailuresFromNilResult = self->_currentGatingStatistics.numberOfFailuresFromNilResult;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfFailuresFromNilResult;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfFailuresFromNilResult: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfSuccessFromCache = self->_currentGatingStatistics.numberOfSuccessFromCache;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfSuccessFromCache;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfSuccessFromCache: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfFailuresFromCache = self->_currentGatingStatistics.numberOfFailuresFromCache;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfFailuresFromCache;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfFailuresFromCache: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfSuccessFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfSuccessFromMediaAnalysisRequests;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfSuccessFromMediaAnalysisRequests;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfSuccessFromMediaAnalysisRequests: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfFailuresFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfFailuresFromMediaAnalysisRequests;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfFailuresFromMediaAnalysisRequests;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfFailuresFromMediaAnalysisRequests: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    numberOfTimeoutsFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfTimeoutsFromMediaAnalysisRequests;
    v16 = 138412546;
    v17 = v4;
    v18 = 1024;
    v19 = numberOfTimeoutsFromMediaAnalysisRequests;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfTimeoutsFromMediaAnalysisRequests: %d", (uint8_t *)&v16, 0x12u);
  }

}

- (void)logCurrentSettlingEffectGatingStatisticsWithPrefix:(id)a3
{
  id v4;
  NSObject *loggingConnection;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "%@ Settling Effect Gating Statistics:", buf, 0xCu);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v6 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v31;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "%@ %d failed feature enablement", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v7 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v30;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "%@ %d failed hardware support", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v8 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v29;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "%@ %d failed to download resources", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v9 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v28;
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "%@ %d failed adjustments supported", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v10 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v27;
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "%@ %d failed with generic error", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v11 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v26;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "%@ %d failed metadata check", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v12 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v25;
    _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "%@ %d failed stabilization", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v13 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v24;
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "%@ %d failed video quality", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v14 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v23;
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "%@ %d failed metadata integrity", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v15 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v22;
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "%@ %d failed FRC", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v16 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v21;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "%@ %d failed video decision", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v17 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v20;
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "%@ %d failed layout decision", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v18 = loggingConnection;
    -[PGWallpaperSuggestionAssetGater settlingEffectGatingStatistics](self, "settlingEffectGatingStatistics");
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 1024;
    v35 = v19;
    _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "%@ %d failed still transition", buf, 0x12u);

  }
}

- (id)existingSegmentationScoresWithAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PGWallpaperSuggestionAssetGater existingWallpaperPropertiesWithAsset:](self, "existingWallpaperPropertiesWithAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("segmentationScores"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)assetIsUsingHeadroom:(id)a3
{
  void *v3;
  char v4;

  -[PGWallpaperSuggestionAssetGater existingSegmentationScoresWithAsset:](self, "existingSegmentationScoresWithAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(MEMORY[0x1E0D71280], "settlingEffectLayoutContainsHeadroomForSegmentationScores:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)existingWallpaperPropertiesWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  PFWallpaperCompoundDeviceConfiguration *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *loggingConnection;
  NSObject *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  PFWallpaperCompoundDeviceConfiguration *deviceWallpaperLayoutConfiguration;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  PFWallpaperCompoundDeviceConfiguration *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoAnalysisWallpaperProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "wallpaperPropertiesVersion") == 10)
  {
    objc_msgSend(v5, "wallpaperPropertiesTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adjustmentTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(v6, "isEqualToDate:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(v4, "creationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v6, "isEqualToDate:", v24);

      if (v25)
      {
LABEL_4:
        v9 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(v5, "wallpaperPropertiesData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v9, "propertyListWithData:options:format:error:", v10, 0, 0, &v40);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (PFWallpaperCompoundDeviceConfiguration *)v40;

        if (!v11)
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
          {
            v27 = loggingConnection;
            objc_msgSend(v4, "localIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v42 = v28;
            v43 = 2112;
            v44 = v12;
            _os_log_error_impl(&dword_1CA237000, v27, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed deserializing wallpaper properties on asset %@: %@", buf, 0x16u);

          }
          goto LABEL_30;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sceneAnalysisVersion"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");
        objc_msgSend(v4, "sceneAnalysisProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14 == objc_msgSend(v15, "sceneAnalysisVersion");

        if (v16)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("faceAnalysisVersion"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "integerValue");
          v16 = v18 == objc_msgSend(v4, "faceAnalysisVersion");

          if (v16)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("segmentationModelVersion"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "unsignedIntegerValue");
            v16 = v20 == objc_msgSend(MEMORY[0x1E0D71280], "currentVersion");

          }
        }
        if (self->_type == 2)
        {
          v21 = VCPMAGetRevisionForMediaAnalysisType();
          if (!v16)
            goto LABEL_29;
          v22 = v21;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("petsModelVersion"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = objc_msgSend(v23, "unsignedIntegerValue") == v22;

          if ((v22 & 1) == 0)
            goto LABEL_29;
        }
        else if (!v16)
        {
LABEL_29:

LABEL_30:
          v11 = 0;
          goto LABEL_31;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("wallpaperSpecificationVersion"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "unsignedIntegerValue") == 3;

        if (v30)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("wallpaperLayoutConfiguration"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v39 = 0;
            objc_msgSend(MEMORY[0x1E0D75340], "compoundDeviceConfigurationFromDictionary:error:", v31, &v39);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v39;
            if (v32)
            {
              if ((objc_msgSend(v32, "isEqualToLayoutConfiguration:", self->_deviceWallpaperLayoutConfiguration) & 1) != 0)
              {

LABEL_31:
                goto LABEL_32;
              }
              v36 = self->_loggingConnection;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                deviceWallpaperLayoutConfiguration = self->_deviceWallpaperLayoutConfiguration;
                *(_DWORD *)buf = 138412546;
                v42 = v32;
                v43 = 2112;
                v44 = deviceWallpaperLayoutConfiguration;
                _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_DEFAULT, "[PGWallpaperSuggestionAssetGater] Layout configuration no longer valid, %@ vs device %@, invalidating", buf, 0x16u);
              }
            }
            else
            {
              v35 = self->_loggingConnection;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v42 = v31;
                v43 = 2112;
                v44 = (PFWallpaperCompoundDeviceConfiguration *)v33;
                _os_log_error_impl(&dword_1CA237000, v35, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed to deserialize persisted layout configuration %@: %@", buf, 0x16u);
              }
            }

          }
          else
          {
            v34 = self->_loggingConnection;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Persisted wallpaper layout configuration is unexpectedly nil, invalidating", buf, 2u);
            }
          }
        }
        goto LABEL_29;
      }
    }
  }
  v11 = 0;
LABEL_32:

  return v11;
}

- (BOOL)hasValidAnalysisVersionForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *loggingConnection;
  BOOL v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v32;
  void *v33;
  NSObject *log;
  char loga;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "adjustmentTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "creationDate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = (__int16)*MEMORY[0x1E0D47690];
  LODWORD(v10) = *MEMORY[0x1E0D47688];
  objc_msgSend(v4, "sceneAnalysisProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sceneAnalysisVersion");

  v13 = objc_msgSend(v4, "faceAnalysisVersion");
  if (v9 <= v12)
  {
    objc_msgSend(v4, "sceneAnalysisProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneAnalysisTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToDate:", v8) && v13 >= (__int16)v10)
    {
      objc_msgSend(v4, "faceAdjustmentVersion");
      v32 = (__int16)v10;
      v10 = v8;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      loga = objc_msgSend(v33, "isEqualToDate:", v10);

      v8 = v10;
      LOWORD(v10) = v32;

      if ((loga & 1) != 0)
      {
        v17 = 1;
        goto LABEL_18;
      }
    }
    else
    {

    }
  }
  if (self->_type == 5 && v12 >= 1 && v13 >= 1 && (v9 > v12 || v13 < (__int16)v10))
  {
    loggingConnection = self->_loggingConnection;
    v17 = 1;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      v18 = loggingConnection;
      objc_msgSend(v4, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v19;
      v38 = 1024;
      v39 = v12;
      v40 = 1024;
      LODWORD(v41) = v13;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] Asset %@ analysis in not up-to-date, performing SettlingEffect, detecting an upgrade scenario with analysis versions (%d, %d), allowing.", buf, 0x18u);

    }
  }
  else
  {
    v20 = self->_loggingConnection;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      log = v20;
      objc_msgSend(v4, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sceneAnalysisProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v8;
      v24 = objc_msgSend(v22, "sceneAnalysisVersion");
      objc_msgSend(v4, "sceneAnalysisProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sceneAnalysisTimestamp");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v4, "faceAnalysisVersion");
      objc_msgSend(v4, "faceAdjustmentVersion");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (__int16)v10;
      v30 = (void *)v28;
      *(_DWORD *)buf = 138414082;
      v37 = v21;
      v38 = 1024;
      v39 = v24;
      v8 = v23;
      v40 = 2112;
      v41 = v26;
      v42 = 1024;
      v43 = v27;
      v44 = 2112;
      v45 = v28;
      v46 = 1024;
      v47 = v9;
      v48 = 1024;
      v49 = v29;
      v50 = 2112;
      v51 = v23;
      _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] Asset %@ analysis in not uptodate ((%d, %@, %d, %@) vs (%d, %d, %@))", buf, 0x42u);

    }
    v17 = 0;
  }
LABEL_18:

  return v17;
}

- (id)requestAndPersistWallpaperPropertiesForAsset:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *loggingConnection;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PGWallpaperSuggestionAssetGater hasValidAnalysisVersionForAsset:](self, "hasValidAnalysisVersionForAsset:", v6))
  {
    v21 = 0;
    -[PGWallpaperSuggestionAssetGater _requestWallpaperPropertiesForAsset:progressBlock:error:](self, "_requestWallpaperPropertiesForAsset:progressBlock:error:", v6, v7, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    v10 = v9;
    if (v8)
    {
      if (!self->_coversTracks)
      {
        v20 = v9;
        v11 = -[PGWallpaperSuggestionAssetGater persistWallpaperProperties:ofAsset:error:](self, "persistWallpaperProperties:ofAsset:error:", v8, v6, &v20);
        v12 = v20;

        if (!v11)
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
          {
            v14 = loggingConnection;
            objc_msgSend(v6, "localIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v23 = v15;
            v24 = 2112;
            v25 = v12;
            _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed persisting wallpaper properties on asset %@: %@", buf, 0x16u);

          }
        }
        goto LABEL_11;
      }
    }
    else
    {
      ++self->_currentGatingStatistics.numberOfFailuresFromNilResult;
      v16 = self->_loggingConnection;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = v16;
        objc_msgSend(v6, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v19;
        v24 = 2112;
        v25 = v10;
        _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed getting wallpaper properties on asset %@: %@", buf, 0x16u);

      }
    }
    v12 = v10;
LABEL_11:

    goto LABEL_12;
  }
  v8 = 0;
  ++self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
LABEL_12:

  return v8;
}

- (id)_requestWallpaperPropertiesForAsset:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[7];
  _QWORD v28[8];

  v28[7] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend((id)objc_opt_class(), "_posterClassificationFromAssetGaterType:", self->_type);
  v11 = objc_msgSend(MEMORY[0x1E0D77EF8], "mediaAnalysisTypeForPosterClassification:", v10) | 0x800000000;
  -[PFWallpaperCompoundDeviceConfiguration dictionaryRepresentation](self->_deviceWallpaperLayoutConfiguration, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGWallpaperSuggestionAssetGater isUserInitiated](self, "isUserInitiated"))
    v13 = 1;
  else
    v13 = 2;
  v14 = *MEMORY[0x1E0D47630];
  v28[0] = MEMORY[0x1E0C9AAB0];
  v15 = *MEMORY[0x1E0D713E8];
  v27[0] = v14;
  v27[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0D71400];
  v28[1] = v16;
  v28[2] = v12;
  v18 = *MEMORY[0x1E0D71410];
  v27[2] = v17;
  v27[3] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0D713F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PGWallpaperSuggestionAssetGater enableSettlingEffect](self, "enableSettlingEffect"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0D71408];
  v28[4] = v20;
  v28[5] = MEMORY[0x1E0C9AAA0];
  v22 = *MEMORY[0x1E0D71418];
  v27[5] = v21;
  v27[6] = v22;
  v28[6] = &unk_1E84E3D40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGWallpaperSuggestionAssetGater _requestAnalysisTypes:asset:options:progressBlock:error:](self, "_requestAnalysisTypes:asset:options:progressBlock:error:", v11, v8, v23, v9, a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  ++self->_currentGatingStatistics.numberOfMediaAnalysisRequest;
  if (v24)
  {
    -[PGWallpaperSuggestionAssetGater wallpaperPropertiesFromAnalysisResults:andAsset:](self, "wallpaperPropertiesFromAnalysisResults:andAsset:", v24, v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_requestAnalysisTypes:(unint64_t)a3 asset:(id)a4 options:(id)a5 progressBlock:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  dispatch_source_t v15;
  OS_os_log *v16;
  void *v17;
  OS_os_log *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  dispatch_semaphore_t v23;
  VCPMediaAnalysisService *mediaAnalysisService;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  mach_timebase_info v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  uint64_t v40;
  os_signpost_id_t spid;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  id v47;
  _QWORD handler[4];
  id v49;
  NSObject *v50;
  PGWallpaperSuggestionAssetGater *v51;
  id v52;
  id v53;
  _BYTE *v54;
  uint64_t v55;
  int v56;
  _QWORD v57[4];
  NSObject *v58;
  id v59;
  NSObject *v60;
  uint64_t *v61;
  uint64_t *v62;
  unint64_t v63;
  mach_timebase_info info;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint8_t v77[4];
  const char *v78;
  __int16 v79;
  double v80;
  _BYTE buf[24];
  uint64_t v82;
  _QWORD v83[4];

  v83[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v47 = a5;
  v12 = a6;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__29939;
  v75 = __Block_byref_object_dispose__29940;
  v76 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__29939;
  v69 = __Block_byref_object_dispose__29940;
  v70 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "dateByAddingTimeInterval:", 120.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v12;
  v13 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(33, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v14);

  v16 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 0x405E000000000000;
    _os_log_impl(&dword_1CA237000, (os_log_t)v16, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] Start requesting analysis for asset: %@. Timeout: %.3f seconds", buf, 0x16u);

  }
  v18 = self->_loggingConnection;
  v19 = os_signpost_id_generate((os_log_t)v18);
  v20 = v18;
  v21 = v20;
  spid = v19;
  v43 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ImagingAnalysisRequest", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v40 = mach_absolute_time();
  v22 = a3;
  v23 = v13;
  mediaAnalysisService = self->_mediaAnalysisService;
  v83[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_2;
  v57[3] = &unk_1E842C940;
  v27 = v15;
  v58 = v27;
  v61 = &v71;
  v28 = v11;
  v59 = v28;
  v62 = &v65;
  v63 = v22;
  v29 = v23;
  v60 = v29;
  LODWORD(mediaAnalysisService) = -[VCPMediaAnalysisService requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:](mediaAnalysisService, "requestAnalysisTypes:forAssets:withOptions:progressHandler:andCompletionHandler:", v22, v25, v47, &__block_literal_global_209, v57);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v82 = 0;
  dispatch_source_set_timer(v27, 0, 0x5F5E100uLL, 0x4C4B40uLL);
  handler[0] = v26;
  handler[1] = 3221225472;
  handler[2] = __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_3;
  handler[3] = &unk_1E842C968;
  v30 = v44;
  v49 = v30;
  v50 = v27;
  v51 = self;
  v56 = (int)mediaAnalysisService;
  v31 = v28;
  v52 = v31;
  v32 = v45;
  v54 = buf;
  v55 = 0x4092C00000000000;
  v53 = v32;
  v33 = v27;
  dispatch_source_set_event_handler(v33, handler);
  dispatch_resume(v33);

  dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
  v34 = mach_absolute_time();
  v35 = info;
  v36 = v21;
  v37 = v36;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)v77 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v37, OS_SIGNPOST_INTERVAL_END, spid, "ImagingAnalysisRequest", ", v77, 2u);
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v77 = 136315394;
    v78 = "ImagingAnalysisRequest";
    v79 = 2048;
    v80 = (float)((float)((float)((float)(v34 - v40) * (float)v35.numer) / (float)v35.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v77, 0x16u);
  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v66[5]);
  v38 = (id)v72[5];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  return v38;
}

- (BOOL)persistWallpaperProperties:(id)a3 ofAsset:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__29939;
  v24 = __Block_byref_object_dispose__29940;
  v25 = 0;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PGWallpaperSuggestionAssetGater_persistWallpaperProperties_ofAsset_error___block_invoke;
  v15[3] = &unk_1E842C990;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v18 = &v26;
  v19 = &v20;
  v12 = objc_msgSend(v9, "performChangesAndWait:error:", v15, a5);

  if (!v12)
    goto LABEL_6;
  if (!*((_BYTE *)v27 + 24))
  {
    if (a5)
    {
      v13 = 0;
      *a5 = objc_retainAutorelease((id)v21[5]);
      goto LABEL_7;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  v13 = 1;
LABEL_7:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)wallpaperPropertiesFromAnalysisResults:(id)a3 andAsset:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "sceneAnalysisProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithShort:", objc_msgSend(v11, "sceneAnalysisVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("sceneAnalysisVersion"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend(v8, "faceAnalysisVersion");

  objc_msgSend(v13, "numberWithShort:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("faceAnalysisVersion"));

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D47528]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("segmentationScores"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D71280], "currentVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("segmentationModelVersion"));

  if (self->_type == 2)
  {
    v18 = *MEMORY[0x1E0D47538];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D47538]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0D47580];
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D47580]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("petsBounds"));

    objc_msgSend(v6, "objectForKeyedSubscript:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D47588];
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D47588]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("petsConfidence"));

    v25 = *MEMORY[0x1E0D47530];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D47530]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("petsFaceBounds"));

    objc_msgSend(v6, "objectForKeyedSubscript:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("petsFaceConfidence"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", VCPMAGetRevisionForMediaAnalysisType());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("petsModelVersion"));

  }
  -[PFWallpaperCompoundDeviceConfiguration dictionaryRepresentation](self->_deviceWallpaperLayoutConfiguration, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("wallpaperLayoutConfiguration"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E84E3D58, CFSTR("wallpaperSpecificationVersion"));
  return v9;
}

- (id)gatingResultWithWallpaperProperties:(id)a3
{
  id v4;
  PGWallpaperAssetGaterResult *v5;

  v4 = a3;
  v5 = objc_alloc_init(PGWallpaperAssetGaterResult);
  if (self->_type != 5)
    -[PGWallpaperAssetGaterResult setPassesSegmentation:](v5, "setPassesSegmentation:", -[PGWallpaperSuggestionAssetGater _passesSegmentationWithWallpaperProperties:](self, "_passesSegmentationWithWallpaperProperties:", v4));
  -[PGWallpaperAssetGaterResult setPassesSettlingEffect:](v5, "setPassesSettlingEffect:", -[PGWallpaperSuggestionAssetGater _passesSettlingEffectWithWallpaperProperties:](self, "_passesSettlingEffectWithWallpaperProperties:", v4));

  return v5;
}

- (BOOL)_passesSegmentationWithWallpaperProperties:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("segmentationScores"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D71280], "curatedSegmentationGatingDecisionForSegmentationScores:", v3))
    v4 = objc_msgSend(MEMORY[0x1E0D71280], "layoutGatingDecisionForSegmentationScores:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_passesSettlingEffectWithWallpaperProperties:(id)a3
{
  void *v4;
  NSObject *loggingConnection;
  BOOL v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];
  __int128 v13;
  __int128 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("segmentationScores"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] segmentation scores: %@", buf, 0xCu);
  }
  if (self->_enableSettlingEffect)
  {
    v15 = 0;
    v13 = 0u;
    v14 = 0u;
    *(_OWORD *)buf = 0u;
    objc_msgSend(MEMORY[0x1E0D71280], "settlingEffectGatingStatisticsFromScores:", v4);
    v6 = (*(_DWORD *)buf | *(_DWORD *)&buf[4] | *(_DWORD *)&buf[8] | *(_DWORD *)&buf[12] | v13 | DWORD1(v13) | DWORD2(v13) | HIDWORD(v13) | v14 | DWORD1(v14) | DWORD2(v14) | HIDWORD(v14) | v15) == 0;
    if (*(_DWORD *)buf)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruFeatureDisabled;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed feature enabled check";
LABEL_48:
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, v8, v11, 2u);
      }
    }
    else if (*(_DWORD *)&buf[4])
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruHardwareUnsupported;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed hardware support check";
        goto LABEL_48;
      }
    }
    else if (*(_DWORD *)&buf[8])
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruResourceAvailability;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed asset resource availability";
        goto LABEL_48;
      }
    }
    else if (*(_DWORD *)&buf[12])
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruUnsupportedAdjustments;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed valid adjustments check";
        goto LABEL_48;
      }
    }
    else if ((_DWORD)v13)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruGenericError;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed due to generic error";
        goto LABEL_48;
      }
    }
    else if (DWORD1(v13))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruMetadataCheck;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed metadata check";
        goto LABEL_48;
      }
    }
    else if (DWORD2(v13))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruStabilization;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed stabilization";
        goto LABEL_48;
      }
    }
    else if (HIDWORD(v13))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruVideoQuality;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed video quality";
        goto LABEL_48;
      }
    }
    else if ((_DWORD)v14)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruMetadataIntegrity;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed metadata integrity";
        goto LABEL_48;
      }
    }
    else if (DWORD1(v14))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruFRC;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed FRC";
        goto LABEL_48;
      }
    }
    else if (DWORD2(v14))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruVideoDecision;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed video decision";
        goto LABEL_48;
      }
    }
    else if (HIDWORD(v14))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruLayoutDecision;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed layout decision";
        goto LABEL_48;
      }
    }
    else if (v15)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruStillTransition;
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed still transition";
        goto LABEL_48;
      }
    }
    else
    {
      v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties pass settling effect gating";
        goto LABEL_48;
      }
    }
  }
  else
  {
    v9 = self->_loggingConnection;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] settling effect disabled. Fail settling effect gating.", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)_hasPetFaceWithWallpaperProperties:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("petsModelVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("petsFaceConfidence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8 >= 0.5 && v5 == 0;
}

- (BOOL)cacheExistsForAsset:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CD1818];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPhotoAsset:", v4);

  objc_msgSend(v5, "segmentationResourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (void)clearCacheOfAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  NSObject *loggingConnection;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PGWallpaperSuggestionAssetGater_clearCacheOfAsset___block_invoke;
  v11[3] = &unk_1E8435668;
  v6 = v4;
  v12 = v6;
  v10 = 0;
  v7 = objc_msgSend(v5, "performChangesAndWait:error:", v11, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Fail deleting segmentation cache for asset %@: %@", buf, 0x16u);
    }
  }

}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->_isUserInitiated = a3;
}

- (BOOL)coversTracks
{
  return self->_coversTracks;
}

- (void)setCoversTracks:(BOOL)a3
{
  self->_coversTracks = a3;
}

- (BOOL)enableSettlingEffect
{
  return self->_enableSettlingEffect;
}

- (void)setEnableSettlingEffect:(BOOL)a3
{
  self->_enableSettlingEffect = a3;
}

- (BOOL)isLastGatingCallingMediaAnalysis
{
  return self->_isLastGatingCallingMediaAnalysis;
}

- ($029C8AA35660F62BB82CBF098D3EDE08)currentGatingStatistics
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var4 = v3;
  *(_QWORD *)&retstr->var8 = *(_QWORD *)&self[1].var9;
  return self;
}

- ($2753767B6D5E71768FC0A26EE39D5FB2)settlingEffectGatingStatistics
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var12;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var4 = v3;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self[2].var3;
  retstr->var12 = self[2].var7;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_deviceWallpaperLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisService, 0);
}

void __53__PGWallpaperSuggestionAssetGater_clearCacheOfAsset___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteAssetResourceWithType:", 109);

}

void __76__PGWallpaperSuggestionAssetGater_persistWallpaperProperties_ofAsset_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWallpaperPropertiesData:", v3);
    objc_msgSend(*(id *)(a1 + 40), "adjustmentTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "setWallpaperPropertiesTimestamp:", v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "creationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWallpaperPropertiesTimestamp:", v10);

    }
    objc_msgSend(v6, "setWallpaperPropertiesVersion:", 10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = v4;
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }

}

void __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;

  v29 = a2;
  v5 = a3;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (!v29)
  {
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v28 = v5;
    v20 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v28;
    goto LABEL_5;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D47528];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D47528]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v13, v11);

  if ((*(_BYTE *)(a1 + 74) & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D47538];
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D47538]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0D47548];
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D47548]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D47530];
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D47530]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v20, v16);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v26, v23);

LABEL_5:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t result;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  if (v5 < 0.0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "cancelRequest:", *(unsigned int *)(a1 + 88));
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(NSObject **)(v6 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 56);
      v10 = v7;
      objc_msgSend(v9, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Timeout requesting analysis for asset: %@", buf, 0xCu);

      v6 = *(_QWORD *)(a1 + 48);
    }
    ++*(_DWORD *)(v6 + 80);
  }
  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(a1 + 80) * (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  return result;
}

+ (unint64_t)currentWallpaperPropertiesVersion
{
  return 10;
}

+ (id)assetFetchPropertySetsForGating
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD1998];
  v4[0] = *MEMORY[0x1E0CD1A50];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E0CD1A10];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)_posterClassificationFromAssetGaterType:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 0;
  else
    return a3;
}

+ (double)sydneyMD4FaceQualityFromAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;

  objc_msgSend(a3, "photoAnalysisWallpaperProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperPropertiesData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.0;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("faceQualityModelVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

      if (v9 == 3737841667)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceQualityScore"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v7 = v11;

      }
    }

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (int)numberOfFailuresAfterStabilizationFromStatistics:(id *)a3
{
  return vaddvq_s32(vaddq_s32(*(int32x4_t *)&a3->var0, *(int32x4_t *)&a3->var4));
}

@end
