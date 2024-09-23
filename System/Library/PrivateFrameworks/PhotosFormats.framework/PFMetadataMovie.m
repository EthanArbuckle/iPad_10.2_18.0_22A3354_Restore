@implementation PFMetadataMovie

- (PFMetadataMovie)initWithAVURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v6;
  id v8;
  PFMetadataMovie *v9;
  PFMetadataMovie *v10;

  v6 = a4;
  v8 = a3;
  v9 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", 0, v6, a5);
  v10 = v9;
  if (v9 && !-[PFMetadataMovie _configureWithAVURL:](v9, "_configureWithAVURL:", v8))
  {

    v10 = 0;
  }

  return v10;
}

- (PFMetadataMovie)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4
{
  id v6;
  PFMetadataMovie *v7;
  PFMetadataMovie *v8;

  v6 = a3;
  v7 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", 0, 13, a4);
  v8 = v7;
  if (v7 && !-[PFMetadataMovie _configureWithAVProxyData:](v7, "_configureWithAVProxyData:", v6))
  {

    v8 = 0;
  }

  return v8;
}

- (PFMetadataMovie)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5 preloadValues:(BOOL)a6
{
  uint64_t v7;
  id v9;
  PFMetadataMovie *v10;
  PFMetadataMovie *v11;

  v7 = a4;
  v9 = a3;
  v10 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", 0, v7, a5);
  v11 = v10;
  if (v10 && !-[PFMetadataMovie _configureWithAVAsset:](v10, "_configureWithAVAsset:", v9))
  {

    v11 = 0;
  }

  return v11;
}

- (PFMetadataMovie)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v6;
  id v8;
  PFMetadataMovie *v9;
  PFMetadataMovie *v10;
  objc_super v12;

  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFMetadataMovie;
  v9 = -[PFMetadata initWithContentType:options:timeZoneLookup:](&v12, sel_initWithContentType_options_timeZoneLookup_, 0, v6, a5);
  v10 = v9;
  if (v9 && !-[PFMetadataMovie _configureWithAVAsset:](v9, "_configureWithAVAsset:", v8))
  {

    v10 = 0;
  }

  return v10;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFMetadataMovie;
  if (-[PFMetadata configureWithMetadataPlist:](&v13, sel_configureWithMetadataPlist_, v4))
  {
    v5 = (void *)MEMORY[0x1E0C8AF90];
    objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataPlistAsset);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetProxyWithPropertyList:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PFMetadataMovie _configureWithAVAsset:](self, "_configureWithAVAsset:", v7);
    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataPlistIdentifyingTagClass);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cached_values, "setObject:forKeyedSubscript:", v9, PFMetadataPlistIdentifyingTagClass);

      objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataPlistOriginalAssetDateProperties);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cached_values, "setObject:forKeyedSubscript:", v10, PFMetadataPlistOriginalAssetDateProperties);

      objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataPlistSourceType);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFMetadata setSourceType:](self, "setSourceType:", objc_msgSend(v11, "integerValue"));

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_configureWithAVURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int st_mode;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  stat v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "path");
    memset(&v14, 0, sizeof(v14));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = stat((const char *)objc_msgSend(v6, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0,
                           0),
           &v14);
    st_mode = (__int16)v14.st_mode;

    v9 = 0;
    if (!v7 && st_mode < 0)
    {
      v10 = (void *)MEMORY[0x1E0C8B3C0];
      if (-[PFMetadata noOutOfProcess](self, "noOutOfProcess"))
      {
        v15 = *MEMORY[0x1E0C89F00];
        v16[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLAssetWithURL:options:", v5, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v10, "URLAssetWithURL:options:", v5, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = -[PFMetadataMovie _configureWithAVAsset:](self, "_configureWithAVAsset:", v12);
      -[PFMetadata setSourceType:](self, "setSourceType:", 6);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_configureWithAVProxyData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v14 = 0;
    +[PFMetadata propertyListObjectFromEncodedData:expectedClass:options:error:](PFMetadata, "propertyListObjectFromEncodedData:expectedClass:options:error:", v5, objc_opt_class(), 0, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetProxyWithPropertyList:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v9 = -[PFMetadataMovie _configureWithAVAsset:](self, "_configureWithAVAsset:", v8);
      else
        v9 = 0;

    }
    else
    {
      v10 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        v12 = v10;
        v13 = objc_msgSend(v5, "length");
        *(_DWORD *)buf = 134218498;
        v16 = v5;
        v17 = 2048;
        v18 = v13;
        v19 = 2114;
        v20 = v7;
        _os_log_error_impl(&dword_1A16EE000, v12, OS_LOG_TYPE_ERROR, "failed to deserialize a property list object from plist data: %p, length: %lu, error: %{public}@", buf, 0x20u);

      }
      v9 = 0;
    }
    -[PFMetadata setSourceType:](self, "setSourceType:", 7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_configureWithAVAsset:(id)a3
{
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cached_values;
  PFMetadataStateHandler *v8;
  PFMetadataStateHandler *stateHandler;
  AVAsset **p_asset;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  AVAsset *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cached_values = self->_cached_values;
    self->_cached_values = v6;

    v8 = -[PFMetadataStateHandler initWithMetadata:]([PFMetadataStateHandler alloc], "initWithMetadata:", self);
    stateHandler = self->_stateHandler;
    self->_stateHandler = v8;

    p_asset = &self->_asset;
    objc_storeStrong((id *)&self->_asset, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v11, "isFileURL"))
    {
      -[PFMetadata setFileURL:](self, "setFileURL:", v11);
      -[AVAsset identifyingTagClass](*p_asset, "identifyingTagClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cached_values, "setObject:forKeyedSubscript:", v13, PFMetadataPlistIdentifyingTagClass);

    }
    if (-[PFMetadata shouldCreateProxy](self, "shouldCreateProxy")
      && !-[PFMetadataMovie _convertToAVAssetProxyIfPossible](self, "_convertToAVAssetProxyIfPossible"))
    {
      v14 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        v19 = v14;
        -[PFMetadata fileURL](self, "fileURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v20;
        _os_log_error_impl(&dword_1A16EE000, v19, OS_LOG_TYPE_ERROR, "Failed to create a proxy for AVAsset %@. Computing all properties immediately to avoid holding an open file handle.", (uint8_t *)&v21, 0xCu);

      }
      -[PFMetadata setOptions:](self, "setOptions:", 64);
    }
    if (!-[PFMetadata shouldLoadValues](self, "shouldLoadValues"))
      goto LABEL_23;
    v15 = *p_asset;
    -[PFMetadataMovie keysToLoad](self, "keysToLoad");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataMovie collectionKeysToLoad](self, "collectionKeysToLoad");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadataMovie _loadMetadataForAsset:withKeys:collectionKeys:](self, "_loadMetadataForAsset:withKeys:collectionKeys:", v15, v16, v17);

    if (!-[AVAsset isReadable](*p_asset, "isReadable"))
    {
      v12 = 0;
    }
    else
    {
LABEL_23:
      if (-[PFMetadata doImmediateCompute](self, "doImmediateCompute"))
      {
        -[PFMetadataMovie _cacheCommonMetadataProperties](self, "_cacheCommonMetadataProperties");
        -[PFMetadataMovie _cacheAllTrackProperties](self, "_cacheAllTrackProperties");
      }
      -[PFMetadata setSourceType:](self, "setSourceType:", 9);
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_convertToAVAssetProxyIfPossible
{
  AVAsset *asset;
  int64_t v4;
  id v5;
  id v6;
  id v7;
  AVAsset *v8;
  AVAsset *v9;
  BOOL v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  asset = self->_asset;
  v13 = 0;
  v14 = 0;
  v4 = -[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:](self, "_audioVideoProxyPropertyListForAsset:propertyList:error:", asset, &v14, &v13);
  v5 = v14;
  v6 = v13;
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4)
    {
      if (v4 != 1)
      {
LABEL_6:
        v10 = 1;
        goto LABEL_10;
      }
      v7 = -[PFMetadataMovie _makeDateTimePropertiesForAsset:](self, "_makeDateTimePropertiesForAsset:", self->_asset);
    }
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetProxyWithPropertyList:", v5);
    v8 = (AVAsset *)objc_claimAutoreleasedReturnValue();
    v9 = self->_asset;
    self->_asset = v8;

    goto LABEL_6;
  }
  v11 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_debug_impl(&dword_1A16EE000, v11, OS_LOG_TYPE_DEBUG, "Invalid asset proxy to cache. Error: %@", buf, 0xCu);
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (void)_loadMetadataForAsset:(id)a3 withKeys:(id)a4 collectionKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_block_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_4127);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys___block_invoke_2;
  v13[3] = &unk_1E45A2A98;
  v14 = v11;
  v12 = v11;
  -[PFMetadataMovie _loadMetadataForAsset:withKeys:collectionKeys:completionHandler:](self, "_loadMetadataForAsset:withKeys:collectionKeys:completionHandler:", v10, v9, v8, v13);

  dispatch_block_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_loadMetadataForAsset:(id)a3 withKeys:(id)a4 collectionKeys:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  PFMetadataStateHandler *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PFMetadataStateHandler *v18;
  _QWORD v19[4];
  PFMetadataStateHandler *v20;
  PFMetadataMovie *v21;
  id v22;
  id v23;
  id v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = self->_stateHandler;
  v14 = a3;
  -[PFMetadataStateHandler addBreadcrumb:](v13, "addBreadcrumb:", CFSTR("%s: Calling -[%p loadValuesAsynchronouslyForKeys:%@ keysForCollectionKeys:%@]"), "-[PFMetadataMovie _loadMetadataForAsset:withKeys:collectionKeys:completionHandler:]", v14, v10, v11);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys_completionHandler___block_invoke;
  v19[3] = &unk_1E45A2AC0;
  v20 = v13;
  v21 = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  objc_msgSend(v14, "loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:", v17, v16, v19);

}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  AVAsset *asset;
  id v5;
  void *v6;
  id v7;

  asset = self->_asset;
  v5 = a3;
  -[PFMetadataMovie keysToLoad](self, "keysToLoad");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PFMetadataMovie collectionKeysToLoad](self, "collectionKeysToLoad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataMovie _loadMetadataForAsset:withKeys:collectionKeys:completionHandler:](self, "_loadMetadataForAsset:withKeys:collectionKeys:completionHandler:", asset, v7, v6, v5);

}

