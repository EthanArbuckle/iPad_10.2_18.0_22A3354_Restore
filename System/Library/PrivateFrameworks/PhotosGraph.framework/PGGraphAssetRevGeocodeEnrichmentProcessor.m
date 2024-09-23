@implementation PGGraphAssetRevGeocodeEnrichmentProcessor

- (PGGraphAssetRevGeocodeEnrichmentProcessor)init
{
  PGGraphAssetRevGeocodeEnrichmentProcessor *v2;
  PGGraphAssetRevGeocodeEnrichmentProcessor *v3;
  NSArray *homeLocations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGGraphAssetRevGeocodeEnrichmentProcessor;
  v2 = -[PGGraphAssetRevGeocodeEnrichmentProcessor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    homeLocations = v2->_homeLocations;
    v2->_homeLocations = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_requiresValidGraph = 0;
  }
  return v3;
}

- (BOOL)revGeoProviderDidChangeForGraphApplicationDataURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("revgeoprovider.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("revgeoprovider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6) ^ 1;

  return v7;
}

- (void)setCurrentGeoProviderInGraphApplicationDataURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("revgeoprovider.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("revgeoprovider");
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "writeToURL:error:", v3, &v10);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: Could not save the new rev geo provider with error (%@)", buf, 0xCu);
    }

  }
}

