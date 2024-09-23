@implementation PXUpNextMemoriesGenerationRequest

- (PXUpNextMemoriesGenerationRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUpNextMemoriesGenerationRequest.m"), 42, CFSTR("%s is not available as initializer"), "-[PXUpNextMemoriesGenerationRequest init]");

  abort();
}

- (PXUpNextMemoriesGenerationRequest)initWithRootMemory:(id)a3 avoidMemoriesWithLocalIdentifiers:(id)a4 targetUpNextMemoryCount:(unint64_t)a5 musicCurationParameters:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXUpNextMemoriesGenerationRequest *v14;
  PXUpNextMemoriesGenerationRequest *v15;
  uint64_t v16;
  PHPhotoLibrary *photoLibrary;
  uint64_t v18;
  PLPhotoAnalysisServiceClient *photoAnalysisServiceClient;
  void *v20;
  uint64_t v21;
  NSSet *memoryLocalIdentifiersToAvoid;
  void *v23;
  uint64_t v24;
  NSArray *recentlyUsedFlexSongIDs;
  void *v26;
  uint64_t v27;
  NSArray *recentlyUsedAppleMusicSongIDs;
  void *v29;
  uint64_t v30;
  OS_dispatch_queue *workQueue;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PXUpNextMemoriesGenerationRequest;
  v14 = -[PXUpNextMemoriesGenerationRequest init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rootMemory, a3);
    objc_msgSend(v11, "photoLibrary");
    v16 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v15->_photoLibrary;
    v15->_photoLibrary = (PHPhotoLibrary *)v16;

    -[PHPhotoLibrary photoAnalysisClient](v15->_photoLibrary, "photoAnalysisClient");
    v18 = objc_claimAutoreleasedReturnValue();
    photoAnalysisServiceClient = v15->_photoAnalysisServiceClient;
    v15->_photoAnalysisServiceClient = (PLPhotoAnalysisServiceClient *)v18;

    objc_msgSend(v11, "localIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setByAddingObject:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    memoryLocalIdentifiersToAvoid = v15->_memoryLocalIdentifiersToAvoid;
    v15->_memoryLocalIdentifiersToAvoid = (NSSet *)v21;

    v15->_targetUpNextMemoryCount = a5;
    objc_msgSend(v13, "recentlyUsedFlexSongIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v24 = objc_claimAutoreleasedReturnValue();
    recentlyUsedFlexSongIDs = v15->_recentlyUsedFlexSongIDs;
    v15->_recentlyUsedFlexSongIDs = (NSArray *)v24;

    objc_msgSend(v13, "recentlyUsedAppleMusicSongIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allObjects");
    v27 = objc_claimAutoreleasedReturnValue();
    recentlyUsedAppleMusicSongIDs = v15->_recentlyUsedAppleMusicSongIDs;
    v15->_recentlyUsedAppleMusicSongIDs = (NSArray *)v27;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
    v30 = objc_claimAutoreleasedReturnValue();
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v30;

  }
  return v15;
}

