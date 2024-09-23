@implementation PUAggregateDictionaryTracer

- (PUAggregateDictionaryTracer)init
{
  PUAggregateDictionaryTracer *v2;
  uint64_t v3;
  NSMapTable *browsingViewModelTracers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAggregateDictionaryTracer;
  v2 = -[PUAggregateDictionaryTracer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    browsingViewModelTracers = v2->__browsingViewModelTracers;
    v2->__browsingViewModelTracers = (NSMapTable *)v3;

  }
  return v2;
}

- (void)userStartedViewingCurrentAssetOfBrowsingViewModel:(id)a3 inContext:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLAggdGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v10;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "%@ %@ %@", buf, 0x20u);

  }
  -[PUAggregateDictionaryTracer _browsingViewModelTracerForBrowsingViewModel:createIfNeeded:](self, "_browsingViewModelTracerForBrowsingViewModel:createIfNeeded:", v7, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__PUAggregateDictionaryTracer_userStartedViewingCurrentAssetOfBrowsingViewModel_inContext___block_invoke;
  v14[3] = &unk_1E58ABCA8;
  v15 = v11;
  v16 = v8;
  v12 = v8;
  v13 = v11;
  objc_msgSend(v13, "performChanges:", v14);

}

- (void)userStoppedViewingCurrentAssetOfBrowsingViewModel:(id)a3 inContext:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  PLAggdGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "%@ %@", buf, 0x16u);

  }
  -[PUAggregateDictionaryTracer _browsingViewModelTracerForBrowsingViewModel:createIfNeeded:](self, "_browsingViewModelTracerForBrowsingViewModel:createIfNeeded:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__PUAggregateDictionaryTracer_userStoppedViewingCurrentAssetOfBrowsingViewModel_inContext___block_invoke;
  v14[3] = &unk_1E58ABCA8;
  v15 = v11;
  v16 = v7;
  v12 = v7;
  v13 = v11;
  objc_msgSend(v13, "performChanges:", v14);

}

- (void)invalidateContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PUAggregateDictionaryTracer _browsingViewModelTracers](self, "_browsingViewModelTracers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __49__PUAggregateDictionaryTracer_invalidateContext___block_invoke;
        v13[3] = &unk_1E58ABCA8;
        v13[4] = v12;
        v14 = v4;
        objc_msgSend(v12, "performChanges:", v13);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)userBrowsedOneUpFor:(double)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLAggdGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%@ %f", (uint8_t *)&v7, 0x16u);

  }
  if (PLSAggregateDictionaryKeyForPhotosOneUpBrowseDuration())
    PLSAggregateDictionaryAddValueForScalarKey();
}

- (void)userViewedPhotoInOneUpFor:(double)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLAggdGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%@ %f", (uint8_t *)&v7, 0x16u);

  }
  if (PLSAggregateDictionaryKeyForPhotosOneUpViewedPhotoDuration())
    PLSAggregateDictionaryAddValueForScalarKey();
}

- (void)userViewedHDRPhotoInOneUpFor:(double)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLAggdGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%@ %f", (uint8_t *)&v7, 0x16u);

  }
  PLSAggregateDictionaryKeyForPhotosOneUpViewedHDRPhotoDuration();
  PLSAggregateDictionaryAddValueForScalarKey();
}

- (void)userViewedAssetInOneUp:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  _QWORD *v11;
  NSObject *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLAggdGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v20, 0x16u);

  }
  -[PUAggregateDictionaryTracer _lastViewedAsset](self, "_lastViewedAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    -[PUAggregateDictionaryTracer _setLastViewedAsset:](self, "_setLastViewedAsset:", v5);
    v10 = -[PUAggregateDictionaryTracer _assetTypeForAsset:](self, "_assetTypeForAsset:", v5);
    v11 = (_QWORD *)MEMORY[0x1E0D72948];
    switch(v10)
    {
      case 0:
        PLAggdGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v20 = 138412290;
          v21 = v5;
          _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "undefined type for asset %@", (uint8_t *)&v20, 0xCu);
        }

        break;
      case 1:
        goto LABEL_12;
      case 2:
        v11 = (_QWORD *)MEMORY[0x1E0D72940];
        goto LABEL_12;
      case 3:
        v11 = (_QWORD *)MEMORY[0x1E0D72950];
        goto LABEL_12;
      case 4:
        v11 = (_QWORD *)MEMORY[0x1E0D72958];
        goto LABEL_12;
      case 5:
        v11 = (_QWORD *)MEMORY[0x1E0D72960];