- (void)invalidateReverseLocationDataForRevGeoProviderChangeUsingManager:(id)a3 progressBlock:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_group_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double Current;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint32_t denom;
  uint32_t numer;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  float v40;
  void *v41;
  void *v42;
  os_signpost_id_t spid;
  uint64_t v44;
  unint64_t v45;
  NSObject *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void (**v51)(void *, void *);
  dispatch_group_t group;
  void (**v53)(void *, _BYTE *, double);
  char v54;
  _QWORD aBlock[4];
  dispatch_group_t v56;
  id v57;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v60[18];
  __int16 v61;
  double v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "enrichmentLoggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InvalidReverseLocationRevGeoProviderChange", ", buf, 2u);
  }
  v45 = v8 - 1;
  v46 = v10;
  spid = v8;

  info = 0;
  mach_timebase_info(&info);
  v44 = mach_absolute_time();
  v50 = v6;
  v53 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v47 = v5;
  objc_msgSend(v5, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = *MEMORY[0x1E0CD1A30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addFetchPropertySets:", v13);

  objc_msgSend(v12, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.reverseLocationDataIsValid == YES"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInternalPredicate:", v14);

  v49 = v12;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_group_create();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke;
  aBlock[3] = &unk_1E842ECC8;
  group = v16;
  v56 = group;
  v48 = v11;
  v57 = v48;
  v51 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (!objc_msgSend(v15, "count"))
  {
LABEL_17:
    if (objc_msgSend(v17, "count"))
    {
      v51[2](v51, v17);
      v18 += objc_msgSend(v17, "count");
    }
    v31 = v46;
    v30 = v47;
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    v32 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v35 = v46;
    v36 = v35;
    v37 = v50;
    v38 = v48;
    if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v60 = v18;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_END, spid, "InvalidReverseLocationRevGeoProviderChange", "%ld assets invalidated", buf, 0xCu);
    }

    v39 = v36;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = (float)((float)((float)(v32 - v44) * (float)numer) / (float)denom) / 1000000.0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld assets invalidated"), v18);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v60 = "InvalidReverseLocationRevGeoProviderChange";
      *(_WORD *)&v60[8] = 2112;
      *(_QWORD *)&v60[10] = v41;
      v61 = 2048;
      v62 = v40;
      _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

    }
    v42 = v49;
    goto LABEL_25;
  }
  v19 = 0;
  v20 = 0.0;
  while (1)
  {
    v21 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v15, "objectAtIndex:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0D71860];
    objc_msgSend(v22, "locationCoordinate");
    if (objc_msgSend(v23, "canUseCoordinate:"))
      break;
LABEL_16:

    objc_autoreleasePoolPop(v21);
    if (++v19 >= (unint64_t)objc_msgSend(v15, "count"))
      goto LABEL_17;
  }
  v24 = (void *)MEMORY[0x1E0D71AA0];
  objc_msgSend(v22, "photosOneUpProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "reverseLocationData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "infoFromPlistData:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v27, "locationWasResolvedWithBestRevGeoProvider") & 1) == 0)
    objc_msgSend(v17, "addObject:", v22);
  if ((unint64_t)objc_msgSend(v17, "count") >= 0x3E8)
  {
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    v28 = (void *)objc_msgSend(v17, "copy");
    v51[2](v51, v28);

    v18 += objc_msgSend(v17, "count");
    objc_msgSend(v17, "removeAllObjects");
  }
  if (!v53 || (Current = CFAbsoluteTimeGetCurrent(), Current - v20 < 0.01))
  {
LABEL_15:

    goto LABEL_16;
  }
  v54 = 0;
  v53[2](v53, &v54, 0.5);
  if (!v54)
  {
    v20 = Current;
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v60 = 182;
    *(_WORD *)&v60[4] = 2080;
    *(_QWORD *)&v60[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

  objc_autoreleasePoolPop(v21);
  v31 = v46;
  v30 = v47;
  v42 = v49;
  v37 = v50;
  v38 = v48;
LABEL_25:

}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  void (**v10)(void *, _BYTE *, double);
  double v11;
  char v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  double v20;
  char v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  uint64_t v25;
  uint32_t v26;
  uint32_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  double Current;
  char v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint32_t denom;
  uint32_t numer;
  NSObject *v39;
  NSObject *v40;
  uint32_t v41;
  double v42;
  char v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  double v52;
  char v53;
  void *v54;
  void *v55;
  NSArray *v56;
  NSArray *homeLocations;
  PGRevGeocodeProcessor *v58;
  NSArray *v59;
  void *v60;
  PGRevGeocodeProcessor *v61;
  _BOOL4 v62;
  double v63;
  char v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  uint32_t v68;
  uint32_t v69;
  NSObject *v70;
  NSObject *v71;
  double v72;
  char v73;
  void *v74;
  uint64_t v75;
  void *v76;
  os_signpost_id_t spid;
  unint64_t v78;
  id v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  void (**v88)(void *, _BYTE *, double);
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;
  mach_timebase_info info;
  uint64_t v94;
  double *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  char v101;
  uint8_t v102[128];
  uint8_t buf[4];
  _BYTE v104[18];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v82 = a3;
  v79 = a4;
  v81 = a5;
  v80 = a6;
  v10 = (void (**)(void *, _BYTE *, double))_Block_copy(v80);
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  v94 = 0;
  v95 = (double *)&v94;
  v96 = 0x2020000000;
  v97 = 0;
  if (!v10
    || (v11 = CFAbsoluteTimeGetCurrent(), v11 - v95[3] < 0.01)
    || (v95[3] = v11,
        LOBYTE(info.numer) = 0,
        ((void (**)(void *, mach_timebase_info *, double))v10)[2](v10, &info, 0.0),
        v12 = *((_BYTE *)v99 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v99 + 24) = v12) == 0))
  {
    objc_msgSend(v82, "enrichmentLoggingConnection");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);
    v15 = v13;
    v16 = v15;
    spid = v14;
    v78 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PGGraphAssetRevGeocodeEnrichmentProcessor", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v75 = mach_absolute_time();
    if (-[PGGraphAssetRevGeocodeEnrichmentProcessor _allowReverseGeocodingWithUpdateType:](self, "_allowReverseGeocodingWithUpdateType:", objc_msgSend(v81, "updateType")))
    {
      objc_msgSend(v82, "photoLibrary");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "pg_urlForGraphApplicationData");
      v17 = objc_claimAutoreleasedReturnValue();
      v74 = (void *)v17;
      if (!v17)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "loggingConnection");
        v31 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "AssetsRevGeocoding: nil graph application data URL", buf, 2u);
        }

        if (!v10
          || (Current = CFAbsoluteTimeGetCurrent(), Current - v95[3] < 0.01)
          || (v95[3] = Current,
              v92 = 0,
              v10[2](v10, &v92, 1.0),
              v33 = *((_BYTE *)v99 + 24) | v92,
              (*((_BYTE *)v99 + 24) = v33) == 0))
        {
          v36 = mach_absolute_time();
          numer = info.numer;
          denom = info.denom;
          v39 = v16;
          v40 = v39;
          if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v40, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphAssetRevGeocodeEnrichmentProcessor", ", buf, 2u);
          }

          if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            goto LABEL_85;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v104 = "PGGraphAssetRevGeocodeEnrichmentProcessor";
          *(_WORD *)&v104[8] = 2048;
          *(double *)&v104[10] = (float)((float)((float)((float)(v36 - v75) * (float)numer) / (float)denom) / 1000000.0);
          v35 = "[Performance] %s: %f ms";
          v34 = v40;
          v41 = 22;
          goto LABEL_48;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v104 = 219;
          *(_WORD *)&v104[4] = 2080;
          *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
          v34 = MEMORY[0x1E0C81028];
          v35 = "Cancelled at line %d in file %s";
