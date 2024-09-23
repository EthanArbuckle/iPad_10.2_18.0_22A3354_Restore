@implementation PGMusicWrapper

+ (void)requestMusicCurationForAssetCollection:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  os_signpost_id_t v84;
  id v85;
  PGMusicCurationInflationOptions *v86;
  uint64_t v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  NSObject *v103;
  id v104;
  uint64_t v105;
  os_signpost_id_t v106;
  mach_timebase_info v107;
  uint64_t v108;
  id v109;
  id v110;
  id v111;
  mach_timebase_info info;
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  id v116;
  _QWORD v117[4];

  v117[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "assetCollectionType") == 4)
  {
    v91 = a1;
    +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v16;
    v18 = os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MusicCurationForMemory", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v87 = mach_absolute_time();
    v98 = v10;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v98, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v114 = v23;
      _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation context for asset collection: %@.", buf, 0xCu);

    }
    v111 = 0;
    objc_msgSend(v12, "musicCuratorContextWithCurationOptions:error:", v11, &v111);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v111;
    v96 = v12;
    if (v24)
    {
      v89 = v25;
      v26 = v98;
      v94 = v14;
      if (objc_msgSend(v98, "creationType") != 1)
        goto LABEL_18;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "loggingConnection");
      v28 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[MemoriesMusic] Generative PHMemory so extract the curated music", buf, 2u);
      }

      objc_msgSend(v98, "extractGenerativeMemoryMusicCuration");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v90 = (void *)v29;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "loggingConnection");
        v31 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v98, "uuid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v114 = v32;
          _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[MemoriesMusic] bypassMusicForTopicElection=YES for generative memory: %@", buf, 0xCu);

        }
        objc_msgSend(v24, "setBypassMusicForTopicElection:", 1);
      }
      else
      {
LABEL_18:
        v90 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "BOOLForKey:", CFSTR("overrideMusicCuration"));

      v84 = v18;
      if (v41)
      {
        v42 = v13;
        v43 = v12;
        v44 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Media/PhotoData/Caches/GraphService/musicCurationOverride.plist"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("memoryUUID"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "uuid");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", v46);

        if (v48)
          objc_msgSend(v44, "setMusicCurationOverrideDictionary:", v45);

        v24 = v44;
        v12 = v43;
        v13 = v42;
        v26 = v98;
      }
      objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_20690);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v24;
      objc_msgSend((id)objc_opt_class(), "appleMusicFeatureExtractionContextWithCuratorContext:", v24);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "loggingConnection");
      v50 = objc_claimAutoreleasedReturnValue();

      v14 = v94;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v26, "uuid");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v114 = v51;
        _os_log_impl(&dword_1CA237000, v50, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features for memory: %@ for Apple Music curation", buf, 0xCu);

      }
      objc_msgSend(v97, "childProgressReporterFromStart:toEnd:", 0.0, 0.2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = 0;
      objc_msgSend(v91, "_musicCurationFeaturesWithFeatureExtractionContext:memory:graphManager:progressReporter:error:", v95, v26, v12, v52, &v110);
      v53 = objc_claimAutoreleasedReturnValue();
      v88 = v110;

      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "loggingConnection");
      v55 = objc_claimAutoreleasedReturnValue();

      v92 = (void *)v53;
      if (v53)
      {
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v26, "uuid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v114 = v56;
          _os_log_impl(&dword_1CA237000, v55, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Apple Music for PHMemory: %@.", buf, 0xCu);

        }
        objc_msgSend(v97, "childProgressReporterFromStart:toEnd:", 0.2, 1.0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = 0;
        +[PGMusicCurator curateMusicForFeatures:context:progressReporter:error:](PGMusicCurator, "curateMusicForFeatures:context:progressReporter:error:", v53, v93, v57, &v109);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v109;

        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "loggingConnection");
        v60 = objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v98, "uuid");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v114 = v61;
            _os_log_impl(&dword_1CA237000, v60, OS_LOG_TYPE_INFO, "[MemoriesMusic] Inflating Apple Music curation for PHMemory: %@.", buf, 0xCu);

          }
          if (v90)
          {
            objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("appleMusicSongIds"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v62;
            if (v62 && objc_msgSend(v62, "count"))
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "loggingConnection");
              v65 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA237000, v65, OS_LOG_TYPE_INFO, "[MemoriesMusic] Replacing replaceBestMusicSuggestionsWithAdamIds", buf, 2u);
              }

              objc_msgSend(v58, "replaceBestMusicSuggestionsWithAdamIds:", v63);
              v66 = objc_claimAutoreleasedReturnValue();

              v58 = (void *)v66;
              v67 = v12;
            }
            else
            {
              v67 = v12;
            }

            v12 = v67;
          }
          v108 = 0;
          v86 = -[PGMusicCurationInflationOptions initWithInflationActionSource:]([PGMusicCurationInflationOptions alloc], "initWithInflationActionSource:", 1);
          objc_msgSend(v12, "musicCurationInflationContextWithInflationOptions:error:");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = 0;
          if (v74)
          {
            objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_205_20699);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v99[0] = MEMORY[0x1E0C809B0];
            v99[1] = 3221225472;
            v99[2] = __92__PGMusicWrapper_requestMusicCurationForAssetCollection_curationOptions_graphManager_reply___block_invoke_2;
            v99[3] = &unk_1E842AC20;
            v100 = v98;
            v104 = v13;
            v101 = v58;
            v102 = v100;
            v105 = v87;
            v107 = info;
            v103 = v20;
            v106 = v84;
            +[PGMusicCurator inflateDisplayMetadataForMusicCuration:inflationContext:curatorContext:progressReporter:completionHandler:](PGMusicCurator, "inflateDisplayMetadataForMusicCuration:inflationContext:curatorContext:progressReporter:completionHandler:", v101, v74, 0, v75, v99);

            v76 = v83;
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "loggingConnection");
            v78 = objc_claimAutoreleasedReturnValue();

            v76 = v83;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v98, "uuid");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v114 = v82;
              v115 = 2114;
              v116 = v83;
              _os_log_error_impl(&dword_1CA237000, v78, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for PHMemory (%@): %{public}@", buf, 0x16u);

            }
            +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v83);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v75);
          }

          v26 = v98;
          v24 = v93;
          v72 = v88;
          v68 = v89;
          v73 = v85;
        }
        else
        {
          v26 = v98;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v98, "uuid");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v114 = v81;
            v115 = 2112;
            v116 = v85;
            _os_log_error_impl(&dword_1CA237000, v60, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);

          }
          v73 = v85;
          +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v85);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v58);
          v24 = v93;
          v72 = v88;
          v68 = v89;
        }

        v14 = v94;
      }
      else
      {
        v72 = v88;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v26, "uuid");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v114 = v80;
          v115 = 2112;
          v116 = v88;
          _os_log_error_impl(&dword_1CA237000, v55, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);

        }
        +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v88);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v73);
        v24 = v93;
        v68 = v89;
      }

      v71 = v90;
    }
    else
    {
      v68 = v25;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "loggingConnection");
      v70 = objc_claimAutoreleasedReturnValue();

      v26 = v98;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v98, "uuid");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v114 = v79;
        v115 = 2112;
        v116 = v68;
        _os_log_error_impl(&dword_1CA237000, v70, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);

      }
      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v68);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v71);
    }

    v36 = v20;
    v12 = v96;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "loggingConnection");
    v34 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "localIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v114 = v35;
      _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[MemoriesMusic] requestMusicCurationForAssetCollection delegating to requestMusicCurationForAssetFetchResult for assetCollection.localIdentifier: %@", buf, 0xCu);

    }
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWantsIncrementalChangeDetails:", 0);
    v117[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFetchPropertySets:", v37);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v10, v36);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v11, "copyWithAssetCollectionLocalIdentifier:", v38);

    objc_msgSend(a1, "requestMusicCurationForAssetFetchResult:curationOptions:graphManager:reply:", v20, v39, v12, v13);
    v11 = (id)v39;
  }

}

