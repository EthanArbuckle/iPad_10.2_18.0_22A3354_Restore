@implementation PLVideoChoosingAndAvailabilitySupport

- (PLVideoChoosingAndAvailabilitySupport)initWithContext:(id)a3 assetInformation:(id)a4 options:(id)a5 size:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  id v14;
  PLVideoChoosingAndAvailabilitySupport *v15;
  PLVideoChoosingAndAvailabilitySupport *v16;
  NSMutableArray *v17;
  NSMutableArray *resourcesNeedingRepair;
  objc_super v20;

  height = a6.height;
  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PLVideoChoosingAndAvailabilitySupport;
  v15 = -[PLVideoChoosingAndAvailabilitySupport init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_assetInformation, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    v16->_size.width = width;
    v16->_size.height = height;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resourcesNeedingRepair = v16->_resourcesNeedingRepair;
    v16->_resourcesNeedingRepair = v17;

  }
  return v16;
}

- (NSArray)resourcesNeedingRepair
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_resourcesNeedingRepair, "copy");
}

- (id)_acceptableResourceVersions
{
  int v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = -[PLVideoChoosingAssetInformation hasAdjustments](self->_assetInformation, "hasAdjustments");
  v4 = -[PLVideoChoosingOptions videoVersion](self->_options, "videoVersion");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    if ((-[PLVideoChoosingAssetInformation shouldUseNonAdjustedVersion](self->_assetInformation, "shouldUseNonAdjustedVersion") & 1) != 0)return &unk_1E37640B8;
    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    v6 = &unk_1E3764118;
    v7 = &unk_1E3764100;
    goto LABEL_11;
  }
  if (v4 != 1)
    return &unk_1E3764130;
  v6 = &unk_1E37640E8;
  v7 = &unk_1E37640D0;
LABEL_11:
  if (v3)
    v6 = v7;
  return v6;
}

- (unsigned)_videoQualityLevelForRequestFallbackToMediumPolicy:(int64_t *)a3
{
  unsigned int v5;
  NSObject *v6;
  __CFString *v7;
  double width;
  double v9;
  BOOL v10;
  double height;
  double v12;
  int64_t v13;
  __CFString *v14;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_videoQualityLevelForRequestFallbackToMediumPolicy__onceToken != -1)
    dispatch_once(&_videoQualityLevelForRequestFallbackToMediumPolicy__onceToken, &__block_literal_global_95223);
  if (_videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum)
  {
    v5 = objc_msgSend((id)_videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum, "unsignedIntValue");
    PLImageManagerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 3)
        v7 = CFSTR("large");
      else
        v7 = off_1E3662220[v5];
      v14 = v7;
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Forcing video quality level to %@", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    if (-[PLVideoChoosingOptions videoDeliveryMode](self->_options, "videoDeliveryMode") != 3
      || ((width = self->_size.width, v9 = self->_size.height, width == *MEMORY[0x1E0C9D820])
        ? (v10 = v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
        : (v10 = 0),
          v10))
    {
      v13 = -[PLVideoChoosingOptions videoDeliveryMode](self->_options, "videoDeliveryMode");
      v5 = 0;
      switch(v13)
      {
        case 0:
          break;
        case 2:
          v13 = 0;
          v5 = 3;
          break;
        case 3:
          if ((unint64_t)(+[PLPrefetchConfiguration defaultPrefetchOptimizeMode](PLPrefetchConfiguration, "defaultPrefetchOptimizeMode")- 1) >= 2)goto LABEL_24;
          goto LABEL_23;
        case 4:
LABEL_23:
          v13 = 0;
          v5 = 1;
          break;
        default:
          goto LABEL_24;
      }
    }
    else
    {
      if (width >= v9)
        height = self->_size.height;
      else
        height = self->_size.width;
      -[PLVideoResourceContext sizeThresholdForHighQuality](self->_context, "sizeThresholdForHighQuality");
      if (height <= v12)
      {
LABEL_24:
        v13 = -[PLVideoChoosingOptions isMediumHighQualityAllowed](self->_options, "isMediumHighQualityAllowed");
        if ((_DWORD)v13)
          v5 = 1;
        else
          v5 = 2;
      }
      else
      {
        v13 = 0;
        v5 = 0;
      }
    }
    if (a3)
      *a3 = v13;
  }
  return v5;
}