LABEL_47:
          v41 = 18;
LABEL_48:
          _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, v35, buf, v41);
        }
LABEL_85:

        goto LABEL_86;
      }
      if (-[PGGraphAssetRevGeocodeEnrichmentProcessor revGeoProviderDidChangeForGraphApplicationDataURL:](self, "revGeoProviderDidChangeForGraphApplicationDataURL:", v17))
      {
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __123__PGGraphAssetRevGeocodeEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
        v87[3] = &unk_1E8434F30;
        v88 = v10;
        v89 = &v94;
        v90 = &v98;
        v91 = 0x3F847AE147AE147BLL;
        -[PGGraphAssetRevGeocodeEnrichmentProcessor invalidateReverseLocationDataForRevGeoProviderChangeUsingManager:progressBlock:](self, "invalidateReverseLocationDataForRevGeoProviderChangeUsingManager:progressBlock:", v82, v87);
        if (*((_BYTE *)v99 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v104 = 229;
            *(_WORD *)&v104[4] = 2080;
            *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_85;
        }
        -[PGGraphAssetRevGeocodeEnrichmentProcessor setCurrentGeoProviderInGraphApplicationDataURL:](self, "setCurrentGeoProviderInGraphApplicationDataURL:", v17);

      }
      if (v10)
      {
        v42 = CFAbsoluteTimeGetCurrent();
        if (v42 - v95[3] >= 0.01)
        {
          v95[3] = v42;
          v92 = 0;
          v10[2](v10, &v92, 0.2);
          v43 = *((_BYTE *)v99 + 24) | v92;
          *((_BYTE *)v99 + 24) = v43;
          if (v43)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v104 = 234;
              *(_WORD *)&v104[4] = 2080;
              *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
              v34 = MEMORY[0x1E0C81028];
              v35 = "Cancelled at line %d in file %s";
              goto LABEL_47;
            }
            goto LABEL_85;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v81, "isResumingFullAnalysis");
      if ((v45 & 1) == 0)
      {
        objc_msgSend(v81, "momentsToProcessForMomentUpdateTypes:includeMomentsToIngest:", 20, 1);
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
        if (v47)
        {
          v48 = *(_QWORD *)v84;
          do
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v84 != v48)
                objc_enumerationMutation(v46);
              objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "uuid");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v50);

            }
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
          }
          while (v47);
        }

      }
      +[PGRevGeocodeProcessor momentsRequiringRevGeocodingWithUUIDs:inPhotoLibrary:defaultToAllAssets:loggingConnection:](PGRevGeocodeProcessor, "momentsRequiringRevGeocodingWithUUIDs:inPhotoLibrary:defaultToAllAssets:loggingConnection:", v44, v76, v45, v16);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v52 = CFAbsoluteTimeGetCurrent();
        if (v52 - v95[3] >= 0.01)
        {
          v95[3] = v52;
          v92 = 0;
          v10[2](v10, &v92, 0.3);
          v53 = *((_BYTE *)v99 + 24) | v92;
          *((_BYTE *)v99 + 24) = v53;
          if (v53)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v104 = 251;
              *(_WORD *)&v104[4] = 2080;
              *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            goto LABEL_84;
          }
        }
      }
      v54 = (void *)objc_opt_class();
      objc_msgSend(v82, "serviceManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "homeLocationsWithServiceManager:", v55);
      v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
      homeLocations = self->_homeLocations;
      self->_homeLocations = v56;

      v58 = [PGRevGeocodeProcessor alloc];
      v59 = self->_homeLocations;
      objc_msgSend(v82, "locationCache");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[PGRevGeocodeProcessor initWithPhotoLibrary:homeLocations:loggingConnection:locationCache:](v58, "initWithPhotoLibrary:homeLocations:loggingConnection:locationCache:", v76, v59, v16, v60);

      v62 = -[PGRevGeocodeProcessor revGeocodeMoments:progressBlock:](v61, "revGeocodeMoments:progressBlock:", v51, v80);
      if (v10
        && (v63 = CFAbsoluteTimeGetCurrent(), v63 - v95[3] >= 0.01)
        && (v95[3] = v63,
            v92 = 0,
            v10[2](v10, &v92, 0.7),
            v64 = *((_BYTE *)v99 + 24) | v92,
            (*((_BYTE *)v99 + 24) = v64) != 0))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_83:

LABEL_84:
          goto LABEL_85;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v104 = 255;
        *(_WORD *)&v104[4] = 2080;
        *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
        v65 = MEMORY[0x1E0C81028];
      }
      else
      {
        if (!v62)
          goto LABEL_83;
        if (-[PGRevGeocodeProcessor numberOfMomentsRevGeocoded](v61, "numberOfMomentsRevGeocoded")
          && -[PGRevGeocodeProcessor numberOfAssetClustersRevGeocoded](v61, "numberOfAssetClustersRevGeocoded"))
        {
          objc_msgSend(v82, "analytics");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGGraphAssetRevGeocodeEnrichmentProcessor sendMetricsForGeocodeProcesssor:toAnalytics:progressBlock:](self, "sendMetricsForGeocodeProcesssor:toAnalytics:progressBlock:", v61, v66, v80);

        }
        v67 = mach_absolute_time();
        v69 = info.numer;
        v68 = info.denom;
        v70 = v16;
        v71 = v70;
        if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v71, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphAssetRevGeocodeEnrichmentProcessor", ", buf, 2u);
        }

        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v104 = "PGGraphAssetRevGeocodeEnrichmentProcessor";
          *(_WORD *)&v104[8] = 2048;
          *(double *)&v104[10] = (float)((float)((float)((float)(v67 - v75) * (float)v69) / (float)v68) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v71, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        if (!v10)
          goto LABEL_83;
        v72 = CFAbsoluteTimeGetCurrent();
        if (v72 - v95[3] < 0.01)
          goto LABEL_83;
        v95[3] = v72;
        v92 = 0;
        v10[2](v10, &v92, 1.0);
        v73 = *((_BYTE *)v99 + 24) | v92;
        *((_BYTE *)v99 + 24) = v73;
        if (!v73 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_83;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v104 = 264;
        *(_WORD *)&v104[4] = 2080;
        *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
        v65 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1CA237000, v65, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_83;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "AssetsRevGeocoding: reverse geocoding not allowed", buf, 2u);
    }

    if (v10
      && (v20 = CFAbsoluteTimeGetCurrent(), v20 - v95[3] >= 0.01)
      && (v95[3] = v20,
          v92 = 0,
          v10[2](v10, &v92, 1.0),
          v21 = *((_BYTE *)v99 + 24) | v92,
          (*((_BYTE *)v99 + 24) = v21) != 0))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_86:

        goto LABEL_87;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v104 = 208;
      *(_WORD *)&v104[4] = 2080;
      *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
      v22 = MEMORY[0x1E0C81028];
      v23 = "Cancelled at line %d in file %s";
      v24 = 18;
    }
    else
    {
      v25 = mach_absolute_time();
      v27 = info.numer;
      v26 = info.denom;
      v28 = v16;
      v29 = v28;
      if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v29, OS_SIGNPOST_INTERVAL_END, v14, "PGGraphAssetRevGeocodeEnrichmentProcessor", ", buf, 2u);
      }

      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        goto LABEL_86;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v104 = "PGGraphAssetRevGeocodeEnrichmentProcessor";
      *(_WORD *)&v104[8] = 2048;
      *(double *)&v104[10] = (float)((float)((float)((float)(v25 - v75) * (float)v27) / (float)v26) / 1000000.0);
      v23 = "[Performance] %s: %f ms";
      v22 = v29;
      v24 = 22;
    }
    _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);
    goto LABEL_86;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v104 = 198;
    *(_WORD *)&v104[4] = 2080;
    *(_QWORD *)&v104[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_87:
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

}