+ (void)requestMusicCurationForAssetFetchResult:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  __objc2_class **v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  PGMusicCurationManager *v50;
  uint64_t v51;
  PGMusicCurationManager *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  PGMusicCurationManager *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  NSObject *v74;
  __CFString *v75;
  id v76;
  PGMusicCurationInflationOptions *v77;
  PGMusicCurationManager *v78;
  PGMusicCurationManager *v79;
  void *v80;
  __CFString *v81;
  uint64_t v82;
  os_signpost_id_t v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  __CFString *v88;
  const __CFString *v89;
  id v90;
  void (**v91)(id, _QWORD, void *);
  void *v92;
  id v93;
  void *v94;
  _QWORD v95[4];
  PGMusicCurationManager *v96;
  NSObject *v97;
  void (**v98)(id, _QWORD, void *);
  uint64_t v99;
  os_signpost_id_t v100;
  mach_timebase_info v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  mach_timebase_info info;
  uint8_t buf[4];
  const __CFString *v110;
  __int16 v111;
  __CFString *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  v14 = off_1E83FA000;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "assetCollectionLocalIdentifier");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v110 = v17;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation context for asset fetch result. assetCollectionLocalIdentifier = %@", buf, 0xCu);

  }
  if (objc_msgSend(v10, "count"))
  {
    v90 = a1;
    +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    v21 = os_signpost_id_generate(v20);
    v22 = v20;
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "MusicCurationForAssetFetchResult", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v24 = mach_absolute_time();
    v107 = 0;
    objc_msgSend(v12, "musicCuratorContextWithCurationOptions:error:", v11, &v107);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (__CFString *)v107;
    v27 = v26;
    if (!v25)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "loggingConnection");
      v40 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v110 = v27;
        _os_log_error_impl(&dword_1CA237000, v40, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curator context error for asset fetch result: %@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v27);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v41);
      goto LABEL_55;
    }
    v82 = v24;
    v88 = v26;
    objc_msgSend(v11, "assetCollectionLocalIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = v21;
    if (v28)
    {
      v93 = v11;
      v29 = v12;
      v30 = v10;
      v31 = v29;
      objc_msgSend(v29, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = 0;
      +[PGMusicCurationRecentlyUsedSongs recentlyUsedAppleMusicSongsForCollectionsFromPhotoLibrary:error:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedAppleMusicSongsForCollectionsFromPhotoLibrary:error:", v32, &v106);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = (const __CFString *)v106;

      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "loggingConnection");
      v36 = objc_claimAutoreleasedReturnValue();

      v89 = v34;
      if (!v33 || v34)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v34;
          _os_log_error_impl(&dword_1CA237000, v36, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Error getting the recently used Apple Music songs for collections. error=%@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v33;
          _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[MemoriesMusic] recentlyUsedSongsForCollections = %@", buf, 0xCu);
        }

        objc_msgSend(v25, "recentlyUsedSongs");
        v36 = objc_claimAutoreleasedReturnValue();
        -[NSObject appendWithOtherRecentlyUsed:](v36, "appendWithOtherRecentlyUsed:", v33);
      }
      v10 = v30;

      v12 = v31;
      v11 = v93;
    }
    else
    {
      v89 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_215);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "appleMusicFeatureExtractionContextWithCuratorContext:", v25);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "loggingConnection");
    v44 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v44, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features from asset fetch result for Apple Music curation", buf, 2u);
    }

    v92 = v42;
    objc_msgSend(v42, "childProgressReporterFromStart:toEnd:", 0.0, 0.2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0;
    objc_msgSend(v90, "_musicCurationFeaturesWithFeatureExtractionContext:assetFetchResult:graphManager:progressReporter:error:", v94, v10, v12, v45, &v105);
    v46 = objc_claimAutoreleasedReturnValue();
    v86 = (const __CFString *)v105;

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "loggingConnection");
    v48 = objc_claimAutoreleasedReturnValue();

    v91 = v13;
    v87 = (void *)v46;
    if (!v46)
    {
      v27 = v88;
      v57 = (__CFString *)v86;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v110 = v86;
        _os_log_error_impl(&dword_1CA237000, v48, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for asset fetch result: %@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v86);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v91[2](v91, 0, v58);
      v41 = (void *)v89;
      v59 = v92;
      goto LABEL_54;
    }
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Apple Music for asset fetch result.", buf, 2u);
    }

    objc_msgSend(v92, "childProgressReporterFromStart:toEnd:", 0.2, 1.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0;
    +[PGMusicCurator curateMusicForFeatures:context:progressReporter:error:](PGMusicCurator, "curateMusicForFeatures:context:progressReporter:error:", v46, v25, v49, &v104);
    v50 = (PGMusicCurationManager *)objc_claimAutoreleasedReturnValue();
    v84 = (const __CFString *)v104;

    v85 = v12;
    if (!v50)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "loggingConnection");
      v61 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v110 = v84;
        _os_log_error_impl(&dword_1CA237000, v61, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error: %@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v84);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v62);
      v27 = v88;
      v41 = (void *)v89;
      v59 = v92;
      v57 = (__CFString *)v86;
      goto LABEL_53;
    }
    objc_msgSend(v11, "backingCollectionLocalIdentifier");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v51 || (objc_msgSend(v11, "assetCollectionLocalIdentifier"), (v51 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v76 = v10;
      v52 = objc_alloc_init(PGMusicCurationManager);
      objc_msgSend(v25, "cache");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 0;
      v80 = (void *)v51;
      -[PGMusicCurationManager adjustCurationForCollection:initialCuration:cache:progressReporter:error:](v52, "adjustCurationForCollection:initialCuration:cache:progressReporter:error:", v51, v50, v53, v54, &v103);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (__CFString *)v103;

      if (!v55)
      {
        v81 = v56;
        v79 = v52;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "loggingConnection");
        v64 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "assetCollectionLocalIdentifier");
          v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v110 = v75;
          v111 = 2112;
          v112 = v56;
          _os_log_error_impl(&dword_1CA237000, v64, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Adjusting curation for collection (%@) failed with error: %@", buf, 0x16u);

        }
        v41 = (void *)v89;
        +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v89);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, 0, v65);
        v10 = v76;
        v66 = v79;
        v57 = (__CFString *)v86;
        goto LABEL_52;
      }

      v78 = (PGMusicCurationManager *)v55;
      v10 = v76;
      v14 = off_1E83FA000;
    }
    else
    {
      v78 = v50;
      v80 = 0;
    }
    -[__objc2_class sharedLogging](v14[323], "sharedLogging", v76);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "loggingConnection");
    v68 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v68, OS_LOG_TYPE_INFO, "[MemoriesMusic] Inflating Apple Music curation for asset fetch result.", buf, 2u);
    }

    v102 = 0;
    v77 = -[PGMusicCurationInflationOptions initWithInflationActionSource:]([PGMusicCurationInflationOptions alloc], "initWithInflationActionSource:", 1);
    objc_msgSend(v85, "musicCurationInflationContextWithInflationOptions:error:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (const __CFString *)0;
    v81 = (__CFString *)v70;
    if (v69)
    {
      objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_218_20669);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __93__PGMusicWrapper_requestMusicCurationForAssetFetchResult_curationOptions_graphManager_reply___block_invoke_2;
      v95[3] = &unk_1E842AC88;
      v98 = v13;
      v66 = v78;
      v96 = v78;
      v99 = v82;
      v101 = info;
      v97 = v23;
      v100 = v83;
      +[PGMusicCurator inflateDisplayMetadataForMusicCuration:inflationContext:curatorContext:progressReporter:completionHandler:](PGMusicCurator, "inflateDisplayMetadataForMusicCuration:inflationContext:curatorContext:progressReporter:completionHandler:", v96, v69, 0, v71, v95);

      v41 = (void *)v89;
      v57 = (__CFString *)v86;
    }
    else
    {
      v72 = v70;
      -[__objc2_class sharedLogging](v14[323], "sharedLogging");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "loggingConnection");
      v74 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v110 = v72;
        _os_log_error_impl(&dword_1CA237000, v74, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for assets: %{public}@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v72);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v71);
      v41 = (void *)v89;
      v57 = (__CFString *)v86;
      v66 = v78;
    }

    v65 = v77;
