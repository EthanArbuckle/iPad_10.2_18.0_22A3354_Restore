@implementation PGUpNextMemoriesGenerationRequest

- (PGUpNextMemoriesGenerationRequest)initWithRootMemoryLocalIdentifier:(id)a3 momentUUIDs:(id)a4 memoryLocalIdentifiersToAvoid:(id)a5 targetUpNextMemoryCount:(unint64_t)a6 sharingFilter:(unsigned __int16)a7
{
  uint64_t v8;

  LOWORD(v8) = a7;
  return -[PGUpNextMemoriesGenerationRequest initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:customVectors:wantsVerboseDebugInfo:sharingFilter:](self, "initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:customVectors:wantsVerboseDebugInfo:sharingFilter:", a3, a4, a5, a6, 0, 0, v8);
}

- (PGUpNextMemoriesGenerationRequest)initWithRootMemoryLocalIdentifier:(id)a3 momentUUIDs:(id)a4 memoryLocalIdentifiersToAvoid:(id)a5 targetUpNextMemoryCount:(unint64_t)a6 customVectors:(id)a7 wantsVerboseDebugInfo:(BOOL)a8 sharingFilter:(unsigned __int16)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  PGUpNextMemoriesGenerationRequest *v19;
  uint64_t v20;
  NSString *rootMemoryLocalIdentifier;
  uint64_t v22;
  NSArray *momentUUIDs;
  uint64_t v24;
  NSSet *memoryLocalIdentifiersToAvoid;
  uint64_t v26;
  NSArray *customVectors;
  objc_super v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PGUpNextMemoriesGenerationRequest;
  v19 = -[PGUpNextMemoriesGenerationRequest init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    rootMemoryLocalIdentifier = v19->_rootMemoryLocalIdentifier;
    v19->_rootMemoryLocalIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    momentUUIDs = v19->_momentUUIDs;
    v19->_momentUUIDs = (NSArray *)v22;

    v24 = objc_msgSend(v17, "copy");
    memoryLocalIdentifiersToAvoid = v19->_memoryLocalIdentifiersToAvoid;
    v19->_memoryLocalIdentifiersToAvoid = (NSSet *)v24;

    v19->_targetUpNextMemoryCount = a6;
    v26 = objc_msgSend(v18, "copy");
    customVectors = v19->_customVectors;
    v19->_customVectors = (NSArray *)v26;

    v19->_wantsVerboseDebugInfo = a8;
    v19->_sharingFilter = a9;
  }

  return v19;
}