- (void)sendMetricsForGeocodeProcesssor:(id)a3 toAnalytics:(id)a4 progressBlock:(id)a5
{
  id v7;
  double v8;
  char v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  unint64_t v28;
  double v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  PGRevGeoMetricEvent *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  double Current;
  char v42;
  double v43;
  double v44;
  double v45;
  id v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint8_t buf[4];
  int v64;
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = a4;
  v46 = a5;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = (double *)&v55;
  v57 = 0x2020000000;
  v58 = 0;
  v48 = _Block_copy(v46);
  if (!v48
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v56[3] < 0.01)
    || (v56[3] = v8,
        v54 = 0,
        (*((void (**)(void *, char *, double))v48 + 2))(v48, &v54, 0.0),
        v9 = *((_BYTE *)v60 + 24) | v54,
        (*((_BYTE *)v60 + 24) = v9) == 0))
  {
    objc_msgSend(v7, "sumNumberOfAssetClustersPerMoment");
    v45 = v10;
    v11 = objc_msgSend(v7, "numberOfMomentsRevGeocoded");
    objc_msgSend(v7, "sumNumberOfAssetClustersPerMoment");
    v44 = v12;
    objc_msgSend(v7, "sumSquareNumberOfAssetClustersPerMoment");
    v43 = v13;
    v14 = objc_msgSend(v7, "numberOfMomentsRevGeocoded");
    objc_msgSend(v7, "sumNumberOfAssetsPerCluster");
    v16 = v15;
    v17 = objc_msgSend(v7, "numberOfAssetClustersRevGeocoded");
    objc_msgSend(v7, "sumNumberOfAssetsPerCluster");
    v19 = v18;
    objc_msgSend(v7, "sumSquareNumberOfAssetsPerCluster");
    v21 = v20;
    v22 = objc_msgSend(v7, "numberOfAssetClustersRevGeocoded");
    objc_msgSend(v7, "numberOfAssetClustersWithin10mOfCenter");
    v24 = v23;
    v25 = objc_msgSend(v7, "numberOfAssetClustersRevGeocoded");
    objc_msgSend(v7, "numberOfAssetClustersWithin20mOfCenter");
    v27 = v26;
    v28 = objc_msgSend(v7, "numberOfAssetClustersRevGeocoded");
    objc_msgSend(v7, "numberOfAssetClustersWithin50mOfCenter");
    v30 = v29;
    v31 = objc_msgSend(v7, "numberOfAssetClustersRevGeocoded");
    objc_msgSend(v7, "numberOfAssetClustersWithin100mOfCenter");
    v33 = v32;
    v34 = objc_msgSend(v7, "numberOfAssetClustersRevGeocoded");
    objc_msgSend(v7, "numberOfAssetClusters100mPlusFromCenter");
    v36 = -[PGRevGeoMetricEvent initWithNumberOfAssetClustersPerMomentMean:numberOfAssetClustersPerMomentStdDev:numberOfAssetsPerClusterMean:numberOfAssetsPerClusterStdDev:ratioAssetClustersWithin10mOfCenter:ratioAssetClustersWithin20mOfCenter:ratioAssetClustersWithin50mOfCenter:ratioAssetClustersWithin100mOfCenter:ratioAssetClusters100mPlusFromCenter:]([PGRevGeoMetricEvent alloc], "initWithNumberOfAssetClustersPerMomentMean:numberOfAssetClustersPerMomentStdDev:numberOfAssetsPerClusterMean:numberOfAssetsPerClusterStdDev:ratioAssetClustersWithin10mOfCenter:ratioAssetClustersWithin20mOfCenter:ratioAssetClustersWithin50mOfCenter:ratioAssetClustersWithin100mOfCenter:ratioAssetClusters100mPlusFromCenter:", v45 / (double)v11, sqrt((double)v14 * v43 - v44 * v44) / (double)v14, v16 / (double)v17, sqrt((double)v22 * v21 - v19 * v19) / (double)v22, v24 / (double)v25, v27 / (double)v28, v30 / (double)v31, v33 / (double)v34, v35 / (double)(unint64_t)objc_msgSend(v7, "numberOfAssetClustersRevGeocoded"));
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __103__PGGraphAssetRevGeocodeEnrichmentProcessor_sendMetricsForGeocodeProcesssor_toAnalytics_progressBlock___block_invoke;
    v49[3] = &unk_1E8434F30;
    v37 = v48;
    v50 = v37;
    v51 = &v55;
    v52 = &v59;
    v53 = 0x3F847AE147AE147BLL;
    -[PGAbstractMetricEvent gatherMetricsWithProgressBlock:](v36, "gatherMetricsWithProgressBlock:", v49);
    if (*((_BYTE *)v60 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_DWORD *)buf = 67109378;
      v64 = 299;
      v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
      v38 = MEMORY[0x1E0C81028];
    }
    else
    {
      -[PGRevGeoMetricEvent identifier](v36, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGRevGeoMetricEvent payload](v36, "payload");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "sendEvent:withPayload:", v39, v40);

      if (!v48)
        goto LABEL_15;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v56[3] < 0.01)
        goto LABEL_15;
      v56[3] = Current;
      v54 = 0;
      (*((void (**)(id, char *, double))v37 + 2))(v37, &v54, 1.0);
      v42 = *((_BYTE *)v60 + 24) | v54;
      *((_BYTE *)v60 + 24) = v42;
      if (!v42 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)buf = 67109378;
      v64 = 302;
      v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
      v38 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v64 = 281;
    v65 = 2080;
    v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphAssetRevGeocodeEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_16:
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

}