LABEL_52:

    v27 = v88;
    v59 = v92;
    v62 = v80;
LABEL_53:

    v58 = (void *)v84;
    v12 = v85;
LABEL_54:

    v13 = v91;
LABEL_55:

    goto LABEL_56;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "loggingConnection");
  v38 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v110 = CFSTR("Cannot curate music for an empty asset fetch result.");
    _os_log_error_impl(&dword_1CA237000, v38, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, CFSTR("Cannot curate music for an empty asset fetch result."));
  v23 = objc_claimAutoreleasedReturnValue();
  v13[2](v13, 0, v23);
LABEL_56:

}

+ (void)requestFlexMusicCurationForAssetCollection:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  PGFlexMusicCurationParameters *v45;
  void *v46;
  void *v47;
  PGFlexMusicCurationManager *v48;
  PGFlexMusicCurationManager *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  PGFlexMusicCurationParameters *v88;
  void (**v89)(id, _QWORD, id);
  id v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  uint8_t buf[4];
  id v105;
  __int16 v106;
  id v107;
  __int16 v108;
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v98 = a3;
  v10 = a4;
  v97 = a5;
  v11 = (void (**)(id, _QWORD, id))a6;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loggingConnection");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Flex Music curation context for asset collection.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_220);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  objc_msgSend(v97, "musicCuratorContextWithCurationOptions:error:", v10, &v103);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v103;
  if (v16)
  {
    v94 = v15;
    v95 = v14;
    v89 = v11;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v18 = (void *)MEMORY[0x1E0C9AA60];
    v90 = v10;
    if ((isKindOfClass & 1) == 0)
    {
      v93 = (id)MEMORY[0x1E0C9AA60];
      v31 = 0;
      v20 = 16;
LABEL_16:
      objc_msgSend(v97, "photoLibrary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedFlexMusicSongsFromPhotoLibrary:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "recentlyUsedBundledSongIDs");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v37;
      objc_msgSend(v37, "addSongIDs:date:", v38, v39);

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v97, "photoLibrary");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0;
        +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsForCollectionsFromPhotoLibrary:error:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedFlexMusicSongsForCollectionsFromPhotoLibrary:error:", v40, &v101);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v101;

        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "loggingConnection");
        v44 = objc_claimAutoreleasedReturnValue();

        if (!v41 || v42)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v105 = v42;
            _os_log_error_impl(&dword_1CA237000, v44, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Error getting the recently used Flex songs for collections. error=%@", buf, 0xCu);
          }

        }
        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v105 = v41;
            _os_log_impl(&dword_1CA237000, v44, OS_LOG_TYPE_INFO, "[MemoriesMusic] recentlyUsedSongsForCollections = %@", buf, 0xCu);
          }

          objc_msgSend(v37, "appendWithOtherRecentlyUsed:", v41);
        }

        v10 = v90;
      }
      v45 = -[PGFlexMusicCurationParameters initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:]([PGFlexMusicCurationParameters alloc], "initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:", v20, v93, v37, v94, 0, v31, v16);
      v14 = v95;
      objc_msgSend(v95, "childProgressReporterFromStart:toEnd:", 0.2, 1.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 0;
      v88 = v45;
      +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:progressReporter:error:](PGFlexMusicCurator, "curateFlexMusicWithCurationParameters:progressReporter:error:", v45, v46, &v100);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v100;

      if (v47)
      {
        if ((isKindOfClass & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = (PGFlexMusicCurationManager *)v98;
            v49 = v48;
            if (v48 && -[PGFlexMusicCurationManager creationType](v48, "creationType") == 1)
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "loggingConnection");
              v51 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "[MemoriesMusic] Generative PHMemory so extract the curated music", buf, 2u);
              }

              -[PGFlexMusicCurationManager extractGenerativeMemoryMusicCuration](v49, "extractGenerativeMemoryMusicCuration");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (v52)
              {
                v53 = v52;
                objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("flexMusicSongIds"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v54;
                if (v54 && objc_msgSend(v54, "count"))
                {
                  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "loggingConnection");
                  v57 = objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1CA237000, v57, OS_LOG_TYPE_INFO, "[MemoriesMusic] Replacing replaceBestSongSuggestionsWithFlexSongIds", buf, 2u);
                  }

                  objc_msgSend(v47, "replaceBestSongSuggestionsWithFlexSongIds:", v55);
                  v58 = objc_claimAutoreleasedReturnValue();

                  v47 = (void *)v58;
                }
                goto LABEL_52;
              }
            }
          }
          else
          {
            v49 = 0;
          }
          v69 = 0;
LABEL_53:
          v53 = v47;

          objc_msgSend(v47, "jsonRepresentation");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (v73)
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "loggingConnection");
            v75 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v98, "title");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "uuid");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v105 = v76;
              v106 = 2112;
              v107 = v77;
              v108 = 2112;
              v109 = v73;
              _os_log_impl(&dword_1CA237000, v75, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Flex Music curation for asset collection (%@) with uuid '%@': %@", buf, 0x20u);

            }
            v59 = (void *)v31;

            +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v91);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v89;
            ((void (**)(id, void *, id))v89)[2](v89, v73, v78);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize flex music curation object to JSON: %@"), v53);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "loggingConnection");
            v80 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v98, "uuid");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v105 = v87;
              v106 = 2112;
              v107 = v78;
              _os_log_error_impl(&dword_1CA237000, v80, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation failed for asset collection (%@) with serialization error: %@", buf, 0x16u);

            }
            v59 = (void *)v31;

            objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, v78);
            v81 = objc_claimAutoreleasedReturnValue();

            v11 = v89;
            v89[2](v89, 0, (id)v81);
            v91 = (id)v81;
          }

          v14 = v95;
          v34 = v96;
          v35 = v93;
          v62 = v91;
          goto LABEL_65;
        }
        objc_msgSend(v10, "backingCollectionLocalIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v63;
        if (v63)
        {
          v65 = v63;
        }
        else
        {
          objc_msgSend(v10, "assetCollectionLocalIdentifier");
          v65 = (id)objc_claimAutoreleasedReturnValue();
        }
        v53 = v65;

        v49 = objc_alloc_init(PGFlexMusicCurationManager);
        objc_msgSend(v16, "cache");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = 0;
        -[PGFlexMusicCurationManager adjustCurationForCollectionWithLocalIdentifier:initialCuration:cache:progressReporter:error:](v49, "adjustCurationForCollectionWithLocalIdentifier:initialCuration:cache:progressReporter:error:", v53, v47, v70, v71, &v99);
        v72 = objc_claimAutoreleasedReturnValue();
        v55 = v99;

        if (v72)
        {
          v47 = (void *)v72;
          v10 = v90;
LABEL_52:

          v69 = v53;
          goto LABEL_53;
        }
        v59 = (void *)v31;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "loggingConnection");
        v83 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v105 = v94;
          v106 = 2112;
          v107 = v55;
          _os_log_error_impl(&dword_1CA237000, v83, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Adjusting curation for collection (%@) failed with error: %@", buf, 0x16u);
        }

        v62 = v91;
        +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v91);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v89;
        v89[2](v89, 0, v84);

        v10 = v90;
        v14 = v95;
      }
      else
      {
        v59 = (void *)v31;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "loggingConnection");
        v61 = objc_claimAutoreleasedReturnValue();

        v62 = v91;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v98, "uuid");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v105 = v85;
          v106 = 2112;
          v107 = v91;
          _os_log_error_impl(&dword_1CA237000, v61, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation failed for asset collection (%@) with Error: %@", buf, 0x16u);

        }
        +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v91);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v89;
        v89[2](v89, 0, v53);
      }
      v34 = v96;
      v35 = v93;