- (id)fetchMemoryLocalIdentifiersWithWorkingContext:(id)a3 musicCurationOptions:(id)a4 error:(id *)a5
{
  id v8;
  NSString *v9;
  NSSet *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  PGUpNextMemoriesGenerationResult *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  PGUpNextMemoriesAggregator *v30;
  id v31;
  uint64_t v32;
  uint32_t denom;
  uint32_t numer;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  unint64_t v42;
  PGUpNextMusicCurator *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint32_t v48;
  uint32_t v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  uint32_t v53;
  uint32_t v54;
  NSObject *v55;
  NSObject *v56;
  os_signpost_id_t spid;
  uint64_t v59;
  id v60;
  void *v61;
  NSString *v62;
  NSSet *v63;
  id v64;
  os_signpost_id_t v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  PGUpNextMemoriesAggregator *v69;
  id v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v74;
  NSObject *oslog;
  mach_timebase_info v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  mach_timebase_info v82;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  double v87;
  __int16 v88;
  NSSet *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v73 = a4;
  v9 = self->_rootMemoryLocalIdentifier;
  v10 = self->_memoryLocalIdentifiersToAvoid;
  objc_msgSend(v8, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v85 = -[PGUpNextMemoriesGenerationRequest targetUpNextMemoryCount](self, "targetUpNextMemoryCount");
    v86 = 2112;
    v87 = *(double *)&v9;
    v88 = 2112;
    v89 = v10;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "[UpNext] Requesting %lu Up Next memories for memory:(%@), memories to avoid:%@", buf, 0x20u);
  }
  objc_msgSend(v8, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  v67 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGUpNextMemoriesGenerationRequest", ", buf, 2u);
  }
  v65 = v13;
  oslog = v11;
  v72 = v15;

  info = 0;
  mach_timebase_info(&info);
  v66 = mach_absolute_time();
  objc_msgSend(v8, "loggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PGUpNextMemoriesGenerationSetup", ", buf, 2u);
  }

  v82 = 0;
  mach_timebase_info(&v82);
  v20 = mach_absolute_time();
  objc_msgSend(v8, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v74 = 0;
LABEL_14:
    -[PGUpNextMemoriesGenerationRequest localMemoriesByUniqueMemoryIdentifiersWithWorkingContext:](self, "localMemoriesByUniqueMemoryIdentifiersWithWorkingContext:", v8);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v71, "count"))
    {
      if (a5)
      {
        objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 1, CFSTR("[UpNext] Could not find any local memories"));
        v23 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      v24 = oslog;
      v25 = v72;
      goto LABEL_58;
    }
    v62 = v9;
    v63 = v10;
    v26 = v21;
    v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __110__PGUpNextMemoriesGenerationRequest_fetchMemoryLocalIdentifiersWithWorkingContext_musicCurationOptions_error___block_invoke;
    v78[3] = &unk_1E842DC18;
    v70 = v27;
    v79 = v70;
    v68 = v26;
    v60 = v26;
    v80 = v60;
    v29 = v28;
    v81 = v29;
    -[PGUpNextMemoriesGenerationRequest _enumerateMemoriesToAvoidWithWorkingContext:usingBlock:](self, "_enumerateMemoriesToAvoidWithWorkingContext:usingBlock:", v8, v78);
    v30 = [PGUpNextMemoriesAggregator alloc];
    v31 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v61 = v29;
    v69 = -[PGUpNextMemoriesAggregator initWithLowercaseTitles:keyAssetLocalIdentifiers:gateOnUserFeedback:loggingConnection:](v30, "initWithLowercaseTitles:keyAssetLocalIdentifiers:gateOnUserFeedback:loggingConnection:", v31, v29, 1, oslog);

    v32 = mach_absolute_time();
    numer = v82.numer;
    denom = v82.denom;
    v35 = v19;
    v36 = v35;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_END, v17, "PGUpNextMemoriesGenerationSetup", ", buf, 2u);
    }

    v25 = v72;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v85 = "PGUpNextMemoriesGenerationSetup";
      v86 = 2048;
      v87 = (float)((float)((float)((float)(v32 - v20) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v77 = 0;
    -[PGUpNextMemoriesGenerationRequest upNextMemoryLocalIdentifiersWithWorkingContext:rootMemory:localMemoriesByUniqueMemoryIdentifiers:uniqueMemoryIdentifiersOfMemoriesToAvoid:aggregator:debugInfo:error:](self, "upNextMemoryLocalIdentifiersWithWorkingContext:rootMemory:localMemoriesByUniqueMemoryIdentifiers:uniqueMemoryIdentifiersOfMemoriesToAvoid:aggregator:debugInfo:error:", v8, v74, v71, v70, v69, &v77, a5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v77;
    v9 = v62;
    if (v37)
    {
      v10 = v63;
      v24 = oslog;
      v21 = v68;
      if (!objc_msgSend(v37, "count"))
      {
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpNext] Could not find up next memories for memory with local identifier (%@), debug info (%@)"), v62, v64);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 2, v46);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v45 = v64;

          v21 = v68;
          v23 = 0;
        }
        else
        {
          v23 = 0;
          v45 = v64;
        }
        goto LABEL_57;
      }
      if (objc_msgSend(v73, "shouldCurateUpNextMemories"))
      {
        objc_msgSend(v8, "loggingConnection");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = os_signpost_id_generate(v38);
        v40 = v38;
        v41 = v40;
        v42 = v39 - 1;
        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "PGUpNextMemoriesGenerationMusicCuration", ", buf, 2u);
        }
        spid = v39;

        v76 = 0;
        mach_timebase_info(&v76);
        v59 = mach_absolute_time();
        v43 = -[PGUpNextMusicCurator initWithLoggingConnection:]([PGUpNextMusicCurator alloc], "initWithLoggingConnection:", oslog);
        if (!-[PGUpNextMusicCurator curateMusicForUpNextMemoriesWithLocalIdentifiers:musicCurationOptions:photoLibrary:managerContext:error:](v43, "curateMusicForUpNextMemoriesWithLocalIdentifiers:musicCurationOptions:photoLibrary:managerContext:error:", v37, v73, v60, v8, a5))
        {
          if (a5)
          {
            objc_msgSend(*a5, "description");
            v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = CFSTR("no error");
          }
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v85 = (const char *)v44;
            v86 = 2112;
            v87 = *(double *)&v37;
            _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "[UpNext] Music curation failed (%@) for Up Next memories: %@", buf, 0x16u);
          }

        }
        v47 = mach_absolute_time();
        v49 = v76.numer;
        v48 = v76.denom;
        v50 = v41;
        v51 = v50;
        if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v51, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMemoriesGenerationMusicCuration", ", buf, 2u);
        }

        v25 = v72;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v85 = "PGUpNextMemoriesGenerationMusicCuration";
          v86 = 2048;
          v87 = (float)((float)((float)((float)(v47 - v59) * (float)v49) / (float)v48) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        v24 = oslog;
      }
      v52 = mach_absolute_time();
      v54 = info.numer;
      v53 = info.denom;
      v55 = v25;
      v56 = v55;
      if (v67 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v56, OS_SIGNPOST_INTERVAL_END, v65, "PGUpNextMemoriesGenerationRequest", ", buf, 2u);
      }

      v45 = v64;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v85 = "PGUpNextMemoriesGenerationRequest";
        v86 = 2048;
        v87 = (float)((float)((float)((float)(v52 - v66) * (float)v54) / (float)v53) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v85 = (const char *)v37;
        _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEFAULT, "[UpNext] Result Up Next memories: %@", buf, 0xCu);
      }
      v23 = -[PGUpNextMemoriesGenerationResult initWithMemoryLocalIdentifiers:debugInfo:]([PGUpNextMemoriesGenerationResult alloc], "initWithMemoryLocalIdentifiers:debugInfo:", v37, v64);
    }
    else
    {
      v23 = 0;
      v10 = v63;
      v45 = v64;
      v24 = oslog;
    }
    v21 = v68;