- (void)_processMetricsOfAssetClustersInMoment:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  uint64_t v19;
  double *p_numberOfAssetClustersWithin50mOfCenter;
  uint64x2_t v21;
  uint64_t v22;
  unint64_t numberOfMomentsRevGeocoded;
  unint64_t v24;
  uint64x2_t v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a3;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v5, "assets");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        objc_msgSend(v5, "region");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v34 = 0;
        objc_msgSend(v8, "center");
        v33 = v9;
        v34 = v10;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v5, "assets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v30;
          v15 = 0.0;
LABEL_8:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "location");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "coordinate");

            CLLocationCoordinate2DGetDistanceFrom();
            if (v15 < v18)
              v15 = v18;
            if (v15 >= 100.0)
              break;
            if (v13 == ++v16)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
              if (v13)
                goto LABEL_8;
              break;
            }
          }

          v19 = 88;
          if (v15 < 100.0)
            v19 = 80;
          p_numberOfAssetClustersWithin50mOfCenter = (double *)((char *)self + v19);
          if (v15 < 50.0)
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin50mOfCenter;
          if (v15 < 20.0)
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin20mOfCenter;
          if (v15 < 10.0)
            p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin10mOfCenter;
        }
        else
        {

          p_numberOfAssetClustersWithin50mOfCenter = &self->_numberOfAssetClustersWithin10mOfCenter;
        }
        *p_numberOfAssetClustersWithin50mOfCenter = *p_numberOfAssetClustersWithin50mOfCenter + 1.0;
        v21.i64[0] = v7;
        v21.i64[1] = v7 * v7;
        *(float64x2_t *)&self->_sumNumberOfAssetsPerCluster = vaddq_f64(*(float64x2_t *)&self->_sumNumberOfAssetsPerCluster, vcvtq_f64_u64(v21));

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v28);
  }
  v22 = objc_msgSend(obj, "count");
  numberOfMomentsRevGeocoded = self->_numberOfMomentsRevGeocoded;
  v24 = self->_numberOfAssetClustersRevGeocoded + v22;
  v25.i64[0] = v22;
  v25.i64[1] = v22 * v22;
  *(float64x2_t *)&self->_sumNumberOfAssetClustersPerMoment = vaddq_f64(*(float64x2_t *)&self->_sumNumberOfAssetClustersPerMoment, vcvtq_f64_u64(v25));
  self->_numberOfMomentsRevGeocoded = numberOfMomentsRevGeocoded + 1;
  self->_numberOfAssetClustersRevGeocoded = v24;

}