- (void)_cacheAllTrackProperties
{
  -[PFMetadataMovie _cacheComputedTrackMetadataProperties](self, "_cacheComputedTrackMetadataProperties");
  -[PFMetadataMovie _cacheIndirectTrackMetadataProperties](self, "_cacheIndirectTrackMetadataProperties");
}

- (void)_cacheCommonMetadataProperties
{
  NSObject *v3;
  uint8_t buf[16];

  v3 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A16EE000, v3, OS_LOG_TYPE_INFO, "Computing all common metadata properties from AVAsset.", buf, 2u);
  }
  -[PFMetadataMovie livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier");

  -[PFMetadataMovie cameraMake](self, "cameraMake");
  -[PFMetadataMovie cameraModel](self, "cameraModel");

  -[PFMetadataMovie software](self, "software");
  -[PFMetadataMovie originatingAssetIdentifier](self, "originatingAssetIdentifier");

  -[PFMetadataMovie renderOriginatingAssetIdentifier](self, "renderOriginatingAssetIdentifier");
  -[PFMetadataMovie captionAbstract](self, "captionAbstract");

  -[PFMetadataMovie artworkContentDescription](self, "artworkContentDescription");
  -[PFMetadataMovie spatialOverCaptureIdentifier](self, "spatialOverCaptureIdentifier");

  -[PFMetadataMovie isSpatialOverCapture](self, "isSpatialOverCapture");
  -[PFMetadataMovie title](self, "title");

  -[PFMetadataMovie keywords](self, "keywords");
  -[PFMetadataMovie gpsHPositioningError](self, "gpsHPositioningError");

  -[PFMetadataMovie imageDirection](self, "imageDirection");
  -[PFMetadataMovie duration](self, "duration");
  -[PFMetadataMovie playbackVariation](self, "playbackVariation");

  -[PFMetadataMovie isAutoLivePhoto](self, "isAutoLivePhoto");
  -[PFMetadataMovie livePhotoVitalityScore](self, "livePhotoVitalityScore");

  -[PFMetadataMovie livePhotoVitalityTransitionScore](self, "livePhotoVitalityTransitionScore");
  -[PFMetadataMovie hasVitality](self, "hasVitality");
  -[PFMetadataMovie livePhotoVitalityLimitingAllowed](self, "livePhotoVitalityLimitingAllowed");
  -[PFMetadataMovie livePhotoMinimumClientVersion](self, "livePhotoMinimumClientVersion");

  -[PFMetadataMovie isActionCam](self, "isActionCam");
  -[PFMetadataMovie montageString](self, "montageString");

  -[PFMetadataMovie author](self, "author");
  -[PFMetadataMovie isPlayable](self, "isPlayable");
  -[PFMetadataMovie smartStyleVideoCastValue](self, "smartStyleVideoCastValue");
  -[PFMetadata gpsLocation](self, "gpsLocation");

  -[PFMetadata utcCreationDate](self, "utcCreationDate");
}

- (void)_cacheComputedTrackMetadataProperties
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  uint8_t v7[48];

  v3 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A16EE000, v3, OS_LOG_TYPE_INFO, "Computing all track metadata properties from AVAsset.", v7, 2u);
  }
  v4 = -[PFMetadataMovie _firstVideoTrack](self, "_firstVideoTrack");
  v5 = -[PFMetadataMovie _firstAudioTrack](self, "_firstAudioTrack");
  -[PFMetadataMovie stillImageDisplayTimeDictionary](self, "stillImageDisplayTimeDictionary");

  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  -[PFMetadataMovie _computeFirstVideoTrackCodecAndName](self, "_computeFirstVideoTrackCodecAndName");
  -[PFMetadataMovie isCinematicVideo](self, "isCinematicVideo");
  -[PFMetadataMovie hasSpatialAudio](self, "hasSpatialAudio");
  -[PFMetadataMovie isDecodable](self, "isDecodable");
  v6 = -[PFMetadataMovie _computeApacAudioTrackInfo](self, "_computeApacAudioTrackInfo");
  -[PFMetadataMovie outOfBandHints](self, "outOfBandHints");

  -[PFMetadataMovie spatialMediaTrack](self, "spatialMediaTrack");
}

- (void)_cacheIndirectTrackMetadataProperties
{
  id v3;

  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  -[PFMetadataMovie lensModel](self, "lensModel");

  -[PFMetadataMovie nominalFrameRate](self, "nominalFrameRate");
  -[PFMetadataMovie videoDataRate](self, "videoDataRate");

  -[PFMetadataMovie audioDataRate](self, "audioDataRate");
  -[PFMetadataMovie videoDynamicRange](self, "videoDynamicRange");

  -[PFMetadataMovie isProRes](self, "isProRes");
  -[PFMetadataMovie captureMode](self, "captureMode");

  -[PFMetadataMovie firstVideoTrackFormatDebugDescription](self, "firstVideoTrackFormatDebugDescription");
  -[PFMetadataMovie _firstVideoTrackFormatDescription](self, "_firstVideoTrackFormatDescription");
  -[PFMetadataMovie colorPrimaries](self, "colorPrimaries");

  -[PFMetadataMovie transferFunction](self, "transferFunction");
  -[PFMetadataMovie hevcProfileInfo](self, "hevcProfileInfo");

  -[PFMetadataMovie isSpatialMedia](self, "isSpatialMedia");
  -[PFMetadataMovie isProRes](self, "isProRes");
  -[PFMetadataMovie outOfBandHintsBase64String](self, "outOfBandHintsBase64String");

  -[PFMetadataMovie focalLengthIn35mm](self, "focalLengthIn35mm");
  v3 = -[PFMetadataMovie _makeGeometryProperties](self, "_makeGeometryProperties");
  -[PFMetadataMovie isSloMo](self, "isSloMo");
}

- (id)keysToLoad
{
  void *v2;

  if (-[PFMetadata shouldLoadTrackMetadata](self, "shouldLoadTrackMetadata"))
  {
    objc_msgSend(&unk_1E45CB2B8, "arrayByAddingObject:", CFSTR("tracks"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &unk_1E45CB2B8;
  }
  return v2;
}

- (id)collectionKeysToLoad
{
  if (-[PFMetadata shouldLoadTrackMetadata](self, "shouldLoadTrackMetadata"))
    return &unk_1E45CB690;
  else
    return 0;
}

- (BOOL)verifyShouldLoadTrackMetadata:(const char *)a3
{
  BOOL v4;
  BOOL v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = -[PFMetadata shouldLoadTrackMetadata](self, "shouldLoadTrackMetadata");
  v5 = v4;
  if (a3)
  {
    if (!v4)
    {
      v6 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
      {
        v8 = 136315138;
        v9 = a3;
        _os_log_debug_impl(&dword_1A16EE000, v6, OS_LOG_TYPE_DEBUG, "%s requires track metadata loaded. Specify the PFMetdataLoadOptionsLoadTrackMetadata at initialization.", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  return v5;
}

- (BOOL)isMovie
{
  return 1;
}

- (id)livePhotoPairingIdentifier
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A948];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PFMetadataMovie_livePhotoPairingIdentifier__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cameraMake
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A858];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__PFMetadataMovie_cameraMake__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cameraModel
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A860];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__PFMetadataMovie_cameraModel__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lensModel
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quicktimeMetadataCameraLensModel](PFMetadataIdentifier, "quicktimeMetadataCameraLensModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__PFMetadataMovie_lensModel__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)focalLengthIn35mm
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quicktimeMetadataCameraFocalLength35mmEquivalent](PFMetadataIdentifier, "quicktimeMetadataCameraFocalLength35mmEquivalent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PFMetadataMovie_focalLengthIn35mm__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)software
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A868];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__PFMetadataMovie_software__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)originatingAssetIdentifier
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quickTimeMetadataOriginatingSignature](PFMetadataIdentifier, "quickTimeMetadataOriginatingSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PFMetadataMovie_originatingAssetIdentifier__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)renderOriginatingAssetIdentifier
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quickTimeMetadataRenderOriginatingSignature](PFMetadataIdentifier, "quickTimeMetadataRenderOriginatingSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PFMetadataMovie_renderOriginatingAssetIdentifier__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)captionAbstract
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A848];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__PFMetadataMovie_captionAbstract__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)artworkContentDescription
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A828];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PFMetadataMovie_artworkContentDescription__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)spatialOverCaptureIdentifier
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quickTimeMetadataSpatialOverCaptureGroupIdentifier](PFMetadataIdentifier, "quickTimeMetadataSpatialOverCaptureGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PFMetadataMovie_spatialOverCaptureIdentifier__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isSpatialOverCapture
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];

  +[PFMetadataIdentifier quickTimeMetadataContainsSpatialOverCaptureContent](PFMetadataIdentifier, "quickTimeMetadataContainsSpatialOverCaptureContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PFMetadataMovie_isSpatialOverCapture__block_invoke;
  v7[3] = &unk_1E45A2AE8;
  v7[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isHDR
{
  void *v2;
  int v3;

  -[PFMetadataMovie videoDynamicRange](self, "videoDynamicRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3 > 1;
}

- (id)title
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A870];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__PFMetadataMovie_title__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keywords
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__PFMetadataMovie_keywords__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("keywords"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)gpsHPositioningError
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A980];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PFMetadataMovie_gpsHPositioningError__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)altitude
{
  return 0;
}

- (id)imageDirection
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A960];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PFMetadataMovie_imageDirection__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)speed
{
  return 0;
}

