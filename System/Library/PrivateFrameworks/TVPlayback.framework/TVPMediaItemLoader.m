@implementation TVPMediaItemLoader

- (AVURLAsset)AVAsset
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AVAsset keys loaded")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Preparing for playback initiation")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Ready for playback")))
  {
    -[TVPMediaItemLoader assetInternalAccessQueue](self, "assetInternalAccessQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29__TVPMediaItemLoader_AVAsset__block_invoke;
    v8[3] = &unk_24F15DE58;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v5, v8);

  }
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (AVURLAsset *)v6;
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Will load AVAsset metadata keys = %@", buf, 0xCu);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", v14))
        {
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
            v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(v13, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v17, v14);

            v26 = CFSTR("value");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = MEMORY[0x24BDAC760];
            v19[1] = 3221225472;
            v19[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_350;
            v19[3] = &unk_24F15D1B8;
            v19[4] = v13;
            v20 = v14;
            v21 = *(id *)(a1 + 32);
            objc_msgSend(v13, "loadValuesAsynchronouslyForKeys:completionHandler:", v18, v19);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

}

- (unint64_t)_rollTypeFromMetadataItemKey:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.hls.pre-roll.count")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.hls.mid-roll.count")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.hls.post-roll.count")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)initialize
{
  if (initialize_onceToken_9 != -1)
    dispatch_once(&initialize_onceToken_9, &__block_literal_global_18);
}

+ (void)removeTemporaryDownloadDirectory
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_228A4E000, v0, v1, "Error deleting directory at %@: %@");
  OUTLINED_FUNCTION_5_0();
}

+ (id)tempDirURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.TVPlayback"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __32__TVPMediaItemLoader_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "TVPMediaItemLoader");
  v1 = (void *)sMediaItemLoaderLogObject;
  sMediaItemLoaderLogObject = (uint64_t)v0;

}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_3(uint64_t a1)
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  int v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 40), CFSTR("TVPMediaItemMetadataRollInfo"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 48), CFSTR("TVPMediaItemMetadataSkipInfo"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 56), CFSTR("TVPMediaItemMetadataPostPlayStartTime"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 64), CFSTR("TVPMediaItemMetadataWatchedTime"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 72), CFSTR("TVPMediaItemMetadataFeatureStartTime"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 80), CFSTR("TVPMediaItemMetadataFeatureDuration"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 88), CFSTR("TVPMediaItemMetadataAdvisoryInfo"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 96), CFSTR("TVPMediaItemMetadataRatingImageURL"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 104), CFSTR("TVPMediaItemMetadataProductPlacementInfo"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 112), CFSTR("TVPMediaItemMetadataPhotoSensitivityImageURL"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 120), CFSTR("TVPMediaItemMetadataPhotoSensitivityDuration"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 128), CFSTR("TVPMediaItemMetadataPhotoSensitivityDescription"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 136), CFSTR("TVPMediaItemMetadataHighMotionWarningImageURL"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 144), CFSTR("TVPMediaItemMetadataHighMotionWarningDuration"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 152), CFSTR("TVPMediaItemMetadataHighMotionWarningDescription"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 160), CFSTR("TVPMediaItemMetadataRecommendedViewingRatio"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStoreItemIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    if (objc_msgSend(*(id *)(a1 + 168), "length"))
    {
      if ((objc_msgSend(v19, "isEqualToString:", *(_QWORD *)(a1 + 168)) & 1) == 0)
      {
        v20 = sMediaItemLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 168);
          v49 = 138412546;
          v50 = v19;
          v51 = 2112;
          v52 = v21;
          _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "Media item metadata and HLS store identifiers do not match. Media item:%@ HLS:%@", (uint8_t *)&v49, 0x16u);
        }
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 168), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 168), CFSTR("TVPMediaItemMetadataStoreItemIdentifier"));

  }
  if (objc_msgSend(*(id *)(a1 + 176), "length"))
  {
    v23 = objc_msgSend(*(id *)(a1 + 176), "BOOLValue");
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMediaItemMetadata:forProperty:", v25, CFSTR("TVPMediaItemMetadataShouldDisplayRatingOverlay"));

  }
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataMediaType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "isEqualToString:", CFSTR("ATVMediaTypeTVEpisode")))
  {
    v28 = CFSTR("TVPMediaItemMetadataTitle");
  }
  else
  {
    v29 = objc_msgSend(v27, "isEqualToString:", CFSTR("ATVMediaTypeTVEpisodePreview"));
    v28 = CFSTR("TVPMediaItemMetadataTitle");
    if (!v29)
      goto LABEL_15;
  }
  if (objc_msgSend(*(id *)(a1 + 184), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 184), v28);

    v31 = CFSTR("TVPMediaItemMetadataSeriesTitle");
    v28 = v31;
  }
LABEL_15:
  if (objc_msgSend(*(id *)(a1 + 192), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 192), v28);

  }
  if (objc_msgSend(*(id *)(a1 + 200), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 200), CFSTR("TVPMediaItemMetadataLongDescription"));

  }
  if (objc_msgSend(*(id *)(a1 + 208), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 208), CFSTR("TVPMediaItemMetadataGenre"));

  }
  if (objc_msgSend(*(id *)(a1 + 216), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 216), CFSTR("TVPMediaItemMetadataContentRating"));

  }
  if (objc_msgSend(*(id *)(a1 + 224), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 224), CFSTR("TVPMediaItemMetadataContentRatingSystem"));

  }
  if (*(_QWORD *)(a1 + 232))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 232), CFSTR("TVPMediaItemMetadataCommonSenseRating"));

  }
  if (objc_msgSend(*(id *)(a1 + 240), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_tomatoFreshnessFromString:", *(_QWORD *)(a1 + 240));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setMediaItemMetadata:forProperty:", v38, CFSTR("TVPMediaItemMetadataTomatoFreshness"));

  }
  v40 = *(void **)(a1 + 248);
  if (v40)
  {
    objc_msgSend(v40, "doubleValue");
    if (v41 >= 0.0)
    {
      objc_msgSend(*(id *)(a1 + 248), "doubleValue");
      v43 = (unint64_t)(v42 * 100.0);
      objc_msgSend(*(id *)(a1 + 32), "mediaItem");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setMediaItemMetadata:forProperty:", v45, CFSTR("TVPMediaItemMetadataTomatoPercentage"));

    }
  }
  if (objc_msgSend(*(id *)(a1 + 256), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 256), CFSTR("TVPMediaItemMetadataArtworkURLFormat"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_contentKeyRequestParamsFromBase64String:", *(_QWORD *)(a1 + 264));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setMediaItemMetadata:forProperty:", v47, CFSTR("TVPMediaItemMetadataContentKeyRequestParams"));

}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "AVAssetInternal");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__TVPMediaItemLoader__needToLoadBlockingMetadataKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "AVAssetInternal");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

const __CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  id *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v28 = a2;
  v29 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addStartEventWithName:", TVPPlaybackReportingEventPrepareForPlaybackInitiation);

  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "mediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v16, "timingData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "setStartTimeForPreparingForPlaybackInitiation:");

  v18 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v18, "_contentKeyLoader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v20, "assetInternalAccessQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_10;
  block[3] = &unk_24F15BA88;
  objc_copyWeak(&v37, (id *)(a1 + 40));
  v23 = v19;
  v36 = v23;
  dispatch_sync(v21, block);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v15;
      _os_log_impl(&dword_228A4E000, v24, OS_LOG_TYPE_DEFAULT, "Calling prepareForPlaybackInitiationWithCompletion for mediaItem %@", buf, 0xCu);
    }
    v32[0] = v22;
    v32[1] = 3221225472;
    v32[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_140;
    v32[3] = &unk_24F15DFC0;
    v33 = v15;
    v34 = *(id *)(a1 + 32);
    objc_msgSend(v33, "prepareForPlaybackInitiationWithCompletion:", v32);

    v25 = &v33;
  }
  else
  {
    v26 = *(void **)(a1 + 32);
    v30[0] = v22;
    v30[1] = 3221225472;
    v30[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_141;
    v30[3] = &unk_24F15BEF8;
    v31 = v26;
    objc_msgSend(v31, "executeBlockAfterCurrentStateTransition:", v30);
    v25 = &v31;
  }

  objc_destroyWeak(&v37);
  return CFSTR("Preparing for playback initiation");
}

const __CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_8(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEndEventWithName:", TVPPlaybackReportingEventLoadAVAssetKeysSecondary);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "mediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEndEventWithName:", TVPPlaybackReportingEventLoadAVAssetKeysTotal);

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "mediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEndEventWithName:", TVPPlaybackReportingEventMediaItemLoaderLoad);

  v11 = objc_loadWeakRetained(v1);
  objc_msgSend(v11, "timingData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "setEndTimeForLoadingAVAssetKeys:");

  v13 = objc_loadWeakRetained(v1);
  objc_msgSend(v13, "mediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMediaItemMetadata:forProperty:", MEMORY[0x24BDBD1C8], CFSTR("TVPMediaItemMetadataHLSMetadataIsLoaded"));

  return CFSTR("AVAsset keys loaded");
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadMediaItemMetadataAsynchronously");

}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v13);
  objc_msgSend(WeakRetained, "mediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEndEventWithName:", TVPPlaybackReportingEventLoadAVAssetKeysPrimary);

  v17 = objc_loadWeakRetained(v13);
  v18 = objc_msgSend(v17, "_needToLoadBlockingMetadataKeys");

  v19 = objc_loadWeakRetained(v13);
  objc_msgSend(v19, "mediaItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v18)
  {
    objc_msgSend(v21, "addStartEventWithName:", TVPPlaybackReportingEventLoadAVAssetKeysSecondary);

    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_7;
    v32[3] = &unk_24F15C088;
    objc_copyWeak(&v33, v13);
    objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v32);
    objc_msgSend(v9, "currentState");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v33);
  }
  else
  {
    objc_msgSend(v21, "addEndEventWithName:", TVPPlaybackReportingEventLoadAVAssetKeysTotal);

    v24 = objc_loadWeakRetained(v13);
    objc_msgSend(v24, "mediaItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addEndEventWithName:", TVPPlaybackReportingEventMediaItemLoaderLoad);

    v27 = objc_loadWeakRetained(v13);
    objc_msgSend(v27, "timingData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    objc_msgSend(v28, "setEndTimeForLoadingAVAssetKeys:");

    v29 = objc_loadWeakRetained(v13);
    objc_msgSend(v29, "mediaItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMediaItemMetadata:forProperty:", MEMORY[0x24BDBD1C8], CFSTR("TVPMediaItemMetadataHLSMetadataIsLoaded"));

    v23 = CFSTR("AVAsset keys loaded");
  }

  return v23;
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "assetLoadContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:", *(_QWORD *)(a1 + 32));

}

const __CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v2 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Content will not be cached to disk; no purge necessary",
      buf,
      2u);
  }
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_76;
  v7[3] = &unk_24F15C088;
  objc_copyWeak(&v8, v3);
  objc_msgSend(v5, "executeBlockAfterCurrentStateTransition:", v7);

  objc_destroyWeak(&v8);
  return CFSTR("Purging disk space during initial loading if necessary");
}

void __41__TVPMediaItemLoader_loaderForMediaItem___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sLoaderHashTable;
  sLoaderHashTable = v0;

}