LABEL_65:

      v15 = v94;
      v19 = v59;
      goto LABEL_66;
    }
    v19 = v98;
    v20 = objc_msgSend(v19, "suggestedMood");
    objc_msgSend(v19, "moodKeywords");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = v18;
    v93 = v23;

    objc_msgSend((id)objc_opt_class(), "flexMusicFeatureExtractionContextWithCuratorContext:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "loggingConnection");
    v26 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v105 = v27;
      _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features for memory: %@ for Flex Music curation", buf, 0xCu);

    }
    objc_msgSend(v95, "childProgressReporterFromStart:toEnd:", 0.0, 0.2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0;
    objc_msgSend(a1, "_musicCurationFeaturesWithFeatureExtractionContext:memory:graphManager:progressReporter:error:", v24, v19, v97, v28, &v102);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v102;

    if (v29)
    {

      v31 = v29;
      v10 = v90;
      goto LABEL_16;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "loggingConnection");
    v67 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "uuid");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v105 = v86;
      v106 = 2112;
      v107 = v30;
      _os_log_error_impl(&dword_1CA237000, v67, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music feature extraction error for PHMemory (%@): %@", buf, 0x16u);

    }
    +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v30);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v89;
    v89[2](v89, 0, v68);

    v10 = v90;
    v15 = v94;
    v14 = v95;
    v34 = v96;
    v35 = v93;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "loggingConnection");
    v33 = objc_claimAutoreleasedReturnValue();

    v34 = v96;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v96;
      _os_log_error_impl(&dword_1CA237000, v33, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curator context error for asset fetch result: %@", buf, 0xCu);
    }

    +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v96);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v19);
    v35 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_66:

}

+ (void)requestFlexMusicCurationForAssetFetchResult:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, void *);
  void *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PGFlexMusicCurationParameters *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  __CFString *v39;
  void *v40;
  NSObject *v41;
  __CFString *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  __CFString *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  __CFString *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  const __CFString *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, void *))a6;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loggingConnection");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building flex music curation context for asset fetch result.", buf, 2u);
  }

  if (objc_msgSend(v10, "count"))
  {
    v69 = 0;
    objc_msgSend(v12, "musicCuratorContextWithCurationOptions:error:", v11, &v69);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CFString *)v69;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_228);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v16;
      objc_msgSend((id)objc_opt_class(), "flexMusicFeatureExtractionContextWithCuratorContext:", v16);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features from asset fetch result for Flex Music curation", buf, 2u);
      }

      objc_msgSend(v18, "childProgressReporterFromStart:toEnd:", 0.0, 0.2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0;
      objc_msgSend(a1, "_musicCurationFeaturesWithFeatureExtractionContext:assetFetchResult:graphManager:progressReporter:error:", v66, v10, v12, v21, &v68);
      v22 = objc_claimAutoreleasedReturnValue();
      v63 = (const __CFString *)v68;

      v64 = (void *)v22;
      if (v22)
      {
        v62 = v18;
        objc_msgSend(v12, "photoLibrary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedFlexMusicSongsFromPhotoLibrary:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = v11;
        objc_msgSend(v11, "recentlyUsedBundledSongIDs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v24;
        objc_msgSend(v24, "addSongIDs:date:", v25, v26);

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v28 = 0;
          do
          {
            v29 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(v10, "objectAtIndexedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "localIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v31);

            objc_autoreleasePoolPop(v29);
            ++v28;
          }
          while (v28 < objc_msgSend(v10, "count"));
        }
        objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = [PGFlexMusicCurationParameters alloc];
        v58 = v32;
        objc_msgSend(v32, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[PGFlexMusicCurationParameters initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:](v33, "initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:", 16, MEMORY[0x1E0C9AA60], v61, v34, 0, v64, v65);

        v67 = 0;
        v57 = (void *)v35;
        +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:progressReporter:error:](PGFlexMusicCurator, "curateFlexMusicWithCurationParameters:progressReporter:error:", v35, v62, &v67);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (const __CFString *)v67;
        v38 = v37;
        if (v36)
        {
          v60 = (__CFString *)v37;
          objc_msgSend(v36, "jsonRepresentation");
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "loggingConnection");
            v41 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v71 = v39;
              _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Flex Music curation for asset local identifiers: %@", buf, 0xCu);
            }

            +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v60);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v13[2](v13, v39, v42);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize flex music curation object to JSON: %@"), v36);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "loggingConnection");
            v55 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v71 = v42;
              _os_log_error_impl(&dword_1CA237000, v55, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music serialization error: %@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, v42);
            v56 = objc_claimAutoreleasedReturnValue();

            v13[2](v13, 0, (void *)v56);
            v60 = (__CFString *)v56;
          }
          v18 = v62;
          v49 = (__CFString *)v63;

          v53 = v60;
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "loggingConnection");
          v52 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v38;
            _os_log_error_impl(&dword_1CA237000, v52, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Error: %@", buf, 0xCu);
          }

          +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v38);
          v53 = (__CFString *)v38;
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v13[2](v13, 0, v39);
          v18 = v62;
          v49 = (__CFString *)v63;
        }

        v11 = v59;
        v16 = v65;
        v50 = v61;
      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "loggingConnection");
        v48 = objc_claimAutoreleasedReturnValue();

        v49 = (__CFString *)v63;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v63;
          _os_log_error_impl(&dword_1CA237000, v48, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music feature extraction error for assert fetch result: %@", buf, 0xCu);
        }

        +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v63);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, 0, v50);
        v16 = v65;
      }

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "loggingConnection");
      v46 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v17;
        _os_log_error_impl(&dword_1CA237000, v46, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curator context error for asset fetch result: %@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v18);
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "loggingConnection");
    v44 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v71 = CFSTR("Cannot curate music for an empty asset fetch result.");
      _os_log_error_impl(&dword_1CA237000, v44, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Error: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, CFSTR("Cannot curate music for an empty asset fetch result."));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);
  }

}

+ (void)fetchSongDisplayMetadataJSONForAdamIDs:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v9 = a6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __109__PGMusicWrapper_fetchSongDisplayMetadataJSONForAdamIDs_inflationContext_progressReporter_completionHandler___block_invoke;
  v11[3] = &unk_1E842ACF0;
  v12 = v9;
  v10 = v9;
  +[PGMusicCurator fetchSongDisplayMetadataJSONForAdamIDs:inflationContext:progressReporter:completionHandler:](PGMusicCurator, "fetchSongDisplayMetadataJSONForAdamIDs:inflationContext:progressReporter:completionHandler:", a3, a4, a5, v11);

}

+ (id)generateFlexMusicCurationDebugInformationForSongWithUID:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return +[PGFlexMusicCurator generateDebugInformationForSongWithUID:progressReporter:error:](PGFlexMusicCurator, "generateDebugInformationForSongWithUID:progressReporter:error:", a3, a5, a6);
}