LABEL_12:
        if (*v11)
          PLSAggregateDictionaryAddValueForScalarKey();
        break;
      default:
        break;
    }
  }
  v13 = -[PUAggregateDictionaryTracer _oneUpPresentationOrigin](self, "_oneUpPresentationOrigin");
  if (v13)
  {
    v14 = v13;
    -[PUAggregateDictionaryTracer _lastViewedAssetPerOrigin](self, "_lastViewedAssetPerOrigin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v5, "isEqual:", v15);

    if ((v16 & 1) == 0)
    {
      -[PUAggregateDictionaryTracer _lastViewedAssetPerOrigin](self, "_lastViewedAssetPerOrigin");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAggregateDictionaryTracer set_lastViewedAssetPerOrigin:](self, "set_lastViewedAssetPerOrigin:", v5);
      objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
        objc_msgSend(v18, "didNavigateInOneUpFromOrigin:", v14);
      else
        objc_msgSend(v18, "didPresentOneUpFromOrigin:", v14);

    }
  }

}

- (void)userWillPlayAssetInOneUp:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAggregateDictionaryTracer _setLastPlayStartDate:](self, "_setLastPlayStartDate:", v4);

}

- (void)userDidPlayAssetInOneUp:(id)a3
{
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[PUAggregateDictionaryTracer _assetTypeForAsset:](self, "_assetTypeForAsset:", v5);
  v7 = -[PUAggregateDictionaryTracer _assetPlayCount](self, "_assetPlayCount");
  -[PUAggregateDictionaryTracer _lastPlayedAsset](self, "_lastPlayedAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (v9)
  {
    v10 = v7 + 1;
  }
  else
  {
    -[PUAggregateDictionaryTracer _setLastPlayedAsset:](self, "_setLastPlayedAsset:", v5);
    v10 = 1;
  }
  -[PUAggregateDictionaryTracer _setAssetPlayCount:](self, "_setAssetPlayCount:", v10);
  -[PUAggregateDictionaryTracer _lastPlayStartDate](self, "_lastPlayStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceNow");
    v14 = -v13;
  }
  else
  {
    v14 = 0.0;
  }
  -[PUAggregateDictionaryTracer _setLastPlayStartDate:](self, "_setLastPlayStartDate:", 0);
  PLAggdGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138413058;
    v25 = v16;
    v26 = 2112;
    v27 = v5;
    v28 = 2112;
    v29 = v17;
    v30 = 2048;
    v31 = v14;
    _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEBUG, "%@ %@ (count: %@, duration: %f)", (uint8_t *)&v24, 0x2Au);

  }
  switch(v6)
  {
    case 0:
      PLAggdGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v24 = 138412290;
        v25 = v5;
        _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "undefined type for asset %@", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_14;
    case 1:
      PLAggdGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v19;
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "cannot record play for asset type %@ for asset %@", (uint8_t *)&v24, 0x16u);

      }
LABEL_14:

      goto LABEL_31;
    case 2:
      v20 = PLSAggregateDictionaryKeyForOneUpPlayedIrisWithPlayCount();
      v21 = v20;
      if (v10 >= 2)
      {
        v22 = PLSAggregateDictionaryKeyForOneUpPlayedIrisWithPlayCount();
        if (!v21)
          goto LABEL_26;
        goto LABEL_25;
      }
      v22 = 0;
      if (v20)
LABEL_25:
        PLSAggregateDictionaryAddValueForScalarKey();
LABEL_26:
      if (v22)
        PLSAggregateDictionaryAddValueForScalarKey();
      if (v6 == 2 && v14 > 0.0)
        PLSAggregateDictionaryPushValueForDistributionKey();
LABEL_31:

      return;
    case 3:
      if (v10 != 1)
        goto LABEL_31;
      v22 = 0;
      v23 = (_QWORD *)MEMORY[0x1E0D72920];
      goto LABEL_24;
    case 4:
      if (v10 != 1)
        goto LABEL_31;
      v22 = 0;
      v23 = (_QWORD *)MEMORY[0x1E0D72928];
      goto LABEL_24;
    case 5:
      if (v10 != 1)
        goto LABEL_31;
      v22 = 0;
      v23 = (_QWORD *)MEMORY[0x1E0D72930];
LABEL_24:
      if (*v23)
        goto LABEL_25;
      goto LABEL_26;
    default:
      goto LABEL_31;
  }
}

- (void)vitalityPlayedForAssetInOneUp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAggdGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v7, 0x16u);

  }
  PLSAggregateDictionaryAddValueForScalarKey();

}

