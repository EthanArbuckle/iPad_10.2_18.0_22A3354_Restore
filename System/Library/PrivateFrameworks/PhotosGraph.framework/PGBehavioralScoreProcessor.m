@implementation PGBehavioralScoreProcessor

- (PGBehavioralScoreProcessor)initWithGraphManager:(id)a3 algorithm:(int64_t)a4
{
  id v6;
  PGBehavioralScoreProcessor *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  uint64_t v10;
  OS_os_log *loggingConnection;
  void *v12;
  NSSet *previousGoldAssetUUIDs;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSSet *v21;
  uint64_t v22;
  NSDictionary *algorithmData;
  void *v24;
  void *v25;
  uint8_t v27[16];
  objc_super v28;

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PGBehavioralScoreProcessor;
  v7 = -[PGBehavioralScoreProcessor init](&v28, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    objc_msgSend(v6, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v10;

    v7->_algorithm = a4;
    -[PGBehavioralScoreProcessor _previousResults](v7, "_previousResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    previousGoldAssetUUIDs = v7->_previousGoldAssetUUIDs;
    v7->_previousGoldAssetUUIDs = 0;

    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("version"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && objc_msgSend(v14, "unsignedIntegerValue") == 10)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("algorithm"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && (v18 = -[NSObject unsignedIntegerValue](v16, "unsignedIntegerValue")) != 0 && v18 == v7->_algorithm)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("goldAssetUUIDs"));
          v19 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v19, "count"))
          {
            v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v19);
            v21 = v7->_previousGoldAssetUUIDs;
            v7->_previousGoldAssetUUIDs = (NSSet *)v20;

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("algorithmData"));
          v22 = objc_claimAutoreleasedReturnValue();
          algorithmData = v7->_algorithmData;
          v7->_algorithmData = (NSDictionary *)v22;

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "loggingConnection");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v27 = 0;
            _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "Behavioral Score Processor: Ignoring previous results due to algorithm mismatch", v27, 2u);
          }
        }

      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "loggingConnection");
        v17 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Behavioral Score Processor: Ignoring previous results due to version mismatch", v27, 2u);
        }
      }

    }
  }

  return v7;
}

- (id)_previousResults
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary urlForApplicationDataFolderIdentifier:](self->_photoLibrary, "urlForApplicationDataFolderIdentifier:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("PGUserBehaviorPreviousResults.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v5)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loggingConnection");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Behavioral Score Processor: Behavioral Score Processor: no previous results found OR error reading behavioral plist\"%@\" : %@", buf, 0x16u);
      }

      v8 = 0;
    }
    else
    {
      v8 = v4;
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "Behavioral Score Processor: No previous results found", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)goldAssetUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  -[PGBehavioralScoreProcessor _previousResults](self, "_previousResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("goldAssetUUIDs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "Behavioral Score Processor: No previous gold assets", v8, 2u);
    }

    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)peopleFeatures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGBehavioralScoreProcessor _previousResults](self, "_previousResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("algorithmData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", PGAssetFeatureBehavioralProcessorPeopleFeaturesKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (id)sceneFeatures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGBehavioralScoreProcessor _previousResults](self, "_previousResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("algorithmData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", PGAssetFeatureBehavioralProcessorSceneFeaturesKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (void)_persistNewGoldAssetsUUIDs:(id)a3 processorData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHPhotoLibrary urlForApplicationDataFolderIdentifier:](self->_photoLibrary, "urlForApplicationDataFolderIdentifier:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("PGUserBehaviorPreviousResults.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, CFSTR("goldAssetUUIDs"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, CFSTR("date"));

    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1E84E4D60, CFSTR("version"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_algorithm);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, CFSTR("algorithm"));

    if (v7)
      -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, CFSTR("algorithmData"));
    v19 = 0;
    -[NSObject writeToURL:error:](v10, "writeToURL:error:", v9, &v19);
    v15 = v19;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v9;
        v22 = 2112;
        v23 = v15;
        _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: An error occurred persisting the processor plist at  \"%@\": %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Behavioral Score Processor: persisted new parameters", buf, 2u);
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: Can't persist the processor data", buf, 2u);
    }
  }

}