LABEL_57:

LABEL_58:
    goto LABEL_59;
  }
  -[PGUpNextMemoriesGenerationRequest _fetchRootMemoryWithPhotoLibrary:](self, "_fetchRootMemoryWithPhotoLibrary:", v21);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
    goto LABEL_14;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpNext] Could not find root memory with local identifier (%@)"), v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 1, v22);
    v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v24 = oslog;
    v25 = v72;

  }
  else
  {
    v23 = 0;
    v24 = oslog;
    v25 = v72;
  }
LABEL_59:

  return v23;
}

- (id)upNextMemoryLocalIdentifiersWithWorkingContext:(id)a3 rootMemory:(id)a4 localMemoriesByUniqueMemoryIdentifiers:(id)a5 uniqueMemoryIdentifiersOfMemoriesToAvoid:(id)a6 aggregator:(id)a7 debugInfo:(id *)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  void *v24;
  void *v25;
  _TtC11PhotosGraph24PGUpNextDebugInfoBuilder *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _TtC11PhotosGraph24PGUpNextDebugInfoBuilder *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *oslog;
  os_log_t osloga;
  void *v56;
  _QWORD v57[4];
  os_log_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _TtC11PhotosGraph24PGUpNextDebugInfoBuilder *v64;
  PGUpNextMemoriesGenerationRequest *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  __int128 *p_buf;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  __int128 buf;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v42 = a5;
  v44 = a6;
  v16 = a7;
  v17 = v14;
  v46 = v16;
  objc_msgSend(v14, "photoLibrary");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loggingConnection");
  oslog = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "title");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v18 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v56, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v15, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  objc_msgSend(v15, "graphMemoryIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "[UpNext] Up Next RootMemory MemoryNodeUniqueIdentifier:(%@)", (uint8_t *)&buf, 0xCu);
  }
  v23 = self->_momentUUIDs;
  v24 = v23;
  if (v15 && !v23)
  {
    -[PGUpNextMemoriesGenerationRequest _momentUUIDsForMemory:](self, "_momentUUIDsForMemory:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a9 && !v24)
  {
    objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 0, CFSTR("[UpNext] Neither rootMemory nor starting moments were provided for UpNext generation"));
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", v56);
  -[PGUpNextMemoriesGenerationRequest customVectors](self, "customVectors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(_TtC11PhotosGraph24PGUpNextDebugInfoBuilder);
  -[PGUpNextDebugInfoBuilder setWantsVerboseDebugInfo:](v26, "setWantsVerboseDebugInfo:", self->_wantsVerboseDebugInfo);
  -[PGUpNextDebugInfoBuilder setRootMemoryNodeUniqueIdentifier:](v26, "setRootMemoryNodeUniqueIdentifier:", v22);
  -[PGUpNextDebugInfoBuilder setMomentUUIDs:](v26, "setMomentUUIDs:", v24);
  -[PGUpNextDebugInfoBuilder setFeatureWeightVectors:](v26, "setFeatureWeightVectors:", v25);
  -[PGUpNextDebugInfoBuilder setRootMemoryIsAggregation:](v26, "setRootMemoryIsAggregation:", (unint64_t)(PGMemorySourceTypeFromCategory(objc_msgSend(v15, "category")) - 3) < 2);
  objc_msgSend(v15, "uuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "substringToIndex:", 8);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subtitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "substringToIndex:", 8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Root memory: %@\n\t%@ - %@\n\tkeyAsset: %@"), v51, v50, v49, v48);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGUpNextDebugInfoBuilder addSuggestionFilteringLog:](v26, "addSuggestionFilteringLog:", v29);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__36560;
  v81 = __Block_byref_object_dispose__36561;
  v82 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__36560;
  v76 = __Block_byref_object_dispose__36561;
  v77 = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke;
  v57[3] = &unk_1E842DC68;
  osloga = oslog;
  v58 = osloga;
  v43 = v42;
  v59 = v43;
  v45 = v44;
  v60 = v45;
  v30 = v22;
  v61 = v30;
  v40 = v15;
  v62 = v40;
  v31 = v24;
  v63 = v31;
  v32 = v26;
  v64 = v32;
  v65 = self;
  v33 = v25;
  v66 = v33;
  v34 = v56;
  v67 = v34;
  v35 = v41;
  v68 = v35;
  v36 = v46;
  v69 = v36;
  p_buf = &buf;
  v71 = &v72;
  objc_msgSend(v17, "performSynchronousConcurrentGraphReadUsingBlock:", v57);
  if (a8)
  {
    -[PGUpNextDebugInfoBuilder debugInfo](v32, "debugInfo");
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = *((_QWORD *)&buf + 1);
  if (a9 && !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    *a9 = objc_retainAutorelease((id)v73[5]);
    v37 = *((_QWORD *)&buf + 1);
  }
  v38 = *(id *)(v37 + 40);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&buf, 8);

  return v38;
}