void __40__TVPMediaItemLoader_initWithMediaItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v10, "AVAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v5;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_INFO, "State did change to %@.  error property is %@, AVAsset property is %@", (uint8_t *)&v13, 0x20u);

  }
  v12 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "setState:", v5);

}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v6);

}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDB21D0];
  v11[0] = CFSTR("TVPMediaItemMetadataAcquisitionDictionary");
  v11[1] = CFSTR("TVPMediaItemMetadataKeyBagPathFileURL");
  v1 = *MEMORY[0x24BDB21C8];
  v12[0] = v0;
  v12[1] = v1;
  v2 = *MEMORY[0x24BDB21F8];
  v11[2] = CFSTR("TVPMediaItemMetadataAllowAppleWirelessDirectLink");
  v11[3] = CFSTR("TVPMediaItemMetadataAirPlayAuthorizationInfo");
  v3 = *MEMORY[0x24BDB2100];
  v12[2] = v2;
  v12[3] = v3;
  v4 = *MEMORY[0x24BDB21E8];
  v11[4] = CFSTR("TVPMediaItemMetadataSSLProperties");
  v11[5] = CFSTR("TVPMediaItemMetadataOutOfBandAlternateTracks");
  v5 = *MEMORY[0x24BDB21B0];
  v12[4] = v4;
  v12[5] = v5;
  v6 = *MEMORY[0x24BDB2188];
  v11[6] = CFSTR("TVPMediaItemMetadataHTTPHeaders");
  v11[7] = CFSTR("TVPMediaItemMetadataDownloadToken");
  v7 = *MEMORY[0x24BDB2170];
  v12[6] = v6;
  v12[7] = v7;
  v11[8] = CFSTR("TVPMediaItemMetadataDownloadDestinationURL");
  v12[8] = *MEMORY[0x24BDB2168];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_avAssetOptions_metadataKeysToAVAssetKeysMappings;
  _avAssetOptions_metadataKeysToAVAssetKeysMappings = v8;

  v10 = (void *)_avAssetOptions_traitsKeysToAVAssetKeysMappings;
  _avAssetOptions_traitsKeysToAVAssetKeysMappings = MEMORY[0x24BDBD1B8];

}

void __29__TVPMediaItemLoader_AVAsset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "AVAssetInternal");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (TVPMediaItemTimingData)timingData
{
  return self->_timingData;
}

- (NSString)state
{
  return self->_state;
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setTimingData:(id)a3
{
  objc_storeStrong((id *)&self->_timingData, a3);
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void)setRefCount:(unint64_t)a3
{
  self->_refCount = a3;
}

- (void)setCleanedUp:(BOOL)a3
{
  self->_cleanedUp = a3;
}

- (void)setAllowsConstrainedNetworkUsage:(BOOL)a3
{
  self->_allowsConstrainedNetworkUsage = a3;
}

- (void)setAllowsCellularUsage:(BOOL)a3
{
  self->_allowsCellularUsage = a3;
}

- (void)setAVAssetInternal:(id)a3
{
  objc_storeStrong((id *)&self->_AVAssetInternal, a3);
}

- (unint64_t)refCount
{
  return self->_refCount;
}

- (void)prepareForPlaybackInitiation
{
  id v2;

  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Prepare for playback initiation"));

}

- (id)newPlayerItem
{
  void *v3;
  void *v4;
  void *v5;
  TVPPlayerItem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Float64 v12;
  Float64 v13;
  void *v14;
  void *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v34;
  const __CFDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;

  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AVAsset keys loaded")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("Preparing for playback initiation")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("Ready for playback")))
  {
    v6 = 0;
    goto LABEL_42;
  }
  v40 = v4;
  -[TVPMediaItemLoader AVAsset](self, "AVAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVPPlayerItem initWithAsset:]([TVPPlayerItem alloc], "initWithAsset:", v5);
  -[TVPPlayerItem setMediaItemLoader:](v6, "setMediaItemLoader:", self);
  -[TVPMediaItemLoader mediaItem](self, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayerItem setContinuesPlayingDuringPrerollForSeek:](v6, "setContinuesPlayingDuringPrerollForSeek:", 0);
  if (objc_msgSend(v7, "hasTrait:", CFSTR("TVPMediaItemTraitMinimizeNetworkUsageWhilePaused")))
    -[TVPPlayerItem setPreferredForwardBufferDuration:](v6, "setPreferredForwardBufferDuration:", 50.0);
  if (!-[TVPMediaItemLoader containsStreamingAVAsset](self, "containsStreamingAVAsset"))
  {
    objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
      -[TVPPlayerItem setPlaybackLikelyToKeepUpTrigger:](v6, "setPlaybackLikelyToKeepUpTrigger:", 1);
  }
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataForwardPlaybackEndTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataReversePlaybackEndTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    memset(&v44, 0, sizeof(v44));
    objc_msgSend(v10, "doubleValue");
    CMTimeMakeWithSeconds(&v44, v12, 1000000);
    v43 = v44;
    -[TVPPlayerItem setForwardPlaybackEndTime:](v6, "setForwardPlaybackEndTime:", &v43);
  }
  if (v11)
  {
    memset(&v44, 0, sizeof(v44));
    objc_msgSend(v11, "doubleValue");
    CMTimeMakeWithSeconds(&v44, v13, 1000000);
    v43 = v44;
    -[TVPPlayerItem setReversePlaybackEndTime:](v6, "setReversePlaybackEndTime:", &v43);
  }
  v38 = v10;
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataAutomaticallyHandlesInterstitialEvents"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    -[TVPPlayerItem setAutomaticallyHandlesInterstitialEvents:](v6, "setAutomaticallyHandlesInterstitialEvents:", objc_msgSend(v14, "BOOLValue"));
  v36 = v15;
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTimeToPauseBuffering"));
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    CMTimeMakeFromDictionary(&v42, v16);
    -[TVPPlayerItem setTimeToPauseBuffering:](v6, "setTimeToPauseBuffering:", &v42);
  }
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTimeToPausePlayback"));
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    CMTimeMakeFromDictionary(&v41, v18);
    -[TVPPlayerItem setTimeToPausePlayback:](v6, "setTimeToPausePlayback:", &v41);
  }
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataDateRangeCollector"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[TVPPlayerItem addMediaDataCollector:](v6, "addMediaDataCollector:", v19);
    objc_msgSend(v7, "removeMediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataDateRangeCollector"));
  }
  v34 = (void *)v19;
  v35 = v18;
  v37 = v11;
  v39 = v5;
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataWebVTTStyles"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDB26B0], "textStyleRulesFromPropertyList:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayerItem setTextStyleRules:](v6, "setTextStyleRules:", v21);

  }
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataGaplessHeuristicInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataGaplessEncodingDelayInFrames"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataGaplessEncodingDrainInFrames"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataGaplessDurationInFrames"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataGaplessLastPacketsResync"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v22, "setObject:forKey:", v23, *MEMORY[0x24BDB1FD8]);
  if (v24)
    objc_msgSend(v22, "setObject:forKey:", v24, *MEMORY[0x24BDB1FC8]);
  if (v25)
    objc_msgSend(v22, "setObject:forKey:", v25, *MEMORY[0x24BDB1FD0]);
  if (v26)
    objc_msgSend(v22, "setObject:forKey:", v26, *MEMORY[0x24BDB1FC0]);
  if (v27)
    objc_msgSend(v22, "setObject:forKey:", v27, *MEMORY[0x24BDB1FE0]);
  if (objc_msgSend(v22, "count"))
    -[TVPPlayerItem setGaplessInfo:](v6, "setGaplessInfo:", v22);
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataMaxHLSVideoResolution"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = objc_msgSend(v28, "integerValue");
    if (!v30)
    {
      v31 = 576.0;
      v32 = 1024.0;
      goto LABEL_40;
    }
    if (v30 == 1)
    {
      v31 = 1080.0;
      v32 = 1920.0;
LABEL_40:
      -[TVPPlayerItem setPreferredMaximumResolution:](v6, "setPreferredMaximumResolution:", v32, v31);
    }
  }
  -[TVPPlayerItem setAllowedAudioSpatializationFormats:](v6, "setAllowedAudioSpatializationFormats:", 7);

  v4 = v40;
LABEL_42:

  return v6;
}

- (void)loadIfNecessary
{
  unint64_t v3;
  id v4;

  v3 = -[TVPMediaItemLoader refCount](self, "refCount");
  -[TVPMediaItemLoader setRefCount:](self, "setRefCount:", v3 + 1);
  if (!v3)
  {
    -[TVPMediaItemLoader stateMachine](self, "stateMachine");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:", CFSTR("Load"));

  }
}

- (TVPMediaItemLoader)initWithMediaItem:(id)a3
{
  id v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  TVPStateMachine *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)TVPMediaItemLoader;
  v6 = -[TVPMediaItemLoader init](&v30, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = objc_opt_class();
    v9 = initWithMediaItem__instanceNumber++;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %ld (%@)"), v8, v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);
    objc_storeStrong((id *)v6 + 2, a3);
    v11 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = CFSTR("Cleaned up");

    *(_WORD *)(v6 + 9) = 257;
    v12 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    v15 = (void *)*((_QWORD *)v6 + 15);
    *((_QWORD *)v6 + 15) = v14;

    v16 = dispatch_queue_create("AVAssetInternal access queue", 0);
    v17 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v16;

    v18 = dispatch_queue_create("assetLoadContext access queue", 0);
    v19 = (void *)*((_QWORD *)v6 + 12);
    *((_QWORD *)v6 + 12) = v18;

    v20 = [TVPStateMachine alloc];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __40__TVPMediaItemLoader_initWithMediaItem___block_invoke;
    v27[3] = &unk_24F15BC10;
    objc_copyWeak(&v28, &location);
    v21 = -[TVPStateMachine initWithName:initialState:mode:stateChangeHandler:](v20, "initWithName:initialState:mode:stateChangeHandler:", v10, CFSTR("Cleaned up"), 0, v27);
    v22 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v21;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:suspensionBehavior:", v6, sel__stopBackgroundCaching_, CFSTR("com.apple.TVPMediaItemLoader.TVPMediaItemLoaderStopBackgroundCaching"), 0, 4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v6, sel__mediaItemPlaybackErrorDidOccur_, CFSTR("TVPMediaItemPlaybackErrorDidOccurNotification"), v5);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v6, sel__mediaItemStopPlayback_, CFSTR("TVPMediaItemStopPlaybackNotification"), v5);

    objc_msgSend(*((id *)v6 + 9), "setCallsStateChangeHandlerSynchronously:", 1);
    objc_msgSend(*((id *)v6 + 9), "setLogObject:", sMediaItemLoaderLogObject);
    objc_msgSend(v6, "_registerStateMachineHandlers");
    objc_msgSend(*((id *)v6 + 9), "setShouldAcceptEvents:", 1);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return (TVPMediaItemLoader *)v6;
}

- (AVURLAsset)existingAVAsset
{
  return self->_existingAVAsset;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)containsStreamingAVAsset
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AVAsset keys loaded")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Preparing for playback initiation")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Ready for playback")))
  {
    -[TVPMediaItemLoader AVAsset](self, "AVAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isStreaming");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)assetLoadContext
{
  return self->_assetLoadContext;
}

- (OS_dispatch_queue)assetLoadContextAccessQueue
{
  return self->_assetLoadContextAccessQueue;
}

- (OS_dispatch_queue)assetInternalAccessQueue
{
  return self->_assetInternalAccessQueue;
}

- (BOOL)allowsConstrainedNetworkUsage
{
  return self->_allowsConstrainedNetworkUsage;
}