- (int64_t)orientation
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  const __CFDictionary *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__PFMetadataMovie_duration__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("duration"), v6);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary((CMTime *)retstr, v4);

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  const __CFDictionary *v5;

  -[PFMetadataMovie stillImageDisplayTimeDictionary](self, "stillImageDisplayTimeDictionary");
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary((CMTime *)retstr, v5);

  return result;
}

- (id)stillImageDisplayTimeDictionary
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PFMetadataMovie_stillImageDisplayTimeDictionary__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("stillImageDisplayTimeDictionary"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nominalFrameRate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PFMetadataMovie_nominalFrameRate__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("nominalFrameRate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)videoDataRate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PFMetadataMovie_videoDataRate__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("videoDataRate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioDataRate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PFMetadataMovie_audioDataRate__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("audioDataRate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioSampleRate
{
  void *v2;
  double v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithDouble:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioTrackFormat
{
  void *v2;
  unsigned int v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithUnsignedInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioTrackFormatFlags
{
  void *v2;
  unsigned int v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithUnsignedInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioBytesPerPacket
{
  void *v2;
  unsigned int v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithUnsignedInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioFramesPerPacket
{
  void *v2;
  unsigned int v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithUnsignedInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioBytesPerFrame
{
  void *v2;
  unsigned int v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithUnsignedInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioChannelsPerFrame
{
  void *v2;
  unsigned int v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithUnsignedInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)audioBitsPerChannel
{
  void *v2;
  unsigned int v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadataMovie _audioStreamBasicDescription](self, "_audioStreamBasicDescription");
  objc_msgSend(v2, "numberWithUnsignedInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)playbackVariation
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier](PFMetadataIdentifier, "quickTimeMetadataVariationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PFMetadataMovie_playbackVariation__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAutoLivePhoto
{
  uint64_t v2;
  void *v3;
  char v4;
  _QWORD v6[5];

  v2 = *MEMORY[0x1E0C8A940];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PFMetadataMovie_isAutoLivePhoto__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)livePhotoVitalityScore
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A978];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PFMetadataMovie_livePhotoVitalityScore__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)livePhotoVitalityTransitionScore
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quickTimeMetadataVitalityTransitionScore](PFMetadataIdentifier, "quickTimeMetadataVitalityTransitionScore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PFMetadataMovie_livePhotoVitalityTransitionScore__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasVitality
{
  void *v3;
  void *v4;
  int v5;
  _QWORD v7[5];

  +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityDisabled](PFMetadataIdentifier, "quickTimeMetadataLivePhotoVitalityDisabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__PFMetadataMovie_hasVitality__block_invoke;
  v7[3] = &unk_1E45A2AE8;
  v7[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v5;
}

- (BOOL)livePhotoVitalityLimitingAllowed
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];

  +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityLimitingAllowed](PFMetadataIdentifier, "quickTimeMetadataLivePhotoVitalityLimitingAllowed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PFMetadataMovie_livePhotoVitalityLimitingAllowed__block_invoke;
  v7[3] = &unk_1E45A2AE8;
  v7[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)livePhotoMinimumClientVersion
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quickTimeMetadataLivePhotoMinimumClientVersion](PFMetadataIdentifier, "quickTimeMetadataLivePhotoMinimumClientVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PFMetadataMovie_livePhotoMinimumClientVersion__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_computeFirstVideoTrackCodecAndName
{
  opaqueCMFormatDescription *v3;
  CMMediaType MediaType;
  CMMediaType v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  CMMediaType v10;
  _QWORD v11[6];
  _QWORD v12[3];
  int v13;

  v3 = -[PFMetadataMovie _firstVideoTrackFormatDescription](self, "_firstVideoTrackFormatDescription");
  MediaType = CMFormatDescriptionGetMediaType(v3);
  if (MediaType)
  {
    v5 = MediaType;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke;
    v11[3] = &unk_1E45A2B10;
    v11[4] = v12;
    v11[5] = v3;
    v7 = -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("firstVideoTrackCodec"), v11);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke_2;
    v9[3] = &unk_1E45A2B38;
    v10 = v5;
    v9[4] = v12;
    v8 = -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("videoCodecName"), v9);
    _Block_object_dispose(v12, 8);
  }
}

- (unsigned)firstVideoTrackCodec
{
  void *v3;
  unsigned int v4;

  -[PFMetadataMovie _computeFirstVideoTrackCodecAndName](self, "_computeFirstVideoTrackCodecAndName");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cached_values, "objectForKeyedSubscript:", CFSTR("firstVideoTrackCodec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)firstVideoTrackCodecString
{
  return +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", -[PFMetadataMovie firstVideoTrackCodec](self, "firstVideoTrackCodec"));
}

- (id)videoCodecName
{
  -[PFMetadataMovie _computeFirstVideoTrackCodecAndName](self, "_computeFirstVideoTrackCodecAndName");
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cached_values, "objectForKeyedSubscript:", CFSTR("videoCodecName"));
}

- (id)videoDynamicRange
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PFMetadataMovie_videoDynamicRange__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("videoDynamicRange"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSloMo
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__PFMetadataMovie_isSloMo__block_invoke;
  v5[3] = &unk_1E45A2AE8;
  v5[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("isSloMo"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isCinematicVideo
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PFMetadataMovie_isCinematicVideo__block_invoke;
  v5[3] = &unk_1E45A2AE8;
  v5[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("isCinematicVideo"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasSpatialAudio
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PFMetadataMovie_hasSpatialAudio__block_invoke;
  v5[3] = &unk_1E45A2AE8;
  v5[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("hasSpatialAudio"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isTimelapse
{
  void *v2;
  char v3;

  -[PFMetadataMovie captureMode](self, "captureMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Time-lapse"));

  return v3;
}

- (BOOL)isProRes
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PFMetadataMovie_isProRes__block_invoke;
  v5[3] = &unk_1E45A2AE8;
  v5[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("isProRes"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isActionCam
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[5];

  +[PFMetadataIdentifier quickTimeMetadataKeyActionVideoStabilizationStrength](PFMetadataIdentifier, "quickTimeMetadataKeyActionVideoStabilizationStrength");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__PFMetadataMovie_isActionCam__block_invoke;
  v7[3] = &unk_1E45A2AE8;
  v7[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)montageString
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A968];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__PFMetadataMovie_montageString__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)author
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *MEMORY[0x1E0C8A838];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__PFMetadataMovie_author__block_invoke;
  v4[3] = &unk_1E45A2AE8;
  v4[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v2, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)captureMode
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[PFMetadataIdentifier quickTimeMetadataCaptureMode](PFMetadataIdentifier, "quickTimeMetadataCaptureMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__PFMetadataMovie_captureMode__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstVideoTrackFormatDebugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PFMetadataMovie_firstVideoTrackFormatDebugDescription__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("firstVideoTrackFormatDebugDescription"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)colorPrimaries
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__PFMetadataMovie_colorPrimaries__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("colorPrimaries"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transferFunction
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PFMetadataMovie_transferFunction__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("transferFunction"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDecodable
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__PFMetadataMovie_isDecodable__block_invoke;
  v5[3] = &unk_1E45A2AE8;
  v5[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("isDecodable"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isPlayable
{
  void *v3;
  char v4;
  _QWORD v6[5];

  if (-[PFMetadataMovie isHDR](self, "isHDR")
    && !+[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback](PFMediaCapabilities, "currentDeviceIsEligibleForHDRPlayback"))
  {
    return 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__PFMetadataMovie_isPlayable__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("isPlayable"), v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)apacAudioTrackChannelCount
{
  void *v2;
  void *v3;

  -[PFMetadataMovie _computeApacAudioTrackInfo](self, "_computeApacAudioTrackInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("channelCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)apacAudioTrackHoaChannelCount
{
  void *v2;
  void *v3;

  -[PFMetadataMovie _computeApacAudioTrackInfo](self, "_computeApacAudioTrackInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hoaChannelCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)apacAudioTrackBedChannelCount
{
  void *v2;
  void *v3;

  -[PFMetadataMovie _computeApacAudioTrackInfo](self, "_computeApacAudioTrackInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bedChannelCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)apacAudioTrackCodecProfileLevelDescription
{
  void *v2;
  void *v3;

  -[PFMetadataMovie _computeApacAudioTrackInfo](self, "_computeApacAudioTrackInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("codecProfileLevelDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)outOfBandHintsBase64String
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PFMetadataMovie_outOfBandHintsBase64String__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("outOfBandHintsBase64String"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hevcProfileInfo
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__PFMetadataMovie_hevcProfileInfo__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("hevcProfileInfo"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (signed)smartStyleVideoCastValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  signed __int16 v7;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quicktimeMetadataSmartStyleCast](PFMetadataIdentifier, "quicktimeMetadataSmartStyleCast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAsset metadata](self->_asset, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  return v7;
}

- (id)_computeStillImageDisplayTimeDictionary
{
  AVAsset *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  opaqueCMSampleBuffer *v18;
  opaqueCMSampleBuffer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const __CFAllocator *v26;
  id v28;
  AVAsset *v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  CMTime time;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_asset;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = v3;
    -[PFMetadata fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_27;
    v5 = (void *)MEMORY[0x1E0C8B3C0];
    -[PFMetadata fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PFMetadata noOutOfProcess](self, "noOutOfProcess");
    if (v7)
    {
      v41 = *MEMORY[0x1E0C89F00];
      v42[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v5, "URLAssetWithURL:options:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v7)
    v3 = (AVAsset *)v9;
  }
  v10 = MEMORY[0x1E0CA2E18];
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3988;
  v36 = __Block_byref_object_dispose__3989;
  v37 = 0;
  v11 = *MEMORY[0x1E0C8A7D0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__PFMetadataMovie__computeStillImageDisplayTimeDictionary__block_invoke;
  v31[3] = &unk_1E45A2B60;
  v31[4] = &v32;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v11, v3, v31);
  flags = *(_DWORD *)(v10 + 12);
  epoch = *(_QWORD *)(v10 + 16);
  v14 = v33[5];
  v29 = v3;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v3, &v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v30;
    if (v16)
    {
      objc_msgSend(v16, "addOutput:", v15);
      objc_msgSend(v16, "startReading");
      v17 = *MEMORY[0x1E0CA4CC0];
      do
      {
        v18 = (opaqueCMSampleBuffer *)objc_msgSend(v15, "copyNextSampleBuffer");
        v19 = v18;
        if (!v18)
          break;
        if (CMSampleBufferGetNumSamples(v18))
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3B0]), "initWithSampleBuffer:", v19);
          v21 = (void *)MEMORY[0x1E0C8B220];
          objc_msgSend(v20, "items");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "metadataItemsFromArray:filteredByIdentifier:", v22, v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            CMSampleBufferGetOutputPresentationTimeStamp(&time, v19);
            value = time.value;
            flags = time.flags;
            timescale = time.timescale;
            epoch = time.epoch;
          }

        }
        CFRelease(v19);
      }
      while ((flags & 1) == 0);
      objc_msgSend(v16, "cancelReading");
    }
    if ((flags & 1) == 0)
    {
      v25 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        LODWORD(time.value) = 138412290;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v28;
        _os_log_error_impl(&dword_1A16EE000, v25, OS_LOG_TYPE_ERROR, "Invalid still image display time: %@", (uint8_t *)&time, 0xCu);
      }
    }

  }
  if ((flags & 1) != 0)
  {
    v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = epoch;
    v4 = CMTimeCopyAsDictionary(&time, v26);
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v32, 8);

LABEL_27:
  return v4;
}

- (BOOL)_computeIsProRes
{
  unsigned int v2;
  uint64_t v3;
  char v4;

  v2 = -[PFMetadataMovie firstVideoTrackCodec](self, "firstVideoTrackCodec");
  v3 = 0;
  v4 = 0;
  do
    v4 |= v2 == _computeIsProRes_proResCodecs[v3++];
  while (v3 != 6);
  return v4 & 1;
}

- (id)spatialMediaTrack
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PFMetadataMovie_spatialMediaTrack__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("spatialMediaTrack"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSpatialMedia
{
  void *v2;
  BOOL v3;

  -[PFMetadataMovie spatialMediaTrack](self, "spatialMediaTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)spatialVideoRecommendationForImmersiveMode
{
  void *v3;
  int64_t v4;

  -[PFMetadataMovie spatialMediaTrack](self, "spatialMediaTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PFMetadataMovie _spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:](self, "_spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:", v3);

  return v4;
}

- (int64_t)_spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spatialVideoRecommendationForImmersiveMode.%d"), objc_msgSend(v4, "trackID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__PFMetadataMovie__spatialVideoRecommendationForImmersiveModeForAssetVideoTrack___block_invoke;
  v10[3] = &unk_1E45A2B88;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v5, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

- (id)_computeHEVCProfileInfo
{
  void *v3;
  AVAsset *asset;
  int v6;
  AVAsset *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[PFMediaUtilities hevcProfileInformationForVideoTrackFormatDescription:](PFMediaUtilities, "hevcProfileInformationForVideoTrackFormatDescription:", -[PFMetadataMovie _firstVideoTrackFormatDescription](self, "_firstVideoTrackFormatDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    asset = self->_asset;
    v6 = 138412290;
    v7 = asset;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to get profile/tier/level for %@", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

- (id)_computeApacAudioTrackInfo
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("apacAudioTrackInfo"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_computeChannelCountsForApacAudioTrackInfo:(id)a3 maxChannelCount:(unint64_t)a4 audioChannelLayout:(const AudioChannelLayout *)a5
{
  uint64_t mNumberChannelDescriptions;
  uint64_t v8;
  uint64_t mChannelLayoutTag_low;
  AudioChannelDescription *mChannelDescriptions;
  AudioChannelLabel mChannelLabel;
  _BOOL4 v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_channelLayoutUsesChannelDescriptions:", a5))
  {
    mNumberChannelDescriptions = a5->mNumberChannelDescriptions;
    if ((_DWORD)mNumberChannelDescriptions)
    {
      v8 = 0;
      mChannelLayoutTag_low = 0;
      mChannelDescriptions = a5->mChannelDescriptions;
      do
      {
        mChannelLabel = mChannelDescriptions->mChannelLabel;
        ++mChannelDescriptions;
        v12 = (mChannelLabel & 0xFFFF0000) != 0x10000;
        v13 = mChannelLabel & 0xFFFE0000;
        if ((mChannelLabel & 0xFFFF0000) == 0x10000)
          ++v8;
        v14 = v13 == 0x20000 && v12;
        mChannelLayoutTag_low += v14;
        --mNumberChannelDescriptions;
      }
      while (mNumberChannelDescriptions);
    }
    else
    {
      mChannelLayoutTag_low = 0;
      v8 = 0;
    }
    v15 = a4 - mChannelLayoutTag_low - v8;
  }
  else if (objc_msgSend((id)objc_opt_class(), "_channelLayoutUsesHOA:", a5))
  {
    v15 = 0;
    mChannelLayoutTag_low = LOWORD(a5->mChannelLayoutTag);
  }
  else
  {
    mChannelLayoutTag_low = 0;
    v15 = 0;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("channelCount"));

  }
  if (mChannelLayoutTag_low)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", mChannelLayoutTag_low);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, CFSTR("hoaChannelCount"));

  }
  v18 = v20;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("bedChannelCount"));

    v18 = v20;
  }

}

- (id)_makeGPSProperties
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PFMetadataMovie__makeGPSProperties__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("gpsProperties"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_makeDateTimeProperties
{
  return -[PFMetadataMovie _makeDateTimePropertiesForAsset:](self, "_makeDateTimePropertiesForAsset:", self->_asset);
}

- (id)_makeDateTimePropertiesForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  PFMetadataMovie *v11;

  v4 = a3;
  v5 = PFMetadataPlistOriginalAssetDateProperties;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PFMetadataMovie__makeDateTimePropertiesForAsset___block_invoke;
  v9[3] = &unk_1E45A2B88;
  v10 = v4;
  v11 = self;
  v6 = v4;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_makeGeometryProperties
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PFMetadataMovie__makeGeometryProperties__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("geometryProperties"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_cachedValueForKey:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cached_values, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7[2](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cached_values, "setObject:forKeyedSubscript:", v8, v6);
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v12))
    v13 = 0;
  else
    v13 = v8;
  v14 = v13;

  return v14;
}

- (id)_contextForKeys:(id)a3 collectionKeys:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "stringByAppendingString:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            v7 = (void *)v16;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    v5 = v18;
  }

  return v7;
}

- (id)_apacProfileLevelDescriptionForFormatDescription:(opaqueCMFormatDescription *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4
{
  const void *MagicCookie;
  __int128 v6;
  OSStatus Property;
  OSStatus v8;
  NSObject *v9;
  id v11;
  UInt32 ioPropertyDataSize;
  _OWORD inSpecifier[2];
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  size_t sizeOut;
  uint8_t buf[4];
  OSStatus v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  sizeOut = 0;
  MagicCookie = CMAudioFormatDescriptionGetMagicCookie(a3, &sizeOut);
  v16 = 0;
  v17 = 0;
  v6 = *(_OWORD *)&a4->mBytesPerPacket;
  inSpecifier[0] = *(_OWORD *)&a4->mSampleRate;
  inSpecifier[1] = v6;
  v14 = *(_QWORD *)&a4->mBitsPerChannel;
  v15 = MagicCookie;
  LODWORD(v16) = sizeOut;
  LODWORD(v17) = 1836069990;
  ioPropertyDataSize = 0;
  v11 = 0;
  Property = AudioFormatGetProperty(0x63706166u, 0x40u, inSpecifier, &ioPropertyDataSize, &v11);
  if (!Property)
    return v11;
  v8 = Property;
  v9 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v20 = v8;
    _os_log_error_impl(&dword_1A16EE000, v9, OS_LOG_TYPE_ERROR, "Unable to get audio format property for APAC profile/level description: %d", buf, 8u);
  }
  return 0;
}

- (id)_firstVideoTrack
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PFMetadataMovie__firstVideoTrack__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("firstVideoTrack"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_firstAudioTrack
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PFMetadataMovie__firstAudioTrack__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("firstAudioTrack"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (opaqueCMFormatDescription)_firstVideoTrackFormatDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PFMetadataMovie__firstVideoTrackFormatDescription__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  return (opaqueCMFormatDescription *)-[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("firstVideoTrackFormatDescription"), v3);
}

- (AudioStreamBasicDescription)_audioStreamBasicDescription
{
  void *v4;
  AudioStreamBasicDescription *result;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PFMetadataMovie__audioStreamBasicDescription__block_invoke;
  v6[3] = &unk_1E45A2AE8;
  v6[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("audioStreamBasicDescription"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  objc_msgSend(v4, "getValue:", retstr);

  return result;
}

- (id)_exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int64_t v20;

  v5 = a3;
  if (_exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken != -1)
    dispatch_once(&_exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken, &__block_literal_global_202);
  objc_msgSend((id)_exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "rangeAtIndex:", 1);
    objc_msgSend(v5, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "rangeAtIndex:", 2);
    objc_msgSend(v5, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "rangeAtIndex:", 3);
    objc_msgSend(v5, "substringWithRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@:%@"), v10, v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v18 = objc_msgSend(v10, "isEqualToString:", CFSTR("-"));
      v19 = objc_msgSend(v13, "intValue");
      v20 = 3600 * v19 + 60 * (int)objc_msgSend(v16, "intValue");
      if (v18)
        v20 = -v20;
      *a4 = v20;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int64_t)_audioVideoProxyPropertyListForAsset:(id)a3 propertyList:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  PFMetadataStateHandler *v12;
  dispatch_block_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PFMetadataStateHandler *v24;
  dispatch_block_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  dispatch_block_t v41;
  void *v42;
  PFMetadataStateHandler *v43;
  _QWORD v44[4];
  PFMetadataStateHandler *v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  _QWORD block[4];
  PFMetadataStateHandler *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v43 = self->_stateHandler;
  objc_msgSend(v8, "propertyListForProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    if (!a4)
      goto LABEL_21;
LABEL_20:
    *a4 = objc_retainAutorelease(v9);
    goto LABEL_21;
  }
  if (-[PFMetadata allowExportForProxy](self, "allowExportForProxy"))
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke;
    block[3] = &unk_1E45A4AC8;
    v12 = v43;
    v50 = v12;
    v13 = dispatch_block_create((dispatch_block_flags_t)0, block);
    -[PFMetadataStateHandler addBreadcrumb:](v12, "addBreadcrumb:", CFSTR("%s: Calling +determineCompatibilityOfExportPreset:"), "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]");
    v14 = (void *)MEMORY[0x1E0C8AFC0];
    v15 = *MEMORY[0x1E0C89E98];
    v16 = *MEMORY[0x1E0C8A2E8];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_2;
    v46[3] = &unk_1E45A2C18;
    v48 = &v51;
    v39 = v15;
    v41 = v13;
    v47 = v41;
    v37 = v16;
    objc_msgSend(v14, "determineCompatibilityOfExportPreset:withAsset:outputFileType:completionHandler:", v15, v8, v16, v46);
    dispatch_block_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
    -[PFMetadataStateHandler addBreadcrumb:](v12, "addBreadcrumb:", CFSTR("%s: Completed +determineCompatibilityOfExportPreset:"), "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]");
    if (*((_BYTE *)v52 + 24))
    {
      v17 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("mov"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingPathComponent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURLWithPath:", v22);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC0]), "initWithAsset:presetName:", v8, v39);
        objc_msgSend(v23, "setOutputFileType:", v37);
        objc_msgSend(v23, "setOutputURL:", v42);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_3;
        v44[3] = &unk_1E45A4AC8;
        v24 = v12;
        v45 = v24;
        v25 = dispatch_block_create((dispatch_block_flags_t)0, v44);

        -[PFMetadataStateHandler addBreadcrumb:](v24, "addBreadcrumb:", CFSTR("%s: Calling -exportAsynchronouslyWithCompletionHandler: for AVAssetExportSession: %p"), "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]", v23);
        objc_msgSend(v23, "exportAsynchronouslyWithCompletionHandler:", v25);
        dispatch_block_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        -[PFMetadataStateHandler addBreadcrumb:](v24, "addBreadcrumb:", CFSTR("%s: Completed -exportAsynchronouslyWithCompletionHandler:"), "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]");
        if (objc_msgSend(v23, "status") == 3)
        {
          objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v42, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v26, "propertyListForProxy");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = 1;
          }
          else
          {
            v9 = 0;
            v11 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "removeItemAtURL:error:", v42, 0);

          v10 = 0;
          v8 = v26;
        }
        else
        {
          objc_msgSend(v23, "error");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 0;
          v11 = 3;
        }
        v30 = v45;
      }
      else
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v57 = *MEMORY[0x1E0CB2D50];
        v29 = (void *)MEMORY[0x1E0CB3940];
        NSTemporaryDirectory();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "UUIDString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringByAppendingPathExtension:", CFSTR("mov"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingPathComponent:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("Failed to create a URL for path '%@'"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 3, v34);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = 0;
        v11 = 3;
        v25 = v41;
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      v56 = CFSTR("Asset, is not compatible with the AVAssetExportPresetPassthrough export preset");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 3;
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 3, v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v25 = v41;

    }
    _Block_object_dispose(&v51, 8);
    if (a4)
      goto LABEL_20;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v11 = 2;
    if (a4)
      goto LABEL_20;
  }
LABEL_21:
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v11;
}

- (id)contentTypeFromFastModernizeVideoMedia
{
  return 0;
}

- (id)outOfBandHints
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__PFMetadataMovie_outOfBandHints__block_invoke;
  v3[3] = &unk_1E45A2AE8;
  v3[4] = self;
  -[PFMetadataMovie _cachedValueForKey:usingBlock:](self, "_cachedValueForKey:usingBlock:", CFSTR("outOfBandHints"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_verifyAllValuesLoadedForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(&unk_1E45CB2B8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        v10 = v7;
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(&unk_1E45CB2B8);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v16 = v7;
        v12 = objc_msgSend(v4, "statusOfValueForKey:error:", v11, &v16);
        v7 = v16;

        if (v12 != 2)
        {
          v13 = metadataLog;
          if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v14 = CFSTR("no error");
            if (v7)
              v14 = v7;
            v22 = v11;
            v23 = 2112;
            v24 = v14;
            _os_log_debug_impl(&dword_1A16EE000, v13, OS_LOG_TYPE_DEBUG, "Value for key '%@' not loaded: %@", buf, 0x16u);
          }
        }
        ++v9;
      }
      while (v6 != v9);
      v15 = objc_msgSend(&unk_1E45CB2B8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v6 = v15;
    }
    while (v15);

  }
  if (objc_msgSend(&unk_1E45CB2B8, "containsObject:", CFSTR("tracks")))
    -[PFMetadataMovie _verifyTrackValuesLoadedForAsset:](self, "_verifyTrackValuesLoadedForAsset:", v4);

}

- (void)_verifyTrackValuesLoadedForAsset:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(v20, "tracks");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v27;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(obj);
        v19 = v3;
        v4 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v3);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(&unk_1E45CB690, "objectForKeyedSubscript:", CFSTR("tracks"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
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
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
              v21 = 0;
              v11 = objc_msgSend(v4, "statusOfValueForKey:error:", v10, &v21);
              v12 = (__CFString *)v21;
              if (v11 != 2)
              {
                v13 = metadataLog;
                if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138413058;
                  v14 = CFSTR("no error");
                  if (v12)
                    v14 = v12;
                  v31 = v10;
                  v32 = 2048;
                  v33 = v20;
                  v34 = 2048;
                  v35 = v4;
                  v36 = 2112;
                  v37 = v14;
                  _os_log_debug_impl(&dword_1A16EE000, v13, OS_LOG_TYPE_DEBUG, "Value for key '%@' for asset '%p', track '%p' is not loaded: %@", buf, 0x2Au);
                }
              }

              ++v9;
            }
            while (v7 != v9);
            v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
            v7 = v15;
          }
          while (v15);
        }

        v3 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v18);
  }

}

- (opaqueCMFormatDescription)_computeFirstFormatDescriptionOfType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PFMetadataMovie _computeFirstTrackOfType:](self, "_computeFirstTrackOfType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (opaqueCMFormatDescription *)v5;
}

- (id)_computeFirstTrackOfType:(id)a3
{
  id v4;
  AVAsset *asset;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3988;
  v13 = __Block_byref_object_dispose__3989;
  v14 = 0;
  asset = self->_asset;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PFMetadataMovie__computeFirstTrackOfType___block_invoke;
  v8[3] = &unk_1E45A2B60;
  v8[4] = &v9;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v4, asset, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_checkHFRMetadataKeyShouldPlayAtFullFrameRate:(BOOL *)a3 containsHFRPlaybackKey:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PFMetadata typeVerifier](self, "typeVerifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quicktimeMetadataFullFrameRatePlaybackIntent](PFMetadataIdentifier, "quicktimeMetadataFullFrameRatePlaybackIntent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAsset metadata](self->_asset, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v11)
  {
    *a3 = objc_msgSend(v11, "BOOLValue");
    v10 = v11;
    *a4 = 1;
  }

}

- (id)plistForEncoding
{
  void *v3;
  void *v4;
  AVAsset *asset;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFMetadataMovie;
  -[PFMetadata plistForEncoding](&v10, sel_plistForEncoding);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  asset = self->_asset;
  if (asset)
  {
    -[AVAsset propertyListForProxy](asset, "propertyListForProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, PFMetadataPlistAsset);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_cached_values, "objectForKeyedSubscript:", PFMetadataPlistIdentifyingTagClass);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, PFMetadataPlistIdentifyingTagClass);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_cached_values, "objectForKeyedSubscript:", PFMetadataPlistOriginalAssetDateProperties);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, PFMetadataPlistOriginalAssetDateProperties);

  }
  return v4;
}

- (id)ptpMediaMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E45CA658, *MEMORY[0x1E0CBCFF0]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadata orientedPixelSize](self, "orientedPixelSize");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CBD048]);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadata orientedPixelSize](self, "orientedPixelSize");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBCEA8]);

  -[PFMetadataMovie cameraMake](self, "cameraMake");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[PFMetadataMovie cameraModel](self, "cameraModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataMovie cameraMake](self, "cameraMake");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CBD0B0]);

  -[PFMetadataMovie cameraModel](self, "cameraModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CBD0B8]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBD090]);
LABEL_5:
  -[PFMetadata gpsLocation](self, "gpsLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinate");
  if (v15 == 0.0)
  {
LABEL_8:

    return v3;
  }
  -[PFMetadata gpsLocation](self, "gpsLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coordinate");
  v18 = v17;

  if (v18 != 0.0)
  {
    v27[0] = *MEMORY[0x1E0CBCD90];
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[PFMetadata gpsLocation](self, "gpsLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinate");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v20;
    v27[1] = *MEMORY[0x1E0CBCDA0];
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[PFMetadata gpsLocation](self, "gpsLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "coordinate");
    objc_msgSend(v21, "numberWithDouble:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CBCD68]);

    goto LABEL_8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataMovie;
  v4 = -[PFMetadata copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 22, self->_asset);
  objc_storeStrong(v4 + 23, self->_cached_values);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  AVAsset *asset;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFMetadataMovie;
  if (-[PFMetadata isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = (id *)v4;
    asset = self->_asset;
    v7 = (asset != 0) ^ (v5[22] == 0);
    if (asset)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      -[AVAsset propertyListForProxy](asset, "propertyListForProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5[22], "propertyListForProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v9, "isEqualToDictionary:", v10);

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_cached_values, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __44__PFMetadataMovie__computeFirstTrackOfType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a5 = 1;
}

id __33__PFMetadataMovie_outOfBandHints__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A808];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __33__PFMetadataMovie_outOfBandHints__block_invoke_2;
  v33[3] = &unk_1E45A2C40;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v27 = v5;
  v34 = v5;
  v35 = v6;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v3, v4, v33);
  v7 = (void *)MEMORY[0x1E0C8B220];
  +[PFMetadataIdentifier quicktimeMetadataSpatialAggressorsSeen](PFMetadataIdentifier, "quicktimeMetadataSpatialAggressorsSeen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C8B220];
  +[PFMetadataIdentifier quicktimeMetadataSpatialFormatVersion](PFMetadataIdentifier, "quicktimeMetadataSpatialFormatVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (!v13)
    goto LABEL_16;
  v14 = v13;
  v15 = *(_QWORD *)v30;
  v16 = *MEMORY[0x1E0C8A9E8];
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v30 != v15)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v18, "keySpace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqual:", v16))
      {
        objc_msgSend(v18, "key");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v9);

        if (!v21)
          goto LABEL_10;
        objc_msgSend(v18, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v9);
      }

LABEL_10:
      objc_msgSend(v18, "keySpace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqual:", v16))
      {
        objc_msgSend(v18, "key");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqual:", v12);

        if (!v24)
          continue;
        objc_msgSend(v18, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, v12);
      }

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  }
  while (v14);
LABEL_16:

  if (objc_msgSend(v27, "count"))
    v25 = v27;
  else
    v25 = 0;

  return v25;
}

void __33__PFMetadataMovie_outOfBandHints__block_invoke_2(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = *MEMORY[0x1E0CA2208];
  CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA2208]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  v7 = *MEMORY[0x1E0CA49F8];
  CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA49F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);
  v9 = *MEMORY[0x1E0CA4A50];
  CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA4A50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);
  v11 = *MEMORY[0x1E0CA4A60];
  CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA4A60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v11);
  v13 = objc_msgSend(*(id *)(a1 + 40), "_spatialVideoRecommendationForImmersiveModeForAssetVideoTrack:", v15);
  if (v13 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, PFMetadataRecommendedForImmersiveModeKey);

  }
}

uint64_t __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBreadcrumb:", CFSTR("%s: In handler for +determineCompatibilityOfExportPreset:"), "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]_block_invoke");
}