- (id)localMemoriesByUniqueMemoryIdentifiersWithWorkingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  v29 = v4;
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_baseMemoryFetchOptionsWithPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSharingFilter:", -[PGUpNextMemoriesGenerationRequest sharingFilter](self, "sharingFilter"));
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("pendingState"), 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84E9D18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "unsignedIntegerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v15);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "loggingConnection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134217984;
    v40 = v18;
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_DEFAULT, "[UpNext] Found %lu eligible local memories", buf, 0xCu);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v25, "graphMemoryIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v22);
  }

  return v19;
}

- (void)_enumerateMemoriesToAvoidWithWorkingContext:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_baseMemoryFetchOptionsWithPhotoLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier IN %@"), self->_memoryLocalIdentifiersToAvoid);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CD1630], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loggingConnection");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "[UpNext] Found %lu memories to avoid", buf, 0xCu);
  }

  if (objc_msgSend(v12, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v15);

      ++v14;
    }
    while (v14 < objc_msgSend(v12, "count"));
  }

}

- (id)_fetchRootMemoryWithPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_baseMemoryFetchOptionsWithPhotoLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CD13B8];
  v11[0] = self->_rootMemoryLocalIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_momentUUIDsForMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchMomentsBackingMemory:options:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }

  return v8;
}

- (NSString)rootMemoryLocalIdentifier
{
  return self->_rootMemoryLocalIdentifier;
}

