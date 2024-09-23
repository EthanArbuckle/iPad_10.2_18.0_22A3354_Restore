@implementation PHAsset(Curation)

- (id)curationModel
{
  void *v2;
  CLSCurationSession *v3;
  uint8_t v5[16];

  objc_getAssociatedObject(a1, "clsCurationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Asset curation requires a curation model, call [CLSCurationSession prepareAssets:] on your asset", v5, 2u);
    }
    v3 = objc_alloc_init(CLSCurationSession);
    objc_msgSend(a1, "fetchPropertySetsIfNeeded");
    -[CLSCurationSession curationModelForAsset:](v3, "curationModelForAsset:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCurationModel:", v2);

  }
  return v2;
}

- (void)setCurationModel:()Curation
{
  objc_setAssociatedObject(a1, "clsCurationModel", a3, (void *)1);
}

- (BOOL)hasCurationModel
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, "clsCurationModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)clsViewCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "assetUserActivityProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "viewCount");

  return v2;
}

- (uint64_t)clsPlayCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "assetUserActivityProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "playCount");

  return v2;
}

- (uint64_t)clsShareCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "assetUserActivityProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "shareCount");

  return v2;
}

- (BOOL)isSubtype:()Curation
{
  return (a3 & ~objc_msgSend(a1, "mediaSubtypes")) == 0;
}

- (double)clsDuration
{
  double v2;
  double Seconds;
  void *v4;
  void *v5;
  CMTime time;

  objc_msgSend(a1, "duration");
  Seconds = v2;
  if (objc_msgSend(a1, "isMediaSubtype:", 8))
  {
    objc_msgSend(a1, "photoIrisProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "photoIrisVideoDuration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

  }
  return Seconds;
}

- (uint64_t)clsIsNonMemorable
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNonMemorableWithAsset:", a1);

  return v3;
}

- (uint64_t)clsIsUtility
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_getAssociatedObject(a1, "clsIsUtility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    objc_msgSend(a1, "curationModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isUtilityWithAsset:", a1);

    objc_msgSend(a1, "clsCacheIsUtility:", v4);
  }

  return v4;
}

- (void)clsCacheIsUtility:()Curation
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsIsUtility", v2, (void *)1);

}

- (uint64_t)clsIsScreenshotOrScreenRecording
{
  if ((objc_msgSend(a1, "isSubtype:", 4) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isScreenRecording");
}

- (uint64_t)clsIsAestheticallyPrettyGood
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAestheticallyPrettyGoodWithAsset:", a1);

  return v3;
}

- (float)clsInteractionScore
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "curationProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interactionScore");
  v3 = v2;

  return v3;
}

- (float)clsBehavioralScore
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "curationProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "behavioralScore");
  v3 = v2;

  return v3;
}

- (uint64_t)isGold
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGoldWithAsset:", a1);

  return v3;
}

- (uint64_t)isShinyGem
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShinyGemWithAsset:", a1);

  return v3;
}

- (uint64_t)isRegularGem
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRegularGemWithAsset:", a1);

  return v3;
}

- (BOOL)clsIsSceneProcessed
{
  void *v1;
  __int16 v2;
  _BOOL8 v3;

  objc_msgSend(a1, "sceneAnalysisProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "sceneAnalysisVersion");
  v3 = *MEMORY[0x24BE720E0] != v2;

  return v3;
}

- (uint64_t)clsIsFaceProcessed
{
  __int16 v2;
  void *v3;
  _BOOL8 v4;

  v2 = objc_msgSend(a1, "faceAnalysisVersion");
  if (*MEMORY[0x24BE720D8] != v2)
    return 1;
  objc_msgSend(a1, "faceAdjustmentVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)clsIsGuestAsset
{
  return objc_msgSend(a1, "sourceType") == 32;
}

- (double)clsIconicScore
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "iconicScoreProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "iconicScore");
  v3 = v2;

  return v3;
}

- (double)clsIconicSceneScoreWithSceneGeography:()Curation
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v4 = a3;
  objc_getAssociatedObject(a1, "clsIconicSceneScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
  }
  else
  {
    objc_msgSend(a1, "curationModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sceneModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "clsSceneClassifications");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneIdentifiersFromSceneClassifications:passingThresholdOfType:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "locationCoordinate");
    +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:maxScenesCount:](PNAssetCurationUtilities, "assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:maxScenesCount:", v12, v4, 5);
    v8 = v13;
    objc_msgSend(a1, "clsCacheIconicSceneScore:");

  }
  return v8;
}

- (void)clsCacheIconicSceneScore:()Curation
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsIconicSceneScore", v2, (void *)1);

}