+ (id)generateFlexMusicCurationDebugInformationForAssetCollection:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__20545;
  v25 = __Block_byref_object_dispose__20546;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __114__PGMusicWrapper_generateFlexMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke;
  v16[3] = &unk_1E84357E0;
  v19 = &v21;
  v12 = v9;
  v17 = v12;
  v13 = v11;
  v18 = v13;
  v20 = a6;
  objc_msgSend(v10, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (id)generateMusicCurationDebugInformationForSongWithAdamID:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a3;
  v10 = a5;
  objc_msgSend(a4, "musicCuratorContextWithRecentlyUsedSongAdamIDs:error:", 0, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[PGMusicCurator generateDebugInformationForSongWithAdamID:context:progressReporter:error:](PGMusicCurator, "generateDebugInformationForSongWithAdamID:context:progressReporter:error:", v9, v11, v10, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)generateMusicCurationDebugInformationForAssetCollection:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "musicCuratorContextWithRecentlyUsedSongAdamIDs:error:", 0, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__20545;
    v25 = __Block_byref_object_dispose__20546;
    v26 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __110__PGMusicWrapper_generateMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke;
    v15[3] = &unk_1E842C810;
    v19 = &v21;
    v16 = v9;
    v17 = v12;
    v18 = v11;
    v20 = a6;
    objc_msgSend(v10, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
    v13 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)cacheStatusWithPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[PGMusicCache cacheWithPhotoLibrary:error:](PGMusicCache, "cacheWithPhotoLibrary:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusAndReturnError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)cacheRemoveAllForPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[PGMusicCache cacheWithPhotoLibrary:error:](PGMusicCache, "cacheWithPhotoLibrary:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "removeAllWithProgressReporter:error:", v6, a4);

  return (char)a4;
}

+ (void)fetchMusicCatalogAdamIDsForPurchasedSongID:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  +[PGMusicCurator fetchSongAdamIDsForPurchasedSongID:inflationContext:progressReport:completionHandler:](PGMusicCurator, "fetchSongAdamIDsForPurchasedSongID:inflationContext:progressReport:completionHandler:", a3, a4, a5, a6);
}

+ (void)requestMusicCurationWithCurationOptions:(id)a3 graphManager:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  int v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  PGSpecificationBasedMusicCurator *v25;
  void *v26;
  uint64_t v27;
  uint32_t denom;
  uint32_t numer;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  PGMusicCurationInflationOptions *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint32_t v54;
  uint32_t v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  uint32_t v61;
  uint32_t v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  uint32_t v69;
  uint32_t v70;
  NSObject *v71;
  NSObject *v72;
  char *v73;
  uint64_t v74;
  PGMusicCurationInflationOptions *v75;
  void *v76;
  os_signpost_id_t spid;
  uint64_t v78;
  void (**v79)(_QWORD, _QWORD, _QWORD);
  _QWORD v80[4];
  NSObject *v81;
  id v82;
  void (**v83)(_QWORD, _QWORD, _QWORD);
  uint64_t v84;
  os_signpost_id_t v85;
  mach_timebase_info v86;
  id v87;
  id v88;
  id v89;
  id v90;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  double v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loggingConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MusicCurationUsingOptions", ", buf, 2u);
  }
  spid = v14;

  info = 0;
  mach_timebase_info(&info);
  v78 = mach_absolute_time();
  v18 = objc_msgSend(v8, "shouldUseSpecificationOptionsForCuration");
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loggingConnection");
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (!v18)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation using curation options", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_238);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    objc_msgSend(a1, "appleMusicCurationWithOptions:graphManager:progressReporter:error:", v8, v9, v22, &v89);
    v32 = objc_claimAutoreleasedReturnValue();
    v25 = (PGSpecificationBasedMusicCurator *)v89;
    if (!v32)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "loggingConnection");
      v47 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (const char *)v25;
        _os_log_error_impl(&dword_1CA237000, v47, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed error: %@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v25);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v48);

      v27 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v49 = v16;
      v31 = v49;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", ", buf, 2u);
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        goto LABEL_32;
      goto LABEL_50;
    }
    v79 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
    v33 = v22;
    v22 = (void *)v32;
    goto LABEL_21;
  }
  if (v21)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation using specification options", buf, 2u);
  }

  objc_msgSend(v8, "musicCurationSpecificationOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isQUEmpty"))
  {
    v79 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
    v25 = -[PGSpecificationBasedMusicCurator initWithOptions:]([PGSpecificationBasedMusicCurator alloc], "initWithOptions:", v22);
    v90 = 0;
    -[PGSpecificationBasedMusicCurator musicCurationAndReturnError:](v25, "musicCurationAndReturnError:", &v90);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v90;
    v36 = v35;
    if (!v34)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "loggingConnection");
      v66 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v36, "localizedDescription");
        v73 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v93 = v73;
        _os_log_error_impl(&dword_1CA237000, v66, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music specification-based curation failed with error: %@", buf, 0xCu);

      }
      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v36);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v79)[2](v79, 0, v67);

      v68 = mach_absolute_time();
      v70 = info.numer;
      v69 = info.denom;
      v71 = v16;
      v72 = v71;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v72, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", ", buf, 2u);
      }

      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v93 = "MusicCurationUsingOptions";
        v94 = 2048;
        v95 = (float)((float)((float)((float)(v68 - v78) * (float)v70) / (float)v69) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v72, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      goto LABEL_49;
    }

    v33 = v22;
    v22 = (void *)v34;
LABEL_21:

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "loggingConnection");
    v38 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "[MemoriesMusic] Inflating Apple Music option-based curation", buf, 2u);
    }

    v39 = -[PGMusicCurationInflationOptions initWithInflationActionSource:]([PGMusicCurationInflationOptions alloc], "initWithInflationActionSource:", 1);
    v88 = 0;
    objc_msgSend(v9, "musicCurationInflationContextWithInflationOptions:error:", v39, &v88);
    v40 = v9;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (PGSpecificationBasedMusicCurator *)v88;
    v76 = v40;
    if (v41)
    {
      v75 = v39;
      v87 = 0;
      objc_msgSend(v40, "musicCuratorContextWithCurationOptions:error:", v8, &v87);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v87;
      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_240);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __77__PGMusicWrapper_requestMusicCurationWithCurationOptions_graphManager_reply___block_invoke_2;
        v80[3] = &unk_1E842AC88;
        v83 = v79;
        v84 = v78;
        v86 = info;
        v81 = v16;
        v85 = spid;
        v82 = v22;
        +[PGMusicCurator inflateDisplayMetadataForMusicCuration:inflationContext:curatorContext:progressReporter:completionHandler:](PGMusicCurator, "inflateDisplayMetadataForMusicCuration:inflationContext:curatorContext:progressReporter:completionHandler:", v82, v41, v42, v44, v80);

        v45 = v43;
        v39 = v75;
      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "loggingConnection");
        v59 = objc_claimAutoreleasedReturnValue();

        v45 = v43;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v93 = (const char *)v43;
          _os_log_error_impl(&dword_1CA237000, v59, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation musicCuratorContext error: %{public}@", buf, 0xCu);
        }

        +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v43);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v79)[2](v79, 0, v60);

        v74 = mach_absolute_time();
        v62 = info.numer;
        v61 = info.denom;
        v63 = v16;
        v64 = v63;
        v39 = v75;
        if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v64, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", ", buf, 2u);
        }

        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v93 = "MusicCurationUsingOptions";
          v94 = 2048;
          v95 = (float)((float)((float)((float)(v74 - v78) * (float)v62) / (float)v61) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v64, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
      }

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "loggingConnection");
      v51 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v93 = (const char *)v25;
        _os_log_error_impl(&dword_1CA237000, v51, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation inflation error: %{public}@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v25);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v79)[2](v79, 0, v52);

      v53 = mach_absolute_time();
      v55 = info.numer;
      v54 = info.denom;
      v56 = v16;
      v57 = v56;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v57, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", ", buf, 2u);
      }

      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v93 = "MusicCurationUsingOptions";
        v94 = 2048;
        v95 = (float)((float)((float)((float)(v53 - v78) * (float)v55) / (float)v54) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }

    v9 = v76;