- (NSArray)momentUUIDs
{
  return self->_momentUUIDs;
}

- (NSSet)memoryLocalIdentifiersToAvoid
{
  return self->_memoryLocalIdentifiersToAvoid;
}

- (unint64_t)targetUpNextMemoryCount
{
  return self->_targetUpNextMemoryCount;
}

- (NSArray)customVectors
{
  return self->_customVectors;
}

- (BOOL)wantsVerboseDebugInfo
{
  return self->_wantsVerboseDebugInfo;
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customVectors, 0);
  objc_storeStrong((id *)&self->_memoryLocalIdentifiersToAvoid, 0);
  objc_storeStrong((id *)&self->_momentUUIDs, 0);
  objc_storeStrong((id *)&self->_rootMemoryLocalIdentifier, 0);
}

void __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __objc2_class **v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  mach_timebase_info v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  _BOOL4 v50;
  id v51;
  uint64_t v52;
  mach_timebase_info v53;
  NSObject *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  _TtC11PhotosGraph16PGUpNextComputer *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  NSObject *log;
  PGUpNextMomentCollectionBasedMatchingInfo *v73;
  void *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _BYTE *v86;
  id v87;
  mach_timebase_info v88;
  mach_timebase_info v89;
  mach_timebase_info info;
  uint8_t v91[4];
  const char *v92;
  __int16 v93;
  double v94;
  _BYTE buf[24];
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v69 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGUpNextMemoriesEligibleMemories", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v65 = mach_absolute_time();
  objc_msgSend(v69, "graph");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifierArray:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesWithUniqueIdentifierArray:inGraph:", v7, v74);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifiers:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesWithUniqueIdentifiers:inGraph:", *(_QWORD *)(a1 + 48), v74);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionBySubtracting:", v68);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "tripTypeNodesInGraph:", v74);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "highlightNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "momentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "memoryNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "subsetWithMemoryCategory:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionBySubtracting:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGMemoryTriggerHandler personMemoryNodesFeaturingMeNodeInGraph:](PGMemoryTriggerHandler, "personMemoryNodesFeaturingMeNodeInGraph:", v74);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionBySubtracting:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_QWORD *)(a1 + 56);
  if (!v18)
    goto LABEL_11;
  +[PGGraphMemoryNodeCollection memoryNodeAsCollectionWithUniqueIdentifier:inGraph:](PGGraphMemoryNodeCollection, "memoryNodeAsCollectionWithUniqueIdentifier:inGraph:", v18, v74);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") != 1)
  {

LABEL_11:
    +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", *(_QWORD *)(a1 + 72), v74);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[PGUpNextMomentCollectionBasedMatchingInfo initWithMomentNodes:]([PGUpNextMomentCollectionBasedMatchingInfo alloc], "initWithMomentNodes:", v22);

    goto LABEL_12;
  }
  v20 = objc_msgSend(*(id *)(a1 + 64), "category");
  v21 = off_1E83FB590;
  if (v20 != 27)
    v21 = off_1E83FB588;
  v73 = (PGUpNextMomentCollectionBasedMatchingInfo *)objc_msgSend(objc_alloc(*v21), "initWithMemoryNodeAsCollection:", v19);

  if (!v73)
    goto LABEL_11;