- (BOOL)allowsCellularUsage
{
  return self->_allowsCellularUsage;
}

- (id)_stringValueForKey:(id)a3 fromMetadata:(id)a4 andKeyIdentifierMap:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:filteredByIdentifier:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (objc_msgSend(v10, "statusOfValueForKey:error:", CFSTR("value"), 0) == 2)
    {
      objc_msgSend(v10, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)_skipTypeFromMetadataItemKey:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.hls.skip"));
}

- (id)_skipKeyNamesForType:(unint64_t)a3 withCount:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _skipKeyNameFromType:](self, "_skipKeyNameFromType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.start"), v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.duration"), v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.target"), v8, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.label"), v8, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.type"), v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.enabled"), v8, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.image"), v8, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.image-width"), v8, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v17);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.image-height"), v8, v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v18);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.title"), v8, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v19);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.genre"), v8, v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v20);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.rating-display-name"), v8, v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v21);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.rating-system"), v8, v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v22);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.canonical-id"), v8, v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v23);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.runtime"), v8, v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v24);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.up-next.is-added"), v8, v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v25);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.up-next.add-label"), v8, v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v26);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.up-next.added-label"), v8, v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v27);

        ++v9;
      }
      while (a4 != v9);
    }

  }
  else
  {
    v7 = 0;
  }
  v28 = (void *)objc_msgSend(v7, "copy");

  return v28;
}

- (id)_skipInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forType:(unint64_t)a5 withTotalCount:(unint64_t)a6
{
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  TVPMediaItemSkipInfo *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  TVPMediaItemSkipInfo *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  id v36;
  id v37;
  void *v38;

  v37 = a3;
  v36 = a4;
  if (a6)
  {
    -[TVPMediaItemLoader _skipKeyNameFromType:](self, "_skipKeyNameFromType:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v33 = a5;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = a6;
      for (i = 0; i != v19; ++i)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.start"), v10, i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _numberValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", v12, v37, v36);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.duration"), v10, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _numberValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", v14, v37, v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.target"), v10, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _numberValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", v16, v37, v36);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.label"), v10, i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v18, v37, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v35;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.type"), v10, i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v20, v37, v36);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && v15 && v17)
        {
          v22 = [TVPMediaItemSkipInfo alloc];
          objc_msgSend(v13, "doubleValue");
          v24 = v23;
          objc_msgSend(v15, "doubleValue");
          v26 = v25;
          objc_msgSend(v17, "doubleValue");
          v28 = -[TVPMediaItemSkipInfo initWithType:start:duration:target:localizedTitle:skipIntroReportingType:](v22, "initWithType:start:duration:target:localizedTitle:skipIntroReportingType:", v33, v38, v21, v24, v26, v27);
          -[TVPMediaItemLoader _promoInfoFromMetadata:keyIdentifierMap:forSkipKey:skipCounter:](self, "_promoInfoFromMetadata:keyIdentifierMap:forSkipKey:skipCounter:", v37, v36, v10, i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            -[TVPMediaItemSkipInfo setPromoInfo:](v28, "setPromoInfo:", v29);
          objc_msgSend(v34, "addObject:", v28);

          v19 = v35;
        }

      }
      v30 = v34;
    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }
  v31 = (void *)objc_msgSend(v30, "copy");

  return v31;
}

- (id)_rollKeyNamesForType:(unint64_t)a3 withCount:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _rollKeyNameFromType:](self, "_rollKeyNameFromType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.start"), v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.duration"), v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.skippable"), v8, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        if ((a3 | 2) == 3)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.adam-id"), v8, v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          if (a3 == 1)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.dynamic-slot.data-set-id"), v8, v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        ++v9;
      }
      while (a4 != v9);
    }

  }
  else
  {
    v7 = 0;
  }
  v15 = (void *)objc_msgSend(v7, "copy");

  return v15;
}

- (id)_rollInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forType:(unint64_t)a5 withTotalCount:(unint64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  TVPMediaItemRollInfo *v18;
  double v19;
  double v20;
  double v21;
  TVPMediaItemRollInfo *v22;
  void *v23;
  void *v24;
  TVPMediaItemLoader *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  id v42;

  v10 = a3;
  v42 = a4;
  if (a6)
  {
    -[TVPMediaItemLoader _rollKeyNameFromType:](self, "_rollKeyNameFromType:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v39 = a6;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v38 = a5;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.start"), v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _numberValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", v13, v10, v42);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.duration"), v11, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _numberValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", v15, v10, v42);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v17 = v16 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          v18 = [TVPMediaItemRollInfo alloc];
          objc_msgSend(v14, "doubleValue");
          v20 = v19;
          objc_msgSend(v16, "doubleValue");
          v22 = -[TVPMediaItemRollInfo initWithType:start:duration:](v18, "initWithType:start:duration:", a5, v20, v21);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.adam-id"), v11, v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVPMediaItemLoader _numberValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", v23, v10, v42);
          v24 = v11;
          v25 = self;
          v26 = objc_claimAutoreleasedReturnValue();

          v41 = (void *)v26;
          v27 = v26;
          self = v25;
          v11 = v24;
          -[TVPMediaItemRollInfo setAdamID:](v22, "setAdamID:", v27);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.skippable"), v24, v12);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v28, v10, v42);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v29, "length"))
            v30 = objc_msgSend(v29, "BOOLValue");
          else
            v30 = 1;
          -[TVPMediaItemRollInfo setSkippable:](v22, "setSkippable:", v30);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.dynamic-slot.data-set-id"), v11, v12);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v31, v10, v42);
          v32 = v10;
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[TVPMediaItemRollInfo setDynamicSlotDataSetId:](v22, "setDynamicSlotDataSetId:", v33);
          objc_msgSend(v40, "addObject:", v22);

          v10 = v32;
          a5 = v38;
          a6 = v39;
        }

        ++v12;
      }
      while (a6 != v12);
      v34 = v10;
      v35 = v40;
    }
    else
    {
      v34 = v10;
      v35 = 0;
    }

  }
  else
  {
    v34 = v10;
    v35 = 0;
  }
  v36 = (void *)objc_msgSend(v35, "copy");

  return v36;
}

- (void)_registerStateMachineHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location;
  _QWORD v50[2];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x24BDAC8D0];
  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke;
  v47[3] = &unk_24F15DEA8;
  objc_copyWeak(&v48, &location);
  v5 = (void *)MEMORY[0x22E2BA4B0](v47);
  v45[0] = v4;
  v45[1] = 3221225472;
  v45[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2;
  v45[3] = &unk_24F15DED0;
  objc_copyWeak(&v46, &location);
  v6 = (void *)MEMORY[0x22E2BA4B0](v45);
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_80;
  v41[3] = &unk_24F15DF70;
  objc_copyWeak(&v44, &location);
  v7 = v3;
  v42 = v7;
  v17 = v6;
  v43 = v17;
  v8 = (void *)MEMORY[0x22E2BA4B0](v41);
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_123;
  v38[3] = &unk_24F15C128;
  objc_copyWeak(&v40, &location);
  v9 = v7;
  v39 = v9;
  objc_msgSend(v9, "registerHandlerForEvent:onState:withBlock:", CFSTR("Load"), CFSTR("Cleaned up"), v38);
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_137;
  v34[3] = &unk_24F15CF98;
  objc_copyWeak(&v37, &location);
  v16 = v5;
  v36 = v16;
  v10 = v9;
  v35 = v10;
  objc_msgSend(v10, "registerHandlerForEvent:onState:withBlock:", CFSTR("Did finish preparing to load"), CFSTR("Preparing for loading"), v34);
  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5;
  v32[3] = &unk_24F15C1B8;
  v11 = v8;
  v33 = v11;
  objc_msgSend(v10, "registerHandlerForEvent:onState:withBlock:", CFSTR("Disk space purge did complete"), CFSTR("Purging disk space during initial loading if necessary"), v32);
  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_6;
  v30[3] = &unk_24F15C0D8;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v10, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVAsset keys did load successfully"), CFSTR("Loading AVAsset keys"), v30);
  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_8;
  v28[3] = &unk_24F15C0D8;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v10, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVAsset metadata did load successfully"), CFSTR("Loading AVAsset keys"), v28);
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_9;
  v25[3] = &unk_24F15C128;
  objc_copyWeak(&v27, &location);
  v12 = v10;
  v26 = v12;
  objc_msgSend(v12, "registerHandlerForEvent:onState:withBlock:", CFSTR("Prepare for playback initiation"), CFSTR("AVAsset keys loaded"), v25);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_142;
  v22[3] = &unk_24F15C128;
  objc_copyWeak(&v24, &location);
  v13 = v12;
  v23 = v13;
  objc_msgSend(v13, "registerHandlerForEvent:onState:withBlock:", CFSTR("Did finish preparing for playback initiation"), CFSTR("Preparing for playback initiation"), v22);
  v51[0] = CFSTR("Cleaned up");
  v51[1] = CFSTR("Failed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Failure"), v14, &__block_literal_global_145);

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_146;
  v20[3] = &unk_24F15C0D8;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v13, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Failure"), v20);
  v50[0] = CFSTR("Cleaned up");
  v50[1] = CFSTR("Failed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Clean up"), v15, &__block_literal_global_148);

  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_149;
  v18[3] = &unk_24F15C0D8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v13, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Clean up"), v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

}

- (id)_productPlacementInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TVPMediaItemProductPlacementInfo *v11;

  v6 = a4;
  v7 = a3;
  -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.product-placement-info.text"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPMediaItemLoader _numberValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.product-placement-info.duration"), v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.product-placement-info.image"), v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[TVPMediaItemProductPlacementInfo initWithLocalizedProductPlacementInfoString:duration:andImageURLStringFormat:]([TVPMediaItemProductPlacementInfo alloc], "initWithLocalizedProductPlacementInfoString:duration:andImageURLStringFormat:", v8, v9, v10);
  return v11;
}

- (void)_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  TVPContentKeySession *v10;
  TVPContentKeySession *contentKeySession;
  __int16 v12;
  __int16 v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (self->_contentKeySession)
  {
    v6 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v7 = "Content key session already exists";
      v8 = (uint8_t *)&v12;
LABEL_4:
      _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    if (!v4)
    {
      v6 = sMediaItemLoaderLogObject;
      if (!os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v13 = 0;
      v7 = "Not creating content key session because contentKeyLoader is nil";
      v8 = (uint8_t *)&v13;
      goto LABEL_4;
    }
    if (!self->_AVAssetInternal && os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
      -[TVPMediaItemLoader _onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:].cold.1();
    v9 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Creating content key session", buf, 2u);
    }
    v10 = -[TVPContentKeySession initWithContentKeyLoader:avAsset:]([TVPContentKeySession alloc], "initWithContentKeyLoader:avAsset:", v5, self->_AVAssetInternal);
    contentKeySession = self->_contentKeySession;
    self->_contentKeySession = v10;

  }
LABEL_14:

}

