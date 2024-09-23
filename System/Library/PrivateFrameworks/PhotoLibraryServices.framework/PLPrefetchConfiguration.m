@implementation PLPrefetchConfiguration

- (PLPrefetchConfiguration)initWithPrefetchDictionary:(id)a3
{
  id v4;
  char *v5;
  PLPrefetchConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPrefetchConfiguration;
  v5 = -[PLPrefetchConfiguration init](&v8, sel_init);
  v6 = (PLPrefetchConfiguration *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_199B9FDA0;
    *((_DWORD *)v5 + 6) = 655560;
    *((_OWORD *)v5 + 2) = xmmword_199B9FDB0;
    *((_OWORD *)v5 + 3) = xmmword_199B9FDC0;
    *((_QWORD *)v5 + 9) = 0x3FB999999999999ALL;
    *((_OWORD *)v5 + 5) = xmmword_199B9FDD0;
    *((_QWORD *)v5 + 12) = 86400;
    if (v4)
      objc_msgSend(v5, "updateValuesFromPrefetchDictionary:", v4);
    -[PLPrefetchConfiguration updateValuesFromTrialIfNecessary](v6, "updateValuesFromTrialIfNecessary");
  }

  return v6;
}

- (void)updateValuesFromPrefetchDictionary:(id)a3
{
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
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("iOS"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryMaxPrefetchPhotosCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryMaxPrefetchPhotosCount"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_memoryMaxPrefetchPhotosCount = objc_msgSend(v5, "integerValue");

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryMaxPrefetchVideosCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryMaxPrefetchVideosCount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_memoryMaxPrefetchVideosCount = objc_msgSend(v7, "integerValue");

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryPrefetchLimit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryPrefetchLimit"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_memoryPrefetchLimit = objc_msgSend(v9, "integerValue");

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("maxFileSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("maxFileSize"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_cloudResourcePrefetchMaxFileSize = objc_msgSend(v11, "integerValue");

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("initialMinimumFreeDiskSpaceForOptimizeRatio"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("initialMinimumFreeDiskSpaceForOptimizeRatio"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      self->_cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio = v14;

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("maximumSmallLibraryThreshold"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("maximumSmallLibraryThreshold"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_cloudResourceMaximumSmallLibraryThreshold = objc_msgSend(v16, "integerValue");

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryPrefetchAllowedIfLastViewedDateWithin"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryPrefetchAllowedIfLastViewedDateWithin"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      self->_memoryPrefetchAllowedIfLastViewedDateWithin = objc_msgSend(v18, "integerValue");

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryPrefetchIfCreationDateWithin"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("memoryPrefetchIfCreationDateWithin"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      self->_memoryPrefetchIfCreationDateWithin = objc_msgSend(v20, "integerValue");

    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("computeSyncMaxPrefetch"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("computeSyncMaxPrefetch"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      self->_cloudResourceComputeSyncMaxResourcesPerFetch = objc_msgSend(v22, "integerValue");

    }
  }

}

- (unint64_t)smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:(int64_t)a3 availableSpace:(int64_t)a4 overrideMaximumThresholdGB:(int64_t)a5
{
  int64_t cloudResourceMaximumSmallLibraryThreshold;
  double v6;

  if (a5 < 1)
    cloudResourceMaximumSmallLibraryThreshold = self->_cloudResourceMaximumSmallLibraryThreshold;
  else
    cloudResourceMaximumSmallLibraryThreshold = a5 << 30;
  v6 = self->_cloudResourceSmallLibraryThresholdRatio * (double)(a4 + a3);
  if (v6 >= (double)cloudResourceMaximumSmallLibraryThreshold)
    return (unint64_t)(double)cloudResourceMaximumSmallLibraryThreshold;
  return (unint64_t)v6;
}

- (int64_t)prefetchOptimizeModeForTotalSizeOfOriginalResources:(int64_t)a3 totalSizeOfLocallyAvailableOriginalResources:(int64_t)a4 availableSpace:(int64_t)a5 overrideMaximumSmallLibraryThresholdGB:(int64_t)a6 nonThumbnailsBudget:(int64_t)a7
{
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  int64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = -[PLPrefetchConfiguration smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumThresholdGB:](self, "smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumThresholdGB:", a4, a5, a6);
  if ((a4 | a3) < 0)
    return objc_msgSend((id)objc_opt_class(), "_defaultPrefetchOptimizeMode");
  v11 = v10;
  if (v10 < a3 || a3 - a4 > a7)
    return objc_msgSend((id)objc_opt_class(), "_defaultPrefetchOptimizeMode");
  PLResourceCachingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    +[PLPrefetchConfiguration descriptionForPrefetchOptimizeMode:](PLPrefetchConfiguration, "descriptionForPrefetchOptimizeMode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218498;
    v16 = a3;
    v17 = 2048;
    v18 = v11;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Library size %lld smaller than small-size threshold %lld, setting prefetch optimize mode to %@", (uint8_t *)&v15, 0x20u);

  }
  return 2;
}

- (unsigned)memoryMaxPrefetchPhotosCount
{
  return self->_memoryMaxPrefetchPhotosCount;
}

- (void)setMemoryMaxPrefetchPhotosCount:(unsigned __int16)a3
{
  self->_memoryMaxPrefetchPhotosCount = a3;
}

- (unsigned)memoryMaxPrefetchVideosCount
{
  return self->_memoryMaxPrefetchVideosCount;
}

- (void)setMemoryMaxPrefetchVideosCount:(unsigned __int16)a3
{
  self->_memoryMaxPrefetchVideosCount = a3;
}

- (unint64_t)cloudResourcePrefetchMaxFileSize
{
  return self->_cloudResourcePrefetchMaxFileSize;
}

- (void)setCloudResourcePrefetchMaxFileSize:(unint64_t)a3
{
  self->_cloudResourcePrefetchMaxFileSize = a3;
}

- (unsigned)cloudResourceMaxPrefetchRetry
{
  return self->_cloudResourceMaxPrefetchRetry;
}

- (unsigned)memoryPrefetchLimit
{
  return self->_memoryPrefetchLimit;
}

- (void)setMemoryPrefetchLimit:(unsigned __int16)a3
{
  self->_memoryPrefetchLimit = a3;
}

- (unsigned)cloudResourceThumbnailsMaxResourcesPerFetch
{
  return self->_cloudResourceThumbnailsMaxResourcesPerFetch;
}

- (unsigned)cloudResourceMemoriesMaxResourcesPerFetch
{
  return self->_cloudResourceMemoriesMaxResourcesPerFetch;
}

- (unsigned)cloudResourceWidgetMaxResourcesPerFetch
{
  return self->_cloudResourceWidgetMaxResourcesPerFetch;
}

- (unsigned)cloudResourceComputeSyncMaxResourcesPerFetch
{
  return self->_cloudResourceComputeSyncMaxResourcesPerFetch;
}

- (void)setCloudResourceComputeSyncMaxResourcesPerFetch:(unsigned __int16)a3
{
  self->_cloudResourceComputeSyncMaxResourcesPerFetch = a3;
}

- (unsigned)cloudResourceNonThumbnailsMaxResourcesPerFetch
{
  return self->_cloudResourceNonThumbnailsMaxResourcesPerFetch;
}

- (unsigned)cloudResourceMediaMetadataOverflowMaxResourcesPerFetch
{
  return self->_cloudResourceMediaMetadataOverflowMaxResourcesPerFetch;
}

- (unint64_t)cloudResourceIntervalBetweenCheckCPLBGDownload
{
  return self->_cloudResourceIntervalBetweenCheckCPLBGDownload;
}

- (double)cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio
{
  return self->_cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio;
}

- (void)setCloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:(double)a3
{
  self->_cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio = a3;
}

- (double)cloudResourceIncrementalMinimumFreeDiskSpaceForOptimizeRatio
{
  return self->_cloudResourceIncrementalMinimumFreeDiskSpaceForOptimizeRatio;
}

- (unint64_t)cloudResourceATVNearLowDiskThreshold
{
  return self->_cloudResourceATVNearLowDiskThreshold;
}

- (double)cloudResourceSmallLibraryThresholdRatio
{
  return self->_cloudResourceSmallLibraryThresholdRatio;
}

- (unint64_t)cloudResourceMaximumSmallLibraryThreshold
{
  return self->_cloudResourceMaximumSmallLibraryThreshold;
}

- (void)setCloudResourceMaximumSmallLibraryThreshold:(unint64_t)a3
{
  self->_cloudResourceMaximumSmallLibraryThreshold = a3;
}

- (int64_t)memoryPrefetchAllowedIfLastViewedDateWithin
{
  return self->_memoryPrefetchAllowedIfLastViewedDateWithin;
}

- (void)setMemoryPrefetchAllowedIfLastViewedDateWithin:(int64_t)a3
{
  self->_memoryPrefetchAllowedIfLastViewedDateWithin = a3;
}

- (int64_t)memoryPrefetchIfCreationDateWithin
{
  return self->_memoryPrefetchIfCreationDateWithin;
}

- (void)setMemoryPrefetchIfCreationDateWithin:(int64_t)a3
{
  self->_memoryPrefetchIfCreationDateWithin = a3;
}

+ (int64_t)defaultPrefetchOptimizeMode
{
  int64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_class(), "_defaultPrefetchOptimizeMode");
  objc_msgSend((id)objc_opt_class(), "overridePrefetchOptimizeMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "integerValue");

  return v2;
}

+ (int64_t)_defaultPrefetchOptimizeMode
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0D731D0], "defaultDeviceConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "logicalScreenPixelSize") > 0x3A147A;

  return v3;
}

+ (id)descriptionForPrefetchOptimizeMode:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("medium");
  if (a3 == 1)
    v3 = CFSTR("fullsize");
  if (a3 == 2)
    return CFSTR("original");
  else
    return (id)v3;
}

+ (id)overridePrefetchOptimizeMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (MEMORY[0x19AEC04BC](a1, a2))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("PLPrefetchOptimizeMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("medium")) & 1) != 0)
      {
        v5 = &unk_1E375E5F8;
LABEL_9:
        v6 = (void *)overridePrefetchOptimizeMode_overridePrefetchOptimizeMode;
        overridePrefetchOptimizeMode_overridePrefetchOptimizeMode = (uint64_t)v5;

        goto LABEL_10;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fullsize")) & 1) != 0)
      {
        v5 = &unk_1E375E610;
        goto LABEL_9;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("original")))
      {
        v5 = &unk_1E375E628;
        goto LABEL_9;
      }
    }
LABEL_10:

  }
  return (id)overridePrefetchOptimizeMode_overridePrefetchOptimizeMode;
}

- (void)updateValuesFromTrialIfNecessary
{
  void *v3;
  void *v4;
  int v5;
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
  NSObject *v16;
  int v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 235);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.trialOverride"), CFSTR("PHOTOS_GENERAL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLeanValue");

  if (v5)
  {
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.memoryMaxPrefetchPhotosCount"), CFSTR("PHOTOS_GENERAL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      -[PLPrefetchConfiguration setMemoryMaxPrefetchPhotosCount:](self, "setMemoryMaxPrefetchPhotosCount:", (unsigned __int16)objc_msgSend(v6, "longValue"));
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.memoryMaxPrefetchVideosCount"), CFSTR("PHOTOS_GENERAL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[PLPrefetchConfiguration setMemoryMaxPrefetchVideosCount:](self, "setMemoryMaxPrefetchVideosCount:", (unsigned __int16)objc_msgSend(v8, "longValue"));
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.memoryPrefetchLimit"), CFSTR("PHOTOS_GENERAL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[PLPrefetchConfiguration setMemoryPrefetchLimit:](self, "setMemoryPrefetchLimit:", (unsigned __int16)objc_msgSend(v9, "longValue"));
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.maxFileSize"), CFSTR("PHOTOS_GENERAL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[PLPrefetchConfiguration setCloudResourcePrefetchMaxFileSize:](self, "setCloudResourcePrefetchMaxFileSize:", objc_msgSend(v10, "longValue"));
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.initialMinimumFreeDiskSpaceForOptimizeRatio"), CFSTR("PHOTOS_GENERAL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      -[PLPrefetchConfiguration setCloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:](self, "setCloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:");
    }
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.maximumSmallLibraryThreshold"), CFSTR("PHOTOS_GENERAL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[PLPrefetchConfiguration setCloudResourceMaximumSmallLibraryThreshold:](self, "setCloudResourceMaximumSmallLibraryThreshold:", objc_msgSend(v12, "longValue"));
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.memoryPrefetchAllowedIfLastViewedDateWithin"), CFSTR("PHOTOS_GENERAL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[PLPrefetchConfiguration setMemoryPrefetchAllowedIfLastViewedDateWithin:](self, "setMemoryPrefetchAllowedIfLastViewedDateWithin:", objc_msgSend(v13, "longValue"));
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.memoryPrefetchIfCreationDateWithin"), CFSTR("PHOTOS_GENERAL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[PLPrefetchConfiguration setMemoryPrefetchIfCreationDateWithin:](self, "setMemoryPrefetchIfCreationDateWithin:", objc_msgSend(v14, "longValue"));
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("com.apple.photos.photolibraryservices.prefetch.computeSyncMaxPrefetch"), CFSTR("PHOTOS_GENERAL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[PLPrefetchConfiguration setCloudResourceComputeSyncMaxResourcesPerFetch:](self, "setCloudResourceComputeSyncMaxResourcesPerFetch:", (unsigned __int16)objc_msgSend(v15, "longValue"));
    PLResourceCachingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v21 = -[PLPrefetchConfiguration memoryMaxPrefetchPhotosCount](self, "memoryMaxPrefetchPhotosCount");
      v17 = -[PLPrefetchConfiguration memoryMaxPrefetchVideosCount](self, "memoryMaxPrefetchVideosCount");
      v18 = -[PLPrefetchConfiguration memoryPrefetchLimit](self, "memoryPrefetchLimit");
      v19 = -[PLPrefetchConfiguration cloudResourcePrefetchMaxFileSize](self, "cloudResourcePrefetchMaxFileSize");
      -[PLPrefetchConfiguration cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio](self, "cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio");
      *(_DWORD *)buf = 67111168;
      v23 = v21;
      v24 = 1024;
      v25 = v17;
      v26 = 1024;
      v27 = v18;
      v28 = 2048;
      v29 = v19;
      v30 = 2048;
      v31 = v20;
      v32 = 2048;
      v33 = -[PLPrefetchConfiguration cloudResourceMaximumSmallLibraryThreshold](self, "cloudResourceMaximumSmallLibraryThreshold");
      v34 = 2048;
      v35 = -[PLPrefetchConfiguration memoryPrefetchAllowedIfLastViewedDateWithin](self, "memoryPrefetchAllowedIfLastViewedDateWithin");
      v36 = 2048;
      v37 = -[PLPrefetchConfiguration memoryPrefetchIfCreationDateWithin](self, "memoryPrefetchIfCreationDateWithin");
      v38 = 1024;
      v39 = -[PLPrefetchConfiguration cloudResourceComputeSyncMaxResourcesPerFetch](self, "cloudResourceComputeSyncMaxResourcesPerFetch");
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Trial Override is TRUE. Using values from Trial Experiment\n\t memoryMaxPrefetchPhotosCount:%hu\n\tmemoryMaxPrefetchVideosCount:%hu\n\tmemoryPrefetchLimit:%hu\n\tcloudResourcePrefetchMaxFileSize:%llu\n\t\n\tcloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio:%f\n\tcloudResourceMaximumSmallLibraryThreshold:%llu\n\tmemoryPrefetchAllowedIfLastViewedDateWithin:%lld\n\tmemoryPrefetchIfCreationDateWithin:%lld\n\tcloudResourceComputeSyncMaxResourcesPerFetch:%hu\n", buf, 0x4Cu);
    }

  }
}

@end