uint64_t __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__PFMetadataMovie__audioVideoProxyPropertyListForAsset_propertyList_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBreadcrumb:", CFSTR("%s: In handler for -exportAsynchronouslyWithCompletionHandler:"), "-[PFMetadataMovie _audioVideoProxyPropertyListForAsset:propertyList:error:]_block_invoke_3");
}

void __69__PFMetadataMovie__exifTimezoneOffsetFromDateString_offsetInSeconds___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(-|\\+)(\\d\\d)(\\d\\d)$"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex;
  _exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex = v0;

}

id __47__PFMetadataMovie__audioStreamBasicDescription__block_invoke(uint64_t a1)
{
  _OWORD v2[2];
  uint64_t v3;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  +[PFMetadataMovie audioStreamBasicDescriptionForAsset:](PFMetadataMovie, "audioStreamBasicDescriptionForAsset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), 0, 0, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v2, "{AudioStreamBasicDescription=dIIIIIIII}");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __52__PFMetadataMovie__firstVideoTrackFormatDescription__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formatDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __35__PFMetadataMovie__firstAudioTrack__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeFirstTrackOfType:", *MEMORY[0x1E0C8A7A0]);
}

uint64_t __35__PFMetadataMovie__firstVideoTrack__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeFirstTrackOfType:", *MEMORY[0x1E0C8A808]);
}