- (id)_numberValueForKey:(id)a3 fromMetadata:(id)a4 andKeyIdentifierMap:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:filteredByIdentifier:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (objc_msgSend(v10, "statusOfValueForKey:error:", CFSTR("value"), 0) == 2)
    {
      objc_msgSend(v10, "tvp_numberValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_needToLoadBlockingMetadataKeys
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  NSObject *v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  -[TVPMediaItemLoader assetInternalAccessQueue](self, "assetInternalAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TVPMediaItemLoader__needToLoadBlockingMetadataKeys__block_invoke;
  block[3] = &unk_24F15DE58;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(v3, block);

  v4 = (void *)v21[5];
  if (v4 && objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("metadata"), 0) == 2)
  {
    -[TVPMediaItemLoader _metadataKeysToLoad](self, "_metadataKeysToLoad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend((id)v21[5], "metadata", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "key");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v5, "containsObject:", v10);

          if ((v11 & 1) != 0)
          {
            LODWORD(v7) = 1;
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LODWORD(v7) = 0;
  }
  v12 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if ((_DWORD)v7)
      v13 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Need to load metadata keys = %@", buf, 0xCu);
  }
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (id)_metadataKeysToLoad
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.hls.advisory-info.count"), CFSTR("com.apple.hls.cs-rating"), CFSTR("com.apple.hls.description"), CFSTR("com.apple.hls.display-ratings-overlay"), CFSTR("com.apple.hls.episode-title"), CFSTR("com.apple.hls.feature.adam-id"), CFSTR("com.apple.hls.feature.duration"), CFSTR("com.apple.hls.genre"), CFSTR("com.apple.hls.keys"), CFSTR("com.apple.hls.mid-roll.count"), CFSTR("com.apple.hls.post-roll.count"), CFSTR("com.apple.hls.poster"), CFSTR("com.apple.hls.pre-roll.count"), CFSTR("com.apple.hls.pre-roll.duration"), CFSTR("com.apple.hls.product-placement-info.duration"), CFSTR("com.apple.hls.product-placement-info.image"), CFSTR("com.apple.hls.product-placement-info.text"),
               CFSTR("com.apple.hls.rating-image"),
               CFSTR("com.apple.hls.rating-system"),
               CFSTR("com.apple.hls.rating-tag"),
               CFSTR("com.apple.hls.rt-audience-score"),
               CFSTR("com.apple.hls.rt-rating"),
               CFSTR("com.apple.hls.skip.count"),
               CFSTR("com.apple.hls.title"),
               CFSTR("com.apple.hls.up-next.start"),
               CFSTR("com.apple.hls.watched.time"),
               CFSTR("com.apple.hls.photosensitivity-info.text"),
               CFSTR("com.apple.hls.photosensitivity-info.image"),
               CFSTR("com.apple.hls.photosensitivity-info.duration"),
               CFSTR("com.apple.hls.high-motion-info.text"),
               CFSTR("com.apple.hls.high-motion-info.image"),
               CFSTR("com.apple.hls.high-motion-info.duration"),
               CFSTR("com.apple.amp.video.recommended.viewing-distance.ratio"),
               0);
}

- (void)_loadMediaItemMetadataAsynchronously
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  NSObject *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  _QWORD *v22;
  uint64_t *v23;
  _QWORD *v24;
  id v25;
  uint8_t buf[8];
  _QWORD v27[6];
  _QWORD v28[4];
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD block[5];
  id v35;
  id location;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  objc_initWeak(&location, self);
  -[TVPMediaItemLoader assetInternalAccessQueue](self, "assetInternalAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke;
  block[3] = &unk_24F15E070;
  block[4] = &v37;
  objc_copyWeak(&v35, &location);
  dispatch_sync(v3, block);

  v5 = (void *)v38[5];
  if (v5 && objc_msgSend(v5, "statusOfValueForKey:error:", CFSTR("metadata"), 0) == 2)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__3;
    v32[4] = __Block_byref_object_dispose__3;
    v33 = (id)objc_opt_new();
    v29[0] = v4;
    v29[1] = 3221225472;
    v29[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2;
    v29[3] = &unk_24F15E098;
    v6 = dispatch_group_create();
    v30 = v6;
    v31 = v32;
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2BA4B0](v29);
    objc_msgSend((id)v38[5], "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      v28[3] = 0;
      -[TVPMediaItemLoader assetLoadContextAccessQueue](self, "assetLoadContextAccessQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v27[0] = v4;
      v27[1] = 3221225472;
      v27[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_352;
      v27[3] = &unk_24F15DE58;
      v27[4] = self;
      v27[5] = v28;
      dispatch_sync(v9, v27);

      -[TVPMediaItemLoader _metadataKeysToLoad](self, "_metadataKeysToLoad");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sMediaItemLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Loading the counts for AVAsset metadata items.", buf, 2u);
      }
      ((void (**)(_QWORD, void *, void *))v7)[2](v7, v8, v10);
      v17[0] = v4;
      v17[1] = 3221225472;
      v17[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_353;
      v17[3] = &unk_24F15E138;
      objc_copyWeak(&v25, &location);
      v22 = v32;
      v23 = &v37;
      v18 = v8;
      v19 = v10;
      v21 = v7;
      v20 = v6;
      v24 = v28;
      v12 = v10;
      dispatch_group_notify(v20, MEMORY[0x24BDAC9B8], v17);

      objc_destroyWeak(&v25);
      _Block_object_dispose(v28, 8);
    }
    else
    {
      v15 = objc_loadWeakRetained(&location);
      objc_msgSend(v15, "stateMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postEvent:", CFSTR("AVAsset metadata did load successfully"));

    }
    _Block_object_dispose(v32, 8);

  }
  else
  {
    v13 = objc_loadWeakRetained(&location);
    objc_msgSend(v13, "stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postEvent:", CFSTR("AVAsset metadata did load successfully"));

  }
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v37, 8);

}

- (id)_contentKeyRequestParamsFromBase64String:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  TVPContentKeyRequestParams *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id obj;
  TVPContentKeyRequestParams *v39;
  void *v40;
  void *v41;
  id v42;
  uint8_t v43;
  _BYTE v44[15];
  uint8_t v45;
  _BYTE v46[15];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 1);
    if (objc_msgSend(v4, "length"))
    {
      v55 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v55);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v55;
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = v6;
          v32 = v5;
          v33 = v4;
          v34 = v3;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          obj = v5;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
          if (!v7)
            goto LABEL_36;
          v8 = v7;
          v9 = *(_QWORD *)v52;
          v35 = *(_QWORD *)v52;
          while (1)
          {
            v10 = 0;
            v37 = v8;
            do
            {
              if (*(_QWORD *)v52 != v9)
                objc_enumerationMutation(obj);
              v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v27 = sMediaItemLoaderLogObject;
                if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
                  -[TVPMediaItemLoader _contentKeyRequestParamsFromBase64String:].cold.3(&v43, v44, v27);
                goto LABEL_34;
              }
              v12 = v11;
              objc_msgSend(v12, "tvp_stringForKey:", CFSTR("uri"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "tvp_arrayForKey:", CFSTR("keyformatversion"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v13, "length"))
                goto LABEL_31;
              v42 = v12;
              v15 = objc_alloc_init(TVPContentKeyRequestParams);
              v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v39 = v15;
              v41 = v13;
              -[TVPContentKeyRequestParams setKeyIdentifier:](v15, "setKeyIdentifier:", v13);
              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              v40 = v14;
              v17 = v14;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
              if (!v18)
                goto LABEL_28;
              v19 = v18;
              v20 = *(_QWORD *)v48;
              do
              {
                v21 = 0;
                do
                {
                  if (*(_QWORD *)v48 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v21);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v23 = v22;
LABEL_22:
                    v25 = v23;
                    if (v23)
                    {
                      objc_msgSend(v16, "addObject:", v23);

                    }
                    goto LABEL_26;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v24 = objc_msgSend(v22, "integerValue");
                    if (v24 < 1)
                      goto LABEL_26;
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v24);
                    v23 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_22;
                  }
                  v26 = sMediaItemLoaderLogObject;
                  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
                    -[TVPMediaItemLoader _contentKeyRequestParamsFromBase64String:].cold.2(&v45, v46, v26);
LABEL_26:
                  ++v21;
                }
                while (v19 != v21);
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
              }
              while (v19);
LABEL_28:

              if (objc_msgSend(v16, "count"))
                -[TVPContentKeyRequestParams setKeyFormatVersions:](v39, "setKeyFormatVersions:", v16);
              objc_msgSend(v36, "addObject:", v39, v31, v32, v33, v34);

              v8 = v37;
              v9 = v35;
              v13 = v41;
              v12 = v42;
              v14 = v40;
LABEL_31:

LABEL_34:
              ++v10;
            }
            while (v10 != v8);
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
            if (!v8)
            {
LABEL_36:

              v4 = v33;
              v3 = v34;
              v6 = v31;
              v5 = v32;
              goto LABEL_41;
            }
          }
        }
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
          -[TVPMediaItemLoader _contentKeyRequestParamsFromBase64String:].cold.4();
      }
      else if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
      {
        -[TVPMediaItemLoader _contentKeyRequestParamsFromBase64String:].cold.1();
      }
LABEL_41:

    }
  }
  if (objc_msgSend(v36, "count", v31, v32, v33, v34))
    v28 = v36;
  else
    v28 = 0;
  v29 = v28;

  return v29;
}