- (double)pl_coordinate
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return *MEMORY[0x24BDBFB70];
  objc_msgSend(a1, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinate");
  v5 = v4;

  if (v5 == 0.0)
    return *MEMORY[0x24BDBFB70];
  return v5;
}

- (double)pl_gpsHorizontalAccuracy
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "coarseLocationProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "gpsHorizontalAccuracy");
  v3 = v2;

  return v3;
}

- (id)clsPersonAndPetLocalIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "clsPersonLocalIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clsPetLocalIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clsPetLocalIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "clsPetLocalIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = a1;
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "clsPetLocalIdentifiers not prefetched for asset %p %@", (uint8_t *)&v7, 0x16u);

    }
    v2 = (void *)MEMORY[0x24BDBD1A8];
  }
  v4 = v2;

  return v4;
}

- (void)clsSetPetLocalIdentifiers:()Curation
{
  objc_setAssociatedObject(a1, "clsPetLocalIdentifiers", a3, (void *)1);
}

- (id)clsPersonLocalIdentifiers
{
  void *v2;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "clsPersonLocalIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = a1;
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "clsPersonLocalIdentifiers not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);

    }
    objc_msgSend(a1, "clsUnprefetchedPersonLocalIdentifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)clsSetPersonLocalIdentifiers:()Curation
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_setAssociatedObject(a1, "clsPersonLocalIdentifiers", v4, (void *)1);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = objc_msgSend(v4, "count");

  objc_msgSend(v5, "numberWithUnsignedInteger:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsPeopleCount", v7, (void *)1);

}

- (id)clsConsolidatedPersonLocalIdentifiers
{
  void *v2;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "clsConsolidatedPersonLocalIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = a1;
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "clsConsolidatedPersonLocalIdentifiers not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);

    }
    v2 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v2;
}

- (void)clsSetConsolidatedPersonLocalIdentifiers:()Curation
{
  objc_setAssociatedObject(a1, "clsConsolidatedPersonLocalIdentifiers", a3, (void *)1);
}

- (id)clsUnprefetchedPersonLocalIdentifiers
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "clsPersonLocalIdentifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if ((objc_msgSend(a1, "clsIsScreenshotOrScreenRecording") & 1) == 0)
    {
      objc_msgSend(a1, "photoLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "librarySpecificFetchOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setPersonContext:", 1);
      objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsInAsset:options:", a1, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "localIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
              objc_msgSend(v3, "addObject:", v11);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);
      }

    }
    v2 = v3;
    objc_setAssociatedObject(a1, "clsPersonLocalIdentifiers", v2, (void *)1);
    v12 = (void *)MEMORY[0x24BDD16E0];
    v13 = objc_msgSend(v2, "count");

    objc_msgSend(v12, "numberWithUnsignedInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "clsPeopleCount", v14, (void *)1);

  }
  return v2;
}

- (uint64_t)clsPeopleCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "clsPeopleCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218242;
      v9 = a1;
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "clsPeopleCount not prefetched for asset %p %@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(a1, "clsUnprefetchedPersonLocalIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count");

  }
  return v4;
}

- (void)clsSetPeopleCount:()Curation
{
  objc_setAssociatedObject(a1, "clsPeopleCount", a3, (void *)1);
}

- (void)clsSetFaceInformationSummary:()Curation
{
  objc_setAssociatedObject(a1, "kCLSFaceInformationSummaryString", a3, (void *)1);
}