- (void)streamedVideoPlaybackBegan:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLAggdGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v10, 0x16u);

  }
  -[PUAggregateDictionaryTracer _streamedVideo](self, "_streamedVideo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    -[PUAggregateDictionaryTracer _setStreamedVideo:](self, "_setStreamedVideo:", v5);
    -[PUAggregateDictionaryTracer _setStreamedVideoDidStartPlaying:](self, "_setStreamedVideoDidStartPlaying:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PUAggregateDictionaryTracer _setStreamedVideoBeginTime:](self, "_setStreamedVideoBeginTime:");
    -[PUAggregateDictionaryTracer _setStreamedVideoStallCount:](self, "_setStreamedVideoStallCount:", 0);
    PLSAggregateDictionaryAddValueForScalarKey();
  }

}

- (void)streamedVideoPlaybackStartedActuallyPlaying:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  double v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLAggdGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = *(double *)&v7;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v17, 0x16u);

  }
  -[PUAggregateDictionaryTracer _streamedVideo](self, "_streamedVideo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    if (!-[PUAggregateDictionaryTracer _streamedVideoDidStartPlaying](self, "_streamedVideoDidStartPlaying"))
    {
      -[PUAggregateDictionaryTracer _setStreamedVideoDidStartPlaying:](self, "_setStreamedVideoDidStartPlaying:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v11 = v10;
      -[PUAggregateDictionaryTracer _streamedVideoBeginTime](self, "_streamedVideoBeginTime");
      v13 = v11 - v12;
      PLAggdGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v17 = 134217984;
        v18 = v13;
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEBUG, "time to start %f", (uint8_t *)&v17, 0xCu);
      }

      PLSAggregateDictionaryKeyForStreamedVideoPlaybackTimeToStart();
      PLSAggregateDictionaryAddValueForScalarKey();
    }
  }
  else
  {
    PLAggdGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[PUAggregateDictionaryTracer _streamedVideo](self, "_streamedVideo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = *(double *)&v5;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "mismatched assets %@ vs %@", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (void)streamedVideoPlaybackStalled:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLAggdGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v18, 0x16u);

  }
  -[PUAggregateDictionaryTracer _streamedVideo](self, "_streamedVideo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    if (!-[PUAggregateDictionaryTracer _streamedVideoDidStartPlaying](self, "_streamedVideoDidStartPlaying"))
      goto LABEL_15;
    v10 = -[PUAggregateDictionaryTracer _streamedVideoStallCount](self, "_streamedVideoStallCount");
    -[PUAggregateDictionaryTracer _setStreamedVideoStallCount:](self, "_setStreamedVideoStallCount:", v10 + 1);
    PLAggdGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "stalled %@ times", (uint8_t *)&v18, 0xCu);

    }
    v13 = PLSAggregateDictionaryKeyForStreamedVideoStallCount();
    v14 = v13;
    if (v10 < 1)
    {
      v15 = 0;
      if (!v13)
      {
LABEL_10:
        if (v15)
          PLSAggregateDictionaryAddValueForScalarKey();
        goto LABEL_15;
      }
    }
    else
    {
      v15 = PLSAggregateDictionaryKeyForStreamedVideoStallCount();
      if (!v14)
        goto LABEL_10;
    }
    PLSAggregateDictionaryAddValueForScalarKey();
    goto LABEL_10;
  }
  PLAggdGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[PUAggregateDictionaryTracer _streamedVideo](self, "_streamedVideo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "mismatched assets %@ vs %@", (uint8_t *)&v18, 0x16u);

  }
LABEL_15:

}

- (void)streamedVideoPlaybackEnded
{
  NSObject *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLAggdGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v12, 0xCu);

  }
  -[PUAggregateDictionaryTracer _streamedVideo](self, "_streamedVideo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!-[PUAggregateDictionaryTracer _streamedVideoDidStartPlaying](self, "_streamedVideoDidStartPlaying"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v8 = v7;
      -[PUAggregateDictionaryTracer _streamedVideoBeginTime](self, "_streamedVideoBeginTime");
      v10 = v9;
      PLAggdGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = 134217984;
        v13 = v8 - v10;
        _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "time to cancel %f", (uint8_t *)&v12, 0xCu);
      }

      PLSAggregateDictionaryAddValueForScalarKey();
    }
    -[PUAggregateDictionaryTracer _setStreamedVideo:](self, "_setStreamedVideo:", 0);
  }
}