- (id)_contentKeyLoader
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[TVPMediaItemLoader mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_255A073F0) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[TVPMediaItemLoader mediaItem](self, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasTrait:", CFSTR("TVPMediaItemTraitAirPlayedContent"));

  if ((v5 & 1) != 0)
  {
LABEL_5:
    v6 = 0;
    return v6;
  }
  -[TVPMediaItemLoader mediaItem](self, "mediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_avAssetOptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  const __CFString *v31;
  int v32;
  NSObject *v33;
  const __CFString *v34;
  NSObject *v35;
  const __CFString *v36;
  void *v37;
  _BOOL8 v38;
  NSObject *v39;
  const __CFString *v40;
  NSObject *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  __CFString *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint8_t buf[4];
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if (_avAssetOptions_onceToken != -1)
    dispatch_once(&_avAssetOptions_onceToken, &__block_literal_global_201);
  -[TVPMediaItemLoader mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_avAssetOptions_metadataKeysToAVAssetKeysMappings;
  v6 = MEMORY[0x24BDAC760];
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __37__TVPMediaItemLoader__avAssetOptions__block_invoke_2;
  v54[3] = &unk_24F15E048;
  v7 = v3;
  v55 = v7;
  v8 = v4;
  v56 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v54);
  v9 = (void *)_avAssetOptions_traitsKeysToAVAssetKeysMappings;
  v51[0] = v6;
  v51[1] = 3221225472;
  v51[2] = __37__TVPMediaItemLoader__avAssetOptions__block_invoke_3;
  v51[3] = &unk_24F15E048;
  v10 = v7;
  v52 = v10;
  v11 = v8;
  v53 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v51);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataAVURLAssetAlternativeConfigurationOptions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataServiceIdentifier"));
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStoreFrontIdentifier"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataRTCChildHierarchyToken"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = sMediaItemLoaderLogObject;
  v17 = os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT);
  v46 = (void *)v14;
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Using existing RTC hierarchy token in media item loader", buf, 2u);
    }
    v18 = v47;
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Creating RTC hierarchy tokens in media item loader", buf, 2u);
    }
    v19 = (void *)objc_msgSend(MEMORY[0x24BE7CA78], "newHierarchyTokenFromParentToken:", 0);
    if (v19)
    {
      v20 = (void *)objc_msgSend(MEMORY[0x24BE7CA78], "newHierarchyTokenFromParentToken:", v19);
      -[TVPMediaItemLoader mediaItem](self, "mediaItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v6;
      v48[1] = 3221225472;
      v48[2] = __37__TVPMediaItemLoader__avAssetOptions__block_invoke_204;
      v48[3] = &unk_24F15D1B8;
      v48[4] = self;
      v49 = v19;
      v15 = v20;
      v50 = v15;
      objc_msgSend(v21, "performMediaItemMetadataTransactionWithBlock:", v48);

      v14 = (uint64_t)v46;
    }
    else
    {
      v15 = 0;
    }
    v18 = v47;

  }
  v22 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v58 = v15;
    _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "RTC hierarchy token for AVAsset: %@", buf, 0xCu);
  }
  if (v13)
    objc_msgSend(v12, "addEntriesFromDictionary:", v13);
  if (v14)
    objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x24BDB2138]);
  if (v18)
    objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("StorefrontID"));
  if (v15)
    objc_msgSend(v12, "setObject:forKey:", v15, *MEMORY[0x24BDB2120]);
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x24BDB2130]);
  if (objc_msgSend(v10, "hasTrait:", CFSTR("TVPMediaItemTraitOptimizeForHighLatency")))
  {
    v23 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB21A0]);
    objc_msgSend(v11, "setObject:forKey:", v23, *MEMORY[0x24BDB21D8]);
  }
  if (objc_msgSend(v10, "hasTrait:", CFSTR("TVPMediaItemTraitIncludeStoreCookiesInContentRequests")))
  {
    objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataDSID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ams_iTunesAccountWithDSID:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "ams_cookies");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v11, "setObject:forKey:", v27, *MEMORY[0x24BDB2180]);

    }
  }
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataiTunesStoreContentInfo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v11, "setObject:forKey:", v28, *MEMORY[0x24BDB2228]);
  v29 = -[TVPMediaItemLoader allowsCellularUsage](self, "allowsCellularUsage");
  v30 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v31 = &stru_24F15E1B8;
    if (!(_DWORD)v29)
      v31 = CFSTR("not ");
    *(_DWORD *)buf = 138412290;
    v58 = v31;
    _os_log_impl(&dword_228A4E000, v30, OS_LOG_TYPE_DEFAULT, "Cellular usage is %@allowed for this media item loader", buf, 0xCu);
  }
  if ((_DWORD)v29)
  {
    v32 = objc_msgSend(v10, "hasTrait:", CFSTR("TVPMediaItemTraitCellularPlaybackProhibited"));
    v33 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v34 = &stru_24F15E1B8;
      if (!v32)
        v34 = CFSTR("not ");
      *(_DWORD *)buf = 138412290;
      v58 = v34;
      _os_log_impl(&dword_228A4E000, v33, OS_LOG_TYPE_DEFAULT, "Cellular usage is %@prohibited for this media item", buf, 0xCu);
    }
    v29 = v32 ^ 1u;
  }
  v35 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v29)
      v36 = CFSTR("Allowing");
    else
      v36 = CFSTR("Not allowing");
    *(_DWORD *)buf = 138412290;
    v58 = v36;
    _os_log_impl(&dword_228A4E000, v35, OS_LOG_TYPE_DEFAULT, "%@ cellular playback of this media item", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v29);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v37, *MEMORY[0x24BDB2108]);

  v38 = -[TVPMediaItemLoader allowsConstrainedNetworkUsage](self, "allowsConstrainedNetworkUsage");
  v39 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v40 = CFSTR("not ");
    if (v38)
      v40 = &stru_24F15E1B8;
    *(_DWORD *)buf = 138412290;
    v58 = v40;
    _os_log_impl(&dword_228A4E000, v39, OS_LOG_TYPE_DEFAULT, "Cellular usage is %@allowed for this media item loader", buf, 0xCu);
  }
  v41 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v42 = CFSTR("Not allowing");
    if (v38)
      v42 = CFSTR("Allowing");
    *(_DWORD *)buf = 138412290;
    v58 = v42;
    _os_log_impl(&dword_228A4E000, v41, OS_LOG_TYPE_DEFAULT, "%@ constrained network playback of this media item", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v43, *MEMORY[0x24BDB2110]);

  v44 = v11;
  return v44;
}

- (id)_advisoryKeyNamesWithCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.advisory-info.%lu.key"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.advisory-info.%lu.value"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      ++v5;
    }
    while (a3 != v5);
  }
  else
  {
    v4 = 0;
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (id)_advisoryInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 withTotalCount:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TVPMediaItemAdvisoryInfo *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.advisory-info.%lu.value"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v12, v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.advisory-info.%lu.key"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v14, v8, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length"))
      {
        v16 = -[TVPMediaItemAdvisoryInfo initWithRatingDescription:]([TVPMediaItemAdvisoryInfo alloc], "initWithRatingDescription:", v13);
        if (objc_msgSend(v15, "length"))
          -[TVPMediaItemAdvisoryInfo setRatingName:](v16, "setRatingName:", v15);
        objc_msgSend(v10, "addObject:", v16);

      }
      ++v11;
    }
    while (a5 != v11);
  }
  else
  {
    v10 = 0;
  }
  v17 = (void *)objc_msgSend(v10, "copy");

  return v17;
}

- (AVURLAsset)AVAssetInternal
{
  return self->_AVAssetInternal;
}

+ (id)loaderForMediaItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (loaderForMediaItem__onceToken != -1)
  {
    dispatch_once(&loaderForMediaItem__onceToken, &__block_literal_global_46);
    if (v4)
      goto LABEL_3;
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  if (!v3)
    goto LABEL_15;
LABEL_3:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)sLoaderHashTable, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      objc_msgSend(v10, "mediaItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToMediaItem:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_16;
  }
  else
  {
LABEL_11:

  }
  v13 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMediaItem:", v4);
  objc_msgSend((id)sLoaderHashTable, "addObject:", v13);
LABEL_16:

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[TVPMediaItemLoader _cleanUp](self, "_cleanUp");
  -[TVPStateMachine deregisterHandlers](self->_stateMachine, "deregisterHandlers");
  v5.receiver = self;
  v5.super_class = (Class)TVPMediaItemLoader;
  -[TVPMediaItemLoader dealloc](&v5, sel_dealloc);
}

- (void)cleanupIfNecessary
{
  id v3;

  if (-[TVPMediaItemLoader refCount](self, "refCount"))
  {
    -[TVPMediaItemLoader setRefCount:](self, "setRefCount:", -[TVPMediaItemLoader refCount](self, "refCount") - 1);
    if (!-[TVPMediaItemLoader refCount](self, "refCount"))
    {
      -[TVPMediaItemLoader stateMachine](self, "stateMachine");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postEvent:", CFSTR("Clean up"));

    }
  }
}

- (NSString)description
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[TVPMediaItemLoader assetInternalAccessQueue](self, "assetInternalAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TVPMediaItemLoader_description__block_invoke;
  block[3] = &unk_24F15DE58;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[TVPMediaItemLoader mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12[5];
  -[TVPMediaItemLoader state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("TVPMediaItem: %@ AVAsset: %@ State: %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return (NSString *)v8;
}

void __33__TVPMediaItemLoader_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "AVAssetInternal");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (TVPContentKeySession)contentKeySession
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[TVPMediaItemLoader _contentKeyLoader](self, "_contentKeyLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPMediaItemLoader assetInternalAccessQueue](self, "assetInternalAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__TVPMediaItemLoader_contentKeySession__block_invoke;
  block[3] = &unk_24F15DE80;
  block[4] = self;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, block);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (TVPContentKeySession *)v6;
}

void __39__TVPMediaItemLoader_contentKeySession__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)loadSHA1DigestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  __CFString *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AVAsset keys loaded")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Preparing for playback initiation")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("Ready for playback")))
  {
    -[TVPMediaItemLoader AVAssetInternal](self, "AVAssetInternal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("SHA1Digest");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke;
    v12[3] = &unk_24F15D7D0;
    v13 = v7;
    v14 = CFSTR("SHA1Digest");
    v15 = v4;
    v9 = v7;
    objc_msgSend(v9, "loadValuesAsynchronouslyForKeys:completionHandler:", v8, v12);

  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_3;
    v10[3] = &unk_24F15C038;
    v11 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
    v9 = v11;
  }

LABEL_6:
}

void __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_2;
  block[3] = &unk_24F15D7D0;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = objc_msgSend(v2, "statusOfValueForKey:error:", v3, &v8);
  v5 = v8;
  v6 = *(_QWORD *)(a1 + 48);
  if (v4 == 2)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "SHA1Digest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

    }
  }
  else if (v6)
  {
    (*(void (**)(_QWORD, _QWORD, id))(v6 + 16))(*(_QWORD *)(a1 + 48), 0, v5);
  }

}

uint64_t __51__TVPMediaItemLoader_loadSHA1DigestWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_76(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("success");
  v5[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Disk space purge did complete"), 0, v3);

}

id __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend((id)objc_opt_class(), "removeTemporaryDownloadDirectory");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend((id)objc_opt_class(), "tempDirURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v5, "attributesOfFileSystemForPath:error:", v7, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;

  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDD0D18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(v1);
    objc_msgSend(v11, "mediaItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataFileSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v10;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Free space is %@, file size is %@", buf, 0x16u);
    }
    if (v10 && v13)
    {
      v15 = objc_msgSend(v10, "unsignedLongLongValue");
      if (v15 > objc_msgSend(v13, "unsignedLongLongValue") + 524288000)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v9;
        v17 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 0, 0, &v25);
        v18 = v25;

        if (v17)
        {
          v19 = objc_loadWeakRetained(v1);
          objc_msgSend(v19, "mediaItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "mediaItemURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "length"))
          {
            objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v22, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
              __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_2();
            v23 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
            __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_3();
          v23 = 0;
        }
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
        __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_4();
    }
    else if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
    {
      __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_5();
    }
    v23 = 0;
    v18 = v9;
LABEL_18:

    v9 = v18;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
    __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_1();
  v23 = 0;