- (void)processBehavioralScoresWithProgressBlock:(id)a3
{
  double v4;
  char v5;
  OS_os_log *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  double Current;
  char v22;
  NSObject *v23;
  uint64_t v24;
  uint32_t numer;
  uint32_t denom;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  double v36;
  char v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  _BOOL4 v43;
  uint64_t v44;
  mach_timebase_info v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  os_signpost_id_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  char v57;
  NSObject *v58;
  id v59;
  int v60;
  void *v61;
  NSObject *v62;
  double v63;
  char v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  uint32_t v73;
  uint32_t v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  id v79;
  void *v80;
  NSObject *v81;
  double v82;
  char v83;
  NSObject *v84;
  id v85;
  double v86;
  char v87;
  NSObject *v88;
  os_signpost_id_t v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  char v96;
  NSObject *v97;
  void *v98;
  NSObject *v99;
  double v100;
  char v101;
  void *v102;
  NSObject *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  unint64_t v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  double v121;
  char v122;
  NSObject *v123;
  int v124;
  double v125;
  char v126;
  NSObject *v127;
  id v128;
  void *v129;
  NSObject *v130;
  double v131;
  char v132;
  void *v133;
  uint64_t v134;
  uint32_t v135;
  uint32_t v136;
  NSObject *v137;
  NSObject *v138;
  NSObject *v139;
  void *v140;
  NSObject *v141;
  double v142;
  char v143;
  NSObject *v144;
  id v145;
  void *v146;
  uint64_t v147;
  unint64_t v148;
  os_signpost_id_t spid;
  NSObject *v150;
  id v151;
  void *v152;
  NSObject *v153;
  void *v154;
  void *v155;
  NSObject *v156;
  unint64_t v157;
  uint64_t v158;
  id v159;
  void *v160;
  id v161;
  NSObject *v162;
  void *v163;
  void *v164;
  PGBehavioralScoreProcessor *v165;
  void *v166;
  void (**v167)(void *, mach_timebase_info *, double);
  _QWORD v168[4];
  void (**v169)(void *, mach_timebase_info *, double);
  uint64_t *v170;
  uint64_t *v171;
  uint64_t v172;
  id v173;
  char v174;
  mach_timebase_info v175;
  mach_timebase_info v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  mach_timebase_info info;
  uint64_t v182;
  double *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t v188;
  char v189;
  uint8_t v190[128];
  uint8_t buf[4];
  _BYTE v192[18];
  _QWORD v193[5];

  v193[2] = *MEMORY[0x1E0C80C00];
  v161 = a3;
  v186 = 0;
  v187 = &v186;
  v188 = 0x2020000000;
  v189 = 0;
  v182 = 0;
  v183 = (double *)&v182;
  v184 = 0x2020000000;
  v185 = 0;
  v167 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v161);
  if (!v167
    || (v4 = CFAbsoluteTimeGetCurrent(), v4 - v183[3] < 0.01)
    || (v183[3] = v4,
        LOBYTE(info.numer) = 0,
        v167[2](v167, &info, 0.0),
        v5 = *((_BYTE *)v187 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v187 + 24) = v5) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "assetPropertySetsForUserBehavioralProcessing");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = self;
    v6 = self->_loggingConnection;
    v7 = os_signpost_id_generate((os_log_t)v6);
    v8 = v6;
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "BehavioralFetchGoldAssets", ", buf, 2u);
    }
    v162 = v9;

    info = 0;
    mach_timebase_info(&info);
    v10 = mach_absolute_time();
    -[PHPhotoLibrary librarySpecificFetchOptions](v165->_photoLibrary, "librarySpecificFetchOptions");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setFetchLimit:", 500);
    objc_msgSend(v166, "addFetchPropertySets:", v163);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("computedAttributes.interactionScore > %f"), 0x3FC99999A0000000);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setInternalPredicate:", v11);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("computedAttributes.interactionScore"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v193[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v193[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setInternalSortDescriptors:", v14);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForBehavioralCurationWithOptions:", v166);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    v160 = v15;
    objc_msgSend(v15, "fetchedObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v164, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v192 = v20;
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "Behavioral Score Processor: fetched %lu gold assets", buf, 0xCu);
    }

    if (v167)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v183[3] >= 0.01)
      {
        v183[3] = Current;
        LOBYTE(v176.numer) = 0;
        v167[2](v167, &v176, 0.1);
        v22 = *((_BYTE *)v187 + 24) | LOBYTE(v176.numer);
        *((_BYTE *)v187 + 24) = v22;
        if (v22)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_164:

            goto LABEL_165;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v192 = 231;
          *(_WORD *)&v192[4] = 2080;
          *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/UserBehavior/PGBehavioralScoreProcessor.m";
          v23 = MEMORY[0x1E0C81028];
LABEL_59:
          _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_164;
        }
      }
    }
    v24 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v27 = v162;
    v28 = v27;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v28, OS_SIGNPOST_INTERVAL_END, v7, "BehavioralFetchGoldAssets", ", buf, 2u);
    }

    v29 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v192 = "BehavioralFetchGoldAssets";
      *(_WORD *)&v192[8] = 2048;
      *(double *)&v192[10] = (float)((float)((float)((float)(v24 - v10) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (!objc_msgSend(v164, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "loggingConnection");
      v62 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v62, OS_LOG_TYPE_INFO, "Behavioral Score Processor: early abort due to no gold assets.", buf, 2u);
      }

      if (!v167)
        goto LABEL_164;
      v63 = CFAbsoluteTimeGetCurrent();
      if (v63 - v183[3] < 0.01)
        goto LABEL_164;
      v183[3] = v63;
      LOBYTE(v176.numer) = 0;
      v167[2](v167, &v176, 1.0);
      v64 = *((_BYTE *)v187 + 24) | LOBYTE(v176.numer);
      *((_BYTE *)v187 + 24) = v64;
      if (!v64 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_164;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v192 = 238;
      *(_WORD *)&v192[4] = 2080;
      *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/UserBehavior/PGBehavioralScoreProcessor.m";
      v23 = MEMORY[0x1E0C81028];
      goto LABEL_59;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v31 = v164;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v177, v190, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v178;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v178 != v33)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * i), "uuid");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v35);

        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v177, v190, 16);
      }
      while (v32);
    }

    if (v167)
    {
      v36 = CFAbsoluteTimeGetCurrent();
      if (v36 - v183[3] >= 0.01)
      {
        v183[3] = v36;
        LOBYTE(v176.numer) = 0;
        v167[2](v167, &v176, 0.15);
        v37 = *((_BYTE *)v187 + 24) | LOBYTE(v176.numer);
        *((_BYTE *)v187 + 24) = v37;
        if (v37)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v192 = 254;
            *(_WORD *)&v192[4] = 2080;
            *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_163;
        }
      }
    }
    v38 = v165->_loggingConnection;
    v39 = os_signpost_id_generate(v38);
    v40 = v38;
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "BehavioralCheckIfNeedReprocessing", ", buf, 2u);
    }

    v176 = 0;
    mach_timebase_info(&v176);
    v42 = mach_absolute_time();
    v43 = -[PGBehavioralScoreProcessor needBehavioralScoreReprocessingUsingCurrentGoldAssetsUUIDs:previousGoldAssetUUIDs:](v165, "needBehavioralScoreReprocessingUsingCurrentGoldAssetsUUIDs:previousGoldAssetUUIDs:", v30, v165->_previousGoldAssetUUIDs);
    v44 = mach_absolute_time();
    v45 = v176;
    v46 = v41;
    v47 = v46;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v47, OS_SIGNPOST_INTERVAL_END, v39, "BehavioralCheckIfNeedReprocessing", ", buf, 2u);
    }

    v48 = v47;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v192 = "BehavioralCheckIfNeedReprocessing";
      *(_WORD *)&v192[8] = 2048;
      *(double *)&v192[10] = (float)((float)((float)((float)(v44 - v42) * (float)v45.numer) / (float)v45.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v153 = v48;

    if (v43)
    {
      v49 = v165->_loggingConnection;
      v50 = os_signpost_id_generate(v49);
      v51 = v49;
      v52 = v51;
      if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v50, "BehavioralResetScoreOfAllLibrary", ", buf, 2u);
      }
      v156 = v52;

      v175 = 0;
      mach_timebase_info(&v175);
      v158 = mach_absolute_time();
      -[PHPhotoLibrary librarySpecificFetchOptions](v165->_photoLibrary, "librarySpecificFetchOptions");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addFetchPropertySets:", v163);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("computedAttributes.behavioralScore > %f"), 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setInternalPredicate:", v54);

      objc_msgSend(v53, "setCacheSizeForFetch:", 100);
      objc_msgSend(v53, "setChunkSizeForFetch:", 100);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = v55;
      if (v167
        && (v56 = CFAbsoluteTimeGetCurrent(), v56 - v183[3] >= 0.01)
        && (v183[3] = v56,
            v174 = 0,
            v167[2](v167, (mach_timebase_info *)&v174, 0.2),
            v57 = *((_BYTE *)v187 + 24) | v174,
            (*((_BYTE *)v187 + 24) = v57) != 0))
      {
        v58 = MEMORY[0x1E0C81028];
        v59 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v192 = 280;
          *(_WORD *)&v192[4] = 2080;
          *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/UserBehavior/PGBehavioralScoreProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        v159 = 0;
        v60 = 1;
      }
      else
      {
        v65 = objc_msgSend(v55, "count");
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "loggingConnection");
        v67 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v192 = v65;
          _os_log_impl(&dword_1CA237000, v67, OS_LOG_TYPE_INFO, "Behavioral Score Processor: start reset behavioral score of %lu assets", buf, 0xCu);
        }

        -[PHPhotoLibrary assetsdClient](v165->_photoLibrary, "assetsdClient");
        v68 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v68, "libraryInternalClient");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v173 = 0;
        LOBYTE(v68) = objc_msgSend(v69, "invalidateBehavioralScoreOnAllAssetsWithError:", &v173);
        v151 = v173;
        if ((v68 & 1) != 0)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "loggingConnection");
          v71 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA237000, v71, OS_LOG_TYPE_INFO, "Behavioral Score Processor: successful reset behavioral score", buf, 2u);
          }

          v72 = mach_absolute_time();
          v73 = v175.numer;
          v74 = v175.denom;
          v75 = v156;
          v76 = v75;
          if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v76, OS_SIGNPOST_INTERVAL_END, v50, "BehavioralResetScoreOfAllLibrary", ", buf, 2u);
          }

          v77 = v76;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v192 = "BehavioralResetScoreOfAllLibrary";
            *(_WORD *)&v192[8] = 2048;
            *(double *)&v192[10] = (float)((float)((float)((float)(v72 - v158) * (float)v73) / (float)v74) / 1000000.0);
            _os_log_impl(&dword_1CA237000, v77, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }

          v159 = -[PGBehavioralScoreProcessor _newBehavioralProcessorForAlgorithm:goldAssets:graph:](v165, "_newBehavioralProcessorForAlgorithm:goldAssets:graph:", v165->_algorithm, v31, v165->_graph);
          v168[0] = MEMORY[0x1E0C809B0];
          v168[1] = 3221225472;
          v168[2] = __71__PGBehavioralScoreProcessor_processBehavioralScoresWithProgressBlock___block_invoke;
          v168[3] = &unk_1E8434F30;
          v169 = v167;
          v170 = &v182;
          v171 = &v186;
          v172 = 0x3F847AE147AE147BLL;
          objc_msgSend(v159, "preprocessWithProgressBlock:", v168);
          if (*((_BYTE *)v187 + 24))
          {
            v78 = MEMORY[0x1E0C81028];
            v79 = MEMORY[0x1E0C81028];
            v60 = 1;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v192 = 305;
              *(_WORD *)&v192[4] = 2080;
              *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
              _os_log_impl(&dword_1CA237000, v78, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else
          {
            objc_msgSend(v159, "dataToPersist");
            v78 = objc_claimAutoreleasedReturnValue();
            -[PGBehavioralScoreProcessor _persistNewGoldAssetsUUIDs:processorData:](v165, "_persistNewGoldAssetsUUIDs:processorData:", v30, v78);
            v60 = 0;
          }

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "loggingConnection");
          v81 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v192 = v151;
            _os_log_error_impl(&dword_1CA237000, v81, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: aborting due to error resetting behavioral scores: %@", buf, 0xCu);
          }

          if (v167)
          {
            v82 = CFAbsoluteTimeGetCurrent();
            if (v82 - v183[3] >= 0.01)
            {
              v183[3] = v82;
              v174 = 0;
              v167[2](v167, (mach_timebase_info *)&v174, 1.0);
              v83 = *((_BYTE *)v187 + 24) | v174;
              *((_BYTE *)v187 + 24) = v83;
              if (v83)
              {
                v84 = MEMORY[0x1E0C81028];
                v85 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v192 = 290;
                  *(_WORD *)&v192[4] = 2080;
                  *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

              }
            }
          }
          v159 = 0;
          v60 = 1;
        }

      }
      if (v60)
        goto LABEL_161;
    }
    else
    {
      -[PGBehavioralScoreProcessor _behavioralProcessorForAlgorithm:goldAssets:graph:persistedData:](v165, "_behavioralProcessorForAlgorithm:goldAssets:graph:persistedData:", v165->_algorithm, v31, v165->_graph, v165->_algorithmData);
      v159 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v159)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "loggingConnection");
      v99 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v99, OS_LOG_TYPE_INFO, "Behavioral Score Processor: no algorithm processor was picked. Exit.", buf, 2u);
      }

      if (v167)
      {
        v100 = CFAbsoluteTimeGetCurrent();
        if (v100 - v183[3] >= 0.01)
        {
          v183[3] = v100;
          LOBYTE(v175.numer) = 0;
          v167[2](v167, &v175, 1.0);
          v101 = *((_BYTE *)v187 + 24) | LOBYTE(v175.numer);
          *((_BYTE *)v187 + 24) = v101;
          if (v101)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v192 = 317;
              *(_WORD *)&v192[4] = 2080;
              *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_162;
    }
    if (v167)
    {
      v86 = CFAbsoluteTimeGetCurrent();
      if (v86 - v183[3] >= 0.01)
      {
        v183[3] = v86;
        LOBYTE(v175.numer) = 0;
        v167[2](v167, &v175, 0.4);
        v87 = *((_BYTE *)v187 + 24) | LOBYTE(v175.numer);
        *((_BYTE *)v187 + 24) = v87;
        if (v87)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v192 = 321;
            *(_WORD *)&v192[4] = 2080;
            *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_161;
        }
      }
    }
    v88 = v165->_loggingConnection;
    v89 = os_signpost_id_generate(v88);
    v90 = v88;
    v91 = v90;
    v148 = v89 - 1;
    spid = v89;
    if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v91, OS_SIGNPOST_INTERVAL_BEGIN, v89, "BehavioralComputeAndSaveBehavioralScore", ", buf, 2u);
    }
    v150 = v91;

    v175 = 0;
    mach_timebase_info(&v175);
    v147 = mach_absolute_time();
    -[PHPhotoLibrary librarySpecificFetchOptions](v165->_photoLibrary, "librarySpecificFetchOptions");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v92, "addFetchPropertySets:", v163);
    objc_msgSend(v92, "setCacheSizeForFetch:", 100);
    objc_msgSend(v92, "setChunkSizeForFetch:", 100);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("computedAttributes.behavioralScore < %f"), 0x3FB99999A0000000);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setInternalPredicate:", v93);
    v152 = v92;

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForBehavioralCurationWithOptions:", v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v94, "count");
    if (v157)
    {
      if (!v167
        || (v95 = CFAbsoluteTimeGetCurrent(), v95 - v183[3] < 0.01)
        || (v183[3] = v95,
            v174 = 0,
            v167[2](v167, (mach_timebase_info *)&v174, 0.5),
            v96 = *((_BYTE *)v187 + 24) | v174,
            (*((_BYTE *)v187 + 24) = v96) == 0))
      {
        v155 = v94;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "loggingConnection");
        v103 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v192 = v157;
          _os_log_impl(&dword_1CA237000, v103, OS_LOG_TYPE_INFO, "Behavioral Score Processor: kick-off behavioralScore processing of %lu assets", buf, 0xCu);
        }

        -[PGGraph infoNode](v165->_graph, "infoNode");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "personalHighAestheticsThreshold");
        v106 = v105;
        if (v105 == -1.0)
        {
          objc_msgSend(v104, "topTierAestheticScore");
          v106 = v107;
        }
        objc_msgSend(v104, "personalGoodAestheticsThreshold");
        v109 = v108;
        v146 = v104;
        if (v108 == -1.0)
        {
          objc_msgSend(MEMORY[0x1E0D77E18], "legacyAestheticScoreThresholdToBeAestheticallyPrettyGood");
          v109 = v110;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = 0;
        v113 = MEMORY[0x1E0C81028];
        while (1)
        {
          v114 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v155, "objectAtIndex:", v112);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "addObject:", v115);
          if ((unint64_t)objc_msgSend(v111, "count") < 0x7D0)
            goto LABEL_128;
          v116 = (void *)MEMORY[0x1CAA4EB2C]();
          -[PGBehavioralScoreProcessor behavioralScoreByAssetUUIDForAssets:algorithmProcessor:personalHighAestheticsThreshold:personalGoodAestheticsThreshold:](v165, "behavioralScoreByAssetUUIDForAssets:algorithmProcessor:personalHighAestheticsThreshold:personalGoodAestheticsThreshold:", v111, v159, v106, v109);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = (void *)objc_msgSend(v111, "copy");
          -[PGBehavioralScoreProcessor _writeBehavioralScoresToPhotosDatabase:assets:](v165, "_writeBehavioralScoresToPhotosDatabase:assets:", v117, v118);

          objc_msgSend(v111, "removeAllObjects");
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "loggingConnection");
          v120 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v192 = v112 + 1;
            *(_WORD *)&v192[8] = 2048;
            *(_QWORD *)&v192[10] = v157;
            _os_log_impl(&dword_1CA237000, v120, OS_LOG_TYPE_INFO, "Behavioral Score Processor: behavioral score of %lu/%lu assets are saved", buf, 0x16u);
          }

          if (v167
            && (v121 = CFAbsoluteTimeGetCurrent(), v121 - v183[3] >= 0.01)
            && (v183[3] = v121,
                v174 = 0,
                v167[2](v167, (mach_timebase_info *)&v174, (double)v112 * (0.4 / (double)v157) + 0.5),
                v122 = *((_BYTE *)v187 + 24) | v174,
                (*((_BYTE *)v187 + 24) = v122) != 0))
          {
            v123 = v113;
            if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v192 = 380;
              *(_WORD *)&v192[4] = 2080;
              *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
              _os_log_impl(&dword_1CA237000, v113, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            v124 = 0;
          }
          else
          {
            v124 = 1;
          }

          objc_autoreleasePoolPop(v116);
          if (v124)
LABEL_128:
            LOBYTE(v124) = 1;

          objc_autoreleasePoolPop(v114);
          if ((v124 & 1) == 0)
            break;
          if (v157 == ++v112)
          {
            if (v167
              && (v125 = CFAbsoluteTimeGetCurrent(), v125 - v183[3] >= 0.01)
              && (v183[3] = v125,
                  v174 = 0,
                  v167[2](v167, (mach_timebase_info *)&v174, 0.9),
                  v126 = *((_BYTE *)v187 + 24) | v174,
                  (*((_BYTE *)v187 + 24) = v126) != 0))
            {
              v127 = MEMORY[0x1E0C81028];
              v128 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v192 = 386;
                *(_WORD *)&v192[4] = 2080;
                *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

            }
            else
            {
              -[PGBehavioralScoreProcessor behavioralScoreByAssetUUIDForAssets:algorithmProcessor:personalHighAestheticsThreshold:personalGoodAestheticsThreshold:](v165, "behavioralScoreByAssetUUIDForAssets:algorithmProcessor:personalHighAestheticsThreshold:personalGoodAestheticsThreshold:", v111, v159, v106, v109);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              -[PGBehavioralScoreProcessor _writeBehavioralScoresToPhotosDatabase:assets:](v165, "_writeBehavioralScoresToPhotosDatabase:assets:", v133, v111);
              v134 = mach_absolute_time();
              v135 = v175.numer;
              v136 = v175.denom;
              v137 = v150;
              v138 = v137;
              if (v148 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA237000, v138, OS_SIGNPOST_INTERVAL_END, spid, "BehavioralComputeAndSaveBehavioralScore", ", buf, 2u);
              }

              v139 = v138;
              if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v192 = "BehavioralComputeAndSaveBehavioralScore";
                *(_WORD *)&v192[8] = 2048;
                *(double *)&v192[10] = (float)((float)((float)((float)(v134 - v147) * (float)v135) / (float)v136)
                                             / 1000000.0);
                _os_log_impl(&dword_1CA237000, v139, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }

              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "loggingConnection");
              v141 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA237000, v141, OS_LOG_TYPE_INFO, "Behavioral Score Processor: ended behavioralScore processing", buf, 2u);
              }

              if (v167)
              {
                v142 = CFAbsoluteTimeGetCurrent();
                if (v142 - v183[3] >= 0.01)
                {
                  v183[3] = v142;
                  v174 = 0;
                  v167[2](v167, (mach_timebase_info *)&v174, 1.0);
                  v143 = *((_BYTE *)v187 + 24) | v174;
                  *((_BYTE *)v187 + 24) = v143;
                  if (v143)
                  {
                    v144 = MEMORY[0x1E0C81028];
                    v145 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v192 = 395;
                      *(_WORD *)&v192[4] = 2080;
                      *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                  }
                }
              }

            }
            break;
          }
        }

        v94 = v155;
        goto LABEL_160;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_160:

LABEL_161:
LABEL_162:

LABEL_163:
        goto LABEL_164;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v192 = 345;
      *(_WORD *)&v192[4] = 2080;
      *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/UserBehavior/PGBehavioralScoreProcessor.m";
      v97 = MEMORY[0x1E0C81028];
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "loggingConnection");
      v130 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v130, OS_LOG_TYPE_INFO, "Behavioral Score Processor: no assets to process for behavioralScore", buf, 2u);
      }

      if (!v167)
        goto LABEL_160;
      v131 = CFAbsoluteTimeGetCurrent();
      if (v131 - v183[3] < 0.01)
        goto LABEL_160;
      v183[3] = v131;
      v174 = 0;
      v167[2](v167, (mach_timebase_info *)&v174, 1.0);
      v132 = *((_BYTE *)v187 + 24) | v174;
      *((_BYTE *)v187 + 24) = v132;
      if (!v132 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_160;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v192 = 341;
      *(_WORD *)&v192[4] = 2080;
      *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/UserBehavior/PGBehavioralScoreProcessor.m";
      v97 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v97, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_160;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v192 = 214;
    *(_WORD *)&v192[4] = 2080;
    *(_QWORD *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/UserBehavior/PGBehavioralScoreProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_165:
  _Block_object_dispose(&v182, 8);
  _Block_object_dispose(&v186, 8);

}

- (void)_writeBehavioralScoresToPhotosDatabase:(id)a3 assets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PHPhotoLibrary *photoLibrary;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA4EB2C]();
  photoLibrary = self->_photoLibrary;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PGBehavioralScoreProcessor__writeBehavioralScoresToPhotosDatabase_assets___block_invoke;
  v16[3] = &unk_1E8433828;
  v10 = v7;
  v17 = v10;
  v11 = v6;
  v18 = v11;
  v15 = 0;
  -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v16, &v15);
  v12 = v15;
  if (v12)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: Error saving behavioral scores to database: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v8);

}