LABEL_12:
  -[PGUpNextMomentCollectionBasedMatchingInfo debugInfo](v73, "debugInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "setInputDebugInfo:", v23);

  -[PGUpNextMomentCollectionBasedMatchingInfo momentNodes](v73, "momentNodes");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    objc_msgSend((id)objc_opt_class(), "_memoryNodesWithSignificantOverlapWithMomentNodes:", v70);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionBySubtracting:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v25;
  }
  objc_msgSend(v17, "subsetWithMemoryCategory:", 27);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "collectionBySubtracting:", v71);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v29 = v6;
  v30 = v29;
  log = v29;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v31 = os_signpost_enabled(v29);
    v30 = log;
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, log, OS_SIGNPOST_INTERVAL_END, v4, "PGUpNextMemoriesEligibleMemories", ", buf, 2u);
      v30 = log;
    }
  }

  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "PGUpNextMemoriesEligibleMemories";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v26 - v65) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v32 = *(id *)(a1 + 32);
  v33 = os_signpost_id_generate(v32);
  v34 = v32;
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PGUpNextMemoriesTargets", ", buf, 2u);
  }

  v89 = 0;
  mach_timebase_info(&v89);
  v36 = mach_absolute_time();
  +[PGUpNextMemoryFeatureBasedMatchingInfo matchingInfosWithMemoryNodes:](PGUpNextMemoryFeatureBasedMatchingInfo, "matchingInfosWithMemoryNodes:", v71);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGUpNextMemoryBasedMatchingInfo matchingInfosWithMemoryNodes:](PGUpNextMemoryBasedMatchingInfo, "matchingInfosWithMemoryNodes:", v67);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "arrayByAddingObjectsFromArray:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[PGUpNextComputer initWithTargets:]([_TtC11PhotosGraph16PGUpNextComputer alloc], "initWithTargets:", v63);
  v37 = mach_absolute_time();
  v38 = v89;
  v39 = v35;
  v40 = v39;
  if (v33 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v40, OS_SIGNPOST_INTERVAL_END, v33, "PGUpNextMemoriesTargets", ", buf, 2u);
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "PGUpNextMemoriesTargets";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v37 - v36) * (float)v38.numer) / (float)v38.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v41 = *(id *)(a1 + 32);
  v42 = os_signpost_id_generate(v41);
  v43 = v41;
  v44 = v43;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v42, "PGUpNextMemoriesGenerationEnumeration", ", buf, 2u);
  }

  v88 = 0;
  mach_timebase_info(&v88);
  v61 = mach_absolute_time();
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v96 = 0;
  v96 = objc_msgSend(*(id *)(a1 + 88), "targetUpNextMemoryCount");
  v46 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v47 = *(_QWORD *)(a1 + 96);
  v87 = 0;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke_210;
  v76[3] = &unk_1E842DC40;
  v48 = v46;
  v77 = v48;
  v75 = v74;
  v78 = v75;
  v79 = *(id *)(a1 + 80);
  v80 = *(id *)(a1 + 32);
  v81 = *(id *)(a1 + 40);
  v82 = *(id *)(a1 + 104);
  v83 = *(id *)(a1 + 112);
  v84 = *(id *)(a1 + 120);
  v49 = v45;
  v85 = v49;
  v86 = buf;
  v50 = -[PGUpNextComputer enumerateSuggestionsWith:featureWeightVectors:error:block:](v62, "enumerateSuggestionsWith:featureWeightVectors:error:block:", v73, v47, &v87, v76);
  v51 = v87;
  v52 = mach_absolute_time();
  v53 = v88;
  v54 = v44;
  v55 = v54;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    *(_WORD *)v91 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v55, OS_SIGNPOST_INTERVAL_END, v42, "PGUpNextMemoriesGenerationEnumeration", ", v91, 2u);
  }

  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v91 = 136315394;
    v92 = "PGUpNextMemoriesGenerationEnumeration";
    v93 = 2048;
    v94 = (float)((float)((float)((float)(v52 - v61) * (float)v53.numer) / (float)v53.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v55, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v91, 0x16u);
  }
  v56 = 136;
  if (v50)
  {
    v56 = 128;
    v57 = v49;
  }
  else
  {
    v57 = v51;
  }
  v58 = *(_QWORD *)(*(_QWORD *)(a1 + v56) + 8);
  v59 = v57;
  v60 = *(void **)(v58 + 40);
  *(_QWORD *)(v58 + 40) = v59;

  _Block_object_dispose(buf, 8);
}