LABEL_19:

  return v23;
}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_80(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 *v41;
  id v42;
  _QWORD block[4];
  id v44;
  __int128 *p_buf;
  uint8_t v46[16];
  _QWORD v47[4];
  id v48;
  id v49;
  __int128 buf;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "mediaItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "mediaItemURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (objc_msgSend(v7, "absoluteString"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "length"),
          v9,
          v10))
    {
      v11 = objc_loadWeakRetained(v4);
      objc_msgSend(v11, "mediaItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addStartEventWithName:", TVPPlaybackReportingEventLoadAVAssetKeysTotal);

      v14 = objc_loadWeakRetained(v4);
      objc_msgSend(v14, "mediaItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addStartEventWithName:", TVPPlaybackReportingEventLoadAVAssetKeysPrimary);

      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v18 = v17;
      objc_msgSend(WeakRetained, "timingData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setStartTimeForLoadingAVAssetKeys:", v18);
      objc_msgSend(WeakRetained, "_avAssetOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "mediaItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = objc_msgSend(v20, "hasTrait:", CFSTR("TVPMediaItemTraitUseTempDownload"));

      if ((_DWORD)v16)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = sMediaItemLoaderLogObject;
        if (v21)
        {
          if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v21;
            _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "Setting AVAsset destination URL to %@", (uint8_t *)&buf, 0xCu);
          }
          objc_msgSend(v19, "setObject:forKey:", v21, *MEMORY[0x24BDB2168]);
        }
        else if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
        {
          __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_80_cold_2();
        }

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v51 = 0x2020000000;
      v52 = 0;
      if (a2)
      {
        v24 = sMediaItemLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v46 = 0;
          _os_log_impl(&dword_228A4E000, v24, OS_LOG_TYPE_DEFAULT, "Disabling AVAssetCache", v46, 2u);
        }
        objc_msgSend(v19, "removeObjectForKey:", *MEMORY[0x24BDB2148]);
      }
      else
      {
        objc_msgSend(v34, "hasTrait:", CFSTR("TVPMediaItemTraitRequiresAppToRunIfBackgroundedDuringPlayback"));
      }
      objc_msgSend(WeakRetained, "_contentKeyLoader");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "assetLoadContextAccessQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_86;
      block[3] = &unk_24F15DE58;
      p_buf = &buf;
      v28 = WeakRetained;
      v44 = v28;
      dispatch_sync(v26, block);

      objc_msgSend(v28, "assetInternalAccessQueue");
      v29 = objc_claimAutoreleasedReturnValue();
      v35[0] = v27;
      v35[1] = 3221225472;
      v35[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_87;
      v35[3] = &unk_24F15DF48;
      v41 = &buf;
      v36 = v28;
      v37 = v19;
      v38 = v8;
      v39 = *(id *)(a1 + 32);
      v40 = v25;
      v30 = v25;
      v31 = v19;
      objc_copyWeak(&v42, v4);
      dispatch_async(v29, v35);

      objc_destroyWeak(&v42);
      _Block_object_dispose(&buf, 8);

      v6 = CFSTR("Loading AVAsset keys");
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
        __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_80_cold_1();
      v23 = *(void **)(a1 + 32);
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_81;
      v47[3] = &unk_24F15BA88;
      objc_copyWeak(&v49, v4);
      v48 = *(id *)(a1 + 32);
      objc_msgSend(v23, "executeBlockAfterCurrentStateTransition:", v47);

      objc_destroyWeak(&v49);
    }

  }
  return v6;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_81(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 802, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventError, v2);

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventErrorEvent, TVPPlaybackReportingEventLoadAVAssetKeysTotal);

  v9 = *(void **)(a1 + 32);
  v11 = CFSTR("error");
  v12[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v10);

}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_86(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "assetLoadContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_87(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD block[4];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[11];
  uint8_t buf[4];
  uint64_t v60;
  _BYTE v61[128];
  _QWORD v62[5];

  v62[2] = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  objc_msgSend(*(id *)(a1 + 32), "assetLoadContextAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3;
  block[3] = &unk_24F15DE58;
  v53 = &v54;
  v52 = *(id *)(a1 + 32);
  dispatch_sync(v2, block);

  if (v55[3] != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    goto LABEL_46;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v4 = *MEMORY[0x24BDB2180];
  v62[0] = *MEMORY[0x24BDB21D0];
  v62[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
          objc_msgSend(v3, "setObject:forKey:", CFSTR("OMITTED"), v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v6);
  }

  v12 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = (uint64_t)v3;
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "AVAsset options: %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x24BDB2228]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDB2218]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = sMediaItemLoaderLogObject;
  v16 = os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v60 = (uint64_t)v14;
      v17 = "AVURLAssetiTunesStoreContentHLSAssetURLStringKey is present: %@";
      v18 = v15;
      v19 = 12;
LABEL_18:
      _os_log_impl(&dword_228A4E000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    v17 = "AVURLAssetiTunesStoreContentHLSAssetURLStringKey is absent";
    v18 = v15;
    v19 = 2;
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 32), "existingAVAsset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "Using existing AVURLAsset instead of creating new one", buf, 2u);
    }
    v22 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x24BDB2170]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (id)sMediaItemLoaderLogObject;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_msgSend(v23, "unsignedLongValue");
        *(_DWORD *)buf = 134217984;
        v60 = v25;
        _os_log_impl(&dword_228A4E000, v24, OS_LOG_TYPE_DEFAULT, "Asset will be created using download token %lu", buf, 0xCu);
      }

    }
    v26 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v60 = v27;
      _os_log_impl(&dword_228A4E000, v26, OS_LOG_TYPE_DEFAULT, "Creating AVURLAsset for %@", buf, 0xCu);
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v28 = objc_msgSend(v20, "statusOfValueForKey:error:", CFSTR("URL"), 0);
    v29 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v28;
      _os_log_impl(&dword_228A4E000, v29, OS_LOG_TYPE_DEFAULT, "Status of AVAsset key [URL] is %ld", buf, 0xCu);
    }
    v22 = 0;
    if (v23 && v28 == 3)
    {
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
        __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_87_cold_2();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 833, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (!v20 || v22)
  {
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
      __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_87_cold_1();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_93;
    v43[3] = &unk_24F15D1B8;
    v44 = v22;
    v45 = *(id *)(a1 + 32);
    v46 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x24BDAC9B8], v43);

    v36 = v44;
  }
  else
  {
    v58[0] = CFSTR("tracks");
    v58[1] = CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions");
    v58[2] = CFSTR("availableChapterLocales");
    v58[3] = CFSTR("duration");
    v58[4] = CFSTR("availableMetadataFormats");
    v58[5] = CFSTR("preferredSoundCheckVolumeNormalization");
    v58[6] = CFSTR("streaming");
    v58[7] = CFSTR("playable");
    v58[8] = CFSTR("availableVideoDynamicRanges");
    v58[9] = CFSTR("maximumVideoResolution");
    v58[10] = CFSTR("metadata");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__avAudioSessionMediaServicesWereReset_, *MEMORY[0x24BDB1610], 0);

    if (!*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(v20, "resourceLoader");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 32);
      v34 = MEMORY[0x24BDAC9B8];
      v35 = MEMORY[0x24BDAC9B8];
      objc_msgSend(v32, "setDelegate:queue:", v33, v34);

    }
    objc_msgSend(*(id *)(a1 + 32), "setAVAssetInternal:", v20);
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_118;
    v37[3] = &unk_24F15DF20;
    v36 = v30;
    v38 = v36;
    v39 = v20;
    objc_copyWeak(&v42, (id *)(a1 + 80));
    v41 = *(_QWORD *)(a1 + 72);
    v40 = *(id *)(a1 + 56);
    objc_msgSend(v39, "loadValuesAsynchronouslyForKeys:completionHandler:", v36, v37);

    objc_destroyWeak(&v42);
  }

LABEL_46:
  _Block_object_dispose(&v54, 8);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_93(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 821, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventError, v4);

  objc_msgSend(*(id *)(a1 + 40), "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventErrorEvent, TVPPlaybackReportingEventLoadAVAssetKeysTotal);

  v9 = *(void **)(a1 + 48);
  v11 = CFSTR("error");
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v10);

}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_118(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  id obj;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24[2];
  char v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  v4 = 0;
  v5 = 0;
  if (v2)
  {
    v6 = *(_QWORD *)v28;
    *(_QWORD *)&v3 = 138412290;
    v17 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7);
        v9 = *(void **)(a1 + 40);
        v26 = v4;
        v10 = objc_msgSend(v9, "statusOfValueForKey:error:", v8, &v26, v17);
        v11 = v26;

        v12 = sMediaItemLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v8;
          v33 = 2048;
          v34 = v10;
          _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Status of AVAsset key [%@] is %ld", buf, 0x16u);
        }
        v4 = v11;
        if (v10 == 3)
        {
          if (!objc_msgSend(MEMORY[0x24BDB2378], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", v8, v11, sMediaItemLoaderLogObject))
          {
            LOBYTE(v2) = 1;
            goto LABEL_19;
          }
          ++v5;
          v13 = sMediaItemLoaderLogObject;
          if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v32 = v8;
            _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring failure of non-essential key [%@]", buf, 0xCu);
          }
        }
        else if (v10 == 2)
        {
          ++v5;
        }
        ++v7;
      }
      while (v2 != v7);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      v2 = v14;
    }
    while (v14);
  }
LABEL_19:

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_120;
  block[3] = &unk_24F15DEF8;
  objc_copyWeak(v24, (id *)(a1 + 64));
  v25 = v2;
  v15 = *(void **)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 56);
  v20 = v4;
  v21 = v15;
  v24[1] = v5;
  v22 = *(id *)(a1 + 32);
  v16 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v24);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_120(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  _QWORD block[4];
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x2020000000;
    v23 = 0;
    objc_msgSend(WeakRetained, "assetLoadContextAccessQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_121;
    block[3] = &unk_24F15DE58;
    v19 = buf;
    v5 = v3;
    v18 = v5;
    dispatch_sync(v4, block);

    if (*((_QWORD *)v21 + 3) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (*(_BYTE *)(a1 + 80))
      {
        v6 = *(_QWORD *)(a1 + 32);
        if (v6)
        {
          v24 = CFSTR("error");
          v25[0] = v6;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        objc_msgSend(v5, "mediaItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventError, *(_QWORD *)(a1 + 32));

        objc_msgSend(v5, "mediaItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventErrorEvent, TVPPlaybackReportingEventLoadAVAssetKeysTotal);

        objc_msgSend(*(id *)(a1 + 40), "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v7);
        goto LABEL_15;
      }
      v11 = *(_QWORD *)(a1 + 72);
      if (v11 == objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "postEvent:", CFSTR("AVAsset keys did load successfully"));
        goto LABEL_15;
      }
      v9 = sMediaItemLoaderLogObject;
      if (!os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_WORD *)v16 = 0;
      v10 = "Not posting any event because AVAsset key loading is still in progress or cancelled";
    }
    else
    {
      v9 = sMediaItemLoaderLogObject;
      if (!os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        _Block_object_dispose(buf, 8);
        goto LABEL_16;
      }
      *(_WORD *)v16 = 0;
      v10 = "AVAsset key load completion is from previous attempt, ignoring";
    }
    _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, v10, v16, 2u);
    goto LABEL_15;
  }
  v8 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Media item loader has been deallocated; ignoring AVAsset key load completion",
      buf,
      2u);
  }
LABEL_16:

}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_121(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "assetLoadContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

const __CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_123(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  TVPMediaItemTimingData *v12;
  id v13;
  NSObject *v14;
  id *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addStartEventWithName:", TVPPlaybackReportingEventMediaItemLoaderLoad);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addStartEventWithName:", TVPPlaybackReportingEventPrepareForLoading);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "setCleanedUp:", 0);

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "mediaItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(TVPMediaItemTimingData);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  -[TVPMediaItemTimingData setStartTimeForPreparingForLoading:](v12, "setStartTimeForPreparingForLoading:");
  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "setTimingData:", v12);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Calling prepareForLoadingWithCompletion for mediaItem %@", buf, 0xCu);
    }
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_127;
    v21[3] = &unk_24F15DFC0;
    v15 = &v22;
    v16 = v11;
    v22 = v16;
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v16, "prepareForLoadingWithCompletion:", v21);

  }
  else
  {
    v17 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_135;
    v19[3] = &unk_24F15BEF8;
    v15 = &v20;
    v20 = v17;
    objc_msgSend(v20, "executeBlockAfterCurrentStateTransition:", v19);
  }

  return CFSTR("Preparing for loading");
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_127(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (a2)
      v8 = CFSTR("YES");
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "prepareForLoadingWithCompletion callback received for mediaItem %@.  Success is %@, error is %@", buf, 0x20u);
  }
  v9 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_132;
  v11[3] = &unk_24F15DF98;
  v14 = a2;
  v12 = v5;
  v13 = v9;
  v10 = v5;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v11);

}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_132(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("success"));

  objc_msgSend(v3, "tvp_setObjectIfNotNil:forKey:", *(_QWORD *)(a1 + 32), CFSTR("error"));
  objc_msgSend(*(id *)(a1 + 40), "postEvent:withContext:userInfo:", CFSTR("Did finish preparing to load"), 0, v3);

}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_135(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v3 = CFSTR("success");
  v4[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:withContext:userInfo:", CFSTR("Did finish preparing to load"), 0, v2);

}

id __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_137(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a5;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "mediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEndEventWithName:", TVPPlaybackReportingEventPrepareForLoading);

  v12 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v12, "timingData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "setEndTimeForPreparingForLoading:");

  objc_msgSend(v7, "objectForKey:", CFSTR("success"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(v8, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  else
  {
    v17 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_4;
    v19[3] = &unk_24F15BCB0;
    v20 = v7;
    v21 = *(id *)(a1 + 32);
    objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v19);

  }
  return v15;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("error"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(void **)(a1 + 40);
  if (v2)
  {
    v6 = CFSTR("error");
    v7[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v5);

  }
  else
  {
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, 0);
  }

}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_140(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v11 = 138412802;
    if ((_DWORD)a2)
      v8 = CFSTR("YES");
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "prepareForPlaybackInitiationWithCompletion callback received for mediaItem %@.  Success is %@, error is %@", (uint8_t *)&v11, 0x20u);
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("success"));

  objc_msgSend(v9, "tvp_setObjectIfNotNil:forKey:", v5, CFSTR("error"));
  objc_msgSend(*(id *)(a1 + 40), "postEvent:withContext:userInfo:", CFSTR("Did finish preparing for playback initiation"), 0, v9);

}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_141(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v3 = CFSTR("success");
  v4[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:withContext:userInfo:", CFSTR("Did finish preparing for playback initiation"), 0, v2);

}

__CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_142(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a5;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEndEventWithName:", TVPPlaybackReportingEventPrepareForPlaybackInitiation);

  objc_msgSend(v7, "objectForKey:", CFSTR("success"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "BOOLValue");
  objc_msgSend(v8, "currentState");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "timingData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "setEndTimeForPreparingForPlaybackInitiation:");

  if ((_DWORD)v11)
  {

    v13 = CFSTR("Ready for playback");
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_143;
    v18[3] = &unk_24F15BCB0;
    v19 = v7;
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v16, "executeBlockAfterCurrentStateTransition:", v18);

  }
  return v13;
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_3_143(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("error"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = *(void **)(a1 + 40);
  if (v2)
  {
    v6 = CFSTR("error");
    v7[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v5);

  }
  else
  {
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, 0);
  }

}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_4_144(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

const __CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_146(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(a5, "objectForKey:", CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "setError:", v6);

  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_ERROR))
    __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_146_cold_1();
  v9 = (void *)sLoaderHashTable;
  v10 = objc_loadWeakRetained(v7);
  objc_msgSend(v9, "removeObject:", v10);

  v11 = objc_loadWeakRetained(v7);
  objc_msgSend(v11, "_cleanUp");

  return CFSTR("Failed");
}

uint64_t __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_147(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

const __CFString *__51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_149(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_cleanUp");

  return CFSTR("Cleaned up");
}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "hasTrait:", a2))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", MEMORY[0x24BDBD1C8], v5);

}