- (id)_ensureOriginalsAreHighestQuality:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isOriginalVideoComplement", (_QWORD)v14) & 1) != 0
          || objc_msgSend(v11, "isOriginalVideo"))
        {
          v12 = v11;

          v8 = v12;
        }
        else
        {
          objc_msgSend(v4, "addObject:", v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);

    if (v8)
      objc_msgSend(v4, "addObject:", v8);
  }
  else
  {

    v8 = 0;
  }

  return v4;
}

- (BOOL)_checkIsReallyLocallyAvailableAndAddToRepairListIfNeeded:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  uint8_t v8[16];

  v4 = a3;
  v5 = -[PLVideoResourceContext validateResource:](self->_context, "validateResource:", v4);
  if ((v5 & 1) == 0)
  {
    PLImageManagerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Video resource local availability is incorrect", v8, 2u);
    }

    -[NSMutableArray addObject:](self->_resourcesNeedingRepair, "addObject:", v4);
  }

  return v5;
}

- (int64_t)_optimalLoadingModeForResource:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "isLocallyAvailable")
    && -[PLVideoChoosingAndAvailabilitySupport _checkIsReallyLocallyAvailableAndAddToRepairListIfNeeded:](self, "_checkIsReallyLocallyAvailableAndAddToRepairListIfNeeded:", v4)&& !-[PLVideoChoosingOptions restrictToStreamable](self->_options, "restrictToStreamable"))
  {
    v5 = 5;
  }
  else if (objc_msgSend(v4, "isLocallyGeneratable")
         && !-[PLVideoChoosingOptions restrictToStreamable](self->_options, "restrictToStreamable"))
  {
    v5 = 4;
  }
  else if (-[PLVideoChoosingOptions isStreamingAllowed](self->_options, "isStreamingAllowed")
         && objc_msgSend(v4, "isStreamable")
         && !_resourceIsOriginalSlomo(v4, self->_assetInformation))
  {
    v5 = 3;
  }
  else if (objc_msgSend(v4, "isDownloadable")
         && (-[PLVideoChoosingOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed") & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(v4, "isDownloadable"))
  {
    v5 = -[PLVideoChoosingOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed") ^ 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)chooseResourceWithLoadingMode:(int64_t *)a3 needsAdjustmentData:(BOOL *)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PLVideoPlaybackResourceChoiceOptimizer *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PLVideoStreamingResourceChoiceOptimizer *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  _BOOL4 v43;
  int64_t v44;
  id v45;
  NSObject *v46;
  int v47;
  int v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  int v61;
  void *v62;
  int v63;
  NSObject *log;
  unsigned int v65;
  void *v66;
  void *v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  -[PLVideoChoosingAndAvailabilitySupport _acceptableResourceVersions](self, "_acceptableResourceVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLVideoResourceContext videoResourcesMatchingVersions:](self->_context, "videoResourcesMatchingVersions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v88 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("zero videos found matching resource versions: %@"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 47017, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  if (objc_msgSend(v7, "count")
    && -[PLVideoChoosingOptions restrictToPlayableOnCurrentDevice](self->_options, "restrictToPlayableOnCurrentDevice"))
  {
    v14 = -[PLVideoPlaybackResourceChoiceOptimizer initWithVideoResources:]([PLVideoPlaybackResourceChoiceOptimizer alloc], "initWithVideoResources:", v7);
    -[PLVideoPlaybackResourceChoiceOptimizer preferredVideoResources](v14, "preferredVideoResources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v15, "count"))
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D74498];
      v86[0] = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("zero playable videos found"));
      v18 = v8;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v86[1] = CFSTR("PLZeroPlayableVideosErrorKey");
      v87[0] = v19;
      v87[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 47017, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v21;
    }

    v7 = v15;
  }
  if (objc_msgSend(v7, "count")
    && -[PLVideoChoosingOptions restrictToStreamable](self->_options, "restrictToStreamable"))
  {
    v22 = -[PLVideoStreamingResourceChoiceOptimizer initWithVideoResources:]([PLVideoStreamingResourceChoiceOptimizer alloc], "initWithVideoResources:", v7);
    -[PLVideoStreamingResourceChoiceOptimizer preferredVideoResources](v22, "preferredVideoResources");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v23, "count"))
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D74498];
      v84[0] = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("zero streamable videos found"));
      v26 = v8;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = CFSTR("PLZeroStreamableVideosErrorKey");
      v85[0] = v27;
      v85[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 47017, v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v29;
    }

    v7 = v23;
  }
  if (objc_msgSend(v7, "count"))
  {
    v71 = 0;
    v30 = -[PLVideoChoosingAndAvailabilitySupport _videoQualityLevelForRequestFallbackToMediumPolicy:](self, "_videoQualityLevelForRequestFallbackToMediumPolicy:", &v71);
    -[PLVideoChoosingAndAvailabilitySupport _ensureOriginalsAreHighestQuality:](self, "_ensureOriginalsAreHighestQuality:", v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "lastObject");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v30;
    if (v30 <= 1
      && (-[PLVideoChoosingOptions isStreamingAllowed](self->_options, "isStreamingAllowed") & 1) == 0
      && -[PLVideoChoosingOptions hasValidTimeRange](self->_options, "hasValidTimeRange")
      && _resourceIsOriginalSlomo(v70, self->_assetInformation))
    {
      v71 = 1;
    }
    objc_msgSend(v31, "reverseObjectEnumerator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "nextObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = v33;
      v35 = 0;
      v36 = 0;
      v66 = v6;
      while (1)
      {
        v37 = (void *)v34;
        while (objc_msgSend(v37, "storeClassID") == 3
             && ((objc_msgSend(v37, "isOriginalVideo") & 1) != 0
              || objc_msgSend(v37, "isOriginalVideoComplement"))
             && (-[PLVideoChoosingOptions isExplicitUserAction](self->_options, "isExplicitUserAction") & 1) == 0)
        {
          PLImageManagerGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "Skipping syndication original video, because the request intent is not a user click", buf, 2u);
          }

          objc_msgSend(v32, "nextObject");
          v39 = objc_claimAutoreleasedReturnValue();

          v37 = (void *)v39;
          if (!v39)
            goto LABEL_58;
        }
        if (v71 && objc_msgSend(v37, "matchesOrExceedsQualityLevel:", 2))
        {
          v40 = v71 == 1 ? objc_msgSend(v35, "isLargeQuality") : 0;
          v41 = 1;
        }
        else
        {
          v41 = 0;
          v40 = 0;
        }
        if (v37 != v70 && (v41 | objc_msgSend(v37, "matchesOrExceedsQualityLevel:", v65)) != 1)
          break;
        v42 = -[PLVideoChoosingAndAvailabilitySupport _optimalLoadingModeForResource:](self, "_optimalLoadingModeForResource:", v37);
        v43 = v42 > v36;
        if (!v40)
          v43 = v42 >= v36;
        if (v43)
        {
          v44 = v42;
          if (v42 < 1)
          {
            v36 = v42;
          }
          else
          {
            v45 = v37;

            v36 = v44;
            v35 = v45;
          }
        }
        v6 = v66;
        if ((objc_msgSend(v37, "isLocallyAvailable") & 1) == 0
          && (objc_msgSend(v37, "isStreamable") & 1) == 0
          && (objc_msgSend(v37, "isDownloadable") & 1) == 0
          && (objc_msgSend(v37, "isLocallyGeneratable") & 1) == 0)
        {
          PLImageManagerGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            -[PLVideoChoosingAssetInformation uuid](self->_assetInformation, "uuid");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v37, "isLocallyAvailable");
            log = v46;
            v47 = objc_msgSend(v37, "isStreamable");
            v61 = objc_msgSend(v37, "isDownloadable");
            v48 = objc_msgSend(v37, "isLocallyGeneratable");
            *(_DWORD *)buf = 138544386;
            v75 = v62;
            v76 = 1024;
            v77 = v63;
            v78 = 1024;
            v79 = v47;
            v46 = log;
            v80 = 1024;
            v81 = v61;
            v6 = v66;
            v82 = 1024;
            v83 = v48;
            _os_log_impl(&dword_199541000, log, OS_LOG_TYPE_ERROR, "Asset %{public}@ video resource is inaccessible (available=%d, streamable=%d, downloadable=%d, generatable=%d", buf, 0x24u);

          }
          -[NSMutableArray addObject:](self->_resourcesNeedingRepair, "addObject:", v37);
        }
        objc_msgSend(v32, "nextObject");
        v34 = objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          v37 = 0;
          goto LABEL_58;
        }
      }
      v6 = v66;
