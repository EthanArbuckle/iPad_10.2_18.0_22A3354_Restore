@implementation PGMemoryGenerator

- (PGMemoryGenerator)initWithMemoryCurationSession:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGMemoryGenerator *v9;
  PGMemoryGenerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryGenerator;
  v9 = -[PGMemoryGenerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingConnection, a4);
    objc_storeStrong((id *)&v10->_memoryCurationSession, a3);
  }

  return v10;
}

- (PGMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  id v5;
  PGMemoryGenerator *v6;
  uint64_t v7;
  PGMemoryProcessedScenesAndFacesCache *processedScenesAndFacesCache;
  uint64_t v9;
  PGMemoryMomentNodesWithBlockedFeatureCache *momentNodesWithBlockedFeatureCache;
  uint64_t v11;
  OS_os_log *loggingConnection;
  uint64_t v13;
  PGGraphLocationHelper *locationHelper;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PGMemoryGenerator;
  v6 = -[PGMemoryGenerator init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "processedScenesAndFacesCache");
    v7 = objc_claimAutoreleasedReturnValue();
    processedScenesAndFacesCache = v6->_processedScenesAndFacesCache;
    v6->_processedScenesAndFacesCache = (PGMemoryProcessedScenesAndFacesCache *)v7;

    objc_msgSend(v5, "momentNodesWithBlockedFeatureCache");
    v9 = objc_claimAutoreleasedReturnValue();
    momentNodesWithBlockedFeatureCache = v6->_momentNodesWithBlockedFeatureCache;
    v6->_momentNodesWithBlockedFeatureCache = (PGMemoryMomentNodesWithBlockedFeatureCache *)v9;

    objc_msgSend(v5, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v6->_loggingConnection;
    v6->_loggingConnection = (OS_os_log *)v11;

    objc_msgSend(v5, "locationHelper");
    v13 = objc_claimAutoreleasedReturnValue();
    locationHelper = v6->_locationHelper;
    v6->_locationHelper = (PGGraphLocationHelper *)v13;

    objc_storeStrong((id *)&v6->_memoryGenerationContext, a3);
  }

  return v6;
}

- (PGMemoryGenerator)initWithController:(id)a3
{
  id v4;
  PGMemoryGenerator *v5;
  PGMemoryGenerator *v6;
  uint64_t v7;
  OS_os_log *loggingConnection;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGMemoryGenerator;
  v5 = -[PGMemoryGenerator init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    objc_msgSend(v4, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v6->_loggingConnection;
    v6->_loggingConnection = (OS_os_log *)v7;

  }
  return v6;
}

- (PGMemoryCurationSession)memoryCurationSession
{
  PGMemoryCurationSession *memoryCurationSession;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  PGMemoryCurationSession *v8;
  void *v9;
  PGMemoryCurationSession *v10;
  PGMemoryCurationSession *v11;

  memoryCurationSession = self->_memoryCurationSession;
  if (!memoryCurationSession)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v5);
    +[PGGraphLocationHelper inefficientLocationHelper](PGGraphLocationHelper, "inefficientLocationHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PGMemoryCurationSession alloc];
    objc_msgSend(WeakRetained, "curationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGMemoryCurationSession initWithCurationManager:photoLibrary:curationContext:locationHelper:](v8, "initWithCurationManager:photoLibrary:curationContext:locationHelper:", v9, v5, v6, v7);
    v11 = self->_memoryCurationSession;
    self->_memoryCurationSession = v10;

    memoryCurationSession = self->_memoryCurationSession;
  }
  return memoryCurationSession;
}

- (PGMemoryProcessedScenesAndFacesCache)processedScenesAndFacesCache
{
  PGMemoryProcessedScenesAndFacesCache *processedScenesAndFacesCache;
  id WeakRetained;
  void *v5;
  void *v6;
  PGMemoryProcessedScenesAndFacesCache *v7;
  void *v8;
  PGMemoryProcessedScenesAndFacesCache *v9;

  processedScenesAndFacesCache = self->_processedScenesAndFacesCache;
  if (!processedScenesAndFacesCache)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "memoryGenerationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processedScenesAndFacesCache");
      v7 = (PGMemoryProcessedScenesAndFacesCache *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = -[PGMemoryProcessedScenesAndFacesCache initWithPhotoLibrary:]([PGMemoryProcessedScenesAndFacesCache alloc], "initWithPhotoLibrary:", v6);
    }
    v9 = self->_processedScenesAndFacesCache;
    self->_processedScenesAndFacesCache = v7;

    processedScenesAndFacesCache = self->_processedScenesAndFacesCache;
  }
  return processedScenesAndFacesCache;
}