id __42__PFMetadataMovie__makeGeometryProperties__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double height;
  void *v11;
  void *v12;
  void *v13;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[3];
  _QWORD v20[4];
  CGRect v21;
  CGRect v22;

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "naturalSize");
  v3 = v2;
  v5 = v4;
  if (v1)
  {
    objc_msgSend(v1, "preferredTransform");
    v6 = v16;
    v7 = v15;
    v8 = v18;
    v9 = v17;
  }
  else
  {
    v8 = 0.0;
    v6 = 0.0;
    v9 = 0.0;
    v7 = 0.0;
  }
  v21.size.width = v5 * v9 + v7 * v3;
  v21.size.height = v5 * v8 + v6 * v3;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v22 = CGRectStandardize(v21);
  height = v22.size.height;
  v19[0] = *MEMORY[0x1E0CBD048];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22.size.width, v22.origin.y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E0CBD040];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = *MEMORY[0x1E0CBCFF0];
  v20[1] = v12;
  v20[2] = &unk_1E45CA640;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __51__PFMetadataMovie__makeDateTimePropertiesForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0CBCB50];
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CBCB50]);

    *(_QWORD *)v25 = 0;
    objc_msgSend(*(id *)(a1 + 40), "typeVerifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C8A840];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", &stru_1E45A8128);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      PFGMTTimeZone();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PFDateFromStringTimeZoneFormat(v11, v12, CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[PFMetadataMovie exifTimezoneOffsetFromDateString:offsetInSeconds:](PFMetadataMovie, "exifTimezoneOffsetFromDateString:offsetInSeconds:", v8, v25);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v2, "objectForKeyedSubscript:", v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBCC20]);

          v17 = *(_QWORD *)v25;