- (BOOL)_allowReverseGeocodingWithUpdateType:(int64_t)a3
{
  BOOL v3;
  void *v4;

  v3 = 1;
  if ((unint64_t)a3 <= 3 && a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0D4B240], "reachabilityForInternetConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "currentNetworkStatus") == 2;

  }
  return v3;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (void)setHomeLocations:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocations, a3);
}

- (double)sumNumberOfAssetClustersPerMoment
{
  return self->_sumNumberOfAssetClustersPerMoment;
}

- (double)sumSquareNumberOfAssetClustersPerMoment
{
  return self->_sumSquareNumberOfAssetClustersPerMoment;
}

- (double)sumNumberOfAssetsPerCluster
{
  return self->_sumNumberOfAssetsPerCluster;
}

- (double)sumSquareNumberOfAssetsPerCluster
{
  return self->_sumSquareNumberOfAssetsPerCluster;
}

- (double)numberOfAssetClustersWithin10mOfCenter
{
  return self->_numberOfAssetClustersWithin10mOfCenter;
}

- (double)numberOfAssetClustersWithin20mOfCenter
{
  return self->_numberOfAssetClustersWithin20mOfCenter;
}

- (double)numberOfAssetClustersWithin50mOfCenter
{
  return self->_numberOfAssetClustersWithin50mOfCenter;
}