- (BOOL)needBehavioralScoreReprocessingUsingCurrentGoldAssetsUUIDs:(id)a3 previousGoldAssetUUIDs:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  BOOL v14;
  const char *v15;
  void *v16;
  int v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v6, "count");
    if (v7 == objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject intersectSet:](v8, "intersectSet:", v6);
      v9 = (double)(unint64_t)-[NSObject count](v8, "count");
      v10 = v9 / (double)(unint64_t)objc_msgSend(v5, "count");
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      v14 = v10 < 0.9;
      if (v10 >= 0.9)
      {
        if (v13)
        {
          v18 = 134217984;
          v19 = v10;
          v15 = "Behavioral Score  Processor: no need for behavioralScore reprocessing (%f gold assets are in common with"
                " previous iteration)";
          goto LABEL_10;
        }
      }
      else if (v13)
      {
        v18 = 134217984;
        v19 = v10;
        v15 = "Behavioral Score  Processor: need behavioralScore reprocessing because only %f gold assets are in common w"
              "ith previous iteration";
LABEL_10:
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, 0xCu);
      }

      goto LABEL_12;
    }
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();

  v14 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Behavioral Score Processor: need behavioral score reprocessing", (uint8_t *)&v18, 2u);
  }
LABEL_12:

  return v14;
}