- (id)clsFaceInformationSummary
{
  void *v2;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "kCLSFaceInformationSummaryString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(a1, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134218242;
    v6 = a1;
    v7 = 2112;
    v8 = v4;
    _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "faceInformationSummary not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);

  }
  return v2;
}

- (void)clsSetProcessedSignals:()Curation
{
  objc_setAssociatedObject(a1, "kCLSProcessedSignalsString", a3, (void *)1);
}

- (id)clsProcessedSignals
{
  void *v2;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "kCLSProcessedSignalsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(a1, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134218242;
    v6 = a1;
    v7 = 2112;
    v8 = v4;
    _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "processedSignals not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);

  }
  return v2;
}

- (double)clsExposureScore
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "mediaAnalysisProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "exposureScore");
    v5 = v4;

  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (double)clsWallpaperScore
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "mediaAnalysisProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "wallpaperScore");
    v5 = v4;

  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (double)clsSharpnessScore
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "mediaAnalysisProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "blurrinessScore");
    v5 = v4;

  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (double)clsAestheticScore
{
  float v1;

  objc_msgSend(a1, "overallAestheticScore");
  return v1;
}

- (double)clsVideoScore
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "mediaAnalysisProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoScore");
    v5 = v4;

  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (double)clsActivityScore
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "mediaAnalysisProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityScore");
    v5 = v4;

  }
  else
  {
    v5 = 0.5;
  }

  return v5;
}

- (uint64_t)clsVideoFaceCount
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "mediaAnalysisProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "faceCount");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)clsFaceScore
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "clsFaceInformationSummary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "averageFaceQuality");
  v3 = v2;

  return v3;
}

- (id)clsSceneClassifications
{
  void *v2;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "clsSceneClassifications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "localIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 134218242;
      v6 = a1;
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "clsSceneClassifications not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);

    }
    objc_msgSend(a1, "sceneClassifications");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)clsSetSceneClassifications:()Curation
{
  objc_setAssociatedObject(a1, "clsSceneClassifications", a3, (void *)1);
}

- (uint64_t)clsVisualLookupSceneClassifications
{
  return objc_msgSend(a1, "sceneClassificationsOfTypes:", &unk_25149A718);
}

- (id)clsSceneprint
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, "clsSceneprint");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "sceneprintProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneprint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      v9 = v8;
      if (v3)
      {

        objc_setAssociatedObject(a1, "clsSceneprint", v3, (void *)1);
LABEL_13:

        return v3;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2112;
        v17 = v9;
        _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error unarchiving sceneprint for asset %@: %@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Sceneprint not available for asset %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "clsSceneprint", v11, (void *)1);

    v3 = 0;
    goto LABEL_13;
  }
  v3 = (void *)v2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {

    return 0;
  }
  return v3;
}

- (uint64_t)clsSimilarityModelVersion
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "curationModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "similarityModelVersion");

  return v2;
}

- (uint64_t)clsIsBlurry
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlurryWithAsset:", a1);

  return v3;
}

- (uint64_t)clsIsInhabited
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInhabitedWithAsset:", a1);

  return v3;
}

- (uint64_t)clsAvoidIfPossibleAsKeyItemForMemories:()Curation allowGuestAsset:
{
  return objc_msgSend(a1, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:reason:", a3, a4, 0);
}

- (uint64_t)clsAvoidIfPossibleAsKeyItemForMemories:()Curation allowGuestAsset:reason:
{
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _OWORD v13[6];

  if ((a4 & 1) != 0 || !objc_msgSend(a1, "clsIsGuestAsset"))
  {
    objc_msgSend(a1, "curationModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a3 && objc_msgSend(v9, "avoidIfPossibleForMemoryKeyAssetWithAsset:", a1))
    {
      if (a5)
        *a5 = CFSTR("Video");
      v8 = 1;
    }
    else
    {
      memset(v13, 0, sizeof(v13));
      v11 = objc_msgSend(v10, "avoidIfPossibleForKeyAssetWithAsset:statistics:", a1, v13);
      v8 = v11;
      if (a5 && (_DWORD)v11)
      {
        +[CLSCurationModel firstReasonForAvoidForKeyAssetFromStatistics:](CLSCurationModel, "firstReasonForAvoidForKeyAssetFromStatistics:", v13);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    if (a5)
      *a5 = CFSTR("Guest Asset");
    return 1;
  }
  return v8;
}

- (uint64_t)clsHasPoorResolution
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPoorResolutionWithAsset:", a1);

  return v3;
}

- (uint64_t)clsHasInterestingScenes
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasInterestingScenesWithAsset:", a1);

  return v3;
}

- (double)clsSquareCropScore
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v2, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0);
  return v2;
}