- (double)numberOfAssetClustersWithin100mOfCenter
{
  return self->_numberOfAssetClustersWithin100mOfCenter;
}

- (double)numberOfAssetClusters100mPlusFromCenter
{
  return self->_numberOfAssetClusters100mPlusFromCenter;
}

- (unint64_t)numberOfMomentsRevGeocoded
{
  return self->_numberOfMomentsRevGeocoded;
}

- (unint64_t)numberOfAssetClustersRevGeocoded
{
  return self->_numberOfAssetClustersRevGeocoded;
}

- (BOOL)requiresValidGraph
{
  return self->_requiresValidGraph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocations, 0);
}

void __103__PGGraphAssetRevGeocodeEnrichmentProcessor_sendMetricsForGeocodeProcesssor_toAnalytics_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __123__PGGraphAssetRevGeocodeEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_2;
  v8[3] = &unk_1E8435668;
  v9 = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_3;
  v6[3] = &unk_1E842ECA0;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "performChanges:completionHandler:", v8, v6);

}

void __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setReverseLocationData:", 0);
        objc_msgSend(v6, "setReverseLocationDataIsValid:", 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __124__PGGraphAssetRevGeocodeEnrichmentProcessor_invalidateReverseLocationDataForRevGeoProviderChangeUsingManager_progressBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Cannot reset the reverse location information with error %@", (uint8_t *)&v8, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (id)homeLocationsWithServiceManager:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "mePerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PGGraphAssetRevGeocodeEnrichmentProcessor_homeLocationsWithServiceManager___block_invoke;
  v9[3] = &unk_1E842ECF0;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateAddressesOfType:asCLLocationsWithBlock:", 0, v9);

  return v7;
}

uint64_t __77__PGGraphAssetRevGeocodeEnrichmentProcessor_homeLocationsWithServiceManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