LABEL_13:

          objc_msgSend(v13, "dateByAddingTimeInterval:", (double)v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          PFGMTTimeZone();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          PFStringFromDateTimeZoneFormat(v21, v22, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "objectForKeyedSubscript:", v4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CBCB40]);

LABEL_14:
          return v2;
        }
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "secondsFromGMTForDate:", v13);
        goto LABEL_13;
      }
      PFDateFromString(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 32), "creationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "fileCreationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_14;
    }
    goto LABEL_12;
  }
  v18 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v25 = 136315138;
    *(_QWORD *)&v25[4] = "-[PFMetadataMovie _makeDateTimePropertiesForAsset:]_block_invoke";
    _os_log_error_impl(&dword_1A16EE000, v18, OS_LOG_TYPE_ERROR, "asset should not be nil %s", v25, 0xCu);
  }
  return 0;
}

id __37__PFMetadataMovie__makeGPSProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C8A850];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = 0.0;
    v11 = 0.0;
    if (+[PFMetadataMovie parseISO6709String:outLatitude:outLongitude:](PFMetadataMovie, "parseISO6709String:outLatitude:outLongitude:", v6, &v11, &v10))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && *MEMORY[0x1E0CBCD90])
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v7);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && *MEMORY[0x1E0CBCDA0])
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8);

    }
  }

  return v2;
}

id __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v3 = *MEMORY[0x1E0C8A7A0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 176);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke_2;
  v9[3] = &unk_1E45A2BB0;
  v9[4] = v4;
  v11 = v12;
  v6 = v2;
  v10 = v6;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v3, v5, v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  _Block_object_dispose(v12, 8);
  return v7;
}

void __45__PFMetadataMovie__computeApacAudioTrackInfo__block_invoke_2(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  const AudioFormatListItem *RichestDecodableFormat;
  const AudioFormatListItem *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _BYTE v20[32];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  if ((_DWORD)a4 == 1634754915 || (_DWORD)a4 == 1902211171 || (_DWORD)a4 == 1667330147)
  {
    RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(a3);
    if (RichestDecodableFormat)
    {
      v11 = RichestDecodableFormat;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = RichestDecodableFormat->mASBD.mChannelsPerFrame;
      objc_msgSend(*(id *)(a1 + 32), "_computeChannelCountsForApacAudioTrackInfo:maxChannelCount:audioChannelLayout:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), CMAudioFormatDescriptionGetChannelLayout(a3, 0));
      v12 = *(void **)(a1 + 32);
      v13 = *(_OWORD *)&v11->mASBD.mSampleRate;
      v14 = *(_OWORD *)&v11->mASBD.mBytesPerPacket;
      v21 = *(_QWORD *)&v11->mASBD.mBitsPerChannel;
      *(_OWORD *)v20 = v13;
      *(_OWORD *)&v20[16] = v14;
      objc_msgSend(v12, "_apacProfileLevelDescriptionForFormatDescription:audioStreamBasicDescription:", a3, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, CFSTR("codecProfileLevelDescription"));

      *a5 = 1;
    }
    else
    {
      v16 = (void *)metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
        *(_DWORD *)v20 = 138543618;
        *(_QWORD *)&v20[4] = v18;
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v19;
        _os_log_error_impl(&dword_1A16EE000, v17, OS_LOG_TYPE_ERROR, "Unable to get format list item for track with codec %{public}@ in asset %@", v20, 0x16u);

      }
    }
  }

}

id __81__PFMetadataMovie__spatialVideoRecommendationForImmersiveModeForAssetVideoTrack___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isSpatialMedia"))
  {
    +[PFMediaUtilities metadataForFormat:forAssetTrack:](PFMediaUtilities, "metadataForFormat:forAssetTrack:", *MEMORY[0x1E0C8A908], *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFMetadataIdentifier quicktimeMetadataSpatialVideoRecommendedForImmersiveMode](PFMetadataIdentifier, "quicktimeMetadataSpatialVideoRecommendedForImmersiveMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB37E8];
    if (v5)
      v7 = objc_msgSend(v5, "BOOLValue");
    else
      v7 = 2;
    objc_msgSend(v6, "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AAA0];
  }
  return v8;
}

id __36__PFMetadataMovie_spatialMediaTrack__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3988;
  v10 = __Block_byref_object_dispose__3989;
  v11 = 0;
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v2 = *MEMORY[0x1E0C8A808];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PFMetadataMovie_spatialMediaTrack__block_invoke_2;
  v5[3] = &unk_1E45A2B60;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v2, v1, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__PFMetadataMovie_spatialMediaTrack__block_invoke_2(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  id v13;

  v13 = a2;
  CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA49F8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E0CA4A50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A718]))
    v11 = v9 == 0;
  else
    v11 = 1;
  v12 = v11 || v10 == 0;
  if (!v12 && objc_msgSend(v13, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A740]))
  {
    *a5 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __58__PFMetadataMovie__computeStillImageDisplayTimeDictionary__block_invoke(uint64_t a1, void *a2, const opaqueCMFormatDescription *a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  id v10;

  v10 = a2;
  CMMetadataFormatDescriptionGetIdentifiers(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0CA4CC0]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a5 = 1;
  }

}