- (double)cropScoreForTargetAspectRatio:()Curation forFaces:
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v32;

  objc_msgSend(a1, "faceAreaMinX");
  v7 = v6;
  objc_msgSend(a1, "faceAreaMinY");
  v9 = v8;
  objc_msgSend(a1, "faceAreaMaxX");
  v11 = v10;
  objc_msgSend(a1, "faceAreaMaxY");
  v12 = v11 - v7;
  v14 = v13 - v9;
  v32 = 0.0;
  v15 = v7;
  v16 = v9;
  v17 = v12;
  v18 = v13 - v9;
  if ((a4 & 1) == 0)
  {
    objc_msgSend(a1, "acceptableCropRect");
    v15 = v19;
    v16 = v20;
    v17 = v21;
    v18 = v22;
  }
  v23 = (void *)MEMORY[0x24BE723E8];
  v24 = objc_msgSend(a1, "pixelWidth");
  v25 = objc_msgSend(a1, "pixelHeight");
  objc_msgSend(a1, "preferredCropRect");
  objc_msgSend(v23, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v24, v25, &v32, a2, 0.0, 0.0, 0.0, 0.0, v26, v27, v28, v29, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v18,
    *(_QWORD *)&v7,
    1.0 - (v9 + v14),
    *(_QWORD *)&v12,
    *(_QWORD *)&v14);
  return v32;
}

- (double)clsContentScore
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  objc_getAssociatedObject(a1, "clsCurationScore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
  }
  else
  {
    objc_msgSend(a1, "curationScore");
    if (v4 == 0.0)
    {
      objc_msgSend(a1, "curationModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scoreWithAsset:inContext:", a1, 0);
      v5 = v7;

      objc_msgSend(a1, "cacheCurationScore:", v5);
      goto LABEL_6;
    }
  }
  v5 = v4;
LABEL_6:

  return v5;
}

- (void)cacheCurationScore:()Curation
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsCurationScore", v2, (void *)1);

}

- (double)scoreInContext:()Curation
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "curationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scoreWithAsset:inContext:", a1, v4);
  v7 = v6;

  return v7;
}

- (uint64_t)clsIsInterestingVideo
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInterestingVideoWithAsset:", a1);

  return v3;
}

- (BOOL)clsIsLoopOrBounce
{
  return objc_msgSend(a1, "playbackVariation") - 1 < 2;
}

- (BOOL)clsIsLongExposure
{
  return objc_msgSend(a1, "playbackVariation") == 3;
}

- (double)clsAutoplaySuggestionScore
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "autoplaySuggestionScore");
  v3 = v2;

  return v3;
}

- (uint64_t)clsIsInterestingLivePhoto
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInterestingLivePhotoWithAsset:", a1);

  return v3;
}

- (uint64_t)clsIsInterestingPanorama
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInterestingPanoramaWithAsset:", a1);

  return v3;
}

- (uint64_t)clsIsInterestingSDOF
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInterestingSDOFWithAsset:", a1);

  return v3;
}

- (uint64_t)clsIsInterestingHDR
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInterestingHDRWithAsset:", a1);

  return v3;
}

- (uint64_t)clsHasInterestingAudioClassification
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasInterestingAudioClassificationWithAsset:", a1);

  return v3;
}