uint64_t __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke_210(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  PGPotentialUpNextMemory *v7;
  uint64_t v8;
  void *v9;
  PGGraphMemoryNodeCollection *v10;
  void *v11;
  void *v12;
  PGPotentialUpNextMemory *v13;
  PGPotentialUpNextMemory *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _BYTE *v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  uint8_t buf[4];
  PGPotentialUpNextMemory *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIdentifier:", a2) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
    v10 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(a1 + 40), v9);
    -[PGGraphMemoryNodeCollection uniqueMemoryIdentifiers](v10, "uniqueMemoryIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v12);
      v13 = (PGPotentialUpNextMemory *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = -[PGPotentialUpNextMemory initWithMemory:photoLibrary:userFeedbackCalculator:]([PGPotentialUpNextMemory alloc], "initWithMemory:photoLibrary:userFeedbackCalculator:", v13, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
        v15 = *(void **)(a1 + 88);
        v32 = CFSTR("No debug info assigned by aggregator");
        v8 = objc_msgSend(v15, "addUpNextMemory:debugInfo:", v14, &v32);
        v16 = v32;
        objc_msgSend(*(id *)(a1 + 48), "addSuggestionFilteringLog:", v16);
        if ((_DWORD)v8)
        {
          v29 = a4;
          v30 = v16;
          v31 = v9;
          v17 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v7;
            _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[UpNext] Accepted memory debug info: %@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 48), "addSuggestionFilteringLog:", v7);
          v18 = *(void **)(a1 + 96);
          -[PGPotentialUpNextMemory localIdentifier](v13, "localIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v19);

          -[PGGraphMemoryNodeCollection momentNodes](v10, "momentNodes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGUpNextMemoriesGenerationRequest _memoryNodesWithSignificantOverlapWithMomentNodes:](PGUpNextMemoriesGenerationRequest, "_memoryNodesWithSignificantOverlapWithMomentNodes:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = *(void **)(a1 + 32);
          objc_msgSend(v21, "elementIdentifiers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "unionWithIdentifierSet:", v23);

          if ((uint64_t)--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) <= 0)
            *v29 = 1;

          v16 = v30;
          v9 = v31;
        }

      }
      else
      {
        v14 = (PGPotentialUpNextMemory *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No local memory found for unique identifier (%@)"), v12);
        objc_msgSend(*(id *)(a1 + 48), "addSuggestionFilteringLog:", v14);
        v27 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v14;
          _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
        }
        v8 = 0;
      }

    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (PGPotentialUpNextMemory *)objc_msgSend(v24, "initWithFormat:", CFSTR("No unique identifier found for memoryNodeIdentifier (%@)"), v25);

      objc_msgSend(*(id *)(a1 + 48), "addSuggestionFilteringLog:", v13);
      v26 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v13;
        _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
      }
      v8 = 0;
    }

  }
  return v8;
}

void __110__PGUpNextMemoriesGenerationRequest_fetchMemoryLocalIdentifiersWithWorkingContext_musicCurationOptions_error___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "graphMemoryIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(a1[4], "addObject:", v9);
  v4 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(a1[5], "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v3, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(a1[6], "addObject:", v8);

}