LABEL_49:
    v10 = (void (**)(id, _QWORD, void *))v79;
    goto LABEL_50;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "loggingConnection");
  v24 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v93 = CFSTR("Apple Music curation failed since specificationOptions is empty");
    _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[MemoriesMusic] %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, CFSTR("Apple Music curation failed since specificationOptions is empty"));
  v25 = (PGSpecificationBasedMusicCurator *)objc_claimAutoreleasedReturnValue();
  +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, 0, v26);

  v27 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v30 = v16;
  v31 = v30;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", ", buf, 2u);
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
LABEL_32:
    *(_DWORD *)buf = 136315394;
    v93 = "MusicCurationUsingOptions";
    v94 = 2048;
    v95 = (float)((float)((float)((float)(v27 - v78) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
LABEL_50:

}

+ (void)requestFlexMusicCurationWithCurationOptions:(id)a3 graphManager:(id)a4 reply:(id)a5
{
  void (**v8)(id, void *, void *);
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char *v21;
  char *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint32_t v35;
  uint32_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint32_t v44;
  uint32_t v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t spid;
  void *v49;
  uint64_t v50;
  id v51;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, void *))a5;
  v9 = a4;
  v10 = a3;
  +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "FlexMusicCurationUsingOptions", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v50 = mach_absolute_time();
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "loggingConnection");
  v18 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Flex Music curation using curation options", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", &__block_literal_global_241);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(a1, "flexMusicCurationWithOptions:graphManager:progressReporter:error:", v10, v9, v19, &v51);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (char *)v51;
  if (v20)
  {
    objc_msgSend(v20, "expandedJsonRepresentation");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "loggingConnection");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v22;
        _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Flex Music curation using provided options: %@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v22, v25);

      v26 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v29 = v15;
      v30 = v29;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v30, OS_SIGNPOST_INTERVAL_END, v13, "FlexMusicCurationUsingOptions", ", buf, 2u);
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "FlexMusicCurationUsingOptions";
        v55 = 2048;
        v56 = (float)((float)((float)((float)(v26 - v50) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
    else
    {
      spid = v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize flex music curation object to JSON: %@"), v20);
      v39 = objc_claimAutoreleasedReturnValue();
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "loggingConnection");
      v41 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = (const char *)v39;
        _os_log_error_impl(&dword_1CA237000, v41, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation using options failed with serialization error: %@", buf, 0xCu);
      }

      v49 = (void *)v39;
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v42);
      v43 = mach_absolute_time();
      v45 = info.numer;
      v44 = info.denom;
      v46 = v15;
      v47 = v46;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v47, OS_SIGNPOST_INTERVAL_END, spid, "FlexMusicCurationUsingOptions", ", buf, 2u);
      }

      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "FlexMusicCurationUsingOptions";
        v55 = 2048;
        v56 = (float)((float)((float)((float)(v43 - v50) * (float)v45) / (float)v44) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "loggingConnection");
    v32 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v21;
      _os_log_error_impl(&dword_1CA237000, v32, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation using options failed with Error: %@", buf, 0xCu);
    }

    +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v21);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v33);

    v34 = mach_absolute_time();
    v36 = info.numer;
    v35 = info.denom;
    v37 = v15;
    v38 = v37;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v38, OS_SIGNPOST_INTERVAL_END, v13, "FlexMusicCurationUsingOptions", ", buf, 2u);
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "FlexMusicCurationUsingOptions";
      v55 = 2048;
      v56 = (float)((float)((float)((float)(v34 - v50) * (float)v36) / (float)v35) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

+ (void)requestRecentlyUsedSongsWithOptions:(id)a3 graphManager:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, void *);
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint32_t denom;
  uint32_t numer;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t spid;
  uint64_t v38;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RequestRecentlyUsedSongsWithOptions", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  spid = v12;
  v38 = mach_absolute_time();
  if (v7
    && (v16 = *MEMORY[0x1E0D720F0],
        objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D720F0]),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D720E0]))
      {
        v20 = v8;
        objc_msgSend(v8, "photoLibrary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMusicCurationRecentlyUsedSongs recentlyUsedAppleMusicSongsFromPhotoLibrary:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedAppleMusicSongsFromPhotoLibrary:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "allEntries");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "loggingConnection");
        v25 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v23;
          v26 = "[MemoriesMusic] recentlyUsedAppleMusicSongs: %@";
LABEL_14:
          _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D720E8]))
      {
        v20 = v8;
        objc_msgSend(v8, "photoLibrary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedFlexMusicSongsFromPhotoLibrary:", v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "allEntries");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "loggingConnection");
        v25 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v23;
          v26 = "[MemoriesMusic] recentlyUsedFlexMusicSongs: %@";
          goto LABEL_14;
        }
LABEL_15:

        +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v23, v29);
        goto LABEL_20;
      }
    }
    v20 = v8;
  }
  else
  {
    v20 = v8;
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requestRecentlyUsedSongsWithOptions is missing a required options key or value"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "loggingConnection");
  v31 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = (const char *)v22;
    _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "[MemoriesMusic] %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 2, v22);
  v23 = (char *)objc_claimAutoreleasedReturnValue();
  +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 0, v29);
LABEL_20:

  v32 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v35 = v14;
  v36 = v35;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_END, spid, "RequestRecentlyUsedSongsWithOptions", ", buf, 2u);
  }

  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "RequestRecentlyUsedSongsWithOptions";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v32 - v38) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