uint64_t __34__PFMetadataMovie_hevcProfileInfo__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeHEVCProfileInfo");
}

id __45__PFMetadataMovie_outOfBandHintsBase64String__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "outOfBandHints");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v1, 200, 0, &v9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    if (v2)
    {
      objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
LABEL_9:

        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v5 = MEMORY[0x1E0C81028];
        v6 = "Base64 serialization failure for URL out of band hints";
        v7 = 2;
LABEL_12:
        _os_log_error_impl(&dword_1A16EE000, v5, OS_LOG_TYPE_ERROR, v6, buf, v7);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Plist serialization failure for URL out of band hints: %@";
      v7 = 12;
      goto LABEL_12;
    }
    v4 = 0;
    goto LABEL_9;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

uint64_t __29__PFMetadataMovie_isPlayable__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "isPlayable"));
}

id __30__PFMetadataMovie_isDecodable__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v2 = *MEMORY[0x1E0C8A808];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__PFMetadataMovie_isDecodable__block_invoke_2;
  v5[3] = &unk_1E45A2B60;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v2, v1, v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v7 + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __30__PFMetadataMovie_isDecodable__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isEnabled") && (objc_msgSend(v7, "isDecodable") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a5 = 1;
  }

}

CFPropertyListRef __35__PFMetadataMovie_transferFunction__block_invoke(uint64_t a1)
{
  const opaqueCMFormatDescription *v1;

  v1 = (const opaqueCMFormatDescription *)objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrackFormatDescription");
  return CMFormatDescriptionGetExtension(v1, (CFStringRef)*MEMORY[0x1E0CA8E98]);
}

CFPropertyListRef __33__PFMetadataMovie_colorPrimaries__block_invoke(uint64_t a1)
{
  const opaqueCMFormatDescription *v1;

  v1 = (const opaqueCMFormatDescription *)objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrackFormatDescription");
  return CMFormatDescriptionGetExtension(v1, (CFStringRef)*MEMORY[0x1E0CA8D68]);
}

id __56__PFMetadataMovie_firstVideoTrackFormatDebugDescription__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMediaUtilities formatDebugDescriptionForVideoTrack:](PFMediaUtilities, "formatDebugDescriptionForVideoTrack:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __30__PFMetadataMovie_captureMode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *MEMORY[0x1E0C8A908];
  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMediaUtilities metadataForFormat:forAssetTrack:](PFMediaUtilities, "metadataForFormat:forAssetTrack:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataCaptureMode](PFMetadataIdentifier, "quickTimeMetadataCaptureMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __25__PFMetadataMovie_author__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A838];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__PFMetadataMovie_montageString__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A968];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __30__PFMetadataMovie_isActionCam__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataKeyActionVideoStabilizationStrength](PFMetadataIdentifier, "quickTimeMetadataKeyActionVideoStabilizationStrength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", v6 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __27__PFMetadataMovie_isProRes__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_computeIsProRes"));
}

id __34__PFMetadataMovie_hasSpatialAudio__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v2 = *MEMORY[0x1E0C8A7A0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PFMetadataMovie_hasSpatialAudio__block_invoke_2;
  v5[3] = &unk_1E45A2B60;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v2, v1, v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v7 + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PFMetadataMovie_hasSpatialAudio__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = FigAudioFormatDescriptionGetCinematicAudioEffectEligibility();
  if ((_DWORD)result)
  {
    *a5 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

id __35__PFMetadataMovie_isCinematicVideo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v2 = *MEMORY[0x1E0C8A7D0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PFMetadataMovie_isCinematicVideo__block_invoke_2;
  v5[3] = &unk_1E45A2B60;
  v5[4] = &v6;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v2, v1, v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v7 + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __35__PFMetadataMovie_isCinematicVideo__block_invoke_2(uint64_t a1, int a2, CMMetadataFormatDescriptionRef desc, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  CMMetadataFormatDescriptionGetIdentifiers(desc);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataCinematicVideoRendering](PFMetadataIdentifier, "quickTimeMetadataCinematicVideoRendering");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v7) & 1) != 0)
  {
    +[PFMetadataIdentifier quickTimeMetadataCinematicVideoCinematography](PFMetadataIdentifier, "quickTimeMetadataCinematicVideoCinematography");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "containsObject:", v8);
    v11 = *(_QWORD *)(a1 + 32);
    v10 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v11 + 8) + 24) = v9;

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v10 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v12 + 8) + 24) = 0;
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v10 + 8) + 24))
    *a5 = 1;

}

id __26__PFMetadataMovie_isSloMo__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  float v4;
  float v5;
  uint64_t v6;
  BOOL v7;
  __int16 v9;

  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "nominalFrameRate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  *(float *)&v3 = v3;
  +[PFVideoAdjustments defaultSlowMotionRateForNominalFrameRate:](PFVideoAdjustments, "defaultSlowMotionRateForNominalFrameRate:", v3);
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "_checkHFRMetadataKeyShouldPlayAtFullFrameRate:containsHFRPlaybackKey:", (char *)&v9 + 1, &v9);
  if ((_BYTE)v9 || v5 >= 1.0)
  {
    if ((_BYTE)v9)
      v7 = HIBYTE(v9) == 0;
    else
      v7 = 0;
    v6 = v7;
  }
  else
  {
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __36__PFMetadataMovie_videoDynamicRange__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrackFormatDescription");
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CMVideoFormatDescriptionGetVideoDynamicRange());
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(a1 + 40));
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

id __54__PFMetadataMovie__computeFirstVideoTrackCodecAndName__block_invoke_2()
{
  MTCopyStringsForMediaTypeAndSubType();
  return 0;
}