- (uint64_t)clsInterestingAudioClassifications
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interestingAudioClassificationsWithAsset:", a1);

  return v3;
}

- (uint64_t)clsHasCustomPlaybackVariation
{
  uint64_t result;

  result = objc_msgSend(a1, "isSubtype:", 8);
  if ((_DWORD)result)
    return objc_msgSend(a1, "playbackVariation") != 0;
  return result;
}

- (uint64_t)clsIsTragicFailure
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTragicFailureWithImageAsset:", a1);

  return v3;
}

- (uint64_t)prepareWithAlternateJunkingHeuristics:()Curation withContext:curationContext:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "curationModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v9, "userFeedbackCalculator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", a1, v12);

  }
  else
  {
    v13 = objc_msgSend(v10, "isUtilityWithAsset:", a1);
  }

  v14 = v13 ^ objc_msgSend(a1, "clsIsUtility");
  if ((_DWORD)v14 == 1)
  {
    objc_msgSend(a1, "clsCacheIsUtility:", v13);
    objc_msgSend(a1, "scoreInContext:", v8);
    v16 = v15;
    objc_msgSend(a1, "curationScore");
    if (v16 != v17)
      objc_msgSend(a1, "cacheCurationScore:", v16);
  }

  return v14;
}

- (BOOL)clsPersonLocalIdentifiersArePrefetched
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, "clsPersonLocalIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)clsPeopleCountIsPrefetched
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, "clsPeopleCount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)clsSceneClassificationsArePrefetched
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, "clsSceneClassifications");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)clsFaceInformationArePrefetched
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, "kCLSFaceInformationSummaryString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

+ (uint64_t)clsPrefetchOptionsForKeyAsset
{
  return 13;
}

+ (BOOL)isScore:()Curation closeToValue:
{
  return vabdd_f64(a1, a2) < 0.00001;
}

+ (id)_personUUIDsByAssetUUIDWithAssets:()Curation personUUIDs:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "uuid", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    objc_msgSend(v9, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_personUUIDsByAssetUUIDWithAssetUUIDs:personUUIDs:photoLibrary:", v8, v7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v17;
}

+ (id)_personUUIDsByAssetUUIDWithAssetUUIDs:()Curation personUUIDs:photoLibrary:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    if (!v8)
    {
      objc_msgSend(v9, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("personForFace.type"), 0xFFFFFFFFLL);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInternalPredicate:", v14);

      objc_msgSend(MEMORY[0x24BDE35E0], "fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v7, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v9, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personForFace.personUUID"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInternalPredicate:", v11);

      objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v7, v10);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = (void *)v12;

      goto LABEL_8;
    }
  }
  v13 = (void *)MEMORY[0x24BDBD1B8];
LABEL_8:

  return v13;
}

+ (id)_petUUIDsByAssetUUIDWithAssetUUIDs:()Curation photoLibrary:
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIncludedDetectionTypes:", &unk_25149A730);
    objc_msgSend(MEMORY[0x24BDE35E0], "fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v8;
}

+ (id)verifiedPersonLocalIdentifiersByAssetUUIDWithAssets:()Curation
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "_personUUIDsByAssetUUIDWithAssets:personUUIDs:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __73__PHAsset_Curation__verifiedPersonLocalIdentifiersByAssetUUIDWithAssets___block_invoke;
    v8[3] = &unk_25147FFA0;
    v9 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  return v5;
}

+ (id)_filterPersonUUIDs:()Curation fromPersonUUIDsByAssetUUID:personUUIDByMergeCandidateUUID:
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __98__PHAsset_Curation___filterPersonUUIDs_fromPersonUUIDsByAssetUUID_personUUIDByMergeCandidateUUID___block_invoke;
    v15[3] = &unk_25147FFC8;
    v16 = v7;
    v17 = v9;
    v11 = v10;
    v18 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
    v12 = v18;
    v13 = v11;

  }
  else
  {
    v13 = (id)MEMORY[0x24BDBD1B8];
  }

  return v13;
}