+ (id)_musicCurationFeaturesWithFeatureExtractionContext:(id)a3 memory:(id)a4 graphManager:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__20545;
  v38 = __Block_byref_object_dispose__20546;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__20545;
  v32 = __Block_byref_object_dispose__20546;
  v33 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __112__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_memory_graphManager_progressReporter_error___block_invoke;
  v22[3] = &unk_1E842BFB0;
  v26 = &v34;
  v15 = v12;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  v17 = v14;
  v25 = v17;
  v27 = &v28;
  objc_msgSend(v13, "performSynchronousConcurrentGraphReadUsingBlock:", v22);
  v18 = (void *)v35[5];
  if (v18)
  {
    v19 = v18;
  }
  else if (a7)
  {
    v20 = (void *)v29[5];
    if (v20)
      *a7 = objc_retainAutorelease(v20);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

+ (id)_musicCurationFeaturesWithFeatureExtractionContext:(id)a3 assetFetchResult:(id)a4 graphManager:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__20545;
  v38 = __Block_byref_object_dispose__20546;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__20545;
  v32 = __Block_byref_object_dispose__20546;
  v33 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __122__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_assetFetchResult_graphManager_progressReporter_error___block_invoke;
  v22[3] = &unk_1E842BFB0;
  v26 = &v34;
  v15 = v12;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  v17 = v14;
  v25 = v17;
  v27 = &v28;
  objc_msgSend(v13, "performSynchronousConcurrentGraphReadUsingBlock:", v22);
  v18 = (void *)v35[5];
  if (v18)
  {
    v19 = v18;
  }
  else if (a7)
  {
    v20 = (void *)v29[5];
    if (v20)
      *a7 = objc_retainAutorelease(v20);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

+ (id)appleMusicCurationWithOptions:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  PGKeywordBasedFeatureExtractor *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v36;
  id v37;
  id v38;
  PGKeywordBasedFeatureExtractor *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "topicKeywordsAndWeights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "count"))
  {
    v43 = 0;
    objc_msgSend(v10, "musicCuratorContextWithCurationOptions:error:", v9, &v43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v43;
    if (v14)
    {
      objc_msgSend((id)objc_opt_class(), "appleMusicFeatureExtractionContextWithCuratorContext:", v14);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = -[PGKeywordBasedFeatureExtractor initWithWeightByKeyword:]([PGKeywordBasedFeatureExtractor alloc], "initWithWeightByKeyword:", v13);
      objc_msgSend(v11, "childProgressReporterFromStart:toEnd:", 0.0, 0.2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v39 = v17;
      v40 = (void *)v16;
      -[PGKeywordBasedFeatureExtractor musicCurationFeaturesWithContext:progressReporter:error:](v17, "musicCurationFeaturesWithContext:progressReporter:error:", v16, v18, &v42);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v42;

      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v37 = v15;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Apple Music using options", buf, 2u);
        }

        objc_msgSend(v11, "childProgressReporterFromStart:toEnd:", 0.2, 1.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        +[PGMusicCurator curateMusicForFeatures:context:progressReporter:error:](PGMusicCurator, "curateMusicForFeatures:context:progressReporter:error:", v19, v14, v22, &v41);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v41;

        if (v23)
        {
          v25 = v23;
          v15 = v37;
        }
        else
        {
          v36 = v19;
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "loggingConnection");
          v32 = v24;
          v33 = objc_claimAutoreleasedReturnValue();

          v34 = v33;
          v24 = v32;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v32;
            _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation error with error: %@", buf, 0xCu);
          }

          v19 = v36;
          v15 = v37;
          if (a6)
            *a6 = objc_retainAutorelease(v24);
        }

        v30 = v38;
      }
      else
      {
        v30 = v38;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v38;
          _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed to extract features with error: %@", buf, 0xCu);
        }

        v23 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v38);
      }

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "loggingConnection");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v15;
        _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed when creating curator context, error: %@", buf, 0xCu);
      }

      v23 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v15);
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "loggingConnection");
    v27 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v27, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed with empty keywords and weights dictionary", buf, 2u);
    }

    if (a6)
    {
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -8, CFSTR("No topic keywords and weights provided in options"));
      v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

+ (id)flexMusicCurationWithOptions:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  PGKeywordBasedFeatureExtractor *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  PGFlexMusicCurationParameters *v35;
  void *v36;
  void *v37;
  PGFlexMusicCurationParameters *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  id v72;
  void *v73;
  id v74;
  PGKeywordBasedFeatureExtractor *v75;
  void *v76;
  __CFString *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  __CFString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "topicKeywordsAndWeights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "count"))
  {
    v81 = 0;
    objc_msgSend(v10, "musicCuratorContextWithCurationOptions:error:", v9, &v81);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v81;
    if (!v14)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "loggingConnection");
      v57 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = (uint64_t)v15;
        _os_log_error_impl(&dword_1CA237000, v57, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation with options failed when creating curator context, error: %@", buf, 0xCu);
      }

      v42 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v15);
      goto LABEL_51;
    }
    objc_msgSend((id)objc_opt_class(), "flexMusicFeatureExtractionContextWithCuratorContext:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = -[PGKeywordBasedFeatureExtractor initWithWeightByKeyword:]([PGKeywordBasedFeatureExtractor alloc], "initWithWeightByKeyword:", v13);
    objc_msgSend(v11, "childProgressReporterFromStart:toEnd:", 0.0, 0.2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    v75 = v17;
    v76 = (void *)v16;
    -[PGKeywordBasedFeatureExtractor musicCurationFeaturesWithContext:progressReporter:error:](v17, "musicCurationFeaturesWithContext:progressReporter:error:", v16, v18, &v80);
    v19 = objc_claimAutoreleasedReturnValue();
    v74 = v80;

    v78 = (void *)v19;
    if (!v19)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "loggingConnection");
      v59 = objc_claimAutoreleasedReturnValue();

      v60 = v74;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = (uint64_t)v74;
        _os_log_error_impl(&dword_1CA237000, v59, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music option-based curation failed to extract features with error: %@", buf, 0xCu);
      }

      v42 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v74);
      goto LABEL_50;
    }
    objc_msgSend(v10, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedFlexMusicSongsFromPhotoLibrary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "recentlyUsedBundledSongIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v21;
    objc_msgSend(v21, "addSongIDs:date:", v22, v23);

    v71 = objc_msgSend(v9, "suggestedMood");
    v77 = &stru_1E8436F28;
    v70 = v15;
    if (objc_msgSend(v9, "shouldUseSpecificationOptionsForCuration"))
    {
      v68 = v14;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "loggingConnection");
      v25 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[MemoriesMusic] Using specification options for flex", buf, 2u);
      }

      objc_msgSend(v9, "musicCurationSpecificationOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "genre");
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "moods");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = &stru_1E8436F28;
      if (v27)
        v29 = v27;
      v77 = v29;
      if (v28 && objc_msgSend(v28, "count"))
      {
        objc_msgSend(v28, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = +[PGMusicCurationSpecificationOptions PHMemoryMoodFromNumber:](PGMusicCurationSpecificationOptions, "PHMemoryMoodFromNumber:", v30);

      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "loggingConnection");
      v32 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v84 = (uint64_t)v28;
        v85 = 2112;
        v86 = v27;
        _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[MemoriesMusic] Specification options mood=%@ | genre=%@", buf, 0x16u);
      }

      v14 = v68;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "loggingConnection");
    v34 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v84 = v71;
      v85 = 2112;
      v86 = v77;
      _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[MemoriesMusic] Final mood:%llu, genre: %@", buf, 0x16u);
    }

    v35 = [PGFlexMusicCurationParameters alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PGFlexMusicCurationParameters initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:genre:](v35, "initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:genre:", v71, MEMORY[0x1E0C9AA60], v73, v37, 0, v78, v14, v77);

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "loggingConnection");
    v40 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Flex Music using options", buf, 2u);
    }

    objc_msgSend(v11, "childProgressReporterFromStart:toEnd:", 0.2, 1.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:progressReporter:error:](PGFlexMusicCurator, "curateFlexMusicWithCurationParameters:progressReporter:error:", v38, v41, &v79);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v79;

    if (!v42)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "loggingConnection");
      v62 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = (uint64_t)v72;
        _os_log_error_impl(&dword_1CA237000, v62, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation using options failed with Error: %@", buf, 0xCu);
      }

      v15 = v70;
      v53 = v72;
      if (a6)
        *a6 = objc_retainAutorelease(v72);
      goto LABEL_49;
    }
    objc_msgSend(v9, "musicCurationSpecificationOptions");
    v43 = objc_claimAutoreleasedReturnValue();
    v15 = v70;
    if (v43)
    {
      v44 = (void *)v43;
      objc_msgSend(v9, "musicCurationSpecificationOptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v45, "shouldDownloadKeyFlexSong"))
        goto LABEL_30;
      objc_msgSend(v42, "bestSongSuggestions");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_30;
      v67 = (void *)v46;
      v69 = v14;
      objc_msgSend(v42, "bestSongSuggestions");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "firstObject");
      v48 = objc_claimAutoreleasedReturnValue();
      if (!v48)
      {
LABEL_29:

        v14 = v69;
LABEL_30:

        goto LABEL_31;
      }
      v65 = (void *)v48;
      objc_msgSend(v42, "bestSongSuggestions");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "uid");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v70;
      v14 = v69;
      if (v66)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "loggingConnection");
        v51 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_INFO, "[MemoriesMusic] Cache the key flex song, which triggers the song assets download", buf, 2u);
        }

        objc_msgSend(v42, "bestSongSuggestions");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "uid");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v67;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGFlexMusicCacher cacheSongAudioAndArtworkForUIDs:](PGFlexMusicCacher, "cacheSongAudioAndArtworkForUIDs:", v47);
        v15 = v70;
        goto LABEL_29;
      }
    }