id __48__PFMetadataMovie_livePhotoMinimumClientVersion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataLivePhotoMinimumClientVersion](PFMetadataIdentifier, "quickTimeMetadataLivePhotoMinimumClientVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__PFMetadataMovie_livePhotoVitalityLimitingAllowed__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityLimitingAllowed](PFMetadataIdentifier, "quickTimeMetadataLivePhotoVitalityLimitingAllowed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __30__PFMetadataMovie_hasVitality__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataLivePhotoVitalityDisabled](PFMetadataIdentifier, "quickTimeMetadataLivePhotoVitalityDisabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__PFMetadataMovie_livePhotoVitalityTransitionScore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataVitalityTransitionScore](PFMetadataIdentifier, "quickTimeMetadataVitalityTransitionScore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__PFMetadataMovie_livePhotoVitalityScore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A978];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__PFMetadataMovie_isAutoLivePhoto__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A940];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__PFMetadataMovie_playbackVariation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier](PFMetadataIdentifier, "quickTimeMetadataVariationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__PFMetadataMovie_audioDataRate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_firstAudioTrack");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "estimatedDataRate");
  objc_msgSend(v2, "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __32__PFMetadataMovie_videoDataRate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "estimatedDataRate");
  objc_msgSend(v2, "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __35__PFMetadataMovie_nominalFrameRate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "nominalFrameRate");
  objc_msgSend(v2, "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __50__PFMetadataMovie_stillImageDisplayTimeDictionary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeStillImageDisplayTimeDictionary");
}

CFDictionaryRef __27__PFMetadataMovie_duration__block_invoke(uint64_t a1)
{
  void *v1;
  CMTime time;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  if (v1)
    objc_msgSend(v1, "duration");
  else
    memset(&time, 0, sizeof(time));
  return CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
}

id __33__PFMetadataMovie_imageDirection__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A960];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__PFMetadataMovie_gpsHPositioningError__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A980];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __27__PFMetadataMovie_keywords__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A970];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __24__PFMetadataMovie_title__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A870];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__PFMetadataMovie_isSpatialOverCapture__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataContainsSpatialOverCaptureContent](PFMetadataIdentifier, "quickTimeMetadataContainsSpatialOverCaptureContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __47__PFMetadataMovie_spatialOverCaptureIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataSpatialOverCaptureGroupIdentifier](PFMetadataIdentifier, "quickTimeMetadataSpatialOverCaptureGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__PFMetadataMovie_artworkContentDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A828];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__PFMetadataMovie_captionAbstract__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A848];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__PFMetadataMovie_renderOriginatingAssetIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataRenderOriginatingSignature](PFMetadataIdentifier, "quickTimeMetadataRenderOriginatingSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __45__PFMetadataMovie_originatingAssetIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quickTimeMetadataOriginatingSignature](PFMetadataIdentifier, "quickTimeMetadataOriginatingSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __27__PFMetadataMovie_software__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A868];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__PFMetadataMovie_focalLengthIn35mm__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *MEMORY[0x1E0C8A908];
  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMediaUtilities metadataForFormat:forAssetTrack:](PFMediaUtilities, "metadataForFormat:forAssetTrack:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quicktimeMetadataCameraFocalLength35mmEquivalent](PFMetadataIdentifier, "quicktimeMetadataCameraFocalLength35mmEquivalent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __28__PFMetadataMovie_lensModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *MEMORY[0x1E0C8A908];
  objc_msgSend(*(id *)(a1 + 32), "_firstVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMediaUtilities metadataForFormat:forAssetTrack:](PFMediaUtilities, "metadataForFormat:forAssetTrack:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadataIdentifier quicktimeMetadataCameraLensModel](PFMetadataIdentifier, "quicktimeMetadataCameraLensModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __30__PFMetadataMovie_cameraModel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A860];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __29__PFMetadataMovie_cameraMake__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A858];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __45__PFMetadataMovie_livePhotoPairingIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "typeVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A948];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAVMetadataIdentifier:fromAVMetadataItems:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __83__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "addBreadcrumb:", CFSTR("%s: In completion handler for -[%p loadValuesAsynchronouslyForKeys:%@ keysForCollectionKeys:%@ completionHandler:]"), "-[PFMetadataMovie _loadMetadataForAsset:withKeys:collectionKeys:completionHandler:]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__PFMetadataMovie__loadMetadataForAsset_withKeys_collectionKeys___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)_channelLayoutUsesChannelDescriptions:(const AudioChannelLayout *)a3
{
  return a3 && a3->mChannelLayoutTag == 0;
}

+ (BOOL)_channelLayoutUsesHOA:(const AudioChannelLayout *)a3
{
  return a3 && (a3->mChannelLayoutTag & 0xFFFE0000) == 12451840;
}

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionForAsset:(SEL)a3
{
  id v6;
  uint64_t v7;
  uint64_t *v8;
  __int128 v9;
  AudioStreamBasicDescription *result;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x4810000000;
  v15 = &unk_1A17D2676;
  v16 = 0u;
  v17 = 0u;
  v18 = 0;
  v7 = *MEMORY[0x1E0C8A7A0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PFMetadataMovie_audioStreamBasicDescriptionForAsset___block_invoke;
  v11[3] = &unk_1E45A2B60;
  v11[4] = &v12;
  objc_msgSend(a2, "_enumerateTracksOfType:onAsset:withBlock:", v7, v6, v11);
  v8 = v13;
  v9 = *((_OWORD *)v13 + 3);
  *(_OWORD *)&retstr->mSampleRate = *((_OWORD *)v13 + 2);
  *(_OWORD *)&retstr->mBytesPerPacket = v9;
  *(_QWORD *)&retstr->mBitsPerChannel = v8[8];
  _Block_object_dispose(&v12, 8);

  return result;
}

+ (void)_enumerateTracksOfType:(id)a3 onAsset:(id)a4 withBlock:(id)a5
{
  void (**v7)(id, void *, const opaqueCMFormatDescription *, uint64_t, char *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const opaqueCMFormatDescription *v18;
  uint64_t MediaSubType;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, const opaqueCMFormatDescription *, uint64_t, char *))a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", a3, a4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
      v25 = 0;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v12, "formatDescriptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
LABEL_8:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v21 + 1) + 8 * v17);
          MediaSubType = CMFormatDescriptionGetMediaSubType(v18);
          v7[2](v7, v12, v18, MediaSubType, &v25);
          if (v25)
            break;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
            if (v15)
              goto LABEL_8;
            break;
          }
        }
      }

      if (v25)
        break;
      if (++v11 == v9)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (BOOL)parseISO6709String:(id)a3 outLatitude:(double *)a4 outLongitude:(double *)a5
{
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  id v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;
  double v38;
  double v39;
  unint64_t v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  int v49;
  id v50;
  double v51;
  int v52;
  double v53;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;

  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "length") >= 3)
  {
    if (a4)
      *a4 = 0.0;
    if (a5)
      *a5 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("+-"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v11 = objc_msgSend(v9, "scanCharactersFromSet:intoString:", v10, &v63);
    v12 = v63;

    if (!v11 || objc_msgSend(v12, "length") != 1)
    {
      v8 = 0;
LABEL_47:

      goto LABEL_48;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v14 = objc_msgSend(v9, "scanCharactersFromSet:intoString:", v13, &v62);
    v15 = v62;

    if (v14)
    {
      v16 = objc_msgSend(v15, "length");
      v17 = 0.0;
      v18 = 1.0;
      switch(v16)
      {
        case 2:
LABEL_15:
          objc_msgSend(v15, "substringWithRange:", 0, 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v17 + v24;

          objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("+-"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0;
          v27 = objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v26, &v61);
          v28 = v61;

          if (v27 && objc_msgSend(v28, "length"))
          {
            objc_msgSend(v28, "doubleValue");
            v25 = v25 + v29 * v18;
          }
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("-")))
            v30 = -v25;
          else
            v30 = v25;
          objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("+-"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0;
          v32 = objc_msgSend(v9, "scanCharactersFromSet:intoString:", v31, &v60);
          v33 = v60;

          if (!v32 || objc_msgSend(v33, "length") != 1)
          {
            v8 = 0;
LABEL_45:

            goto LABEL_46;
          }
          v57 = v28;
          objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0;
          v35 = objc_msgSend(v9, "scanCharactersFromSet:intoString:", v34, &v59);
          v36 = v59;

          if (v35)
          {
            v37 = objc_msgSend(v36, "length");
            v38 = 0.0;
            v39 = 1.0;
            v55 = v36;
            if (v37 == 3)
            {
              v40 = 0x1E0CB3000uLL;
LABEL_34:
              objc_msgSend(v36, "substringWithRange:", 0, 3, v55);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "doubleValue");
              v47 = v38 + v46;

              objc_msgSend(*(id *)(v40 + 1280), "characterSetWithCharactersInString:", CFSTR("+-C/"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = 0;
              v49 = objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v48, &v58);
              v50 = v58;

              if (v49 && objc_msgSend(v50, "length"))
              {
                objc_msgSend(v50, "doubleValue");
                v47 = v47 + v51 * v39;
              }
              v36 = v56;
              v28 = v57;
              v52 = objc_msgSend(v33, "isEqualToString:", CFSTR("-"));
              v53 = -v47;
              if (!v52)
                v53 = v47;
              if (a4)
                *a4 = v30;
              if (a5)
                *a5 = v53;

              v8 = 1;
              goto LABEL_44;
            }
            v40 = 0x1E0CB3000;
            if (v37 == 5)
            {
LABEL_28:
              v39 = v39 / 60.0;
              objc_msgSend(v36, "substringWithRange:", 3, 2, v55);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "doubleValue");
              v38 = v38 + v44 / 60.0;

              v36 = v55;
              goto LABEL_34;
            }
            if (v37 == 7)
            {
              objc_msgSend(v36, "substringWithRange:", 5, 2);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "doubleValue");
              v38 = v42 / 60.0 / 60.0 + 0.0;

              v36 = v55;
              v39 = 0.0166666667;
              goto LABEL_28;
            }
          }
          v8 = 0;
          v28 = v57;
LABEL_44:

          goto LABEL_45;
        case 4:
LABEL_14:
          v18 = v18 / 60.0;
          objc_msgSend(v15, "substringWithRange:", 2, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v17 = v17 + v22 / 60.0;

          goto LABEL_15;
        case 6:
          objc_msgSend(v15, "substringWithRange:", 4, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v17 = v20 / 60.0 / 60.0 + 0.0;

          v18 = 0.0166666667;
          goto LABEL_14;
      }
    }
    v8 = 0;
LABEL_46:

    goto LABEL_47;
  }
  v8 = 0;
LABEL_48:

  return v8;
}

+ (id)exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int64_t v20;

  v5 = a3;
  if (exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken[0] != -1)
    dispatch_once(exifTimezoneOffsetFromDateString_offsetInSeconds__onceToken, &__block_literal_global_185);
  objc_msgSend((id)exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "rangeAtIndex:", 1);
    objc_msgSend(v5, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "rangeAtIndex:", 2);
    objc_msgSend(v5, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "rangeAtIndex:", 3);
    objc_msgSend(v5, "substringWithRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@:%@"), v10, v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v18 = objc_msgSend(v10, "isEqualToString:", CFSTR("-"));
      v19 = objc_msgSend(v13, "intValue");
      v20 = 3600 * v19 + 60 * (int)objc_msgSend(v16, "intValue");
      if (v18)
        v20 = -v20;
      *a4 = v20;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (void)firstVideoTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = *MEMORY[0x1E0C8A808];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PFMetadataMovie_firstVideoTrackForAsset_resultBlock___block_invoke;
  v8[3] = &unk_1E45A2C68;
  v9 = v5;
  v7 = v5;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v6, a3, v8);

}

+ (void)firstAudioTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = *MEMORY[0x1E0C8A7A0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PFMetadataMovie_firstAudioTrackForAsset_resultBlock___block_invoke;
  v8[3] = &unk_1E45A2C68;
  v9 = v5;
  v7 = v5;
  +[PFMetadataMovie _enumerateTracksOfType:onAsset:withBlock:](PFMetadataMovie, "_enumerateTracksOfType:onAsset:withBlock:", v6, a3, v8);

}

uint64_t __55__PFMetadataMovie_firstAudioTrackForAsset_resultBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a5 = 1;
  return result;
}

uint64_t __55__PFMetadataMovie_firstVideoTrackForAsset_resultBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a5 = 1;
  return result;
}

void __68__PFMetadataMovie_exifTimezoneOffsetFromDateString_offsetInSeconds___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(-|\\+)(\\d\\d)(\\d\\d)$"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex;
  exifTimezoneOffsetFromDateString_offsetInSeconds__timeZoneSuffixRegex = v0;

}

__n128 __55__PFMetadataMovie_audioStreamBasicDescriptionForAsset___block_invoke(uint64_t a1, int a2, CMAudioFormatDescriptionRef desc, uint64_t a4, _BYTE *a5)
{
  const AudioFormatListItem *RichestDecodableFormat;
  __n128 result;
  uint64_t v9;
  __int128 v10;

  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(desc);
  if (RichestDecodableFormat)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = *(__n128 *)&RichestDecodableFormat->mASBD.mSampleRate;
    v10 = *(_OWORD *)&RichestDecodableFormat->mASBD.mBytesPerPacket;
    *(_QWORD *)(v9 + 64) = *(_QWORD *)&RichestDecodableFormat->mASBD.mBitsPerChannel;
    *(__n128 *)(v9 + 32) = result;
    *(_OWORD *)(v9 + 48) = v10;
    *a5 = 1;
  }
  return result;
}

@end