- (id)_newBehavioralProcessorForAlgorithm:(int64_t)a3 goldAssets:(id)a4 graph:(id)a5
{
  id v6;
  PGAssetFeatureBehavioralProcessor *v7;

  if (a3 != 1)
    return 0;
  v6 = a4;
  v7 = -[PGAssetFeatureBehavioralProcessor initWithGoldAssets:loggingConnection:]([PGAssetFeatureBehavioralProcessor alloc], "initWithGoldAssets:loggingConnection:", v6, self->_loggingConnection);

  return v7;
}

- (id)_behavioralProcessorForAlgorithm:(int64_t)a3 goldAssets:(id)a4 graph:(id)a5 persistedData:(id)a6
{
  id v8;
  id v9;
  PGAssetFeatureBehavioralProcessor *v10;

  if (a3 == 1)
  {
    v8 = a6;
    v9 = a4;
    v10 = -[PGAssetFeatureBehavioralProcessor initWithGoldAssets:persistedData:loggingConnection:]([PGAssetFeatureBehavioralProcessor alloc], "initWithGoldAssets:persistedData:loggingConnection:", v9, v8, self->_loggingConnection);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)behavioralScoreByAssetUUIDForAssets:(id)a3 algorithmProcessor:(id)a4 personalHighAestheticsThreshold:(double)a5 personalGoodAestheticsThreshold:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  double v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *context;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v11, "semanticScoreByAssetUUIDForAssets:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v19, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "clsAestheticScore");
        if (v21 >= a6)
        {
          v22 = v21;
          objc_msgSend(v13, "objectForKeyedSubscript:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          v25 = v24;

          LODWORD(v27) = 1036831949;
          if (v25 >= 0.2)
          {
            if (v22 < a5 || (LODWORD(v27) = 1063675494, v25 < 0.7))
            {
              v28 = v25 < 0.7 && v22 < a5;
              LODWORD(v27) = 0.5;
              if (!v28)
                *(float *)&v27 = 0.7;
            }
          }
          v29 = (void *)MEMORY[0x1E0CB37E8];
          *(float *)&v26 = v25;
          -[PGBehavioralScoreProcessor behavioralScoreFromBaseScore:semanticScore:](self, "behavioralScoreFromBaseScore:semanticScore:", v27, v26);
          objc_msgSend(v29, "numberWithFloat:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, v20);

        }
        else
        {
          objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E84EB688, v20);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(context);
  return v12;
}

- (float)behavioralScoreFromBaseScore:(float)a3 semanticScore:(float)a4
{
  return (float)(a4 * 0.01) + a3;
}

- (float)semanticScoreFromBehavioralScore:(float)a3
{
  return fmodf(a3, 0.1) * 100.0;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (NSSet)previousGoldAssetUUIDs
{
  return self->_previousGoldAssetUUIDs;
}

- (void)setPreviousGoldAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_previousGoldAssetUUIDs, a3);
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int64_t)a3
{
  self->_algorithm = a3;
}

- (NSDictionary)algorithmData
{
  return self->_algorithmData;
}

- (void)setAlgorithmData:(id)a3
{
  objc_storeStrong((id *)&self->_algorithmData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmData, 0);
  objc_storeStrong((id *)&self->_previousGoldAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __76__PGBehavioralScoreProcessor__writeBehavioralScoresToPhotosDatabase_assets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "uuid", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        objc_msgSend(v11, "setBehavioralScore:");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __71__PGBehavioralScoreProcessor_processBehavioralScoresWithProgressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)assetPropertySetsForUserBehavioralProcessing
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD1A60];
  v4[0] = *MEMORY[0x1E0CD1978];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E0CD19F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