LABEL_31:
    v52 = v42;
    v53 = v72;
LABEL_49:

    v60 = v74;
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "loggingConnection");
  v55 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v55, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation with options failed with empty keywords and weights dictionary", buf, 2u);
  }

  if (a6)
  {
    +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -8, CFSTR("Flex Music curation: No topic keywords and weights provided in options"));
    v42 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
LABEL_52:

  return v42;
}

void __122__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_assetFetchResult_graphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v7 + 40);
  +[PGMusicCurator extractMusicCurationFeaturesForAssets:graph:context:progressReporter:error:](PGMusicCurator, "extractMusicCurationFeaturesForAssets:graph:context:progressReporter:error:", v4, v3, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __112__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_memory_graphManager_progressReporter_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v7 + 40);
  +[PGMusicCurator extractMusicCurationFeaturesForMemory:graph:context:progressReporter:error:](PGMusicCurator, "extractMusicCurationFeaturesForMemory:graph:context:progressReporter:error:", v4, v3, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __77__PGMusicWrapper_requestMusicCurationWithCurationOptions_graphManager_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char *v5;
  char *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  char *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "jsonRepresentation");
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v6;
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Apple Music curation using provided options: %@", buf, 0xCu);
      }

      +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      v10 = mach_absolute_time();
      v11 = *(_QWORD *)(a1 + 56);
      v13 = *(_DWORD *)(a1 + 72);
      v12 = *(_DWORD *)(a1 + 76);
      v14 = *(id *)(a1 + 32);
      v15 = v14;
      v16 = *(_QWORD *)(a1 + 64);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_END, v16, "MusicCurationUsingOptions", ", buf, 2u);
      }

      v17 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "MusicCurationUsingOptions";
        v43 = 2048;
        v44 = (float)((float)((float)((float)(v10 - v11) * (float)v13) / (float)v12) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize inflated music curation object to JSON: %@"), *(_QWORD *)(a1 + 40));
      v29 = (char *)objc_claimAutoreleasedReturnValue();
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "loggingConnection");
      v31 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation error: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v33 = mach_absolute_time();
      v34 = *(_QWORD *)(a1 + 56);
      v36 = *(_DWORD *)(a1 + 72);
      v35 = *(_DWORD *)(a1 + 76);
      v37 = *(id *)(a1 + 32);
      v38 = v37;
      v39 = *(_QWORD *)(a1 + 64);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v38, OS_SIGNPOST_INTERVAL_END, v39, "MusicCurationUsingOptions", ", buf, 2u);
      }

      v40 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "MusicCurationUsingOptions";
        v43 = 2048;
        v44 = (float)((float)((float)((float)(v33 - v34) * (float)v36) / (float)v35) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v5;
      _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation inflation failed with error: %@", buf, 0xCu);
    }

    +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    v21 = mach_absolute_time();
    v22 = *(_QWORD *)(a1 + 56);
    v24 = *(_DWORD *)(a1 + 72);
    v23 = *(_DWORD *)(a1 + 76);
    v25 = *(id *)(a1 + 32);
    v26 = v25;
    v27 = *(_QWORD *)(a1 + 64);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v26, OS_SIGNPOST_INTERVAL_END, v27, "MusicCurationUsingOptions", ", buf, 2u);
    }

    v28 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "MusicCurationUsingOptions";
      v43 = 2048;
      v44 = (float)((float)((float)((float)(v21 - v22) * (float)v24) / (float)v23) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

void __110__PGMusicWrapper_generateMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "graph");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PGMusicCurator generateDebugInformationForAssetCollection:graph:context:progressReporter:error:](PGMusicCurator, "generateDebugInformationForAssetCollection:graph:context:progressReporter:error:", a1[4], v6, a1[5], a1[6], a1[8]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __114__PGMusicWrapper_generateFlexMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "graph");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PGFlexMusicCurator generateDebugInformationForAssetCollection:graph:progressReporter:error:](PGFlexMusicCurator, "generateDebugInformationForAssetCollection:graph:progressReporter:error:", a1[4], v6, a1[5], a1[7]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __109__PGMusicWrapper_fetchSongDisplayMetadataJSONForAdamIDs_inflationContext_progressReporter_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__PGMusicWrapper_requestMusicCurationForAssetFetchResult_curationOptions_graphManager_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  char *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  void (*v18)(void);
  void *v19;
  NSObject *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a2)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loggingConnection");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for asset fetch result: %@", buf, 0xCu);
    }

    +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v5);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_14;
  }
  objc_msgSend(a2, "jsonRepresentation");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (char *)v6;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Apple Music curation for asset fetch result: %@", buf, 0xCu);
    }

    v10 = mach_absolute_time();
    v11 = *(_QWORD *)(a1 + 56);
    v13 = *(_DWORD *)(a1 + 72);
    v12 = *(_DWORD *)(a1 + 76);
    v14 = *(id *)(a1 + 40);
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 64);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_END, v16, "MusicCurationForAssetFetchResult", ", buf, 2u);
    }

    v17 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "MusicCurationForAssetFetchResult";
      v27 = 2048;
      v28 = (float)((float)((float)((float)(v10 - v11) * (float)v13) / (float)v12) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_14:
    v18();
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize inflated music curation object to JSON: %@"), *(_QWORD *)(a1 + 32));
  v21 = (char *)objc_claimAutoreleasedReturnValue();
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "loggingConnection");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v21;
    _os_log_error_impl(&dword_1CA237000, v23, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for asset fetch result: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  v7 = 0;
LABEL_18:

}

void __92__PGMusicWrapper_requestMusicCurationForAssetCollection_curationOptions_graphManager_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  void (*v20)(void);
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char *v27;
  char *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a2)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v27;
      v31 = 2112;
      v32 = *(double *)&v5;
      _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for PHMemory (%@): %@", buf, 0x16u);

    }
    +[PGError xpcSafeErrorWithError:](PGError, "xpcSafeErrorWithError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_14;
  }
  objc_msgSend(a2, "jsonRepresentation");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 48), "title");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v10;
      v31 = 2112;
      v32 = *(double *)&v11;
      v33 = 2112;
      v34 = v7;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Apple Music curation for asset collection (%@) with uuid '%@': %@", buf, 0x20u);

    }
    v12 = mach_absolute_time();
    v13 = *(_QWORD *)(a1 + 72);
    v15 = *(_DWORD *)(a1 + 88);
    v14 = *(_DWORD *)(a1 + 92);
    v16 = *(id *)(a1 + 56);
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 80);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_END, v18, "MusicCurationForMemory", ", buf, 2u);
    }

    v19 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "MusicCurationForMemory";
      v31 = 2048;
      v32 = (float)((float)((float)((float)(v12 - v13) * (float)v15) / (float)v14) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_14:
    v20();
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize inflated music curation object to JSON: %@"), *(_QWORD *)(a1 + 40));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "loggingConnection");
  v25 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v28;
    v31 = 2112;
    v32 = *(double *)&v23;
    _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 1, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  v7 = 0;
LABEL_18:

}

@end