void __37__TVPMediaItemLoader__avAssetOptions__block_invoke_204(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 40), CFSTR("TVPMediaItemMetadataRTCParentHierarchyToken"));

  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMediaItemMetadata:forProperty:", *(_QWORD *)(a1 + 48), CFSTR("TVPMediaItemMetadataRTCChildHierarchyToken"));

}

- (void)_avAudioSessionMediaServicesWereReset:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Received AVAudioSessionMediaServicesWereResetNotification.  Will handle on next run loop to ensure audio session has a chance to configure itself", buf, 2u);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TVPMediaItemLoader__avAudioSessionMediaServicesWereReset___block_invoke;
  block[3] = &unk_24F15BEF8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __60__TVPMediaItemLoader__avAudioSessionMediaServicesWereReset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Handling AVAudioSessionMediaServicesWereResetNotification after delay", v7, 2u);
  }
  v8 = CFSTR("error");
  v3 = objc_alloc(MEMORY[0x24BDD1540]);
  v4 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11819, 0);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v5);

}

- (id)_tomatoFreshnessFromString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRESH")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Fresh")) & 1) != 0)
  {
    v4 = &unk_24F1738B8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CERTIFIED_FRESH")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("CertifiedFresh")))
  {
    v4 = &unk_24F1738D0;
  }
  else
  {
    v4 = &unk_24F1738A0;
  }

  return v4;
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_350(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("value"), 0);
  v3 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v4;
    v7 = 2048;
    v8 = v2;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "Status of AVAsset Metadata key [%@] is = %ld", (uint8_t *)&v5, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_352(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "assetLoadContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_353(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *group;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id *from;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  _QWORD block[4];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  uint64_t *v103;
  id v104;
  uint8_t buf[16];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[10];
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  from = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.feature.adam-id"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.up-next.start"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.watched.time"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.pre-roll.duration"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.feature.duration"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.rating-image"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.display-ratings-overlay"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.title"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.episode-title"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.description"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.genre"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.rating-tag"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.rating-system"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.photosensitivity-info.text"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.photosensitivity-info.image"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.photosensitivity-info.duration"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.high-motion-info.text"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.high-motion-info.image"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.high-motion-info.duration"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.cs-rating"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.rt-rating"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.rt-audience-score"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.poster"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.hls.keys"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_numberValueForKey:fromMetadata:andKeyIdentifierMap:", CFSTR("com.apple.amp.video.recommended.viewing-distance.ratio"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0;
  v128 = &v127;
  v129 = 0x2020000000;
  v130 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x2020000000;
  v126 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  v110[0] = MEMORY[0x24BDAC760];
  v110[1] = 3221225472;
  v110[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_354;
  v110[3] = &unk_24F15E0C0;
  v110[4] = WeakRetained;
  v110[5] = &v127;
  v110[6] = &v123;
  v110[7] = &v119;
  v110[8] = &v115;
  v110[9] = &v111;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2BA4B0](v110);
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v107 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v8, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9)
          && objc_msgSend(v8, "statusOfValueForKey:error:", CFSTR("value"), 0) == 2)
        {
          ((void (**)(_QWORD, void *))v3)[2](v3, v8);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_rollKeyNamesForType:withCount:", 1, v128[3]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  objc_msgSend(WeakRetained, "_rollKeyNamesForType:withCount:", 2, v124[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  objc_msgSend(WeakRetained, "_rollKeyNamesForType:withCount:", 3, v120[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v13);

  objc_msgSend(WeakRetained, "_skipKeyNamesForType:withCount:", 1, v116[3]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v14);

  objc_msgSend(WeakRetained, "_advisoryKeyNamesWithCount:", v112[3]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v15);

  v16 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Loading the values for AVAsset metadata items.", buf, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  group = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_360;
  block[3] = &unk_24F15E110;
  objc_copyWeak(&v104, from);
  v97 = *(_QWORD *)(a1 + 80);
  v17 = *(id *)(a1 + 32);
  v98 = *(_QWORD *)(a1 + 64);
  v99 = &v127;
  v100 = &v123;
  v101 = &v119;
  v102 = &v115;
  v103 = &v111;
  v71 = v17;
  v72 = v67;
  v73 = v66;
  v74 = v65;
  v75 = v64;
  v76 = v63;
  v77 = v56;
  v78 = v55;
  v79 = v57;
  v80 = v51;
  v81 = v49;
  v82 = v53;
  v83 = v47;
  v84 = v68;
  v85 = v61;
  v86 = v59;
  v87 = v44;
  v88 = v42;
  v89 = v40;
  v90 = v38;
  v91 = v36;
  v92 = v34;
  v93 = v32;
  v94 = v30;
  v95 = v28;
  v96 = v26;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v60 = v59;
  v62 = v61;
  v69 = v68;
  v48 = v47;
  v54 = v53;
  v50 = v49;
  v52 = v51;
  v58 = v57;
  v18 = v55;
  v19 = v56;
  v20 = v63;
  v21 = v64;
  v22 = v65;
  v23 = v66;
  v24 = v67;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v104);
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);

}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_354(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "statusOfValueForKey:error:", v3, 0) == 2)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_rollTypeFromMetadataItemKey:", v3);
    if (!v4)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "_skipTypeFromMetadataItemKey:", v3);
      if (v9)
      {
        if (v9 != 1)
          goto LABEL_17;
        objc_msgSend(v13, "tvp_numberValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
        v12 = *(_QWORD *)(a1 + 64);
      }
      else
      {
        if (!objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.hls.advisory-info")))
          goto LABEL_17;
        objc_msgSend(v13, "tvp_numberValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
        v12 = *(_QWORD *)(a1 + 72);
      }
      *(_QWORD *)(*(_QWORD *)(v12 + 8) + 24) = v11;

      goto LABEL_17;
    }
    v5 = v4;
    objc_msgSend(v13, "tvp_numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    switch(v5)
    {
      case 3:
        v8 = *(_QWORD *)(a1 + 56);
        goto LABEL_13;
      case 2:
        v8 = *(_QWORD *)(a1 + 48);
        goto LABEL_13;
      case 1:
        v8 = *(_QWORD *)(a1 + 40);
LABEL_13:
        *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = v7;
        break;
    }
  }
LABEL_17:

}

void __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_360(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t v23[16];
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD block[4];
  id v56;
  uint8_t *v57;
  uint8_t buf[8];
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 296));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    v59 = buf;
    v60 = 0x2020000000;
    v61 = 0;
    objc_msgSend(WeakRetained, "assetLoadContextAccessQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_361;
    block[3] = &unk_24F15DE58;
    v57 = buf;
    v6 = v3;
    v56 = v6;
    dispatch_sync(v4, block);

    if (*((_QWORD *)v59 + 3) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 24))
    {
      objc_msgSend(v6, "_rollInfoFromMetadata:keyIdentifierMap:forType:withTotalCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 40), 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 256) + 8) + 24));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_rollInfoFromMetadata:keyIdentifierMap:forType:withTotalCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 40), 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8) + 24));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_rollInfoFromMetadata:keyIdentifierMap:forType:withTotalCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 40), 3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 272) + 8) + 24));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_skipInfoFromMetadata:keyIdentifierMap:forType:withTotalCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 40), 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8) + 24));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_advisoryInfoFromMetadata:keyIdentifierMap:withTotalCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_productPlacementInfoFromMetadata:keyIdentifierMap:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "addObjectsFromArray:", v22);
      objc_msgSend(v11, "addObjectsFromArray:", v21);
      objc_msgSend(v11, "addObjectsFromArray:", v7);
      objc_msgSend(v6, "mediaItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_3;
      v24[3] = &unk_24F15E0E8;
      v13 = v6;
      v25 = v13;
      v14 = v11;
      v26 = v14;
      v15 = v8;
      v27 = v15;
      v28 = *(id *)(a1 + 40);
      v29 = *(id *)(a1 + 48);
      v30 = *(id *)(a1 + 56);
      v31 = *(id *)(a1 + 64);
      v16 = v9;
      v32 = v16;
      v33 = *(id *)(a1 + 72);
      v17 = v10;
      v34 = v17;
      v35 = *(id *)(a1 + 80);
      v36 = *(id *)(a1 + 88);
      v37 = *(id *)(a1 + 96);
      v38 = *(id *)(a1 + 104);
      v39 = *(id *)(a1 + 112);
      v40 = *(id *)(a1 + 120);
      v41 = *(id *)(a1 + 128);
      v42 = *(id *)(a1 + 136);
      v43 = *(id *)(a1 + 144);
      v44 = *(id *)(a1 + 152);
      v45 = *(id *)(a1 + 160);
      v46 = *(id *)(a1 + 168);
      v47 = *(id *)(a1 + 176);
      v48 = *(id *)(a1 + 184);
      v49 = *(id *)(a1 + 192);
      v50 = *(id *)(a1 + 200);
      v51 = *(id *)(a1 + 208);
      v52 = *(id *)(a1 + 216);
      v53 = *(id *)(a1 + 224);
      v54 = *(id *)(a1 + 232);
      objc_msgSend(v12, "performMediaItemMetadataTransactionWithBlock:", v24);

      objc_msgSend(v13, "stateMachine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postEvent:", CFSTR("AVAsset metadata did load successfully"));

    }
    else
    {
      v20 = sMediaItemLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "Metadata key load completion is from previous attempt, ignoring", v23, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v19 = sMediaItemLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Media item loader has been deallocated; ignoring Metadata key load completion",
        buf,
        2u);
    }
  }

}