+ (void)_populateAsset:()Curation withPersonUUIDs:consolidatedPersonUUIDs:petUUIDs:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a4;
  v9 = a5;
  v10 = a6;
  v11 = a3;
  if (objc_msgSend(v11, "clsIsScreenshotOrScreenRecording"))
  {
    v12 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v11, "clsSetPersonLocalIdentifiers:", MEMORY[0x24BDBD1A8]);
    objc_msgSend(v11, "clsSetConsolidatedPersonLocalIdentifiers:", v12);
    objc_msgSend(v11, "clsSetPetLocalIdentifiers:", v12);
  }
  else
  {
    objc_msgSend(v23, "_pl_map:", &__block_literal_global_193);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = MEMORY[0x24BDBD1A8];
    if (v13)
      v16 = v13;
    else
      v16 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v11, "clsSetPersonLocalIdentifiers:", v16);
    objc_msgSend(v9, "_pl_map:", &__block_literal_global_194);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = v17;
    else
      v19 = v15;
    objc_msgSend(v11, "clsSetConsolidatedPersonLocalIdentifiers:", v19);
    objc_msgSend(v10, "_pl_map:", &__block_literal_global_195);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = v20;
    else
      v22 = v15;
    objc_msgSend(v11, "clsSetPetLocalIdentifiers:", v22);

    v11 = v14;
  }

}

+ (id)clsAllAssetsFromFetchResult:()Curation prefetchOptions:curationContext:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "count"))
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_11;
  }
  v10 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(v8, "fetchedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 0);

  if ((a4 & 4) != 0
    && (objc_msgSend(v8, "fetchPropertySets"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x24BDE3750]),
        v13,
        (v14 & 1) == 0)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Asking for scene information but sceneAnalysisVersion is not available", buf, 2u);
    if ((a4 & 8) != 0)
      goto LABEL_6;
  }
  else if ((a4 & 8) != 0)
  {
LABEL_6:
    objc_msgSend(v8, "fetchPropertySets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", *MEMORY[0x24BDE3700]);

    if ((v16 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Asking for face information but faceAnalysisVersion is not available", v18, 2u);
    }
  }
  objc_msgSend(a1, "prefetchOnAssets:options:curationContext:", v12, a4, v9);
LABEL_11:

  return v12;
}

+ (void)prefetchScenesOnAssets:()Curation
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE3648], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:sceneClassificationType:includeTemporalClassifications:", v3, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v5, "localIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v31 = i;
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "clsSetSceneClassifications:");
          v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v29 = v5;
          objc_msgSend(v5, "curationModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sceneModel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v30 = v7;
          v11 = v7;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v33 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                v17 = objc_msgSend(v16, "extendedSceneIdentifier");
                if ((objc_msgSend(v10, "isResponsibleForSignalIdentifier:", v17) & 1) == 0)
                {
                  v18 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v16, "confidence");
                  objc_msgSend(v18, "numberWithDouble:");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v17);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v20);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v13);
          }

          objc_msgSend(v29, "curationModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "processedSignalsFromSignals:", v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "clsSetProcessedSignals:", v22);
          v7 = v30;
          i = v31;
          v23 = (id)v28;
        }
        else
        {
          v23 = objc_alloc_init(MEMORY[0x24BDBCF20]);
          objc_msgSend(v5, "clsSetSceneClassifications:", v23);
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

}