- (int64_t)_assetTypeForAsset:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "mediaType");
  if (v4 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(v3, "mediaSubtypes");
    else
      LODWORD(v6) = 0;
    v7 = 5;
    if ((v6 & 0x40000) == 0)
      v7 = 3;
    if ((v6 & 0x20000) != 0)
      v5 = 4;
    else
      v5 = v7;
  }
  else if (v4 == 1)
  {
    if (objc_msgSend(v3, "canPlayPhotoIris"))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_browsingViewModelTracerForBrowsingViewModel:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  PUAggregateDictionaryBrowsingViewModelTracer *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[PUAggregateDictionaryTracer _browsingViewModelTracers](self, "_browsingViewModelTracers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (PUAggregateDictionaryBrowsingViewModelTracer *)objc_claimAutoreleasedReturnValue();

  if (!v8 && v4)
  {
    v8 = -[PUAggregateDictionaryBrowsingViewModelTracer initWithBrowsingViewModel:]([PUAggregateDictionaryBrowsingViewModelTracer alloc], "initWithBrowsingViewModel:", v6);
    -[PUAggregateDictionaryTracer _browsingViewModelTracers](self, "_browsingViewModelTracers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

  }
  return v8;
}

- (void)userStartedViewingCollection:(id)a3 withListViewItemSelectionTrackerKey:(__CFString *)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "assetCollectionType");
    v7 = objc_msgSend(v5, "assetCollectionSubtype");

  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  if (objc_msgSend(v4, "px_isPeopleVirtualCollection"))
  {
    v8 = *MEMORY[0x1E0D727A0];
    v9 = CFSTR("com.apple.photos.CPAnalytics.peopleAlbumSelected");
  }
  else
  {
    v10 = objc_msgSend(v4, "px_isPlacesSmartAlbum");
    if (v10)
      v8 = *MEMORY[0x1E0D729F0];
    else
      v8 = 0;
    if (v10)
      v9 = CFSTR("com.apple.photos.CPAnalytics.placesAlbumSelected");
    else
      v9 = 0;
  }
  if (v6 != 2)
  {
    if (v7 == 100)
    {
      v9 = CFSTR("com.apple.photos.CPAnalytics.myPhotoStreamSelected");
      if (!*MEMORY[0x1E0D72980])
        goto LABEL_41;
    }
    else
    {
      if (v7 != 101)
        goto LABEL_39;
      v9 = CFSTR("com.apple.photos.CPAnalytics.sharedAlbumSelected");
      if (!*MEMORY[0x1E0D72A10])
        goto LABEL_41;
    }
LABEL_40:
    PLSAggregateDictionaryAddValueForScalarKey();
    PLSAggregateDictionaryAddValueForScalarKey();
    goto LABEL_41;
  }
  if (v7 <= 1000000200)
  {
    switch(v7)
    {
      case 200:
      case 206:
        goto LABEL_39;
      case 201:
        v11 = (uint64_t *)MEMORY[0x1E0D72988];
        goto LABEL_38;
      case 202:
        v11 = (uint64_t *)MEMORY[0x1E0D729D8];
        goto LABEL_38;
      case 203:
        v11 = (uint64_t *)MEMORY[0x1E0D72978];
        goto LABEL_38;
      case 204:
        v11 = (uint64_t *)MEMORY[0x1E0D729C8];
        goto LABEL_38;
      case 205:
        v11 = (uint64_t *)MEMORY[0x1E0D72968];
        goto LABEL_38;
      case 207:
        v11 = (uint64_t *)MEMORY[0x1E0D72970];
        goto LABEL_38;
      case 208:
        v11 = (uint64_t *)MEMORY[0x1E0D729C0];
        goto LABEL_38;
      case 209:
        v11 = (uint64_t *)MEMORY[0x1E0D729D0];
        goto LABEL_38;
      case 210:
        v11 = (uint64_t *)MEMORY[0x1E0D729B8];
        goto LABEL_38;
      case 211:
        v11 = (uint64_t *)MEMORY[0x1E0D729B0];
        goto LABEL_38;
      case 217:
        v11 = (uint64_t *)MEMORY[0x1E0D72990];
        goto LABEL_38;
      default:
        goto LABEL_44;
    }
  }
  switch(v7)
  {
    case 1000000201:
      v11 = (uint64_t *)MEMORY[0x1E0D72998];
      goto LABEL_38;
    case 1000000206:
      v11 = (uint64_t *)MEMORY[0x1E0D729A0];
      goto LABEL_38;
    case 1000000207:
      v11 = (uint64_t *)MEMORY[0x1E0D729A8];
LABEL_38:
      v8 = *v11;
LABEL_39:
      if (!v8)
        goto LABEL_41;
      goto LABEL_40;
  }
LABEL_44:
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "No aggd key for smart album type %li", buf, 0xCu);
  }

  if (v8)
    goto LABEL_40;
LABEL_41:
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0D09910];
    v15 = *MEMORY[0x1E0D09818];
    v16 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendEvent:withPayload:", v9, v13);

  }
}