- (void)startGenerationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PXUpNextMemoriesGenerationRequest_startGenerationWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5146480;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  -[PXUpNextMemoriesGenerationRequest workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (id)_fetchOverrideMemories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXUpNextMemoriesGenerationResult *v8;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Media/PhotoData/Caches/GraphService/upNextMemoriesResultOverride.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUpNextMemoriesGenerationRequest rootMemory](self, "rootMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXUpNextMemoriesGenerationRequest _fetchLocalMemoriesWithLocalIdentifiers:](self, "_fetchLocalMemoriesWithLocalIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXUpNextMemoriesGenerationResult initWithMemories:debugInfo:]([PXUpNextMemoriesGenerationResult alloc], "initWithMemories:debugInfo:", v7, &stru_1E5149688);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fetchUpNextMemoriesWithError:(id *)a3
{
  void *v5;
  void *v6;
  PXLibraryFilterState *v7;
  void *v8;

  -[PXUpNextMemoriesGenerationRequest photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v6);
  -[PXUpNextMemoriesGenerationRequest fetchUpNextMemoriesWithError:sharingFilter:](self, "fetchUpNextMemoriesWithError:sharingFilter:", a3, -[PXLibraryFilterState sharingFilter](v7, "sharingFilter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchUpNextMemoriesWithError:(id *)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  PXUpNextMemoriesGenerationResult *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  char *v42;
  NSObject *v43;
  id *v44;
  char *v45;
  void *v46;
  double v47;
  unint64_t targetUpNextMemoryCount;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  unint64_t v57;
  double v58;
  PXUpNextMemoriesGenerationRequest *v59;
  NSObject *v60;
  const char *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint32_t denom;
  uint32_t numer;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  os_signpost_id_t spid;
  uint64_t v78;
  unsigned int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  NSObject *v86;
  unint64_t v87;
  void *v88;
  id *v89;
  void *v90;
  PXUpNextMemoriesGenerationRequest *v91;
  id v92;
  id v93;
  mach_timebase_info info;
  void *v95;
  _QWORD v96[10];
  _QWORD v97[10];
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  double v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v4 = a4;
  v104 = *MEMORY[0x1E0C80C00];
  PLMemoriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v91 = self;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[PXUpNextMemoriesGenerationRequest targetUpNextMemoryCount](self, "targetUpNextMemoryCount");
    -[PXUpNextMemoriesGenerationRequest rootMemory](self, "rootMemory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentifier");
    v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[PXUpNextMemoriesGenerationRequest rootMemory](self, "rootMemory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v99 = (const char *)v8;
    v100 = 2112;
    v101 = v10;
    v102 = 2112;
    v103 = v12;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[UpNext] Fetch %lu suggestions for memory:%@ - %@", buf, 0x20u);

    self = v91;
  }

  +[PXUpNextSettings sharedInstance](PXUpNextSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "overrideMemoriesResult")
    || (-[PXUpNextMemoriesGenerationRequest _fetchOverrideMemories](self, "_fetchOverrideMemories"),
        (v14 = (PXUpNextMemoriesGenerationResult *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v89 = a3;
    v90 = v13;
    PLUpNextGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);
    v17 = v15;
    v18 = v17;
    v87 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXUpNextMemoriesGenerationRequest", ", buf, 2u);
    }
    spid = v16;
    v86 = v18;

    info = 0;
    mach_timebase_info(&info);
    v78 = mach_absolute_time();
    +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "useOnlyMusicForTopicInTopPickSuggestions");
    v21 = objc_msgSend(v19, "includeChillMixInMusicForYou");
    v88 = v19;
    v22 = objc_msgSend(v19, "includeGetUpMixInMusicForYou");
    v84 = objc_alloc(MEMORY[0x1E0C99E08]);
    v96[0] = *MEMORY[0x1E0D72350];
    -[PXUpNextMemoriesGenerationRequest rootMemory](self, "rootMemory");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "localIdentifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v82;
    v96[1] = *MEMORY[0x1E0D72340];
    -[PXUpNextMemoriesGenerationRequest memoryLocalIdentifiersToAvoid](self, "memoryLocalIdentifiersToAvoid");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "allObjects");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v80;
    v96[2] = *MEMORY[0x1E0D72358];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXUpNextMemoriesGenerationRequest targetUpNextMemoryCount](self, "targetUpNextMemoryCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v97[2] = v23;
    v96[3] = *MEMORY[0x1E0D72360];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXUpNextMemoriesGenerationRequest wantsVerboseDebugInfo](self, "wantsVerboseDebugInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v97[3] = v24;
    v96[4] = *MEMORY[0x1E0D72348];
    v79 = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v97[4] = v25;
    v96[5] = *MEMORY[0x1E0D72468];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v97[5] = v26;
    v96[6] = *MEMORY[0x1E0D723F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v97[6] = v27;
    v96[7] = *MEMORY[0x1E0D723F8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v97[7] = v28;
    v96[8] = *MEMORY[0x1E0D721F8];
    -[PXUpNextMemoriesGenerationRequest recentlyUsedFlexSongIDs](self, "recentlyUsedFlexSongIDs");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = MEMORY[0x1E0C9AA60];
    if (v29)
      v32 = v29;
    else
      v32 = MEMORY[0x1E0C9AA60];
    v97[8] = v32;
    v96[9] = *MEMORY[0x1E0D72200];
    -[PXUpNextMemoriesGenerationRequest recentlyUsedAppleMusicSongIDs](self, "recentlyUsedAppleMusicSongIDs");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
      v35 = v33;
    else
      v35 = v31;
    v97[9] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v84, "initWithDictionary:", v36);

    if (objc_msgSend(v90, "enableCustomVectors"))
    {
      objc_msgSend(v90, "featureWeightVectors");
      v38 = (char *)objc_claimAutoreleasedReturnValue();
      PLMemoriesGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v38;
        _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_DEFAULT, "[UpNext] custom vector:%@", buf, 0xCu);
      }

      objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D72338]);
    }
    -[PXUpNextMemoriesGenerationRequest photoAnalysisServiceClient](v91, "photoAnalysisServiceClient");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(v40, "requestUpNextMemoryLocalIdentifiersWithOptions:error:", v37, &v93);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (char *)v93;

    v85 = v37;
    if (v41 && (objc_msgSend(v90, "forceFallbackMemories") & 1) == 0)
    {
      objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0D72370]);
      v47 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v44 = v89;
      if (v47 == 0.0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        PLMemoriesGetLog();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v99 = *(const char **)&v47;
          _os_log_impl(&dword_1A6789000, v52, OS_LOG_TYPE_ERROR, "[UpNext] memoryLocalIdentifiers: %@, is nil or not a NSArray object", buf, 0xCu);
        }

      }
      objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0D72368]);
      v45 = (char *)objc_claimAutoreleasedReturnValue();
      if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        PLMemoriesGetLog();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v99 = v45;
          _os_log_impl(&dword_1A6789000, v53, OS_LOG_TYPE_ERROR, "[UpNext] debugInfo: %@, is nil or not a NSString object", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UpNext debugInfo: %@, is nil or not a NSString object"), v45);
        v54 = objc_claimAutoreleasedReturnValue();

        v45 = (char *)v54;
      }
      PLMemoriesGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = objc_msgSend(*(id *)&v47, "count");
        *(_DWORD *)buf = 134218242;
        v99 = (const char *)v56;
        v100 = 2112;
        v101 = v47;
        _os_log_impl(&dword_1A6789000, v55, OS_LOG_TYPE_DEFAULT, "[UpNext] Found %lu UpNext Memories from PhotoAnalysis:%@", buf, 0x16u);
      }

      -[PXUpNextMemoriesGenerationRequest _fetchLocalMemoriesWithLocalIdentifiers:](v91, "_fetchLocalMemoriesWithLocalIdentifiers:", *(_QWORD *)&v47);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLMemoriesGetLog();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v89;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v42;
        _os_log_impl(&dword_1A6789000, v43, OS_LOG_TYPE_ERROR, "[UpNext] generation error:%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpNext] generation error:%@. Using Fallback Memory."), v42);
      v45 = (char *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x1E0CD1660];
      -[PXUpNextMemoriesGenerationRequest rootMemory](v91, "rootMemory");
      v47 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      targetUpNextMemoryCount = v91->_targetUpNextMemoryCount;
      -[PXUpNextMemoriesGenerationRequest memoryLocalIdentifiersToAvoid](v91, "memoryLocalIdentifiersToAvoid");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "allObjects");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = 0;
      objc_msgSend(v46, "fetchFallbackMemoriesForMemory:targetCount:memoryLocalIdentifiersToAvoid:sharingFilter:error:", *(_QWORD *)&v47, targetUpNextMemoryCount, v50, v79, &v92);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (char *)v92;

    }
    v57 = objc_msgSend(v51, "count");
    if (v57)
    {
      v58 = *(double *)&v57;
      v59 = v91;
      if (v57 < v91->_targetUpNextMemoryCount)
      {
        PLMemoriesGetLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = (const char *)v91->_targetUpNextMemoryCount;
          *(_DWORD *)buf = 134218240;
          v99 = v61;
          v100 = 2048;
          v101 = v58;
          _os_log_impl(&dword_1A6789000, v60, OS_LOG_TYPE_DEFAULT, "[UpNext] Insufficient number of suggestions. Need %lu, got %lu; returning 1.",
            buf,
            0x16u);
        }

        v62 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(v51, "firstObject");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v63;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "photoLibrary");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "fetchType");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "fetchPropertySets");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v62, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v64, v65, v66, v67, 0, 0);

        v59 = v91;
        v51 = (void *)v68;
        v44 = v89;
      }
    }
    else
    {
      v59 = v91;
    }
    objc_msgSend(v45, "stringByAppendingFormat:", CFSTR(" Requested Count: %li."), v59->_targetUpNextMemoryCount);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[PXUpNextMemoriesGenerationResult initWithMemories:debugInfo:]([PXUpNextMemoriesGenerationResult alloc], "initWithMemories:debugInfo:", v51, v69);
    v70 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v73 = v86;
    v74 = v73;
    v13 = v90;
    if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v74, OS_SIGNPOST_INTERVAL_END, spid, "PXUpNextMemoriesGenerationRequest", ", buf, 2u);
    }

    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v99 = "PXUpNextMemoriesGenerationRequest";
      v100 = 2048;
      v101 = (float)((float)((float)((float)(v70 - v78) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1A6789000, v74, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v42)
    {
      PLMemoriesGetLog();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v42;
        _os_log_impl(&dword_1A6789000, v75, OS_LOG_TYPE_ERROR, "[UpNext] Generation error:%@", buf, 0xCu);
      }

    }
    if (v44)
      *v44 = objc_retainAutorelease(v42);

  }
  return v14;
}

- (id)_fetchLocalMemoriesWithLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PXUpNextMemoriesGenerationRequest photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v6, "setIncludeLocalMemories:", 1);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier IN %@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("pendingState = %d"), 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v10);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchedObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __77__PXUpNextMemoriesGenerationRequest__fetchLocalMemoriesWithLocalIdentifiers___block_invoke;
    v28[3] = &unk_1E512ED18;
    v13 = v4;
    v29 = v13;
    objc_msgSend(v12, "sortedArrayUsingComparator:", v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v11, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchPropertySets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, v16, v17, v18, 0, 0);

    PLMemoriesGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134218242;
      v31 = v21;
      v32 = 2112;
      v33 = (uint64_t)v19;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "[UpNext] Fetched %lu UpNext Memories:%@", buf, 0x16u);
    }

    v22 = objc_msgSend(v19, "count");
    if (v22 != objc_msgSend(v13, "count"))
    {
      PLMemoriesGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v13, "count");
        v25 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 134218240;
        v31 = v24;
        v32 = 2048;
        v33 = v25;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "[UpNext] Failed fetching local memories. Expecting:%lu Got:%lu", buf, 0x16u);
      }

    }
    v26 = v19;

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NSSet)memoryLocalIdentifiersToAvoid
{
  return self->_memoryLocalIdentifiersToAvoid;
}

- (unint64_t)targetUpNextMemoryCount
{
  return self->_targetUpNextMemoryCount;
}

- (BOOL)wantsVerboseDebugInfo
{
  return self->_wantsVerboseDebugInfo;
}

- (void)setWantsVerboseDebugInfo:(BOOL)a3
{
  self->_wantsVerboseDebugInfo = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PLPhotoAnalysisServiceClient)photoAnalysisServiceClient
{
  return self->_photoAnalysisServiceClient;
}

- (PHMemory)rootMemory
{
  return self->_rootMemory;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSArray)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, a3);
}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_rootMemory, 0);
  objc_storeStrong((id *)&self->_photoAnalysisServiceClient, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_memoryLocalIdentifiersToAvoid, 0);
}

uint64_t __77__PXUpNextMemoriesGenerationRequest__fetchLocalMemoriesWithLocalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v7, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "compare:", v13);

  return v14;
}

void __74__PXUpNextMemoriesGenerationRequest_startGenerationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = 0;
  objc_msgSend(WeakRetained, "fetchUpNextMemoriesWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