+ (void)prefetchOnAssets:()Curation options:curationContext:
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CLSAssetProcessedSignals *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id obj;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  int v98;
  int v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *contextb;
  void *context;
  void *contexta;
  void *contextc;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t buf[4];
  void *v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v83 = a5;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_68;
  if ((a4 & 3) != 0)
  {
    v98 = objc_msgSend(v8, "clsPeopleCountIsPrefetched") ^ 1;
    if ((a4 & 0x10) == 0)
      goto LABEL_4;
  }
  else
  {
    v98 = 0;
    if ((a4 & 0x10) == 0)
    {
LABEL_4:
      v10 = 0;
      if ((a4 & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v97 = 0;
      if ((a4 & 8) != 0)
        goto LABEL_6;
LABEL_10:
      v99 = 0;
      goto LABEL_11;
    }
  }
  v10 = objc_msgSend(v8, "canUseLocationCoordinateForLocation") ^ 1;
  if ((a4 & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v97 = objc_msgSend(v8, "clsSceneClassificationsArePrefetched") ^ 1;
  if ((a4 & 8) == 0)
    goto LABEL_10;
LABEL_6:
  v99 = objc_msgSend(v8, "clsFaceInformationArePrefetched") ^ 1;
LABEL_11:
  if (((v98 | v10 | v97) & 1) != 0 || v99)
  {
    v93 = v10;
    if ((a4 & 0xC) != 0)
    {
      objc_msgSend(v7, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasCurationModel");

      if ((v12 & 1) == 0)
      {
        v13 = (void *)MEMORY[0x249506444]();
        objc_msgSend(v83, "curationSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "prepareAssets:", v7);

        objc_autoreleasePoolPop(v13);
      }
    }
    if ((v98 | v99) == 1)
    {
      contextb = (void *)MEMORY[0x249506444]();
      objc_msgSend(v83, "personUUIDByMergeCandidateUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "verifiedPersonUUIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "hiddenOrBlockedPersonUUIDs");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v15, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v21, "unionSet:", v16);
      v80 = (void *)v17;
      objc_msgSend(v21, "unionSet:", v17);
      objc_msgSend(v21, "unionSet:", v20);
      v74 = (void *)v20;
      objc_msgSend(v16, "setByAddingObjectsFromSet:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_pl_map:", &__block_literal_global_199);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_personUUIDsByAssetUUIDWithAssetUUIDs:personUUIDs:photoLibrary:", v23, v21, v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v16;
      objc_msgSend(a1, "_filterPersonUUIDs:fromPersonUUIDsByAssetUUID:personUUIDByMergeCandidateUUID:", v16, v24, 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v15;
      objc_msgSend(a1, "_filterPersonUUIDs:fromPersonUUIDsByAssetUUID:personUUIDByMergeCandidateUUID:", v22, v24, v15);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_petUUIDsByAssetUUIDWithAssetUUIDs:photoLibrary:", v23, v9);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(contextb);
    }
    else
    {
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v74 = 0;
      v80 = 0;
      v81 = 0;
      v82 = 0;
    }
    v76 = v9;
    v77 = v7;
    v75 = v8;
    if (v99)
    {
      v104 = (void *)MEMORY[0x249506444]();
      objc_msgSend(v9, "librarySpecificFetchOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setIncludedDetectionTypes:", &unk_25149A748);
      objc_msgSend(v25, "setIncludeTorsoAndFaceDetectionData:", 1);
      objc_msgSend(v25, "setWantsIncrementalChangeDetails:", 0);
      v101 = v25;
      objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v7, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      v79 = v26;
      objc_msgSend(v26, "objectEnumerator");
      context = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(context, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v120;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v120 != v30)
              objc_enumerationMutation(context);
            v32 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
            v33 = (void *)MEMORY[0x249506444]();
            if (objc_msgSend(v32, "count"))
            {
              v34 = 0;
              do
              {
                v35 = (void *)MEMORY[0x249506444]();
                objc_msgSend(v32, "objectAtIndexedSubscript:", v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "uuid");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v37);

                objc_autoreleasePoolPop(v35);
                ++v34;
              }
              while (v34 < objc_msgSend(v32, "count"));
            }
            objc_autoreleasePoolPop(v33);
          }
          v29 = objc_msgSend(context, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
        }
        while (v29);
      }

      objc_msgSend(MEMORY[0x24BDE3540], "detectionTraitsByFaceLocalIdentifierForFaceUUIDs:photoLibrary:", v27, v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v104);
      v7 = v77;
    }
    else
    {
      v78 = 0;
      v79 = 0;
    }
    if (v97)
    {
      v38 = (void *)MEMORY[0x249506444]();
      objc_msgSend(MEMORY[0x24BDE3648], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:sceneClassificationType:includeTemporalClassifications:", v7, 0, 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v38);
    }
    else
    {
      v84 = 0;
    }
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    obj = v7;
    v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
    if (v100)
    {
      v92 = *(_QWORD *)v116;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v116 != v92)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)v39);
          objc_msgSend(v40, "uuid");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "objectForKeyedSubscript:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "objectForKeyedSubscript:", v41);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v98)
            objc_msgSend(a1, "_populateAsset:withPersonUUIDs:consolidatedPersonUUIDs:petUUIDs:", v40, v42, v43, v44);
          if (v93)
            objc_msgSend(v40, "setCanUseLocationCoordinateForLocation:", 1);
          if (v97)
          {
            objc_msgSend(v40, "localIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "objectForKeyedSubscript:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            v91 = v46;
            if (v46)
            {
              v89 = v44;
              v90 = v41;
              v102 = v43;
              v105 = v42;
              contexta = v39;
              objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v46);
              v87 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "clsSetSceneClassifications:");
              v47 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v88 = v40;
              objc_msgSend(v40, "curationModel");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "sceneModel");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              v113 = 0u;
              v114 = 0u;
              v111 = 0u;
              v112 = 0u;
              v50 = v46;
              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
              if (v51)
              {
                v52 = v51;
                v53 = *(_QWORD *)v112;
                do
                {
                  for (j = 0; j != v52; ++j)
                  {
                    if (*(_QWORD *)v112 != v53)
                      objc_enumerationMutation(v50);
                    v55 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
                    v56 = objc_msgSend(v55, "extendedSceneIdentifier");
                    if ((objc_msgSend(v49, "isResponsibleForSignalIdentifier:", v56) & 1) == 0)
                    {
                      v57 = (void *)MEMORY[0x24BDD16E0];
                      objc_msgSend(v55, "confidence");
                      objc_msgSend(v57, "numberWithDouble:");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v56);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "setObject:forKeyedSubscript:", v58, v59);

                    }
                  }
                  v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
                }
                while (v52);
              }

              v40 = v88;
              objc_msgSend(v88, "curationModel");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "processedSignalsFromSignals:", v47);
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v88, "clsSetProcessedSignals:", v61);
              v42 = v105;
              v39 = contexta;
              v44 = v89;
              v41 = v90;
              v43 = v102;
              v62 = (CLSAssetProcessedSignals *)v87;
            }
            else
            {
              v63 = objc_alloc_init(MEMORY[0x24BDBCF20]);
              objc_msgSend(v40, "clsSetSceneClassifications:", v63);

              v62 = objc_alloc_init(CLSAssetProcessedSignals);
              objc_msgSend(v40, "clsSetProcessedSignals:", v62);
            }

          }
          if (v99)
          {
            if (objc_msgSend(v40, "faceAnalysisVersionWasFetched"))
            {
              objc_msgSend(v83, "userFeedbackCalculator");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "localIdentifier");
              contextc = v39;
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "objectForKeyedSubscript:", v65);
              v106 = v42;
              v66 = v41;
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "fetchedObjects");
              v103 = v43;
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v40, "curationModel");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "clsIdentifier");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "faceInformationSummaryWithFaces:detectionTraitsByFaceLocalIdentifier:verifiedPersonUUIDs:hiddenPersonUUIDs:personUUIDByMergeCandidateUUID:userFeedbackCalculator:assetUUID:", v68, v78, v81, v80, v82, v64, v70);
              v71 = v44;
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = v66;
              v42 = v106;

              v39 = contextc;
              objc_msgSend(v40, "clsSetFaceInformationSummary:", v72);

              v44 = v71;
              v43 = v103;
LABEL_61:

              goto LABEL_63;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v40, "uuid");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v124 = v64;
              goto LABEL_61;
            }
          }
LABEL_63:

          v39 = (char *)v39 + 1;
        }
        while (v39 != (void *)v100);
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
        v100 = v73;
      }
      while (v73);
    }

    v9 = v76;
    v7 = v77;
    v8 = v75;
  }
LABEL_68:

}

@end