- (void)userDidEnterOneUpFromOrigin:(int64_t)a3
{
  -[PUAggregateDictionaryTracer set_oneUpPresentationOrigin:](self, "set_oneUpPresentationOrigin:", a3);
  -[PUAggregateDictionaryTracer set_lastViewedAssetPerOrigin:](self, "set_lastViewedAssetPerOrigin:", 0);
}

- (NSMapTable)_browsingViewModelTracers
{
  return self->__browsingViewModelTracers;
}

- (PUDisplayAsset)_lastViewedAsset
{
  return (PUDisplayAsset *)objc_loadWeakRetained((id *)&self->__lastViewedAsset);
}

- (void)_setLastViewedAsset:(id)a3
{
  objc_storeWeak((id *)&self->__lastViewedAsset, a3);
}

- (NSDate)_lastPlayStartDate
{
  return self->__lastPlayStartDate;
}

- (void)_setLastPlayStartDate:(id)a3
{
  objc_storeStrong((id *)&self->__lastPlayStartDate, a3);
}

- (PUDisplayAsset)_lastPlayedAsset
{
  return (PUDisplayAsset *)objc_loadWeakRetained((id *)&self->__lastPlayedAsset);
}

- (void)_setLastPlayedAsset:(id)a3
{
  objc_storeWeak((id *)&self->__lastPlayedAsset, a3);
}

- (int64_t)_assetPlayCount
{
  return self->__assetPlayCount;
}

- (void)_setAssetPlayCount:(int64_t)a3
{
  self->__assetPlayCount = a3;
}

- (PUDisplayAsset)_streamedVideo
{
  return (PUDisplayAsset *)objc_loadWeakRetained((id *)&self->__streamedVideo);
}

- (void)_setStreamedVideo:(id)a3
{
  objc_storeWeak((id *)&self->__streamedVideo, a3);
}

- (BOOL)_streamedVideoDidStartPlaying
{
  return self->__streamedVideoDidStartPlaying;
}

- (void)_setStreamedVideoDidStartPlaying:(BOOL)a3
{
  self->__streamedVideoDidStartPlaying = a3;
}

- (double)_streamedVideoBeginTime
{
  return self->__streamedVideoBeginTime;
}

- (void)_setStreamedVideoBeginTime:(double)a3
{
  self->__streamedVideoBeginTime = a3;
}

- (int64_t)_streamedVideoStallCount
{
  return self->__streamedVideoStallCount;
}

- (void)_setStreamedVideoStallCount:(int64_t)a3
{
  self->__streamedVideoStallCount = a3;
}

- (int64_t)_oneUpPresentationOrigin
{
  return self->__oneUpPresentationOrigin;
}

- (void)set_oneUpPresentationOrigin:(int64_t)a3
{
  self->__oneUpPresentationOrigin = a3;
}

- (PUDisplayAsset)_lastViewedAssetPerOrigin
{
  return self->__lastViewedAssetPerOrigin;
}

- (void)set_lastViewedAssetPerOrigin:(id)a3
{
  objc_storeStrong((id *)&self->__lastViewedAssetPerOrigin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lastViewedAssetPerOrigin, 0);
  objc_destroyWeak((id *)&self->__streamedVideo);
  objc_destroyWeak((id *)&self->__lastPlayedAsset);
  objc_storeStrong((id *)&self->__lastPlayStartDate, 0);
  objc_destroyWeak((id *)&self->__lastViewedAsset);
  objc_storeStrong((id *)&self->__browsingViewModelTracers, 0);
}

uint64_t __49__PUAggregateDictionaryTracer_invalidateContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeViewingContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __91__PUAggregateDictionaryTracer_userStoppedViewingCurrentAssetOfBrowsingViewModel_inContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeViewingContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __91__PUAggregateDictionaryTracer_userStartedViewingCurrentAssetOfBrowsingViewModel_inContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addViewingContext:", *(_QWORD *)(a1 + 40));
}

+ (PUAggregateDictionaryTracer)sharedTracer
{
  if (sharedTracer_onceToken != -1)
    dispatch_once(&sharedTracer_onceToken, &__block_literal_global_6491);
  return (PUAggregateDictionaryTracer *)(id)sharedTracer_sharedTracer;
}

void __43__PUAggregateDictionaryTracer_sharedTracer__block_invoke()
{
  PUAggregateDictionaryTracer *v0;
  void *v1;

  v0 = objc_alloc_init(PUAggregateDictionaryTracer);
  v1 = (void *)sharedTracer_sharedTracer;
  sharedTracer_sharedTracer = (uint64_t)v0;

}

@end