- (PGMemoryMomentNodesWithBlockedFeatureCache)momentNodesWithBlockedFeatureCache
{
  PGMemoryMomentNodesWithBlockedFeatureCache *momentNodesWithBlockedFeatureCache;
  PGMemoryMomentNodesWithBlockedFeatureCache *v3;
  id WeakRetained;
  void *v5;

  momentNodesWithBlockedFeatureCache = self->_momentNodesWithBlockedFeatureCache;
  if (momentNodesWithBlockedFeatureCache)
  {
    v3 = momentNodesWithBlockedFeatureCache;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "memoryGenerationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "momentNodesWithBlockedFeatureCache");
    v3 = (PGMemoryMomentNodesWithBlockedFeatureCache *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (PGGraphLocationHelper)locationHelper
{
  PGGraphLocationHelper *locationHelper;
  PGGraphLocationHelper *v3;
  id WeakRetained;
  void *v5;

  locationHelper = self->_locationHelper;
  if (locationHelper)
  {
    v3 = locationHelper;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "memoryGenerationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationHelper");
    v3 = (PGGraphLocationHelper *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_enumeratePotentialMemoriesWithGraph:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  PGMethodNotImplentedException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)_enumerateBestScoringPotentialMemoriesInPotentialMemories:(id)a3 withGraph:(id)a4 attemptUpgradesBeforeSorting:(BOOL)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, double);
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double Current;
  NSObject *v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t i;
  void *v29;
  void *v30;
  double v31;
  void (**v32)(_QWORD, _QWORD, double);
  void *v33;
  NSObject *v34;
  NSObject *v35;
  unint64_t v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void (**v41)(id, void *, uint8_t *);
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  char v46;
  uint8_t buf[4];
  _BYTE v48[18];
  _BYTE v49[128];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v41 = (void (**)(id, void *, uint8_t *))a6;
  -[PGMemoryGenerator controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "progressBlock");
  v12 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v13 = 0.0;
  if (!v12 || (v14 = CFAbsoluteTimeGetCurrent(), v14 < 0.01))
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v13 >= 0.01)
      {
        v46 = 0;
        ((void (**)(_QWORD, char *, double))v12)[2](v12, &v46, 0.5);
        if (v46)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_44:

            goto LABEL_45;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v48 = 180;
          *(_WORD *)&v48[4] = 2080;
          *(_QWORD *)&v48[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/Memory Generators/PGMemoryGenerator.m";
          v20 = MEMORY[0x1E0C81028];
LABEL_40:
          _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_44;
        }
        v13 = Current;
      }
    }
    v39 = v17;
    v40 = v10;
    v21 = objc_msgSend(v18, "count");
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v22 = v18;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    v36 = v21;
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v43;
      v27 = (0.0 / (double)v21 + 1.0) * 0.25;
      v37 = v18;
      v38 = v9;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v22);
          v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v30 = (void *)MEMORY[0x1CAA4EB2C]();
          if (v12)
          {
            v31 = CFAbsoluteTimeGetCurrent();
            if (v31 - v13 >= 0.01)
            {
              v46 = 0;
              ((void (**)(_QWORD, char *, double))v12)[2](v12, &v46, 0.5);
              if (v46)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v48 = 187;
                  *(_WORD *)&v48[4] = 2080;
                  *(_QWORD *)&v48[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Memories/Memory Generators/PGMemoryGenerator.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
LABEL_43:
                v9 = v38;
                v17 = v39;
                v10 = v40;
                objc_autoreleasePoolPop(v30);

                v18 = v37;
                goto LABEL_44;
              }
              v13 = v31;
            }
          }
          v46 = 0;
          objc_msgSend(v11, "progressBlock", v36);
          v32 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, char *, double))v32)[2](v32, &v46, v27);

          if (v46)
            goto LABEL_43;
          objc_msgSend(v29, "buildAssetCollectionUsingMemoryController:withMinimumNumberOfAssets:", v11, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v29, "setAssetCollection:", v33);
            buf[0] = 0;
            v41[2](v41, v29, buf);
            if (buf[0])
            {

              objc_autoreleasePoolPop(v30);
              v18 = v37;
              v9 = v38;
              goto LABEL_33;
            }
          }
          else
          {
            objc_msgSend(v11, "loggingConnection");
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "Nil asset collection for momentNode, graph is out-of-sync with the photo library.", buf, 2u);
            }

            ++v25;
          }

          objc_autoreleasePoolPop(v30);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        v18 = v37;
        v9 = v38;
        if (v24)
          continue;
        break;
      }
    }
    else
    {
      v25 = 0;
    }