LABEL_58:
      if (v35)
        goto LABEL_64;
    }
    else
    {
      v37 = 0;
      v36 = 0;
    }
    if (!-[PLVideoChoosingOptions videoVersion](self->_options, "videoVersion")
      && -[PLVideoChoosingAssetInformation hasAdjustments](self->_assetInformation, "hasAdjustments")
      && -[PLVideoChoosingAssetInformation isPhotoIris](self->_assetInformation, "isPhotoIris"))
    {
      -[PLVideoResourceContext onDemandInstallAdjustedFullSizeVideoComplementResourceIfPresent](self->_context, "onDemandInstallAdjustedFullSizeVideoComplementResourceIfPresent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
LABEL_64:

    goto LABEL_65;
  }
  v36 = 0;
  v35 = 0;
  v31 = v7;
LABEL_65:
  if (!objc_msgSend(v31, "count")
    && !-[PLVideoChoosingOptions videoVersion](self->_options, "videoVersion")
    && -[PLVideoChoosingAssetInformation hasAdjustments](self->_assetInformation, "hasAdjustments")
    && (-[PLVideoChoosingAssetInformation shouldUseNonAdjustedVersion](self->_assetInformation, "shouldUseNonAdjustedVersion") & 1) == 0&& -[PLVideoChoosingAssetInformation isOriginalSlomo](self->_assetInformation, "isOriginalSlomo"))
  {
    -[PLVideoResourceContext videoResourcesMatchingVersions:](self->_context, "videoResourcesMatchingVersions:", &unk_1E3764148);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "indexOfObjectPassingTest:", &__block_literal_global_72_95212);
    if (v50 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v51 = v50;
      PLImageManagerGetLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        -[PLVideoChoosingAssetInformation uuid](self->_assetInformation, "uuid");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v75 = v53;
        _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_ERROR, "Slomo asset (%{public}@) with non-standard adjustment format is missing renders, optimistically returning original video and adjustment data", buf, 0xCu);

      }
      objc_msgSend(v49, "objectAtIndexedSubscript:", v51);
      v54 = objc_claimAutoreleasedReturnValue();

      v36 = -[PLVideoChoosingAndAvailabilitySupport _optimalLoadingModeForResource:](self, "_optimalLoadingModeForResource:", v54);
      v35 = (void *)v54;
    }

  }
  if (v35)
  {
    if (_resourceIsOriginalSlomo(v35, self->_assetInformation))
    {
      v55 = -[PLVideoChoosingOptions videoVersion](self->_options, "videoVersion") == 0;
      goto LABEL_81;
    }
  }
  else if (!v8)
  {
    v56 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0D74498];
    v72[0] = *MEMORY[0x1E0CB2938];
    v72[1] = CFSTR("PLZeroPlayableVideosErrorKey");
    v73[0] = CFSTR("chooser found zero valid videos");
    v73[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, 47017, v58);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v55 = 0;
LABEL_81:
  if (a3)
    *a3 = v36;
  if (a4)
    *a4 = v55;
  if (a5)
    *a5 = objc_retainAutorelease(v8);
  v59 = v35;

  return v59;
}

- (PLVideoResourceContext)context
{
  return self->_context;
}

- (PLVideoChoosingAssetInformation)assetInformation
{
  return self->_assetInformation;
}

- (PLVideoChoosingOptions)options
{
  return self->_options;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetInformation, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourcesNeedingRepair, 0);
}

uint64_t __97__PLVideoChoosingAndAvailabilitySupport_chooseResourceWithLoadingMode_needsAdjustmentData_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOriginalVideo");
}

void __92__PLVideoChoosingAndAvailabilitySupport__videoQualityLevelForRequestFallbackToMediumPolicy___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PLForceVideoQualityLevel"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum;
  _videoQualityLevelForRequestFallbackToMediumPolicy__forceVideoQualityLevelNum = v0;

}

@end