+ (id)requestWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  __int16 v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D72350];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72350]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = *MEMORY[0x1E0D72340];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72340]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is nil"), v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 0, v25);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v24 = 0;
      goto LABEL_38;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72358]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpNext] %@ is nil"), v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 0, v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v24 = 0;
      goto LABEL_37;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72338]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v38 = v8;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v14 = objc_msgSend(v12, "count");
      if (v14 != *MEMORY[0x1E0D72308])
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpNext] Custom vector count mismatch. (Expecting:%lu Received:%lu)"), *MEMORY[0x1E0D72308], objc_msgSend(v12, "count"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 3, v31);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v24 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

        goto LABEL_39;
      }
      v37 = v10;
      v40 = v11;
      v41 = v12;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v43;
        v19 = *MEMORY[0x1E0D72300];
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v43 != v18)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v21, "count") != v19)
            {
              if (a4)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UpNext] Vector feature count mismatch. (Expecting:%lu Received:%lu)"), v19, objc_msgSend(v21, "count"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 3, v32);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              v24 = 0;
              v10 = v37;
              v8 = v38;
              v11 = v40;
              goto LABEL_35;
            }
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v21);
            objc_msgSend(v13, "addObject:", v22);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v17)
            continue;
          break;
        }
      }

      v10 = v37;
      v8 = v38;
      v12 = v41;
    }
    else
    {
      v40 = v11;
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72360]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0D72348];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D72348]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v12;
    if (v29)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = &unk_1E84E4310;
    }
    v39 = objc_msgSend(v30, "unsignedShortValue");
    v33 = objc_alloc((Class)a1);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v40;
    LOWORD(v36) = v39;
    v24 = (void *)objc_msgSend(v33, "initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:customVectors:wantsVerboseDebugInfo:sharingFilter:", v8, 0, v34, objc_msgSend(v40, "unsignedIntegerValue"), v13, objc_msgSend(v27, "BOOLValue"), v36);

LABEL_35:
    v12 = v41;
    goto LABEL_36;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is nil"), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_requestErrorWithCode:description:", 0, v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v24 = 0;
LABEL_39:

  return v24;
}

+ (id)_requestErrorWithCode:(int64_t)a3 description:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGUpNextErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_memoryNodesWithSignificantOverlapWithMomentNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  PGGraphMemoryNodeCollection *v11;
  void *v12;
  PGGraphMemoryNodeCollection *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D429D8];
  objc_msgSend(v3, "memoryNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryNode momentOfMemory](PGGraphMemoryNode, "momentOfMemory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjacencyWithSources:relation:targetsClass:", v5, v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __87__PGUpNextMemoriesGenerationRequest__memoryNodesWithSignificantOverlapWithMomentNodes___block_invoke;
  v18 = &unk_1E842DC90;
  v19 = v3;
  v20 = v8;
  v9 = v8;
  v10 = v3;
  objc_msgSend(v7, "enumerateTargetsBySourceWithBlock:", &v15);
  v11 = [PGGraphMemoryNodeCollection alloc];
  objc_msgSend(v10, "graph", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MAElementCollection initWithGraph:elementIdentifiers:](v11, "initWithGraph:elementIdentifiers:", v12, v9);

  return v13;
}

+ (id)_baseMemoryFetchOptionsWithPhotoLibrary:(id)a3
{
  void *v3;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v3, "setIncludeLocalMemories:", 1);
  objc_msgSend(v3, "setIncludePendingMemories:", 1);
  return v3;
}

void __87__PGUpNextMemoriesGenerationRequest__memoryNodesWithSignificantOverlapWithMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if ((v6 - 1) / 3uLL >= 2)
    v7 = 2;
  else
    v7 = (v6 - 1) / 3uLL;
  objc_msgSend(v5, "collectionByIntersecting:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9 > v7)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v12, "elementIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addIdentifier:", objc_msgSend(v11, "firstElement"));

  }
}

@end