LABEL_33:

    objc_msgSend(v11, "loggingConnection");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v48 = v36;
      *(_WORD *)&v48[8] = 2048;
      *(_QWORD *)&v48[10] = v25;
      _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_DEFAULT, "Memory Creation Request: Potential Memory Election out of %lu, rejected %lu build failures", buf, 0x16u);
    }

    v17 = v39;
    v10 = v40;
    if (!v12)
      goto LABEL_44;
    if (CFAbsoluteTimeGetCurrent() - v13 < 0.01)
      goto LABEL_44;
    v46 = 0;
    ((void (**)(_QWORD, char *, double))v12)[2](v12, &v46, 0.5);
    if (!v46 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_44;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v48 = 217;
    *(_WORD *)&v48[4] = 2080;
    *(_QWORD *)&v48[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Memories/Memory Generators/PGMemoryGenerator.m";
    v20 = MEMORY[0x1E0C81028];
    goto LABEL_40;
  }
  v46 = 0;
  ((void (**)(_QWORD, char *, double))v12)[2](v12, &v46, 0.5);
  if (!v46)
  {
    v13 = v14;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v48 = 173;
    *(_WORD *)&v48[4] = 2080;
    *(_QWORD *)&v48[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Memories/Memory Generators/PGMemoryGenerator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_45:

}

- (id)_additionalInfoKeywordsForPotentialMemory:(id)a3
{
  return 0;
}

- (id)localIdentifiersFromAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "localIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)addLocalIdentifiersFromAssets:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)defaultTitleGeneratorWithMomentNodes:(id)a3 keyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 category:(unint64_t)a7 creationDate:(id)a8 titleGenerationContext:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  PGTitleGenerator *v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = a8;
  v20 = objc_msgSend((id)objc_opt_class(), "titleDateMatchingTypeForMemoryCategory:", a7);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v19, 0.0);

  objc_msgSend(v15, "photoLibrary");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v15 && v22 && objc_msgSend(v16, "count") && objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v16, 0, 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v17, 0, 0, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:]([PGTitleGenerator alloc], "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", v14, v21, v15, v24, v25, v20, v18);

  }
  else
  {
    v26 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:]([PGTitleGenerator alloc], "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", v14, v21, 0, 0, 0, v20, v18);
  }

  return v26;
}

- (unint64_t)durationForCuration
{
  return 21;
}

- (BOOL)semanticalDedupingEnabledForCuration
{
  return 1;
}

- (unint64_t)durationForExtendedCuration
{
  return 9;
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[PGMemoryGenerator controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProgressBlock:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PGMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
  v12[3] = &unk_1E842E678;
  v10 = v9;
  v13 = v10;
  -[PGMemoryGenerator _enumeratePotentialMemoriesWithGraph:usingBlock:](self, "_enumeratePotentialMemoriesWithGraph:usingBlock:", v7, v12);

  return v10;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
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

  v6 = a5;
  v9 = a4;
  v10 = a3;
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v10, "memoryMomentNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "localIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchAssetCollectionsWithLocalIdentifiers:options:", v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "curationManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "defaultAssetFetchOptionsForMemories");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setIncludeGuestAssets:", v6);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollections:options:", v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v22, v23, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)relevantCurationFeederForTriggeredMemory:(id)a3 relevantFeeder:(id)a4 inGraph:(id)a5 allowGuestAsset:(BOOL)a6 progressReporter:(id)a7
{
  return 0;
}

- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  return 0;
}