uint64_t __58__TVPMediaItemLoader__loadMediaItemMetadataAsynchronously__block_invoke_2_361(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "assetLoadContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_promoInfoFromMetadata:(id)a3 keyIdentifierMap:(id)a4 forSkipKey:(id)a5 skipCounter:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  TVPMediaItemPromoInfo *v36;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.enabled"), v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v13, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && objc_msgSend(v14, "length") && objc_msgSend(v14, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.image"), v12, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v15, v10, v11);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.image-width"), v12, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v16, v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0.0;
    v19 = 0.0;
    if (v17)
    {
      objc_msgSend(v17, "floatValue");
      v19 = v20;
    }
    v50 = v17;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.image-height"), v12, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v21, v10, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "floatValue");
      v18 = v23;
    }
    v49 = v22;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.title"), v12, a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v24, v10, v11);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.genre"), v12, a6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v25, v10, v11);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.rating-display-name"), v12, a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v26, v10, v11);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.rating-system"), v12, a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v27, v10, v11);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.runtime"), v12, a6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v28, v10, v11);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.canonical-id"), v12, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v29, v10, v11);
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.up-next.is-added"), v12, a6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v31, v10, v11);
    v32 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v32;
    v44 = v14;
    if (v32)
    {
      v33 = (void *)v32;
      v34 = (void *)v30;
      if (objc_msgSend(v33, "length"))
      {
        v35 = objc_msgSend(v33, "BOOLValue");
LABEL_15:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.up-next.add-label"), v12, a6);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v38, v10, v11);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.hls.%@.%lu.promo.up-next.added-label"), v12, a6);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPMediaItemLoader _stringValueForKey:fromMetadata:andKeyIdentifierMap:](self, "_stringValueForKey:fromMetadata:andKeyIdentifierMap:", v39, v10, v11);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v41) = v35;
        v36 = -[TVPMediaItemPromoInfo initWithTitleImageURL:originalTitleImageWidth:originalTitleImageHeight:title:genre:ratingDisplayName:ratingSystem:movieRuntime:canonicalId:isAddedToUpNext:addToUpNextLabelString:addedToUpNextLabelString:]([TVPMediaItemPromoInfo alloc], "initWithTitleImageURL:originalTitleImageWidth:originalTitleImageHeight:title:genre:ratingDisplayName:ratingSystem:movieRuntime:canonicalId:isAddedToUpNext:addToUpNextLabelString:addedToUpNextLabelString:", v52, v51, v48, v47, v46, v45, v19, v18, v34, v41, v42, v40);

        v14 = v44;
        goto LABEL_12;
      }
    }
    else
    {
      v34 = (void *)v30;
    }
    v35 = 0;
    goto LABEL_15;
  }
  v36 = 0;
LABEL_12:

  return v36;
}

- (id)_rollKeyNameFromType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return off_24F15E158[a3 - 1];
}

- (id)_skipKeyNameFromType:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("skip");
  else
    return 0;
}

- (void)_mediaItemPlaybackErrorDidOccur:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("TVPMediaItemPlaybackErrorKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("TVPMediaItemPlaybackErrorShouldStopKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCED8]);
    objc_msgSend(v6, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithDictionary:", v10);

    objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("TVPMediaItemPlaybackErrorShouldStopKey"));
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(v6, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);

    v6 = (void *)v14;
  }
  if (v6)
  {
    v20 = CFSTR("error");
    v21[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v6;
    _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Media item playback error did occur: %@", (uint8_t *)&v18, 0xCu);
  }
  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v15);

}

- (void)_mediaItemStopPlayback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BDD1540]);
  v16 = CFSTR("TVPMediaItemLoaderSuppressErrorAndStopKey");
  v17[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 819, v5);

  v7 = (void *)sMediaItemLoaderLogObject;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[TVPMediaItemLoader mediaItem](self, "mediaItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Media item requested stop: %@", buf, 0xCu);

  }
  -[TVPMediaItemLoader stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("error");
  v13 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postEvent:withContext:userInfo:", CFSTR("Failure"), 0, v11);

}

- (void)_cleanUp
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[TVPMediaItemLoader cleanedUp](self, "cleanedUp"))
  {
    -[TVPMediaItemLoader diskSpaceMonitorTimer](self, "diskSpaceMonitorTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    -[TVPMediaItemLoader setDiskSpaceMonitorTimer:](self, "setDiskSpaceMonitorTimer:", 0);
    -[TVPMediaItemLoader assetLoadContextAccessQueue](self, "assetLoadContextAccessQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__TVPMediaItemLoader__cleanUp__block_invoke;
    block[3] = &unk_24F15BEF8;
    block[4] = self;
    dispatch_sync(v4, block);

    -[TVPMediaItemLoader assetInternalAccessQueue](self, "assetInternalAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __30__TVPMediaItemLoader__cleanUp__block_invoke_2;
    v10[3] = &unk_24F15BEF8;
    v10[4] = self;
    dispatch_sync(v6, v10);

    -[TVPMediaItemLoader mediaItem](self, "mediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v7, "hasTrait:", CFSTR("TVPMediaItemTraitUseTempDownload"));

    if ((_DWORD)v5)
      objc_msgSend((id)objc_opt_class(), "removeTemporaryDownloadDirectory");
    -[TVPMediaItemLoader setTimingData:](self, "setTimingData:", 0);
    -[TVPMediaItemLoader mediaItem](self, "mediaItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = sMediaItemLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Calling cleanUpMediaItem for media item %@", buf, 0xCu);
      }
      objc_msgSend(v8, "cleanUpMediaItem");
    }
    -[TVPMediaItemLoader setCleanedUp:](self, "setCleanedUp:", 1);

  }
}

uint64_t __30__TVPMediaItemLoader__cleanUp__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssetLoadContext:", objc_msgSend(*(id *)(a1 + 32), "assetLoadContext") + 1);
}

void __30__TVPMediaItemLoader__cleanUp__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "AVAssetInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDB1610], 0);

    objc_msgSend(*(id *)(a1 + 32), "setContentKeySession:", 0);
    objc_msgSend(*(id *)(a1 + 32), "AVAssetInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:queue:", 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "setAVAssetInternal:", 0);
  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  char v13;
  void *v14;
  TVPSecureKeyRequest *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint8_t v21[16];

  v5 = a4;
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("skd")))
  {

LABEL_6:
    -[TVPMediaItemLoader mediaItem](self, "mediaItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();
    if ((v13 & 1) != 0)
    {
      v15 = -[TVPSecureKeyRequest initWithAssetResourceLoadingRequest:]([TVPSecureKeyRequest alloc], "initWithAssetResourceLoadingRequest:", v5);
      -[TVPMediaItemLoader mediaItem](self, "mediaItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasTrait:", CFSTR("TVPMediaItemTraitIsRental"));

      if (v17)
      {
        -[TVPMediaItemLoader mediaItem](self, "mediaItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataRentalID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[TVPSecureKeyRequest setRentalID:](v15, "setRentalID:", v19);
      }
      objc_msgSend(v14, "loadStreamingKeyForRequest:", v15);

    }
    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x24BDD1830];
  objc_msgSend(v5, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "_protocolClassForRequest:", v10);

  if (!v11)
    goto LABEL_6;
  v12 = sMediaItemLoaderLogObject;
  v13 = 0;
  if (os_log_type_enabled((os_log_t)sMediaItemLoaderLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Bypassing loadStreamingKeyForRequest: since a protocol handler exists for this request", v21, 2u);
    v13 = 0;
  }
LABEL_11:

  return v13 & 1;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setAVAsset:(id)a3
{
  objc_storeStrong((id *)&self->_AVAsset, a3);
}

- (void)setExistingAVAsset:(id)a3
{
  objc_storeStrong((id *)&self->_existingAVAsset, a3);
}

- (void)setContentKeySession:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeySession, a3);
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (void)setAssetInternalAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetInternalAccessQueue, a3);
}

- (void)setAssetLoadContextAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoadContextAccessQueue, a3);
}

- (void)setAssetLoadContext:(unint64_t)a3
{
  self->_assetLoadContext = a3;
}

- (NSString)mediaItemLoaderGUID
{
  return self->_mediaItemLoaderGUID;
}

- (void)setMediaItemLoaderGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSTimer)diskSpaceMonitorTimer
{
  return self->_diskSpaceMonitorTimer;
}

- (void)setDiskSpaceMonitorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_diskSpaceMonitorTimer, a3);
}

- (BOOL)cleanedUp
{
  return self->_cleanedUp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskSpaceMonitorTimer, 0);
  objc_storeStrong((id *)&self->_mediaItemLoaderGUID, 0);
  objc_storeStrong((id *)&self->_assetLoadContextAccessQueue, 0);
  objc_storeStrong((id *)&self->_assetInternalAccessQueue, 0);
  objc_storeStrong((id *)&self->_AVAssetInternal, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_existingAVAsset, 0);
  objc_storeStrong((id *)&self->_AVAsset, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_228A4E000, v0, v1, "Unable to retrieve file system attributes due to error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "File name has zero length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_228A4E000, v0, v1, "Error creating directory at %@: %@");
  OUTLINED_FUNCTION_5_0();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Not enough free space for temporary download", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Unable to determine free space for temporary download", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_80_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_228A4E000, v0, v1, "Media item %@ has empty URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_80_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Not setting AVAsset destination URL since it is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_87_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Unable to create AVURLAsset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_2_87_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Creation of AVURLAsset using download token failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__TVPMediaItemLoader__registerStateMachineHandlers__block_invoke_5_146_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_228A4E000, v0, v1, "Error occurred while loading media item: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)_onAssetInternalAccessQueue_updateContentKeySessionWithContentKeyLoader:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "AVAssetInternal is nil; unable to add content key recipient",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)_contentKeyRequestParamsFromBase64String:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_228A4E000, v0, v1, "Unable to deserialize key request params: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)_contentKeyRequestParamsFromBase64String:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_228A4E000, a3, (uint64_t)a3, "Key format version object is not a string or number", a1);
}

- (void)_contentKeyRequestParamsFromBase64String:(NSObject *)a3 .cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_228A4E000, a3, (uint64_t)a3, "Key request param object is not a dictionary", a1);
}

- (void)_contentKeyRequestParamsFromBase64String:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Key request param data is not an array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