- (id)uuidsOfRequiredAssetsWithKeyAsset:(id)a3 triggeredMemory:(id)a4 inGraph:(id)a5 progressReporter:(id)a6
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  PGKeyAssetCurationOptions *v4;

  v4 = objc_alloc_init(PGKeyAssetCurationOptions);
  -[PGKeyAssetCurationOptions setIsForMemories:](v4, "setIsForMemories:", 1);
  -[PGKeyAssetCurationOptions setWantsGoodSquareCropScore:](v4, "setWantsGoodSquareCropScore:", 1);
  return v4;
}

- (id)baseCurationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4
{
  id v6;
  id v7;
  PGCurationOptions *v8;
  _BOOL8 v9;

  v6 = a4;
  v7 = a3;
  v8 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", -[PGMemoryGenerator durationForCuration](self, "durationForCuration"));
  -[PGCurationOptions setSemanticalDedupingEnabled:](v8, "setSemanticalDedupingEnabled:", -[PGMemoryGenerator semanticalDedupingEnabledForCuration](self, "semanticalDedupingEnabledForCuration"));
  -[PGCurationOptions setUseDurationBasedCuration:](v8, "setUseDurationBasedCuration:", 1);
  -[PGCurationOptions setFailIfMinimumDurationNotReached:](v8, "setFailIfMinimumDurationNotReached:", 1);
  -[PGCurationOptions setSkipCurationIfEligibleItemsFitTargetDuration:](v8, "setSkipCurationIfEligibleItemsFitTargetDuration:", 1);
  -[PGCurationOptions setUuidsOfRequiredAssets:](v8, "setUuidsOfRequiredAssets:", v7);

  -[PGCurationOptions setUuidsOfEligibleAssets:](v8, "setUuidsOfEligibleAssets:", v6);
  v9 = v6 == 0;
  -[PGCurationOptions setIdenticalDedupingEnabled:](v8, "setIdenticalDedupingEnabled:", v9);
  -[PGCurationOptions setSemanticalDedupingEnabled:](v8, "setSemanticalDedupingEnabled:", v9);
  -[PGCurationOptions setMovieDedupingEnabled:](v8, "setMovieDedupingEnabled:", v9);
  return v8;
}

- (id)extendedCurationOptionsWithRequiredAssetUUIDs:(id)a3 triggeredMemory:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = -[PGDejunkerDeduperOptions initForMemories]([PGDejunkerDeduperOptions alloc], "initForMemories");
  objc_msgSend(v6, "setDoSemanticalDeduping:", -[PGMemoryGenerator semanticalDedupingEnabledForExtendedCuration](self, "semanticalDedupingEnabledForExtendedCuration"));
  objc_msgSend(v6, "setIdentifiersOfRequiredItems:", v5);

  objc_msgSend(v6, "setDuration:", -[PGMemoryGenerator durationForExtendedCuration](self, "durationForExtendedCuration"));
  return v6;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v17, "memoryMomentNodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "memoryCategory");
  objc_msgSend(v17, "creationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator defaultTitleGeneratorWithMomentNodes:keyAsset:curatedAssets:extendedCuratedAssets:category:creationDate:titleGenerationContext:](self, "defaultTitleGeneratorWithMomentNodes:keyAsset:curatedAssets:extendedCuratedAssets:category:creationDate:titleGenerationContext:", v19, v16, v15, v14, v20, v21, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)chapterTitleGeneratorForTriggeredMemory:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 titleGenerationContext:(id)a6 inGraph:(id)a7
{
  return 0;
}

- (PGMemoryController)controller
{
  return (PGMemoryController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (BOOL)isDebug
{
  return self->_isDebug;
}

- (void)setIsDebug:(BOOL)a3
{
  self->_isDebug = a3;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (PGMemoryGenerationContext)memoryGenerationContext
{
  return self->_memoryGenerationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryGenerationContext, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeatureCache, 0);
  objc_storeStrong((id *)&self->_processedScenesAndFacesCache, 0);
  objc_storeStrong((id *)&self->_memoryCurationSession, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_controller);
}

uint64_t __73__PGMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (int64_t)titleDateMatchingTypeForMemoryCategory:(unint64_t)a3
{
  if (a3 - 202 > 0xB)
    return 0;
  else
    return qword_1CA8ECD08[a3 - 202];
}

@end
