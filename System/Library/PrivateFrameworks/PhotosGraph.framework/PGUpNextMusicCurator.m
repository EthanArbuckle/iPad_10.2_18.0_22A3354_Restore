@implementation PGUpNextMusicCurator

- (PGUpNextMusicCurator)initWithLoggingConnection:(id)a3
{
  id v5;
  PGUpNextMusicCurator *v6;
  PGUpNextMusicCurator *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGUpNextMusicCurator;
  v6 = -[PGUpNextMusicCurator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_loggingConnection, a3);
    objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isAppleMusicSubscriber = +[PGMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:](PGMusicCatalogMonitor, "checkMusicCatalogEligibilityWithProgressReporter:", v8);

  }
  return v7;
}

- (BOOL)curateMusicForUpNextMemoriesWithLocalIdentifiers:(id)a3 musicCurationOptions:(id)a4 photoLibrary:(id)a5 managerContext:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  PGUpNextMusicCurator *v14;
  id v15;
  id v16;
  OS_os_log *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  PGUpNextMusicCurator *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  NSObject *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  char *v59;
  uint64_t v60;
  void *v61;
  const __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  uint32_t v65;
  uint32_t v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  uint32_t v70;
  uint32_t v71;
  NSObject *v72;
  NSObject *v73;
  char v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint32_t numer;
  uint32_t denom;
  NSObject *v80;
  NSObject *v81;
  NSObject *loggingConnection;
  uint64_t v83;
  uint32_t v84;
  uint32_t v85;
  NSObject *v86;
  NSObject *v87;
  uint64_t v88;
  uint32_t v89;
  uint32_t v90;
  NSObject *v91;
  NSObject *v92;
  uint64_t v93;
  uint32_t v94;
  uint32_t v95;
  NSObject *v96;
  NSObject *v97;
  uint64_t v98;
  uint32_t v99;
  uint32_t v100;
  NSObject *v101;
  NSObject *v102;
  const __CFString *v104;
  const __CFString *v105;
  os_signpost_id_t spid;
  id v107;
  uint64_t v108;
  unint64_t v109;
  void *v110;
  id v111;
  NSObject *v112;
  os_signpost_id_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  unint64_t v118;
  id obj;
  void *v120;
  void *v121;
  char v122;
  PGUpNextMusicCurator *v123;
  NSObject *v124;
  id v125;
  id *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  _QWORD v131[4];
  id v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  mach_timebase_info v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  mach_timebase_info info;
  uint8_t v144[128];
  uint8_t buf[4];
  const char *v146;
  __int16 v147;
  double v148;
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = v13;
  v16 = a5;
  v125 = a6;
  v17 = self->_loggingConnection;
  v18 = os_signpost_id_generate((os_log_t)v17);
  v19 = v17;
  v20 = v19;
  v118 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PGUpNextMusicCurator", ", buf, 2u);
  }
  v113 = v18;
  v124 = v20;

  info = 0;
  mach_timebase_info(&info);
  v115 = mach_absolute_time();
  v123 = v14;
  v121 = v16;
  objc_msgSend((id)objc_opt_class(), "_baseMemoryFetchOptionsWithPhotoLibrary:", v16);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1630], "fetchAssetCollectionsWithLocalIdentifiers:options:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v139, v149, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v140 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v22, "addObject:", v28);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v139, v149, 16);
    }
    while (v25);
  }

  if (!objc_msgSend(v22, "count"))
  {
    v74 = 1;
    v75 = v125;
    goto LABEL_100;
  }
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "musicCuratorContextWithCurationOptions:error:", v15, a7);
  v30 = objc_claimAutoreleasedReturnValue();
  v114 = (void *)v30;
  if (!v30)
  {
    v76 = (void *)v29;
    v77 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v80 = v124;
    v81 = v80;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v81, OS_SIGNPOST_INTERVAL_END, v18, "PGUpNextMusicCurator", ", buf, 2u);
    }

    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      v147 = 2048;
      v148 = (float)((float)((float)((float)(v77 - v115) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v81, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v74 = 0;
    v75 = v125;
    goto LABEL_99;
  }
  v31 = v30;
  v32 = v123;
  -[PGUpNextMusicCurator _appleMusicCurationForMemories:curatorContext:managerContext:progressReporter:error:](v123, "_appleMusicCurationForMemories:curatorContext:managerContext:progressReporter:error:", v22, v30, v125, v29, a7);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v130)
  {
    loggingConnection = v123->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      if (a7)
        v104 = (const __CFString *)*a7;
      else
        v104 = CFSTR("no error");
      *(_DWORD *)buf = 138412290;
      v146 = (const char *)v104;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to curate music for memories, error: %@", buf, 0xCu);
    }
    v76 = (void *)v29;
    v83 = mach_absolute_time();
    v84 = info.numer;
    v85 = info.denom;
    v86 = v124;
    v87 = v86;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v87, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", ", buf, 2u);
    }

    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      v147 = 2048;
      v148 = (float)((float)((float)((float)(v83 - v115) * (float)v84) / (float)v85) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v74 = 0;
    v75 = v125;
    goto LABEL_98;
  }
  -[PGUpNextMusicCurator _flexMusicCurationForMemories:curatorContext:musicCurationOptions:managerContext:progressReporter:error:](v123, "_flexMusicCurationForMemories:curatorContext:musicCurationOptions:managerContext:progressReporter:error:", v22, v31, v15, v125, v29, a7);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v123->_loggingConnection;
  v129 = (void *)v33;
  if (!v33)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      if (a7)
        v105 = (const __CFString *)*a7;
      else
        v105 = CFSTR("no error");
      *(_DWORD *)buf = 138412290;
      v146 = (const char *)v105;
      _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to curate flex music for memories, error: %@", buf, 0xCu);
    }
    v76 = (void *)v29;
    v88 = mach_absolute_time();
    v89 = info.numer;
    v90 = info.denom;
    v91 = v124;
    v92 = v91;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v92, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", ", buf, 2u);
    }

    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      v147 = 2048;
      v148 = (float)((float)((float)((float)(v88 - v115) * (float)v89) / (float)v90) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v92, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v74 = 0;
    v75 = v125;
    goto LABEL_97;
  }
  v110 = (void *)v29;
  v35 = v34;
  v36 = os_signpost_id_generate(v35);
  v37 = v35;
  v38 = v37;
  v109 = v36 - 1;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PGUpNextMusicCurator_BuildAndPersistRecipe", ", buf, 2u);
  }
  spid = v36;
  v111 = v12;
  v112 = v38;

  v138 = 0;
  mach_timebase_info(&v138);
  v108 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v39 = v22;
  v128 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
  if (!v128)
  {

    goto LABEL_85;
  }
  obj = v39;
  v107 = v15;
  v127 = *(_QWORD *)v135;
  v122 = 1;
  v126 = a7;
  do
  {
    v40 = 0;
    do
    {
      if (*(_QWORD *)v135 != v127)
        objc_enumerationMutation(obj);
      v41 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v40);
      objc_msgSend(v130, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "appleMusicCuration");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v129, "objectForKeyedSubscript:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "flexMusicCuration");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v130, "objectForKeyedSubscript:", v41);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "features");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        v48 = v45 == 0;
      else
        v48 = 1;
      if (!v48 && v47 != 0)
      {
        objc_msgSend((id)objc_opt_class(), "_photosGraphPropertiesForMemory:musicCurationFeatures:appleMusicCuration:flexMusicCuration:isAppleMusicSubscriber:error:", v41, v47, v43, v45, v32->_isAppleMusicSubscriber, a7);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v54, 1, a7);
        v55 = objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v53 = (void *)v55;
          objc_msgSend(v117, "setObject:forKeyedSubscript:", v55, v41);
          objc_msgSend(v116, "setObject:forKeyedSubscript:", v54, v41);
          v56 = 0;
LABEL_41:

          a7 = v126;
          goto LABEL_42;
        }
        v57 = v32->_loggingConnection;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v41, "uuid");
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v60;
          *(double *)&v62 = COERCE_DOUBLE(CFSTR("no error"));
          if (v126)
            v62 = *(const __CFString **)v126;
          *(_DWORD *)buf = 138412546;
          v146 = (const char *)v60;
          v147 = 2112;
          v148 = *(double *)&v62;
          _os_log_error_impl(&dword_1CA237000, v57, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Unable to create photosGraphData for memory (%@), error: %@", buf, 0x16u);

        }
        v53 = 0;
        v122 = 0;
LABEL_40:
        v56 = 4;
        goto LABEL_41;
      }
      v50 = v32->_loggingConnection;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v58 = v50;
        objc_msgSend(v41, "uuid");
        v59 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v146 = v59;
        _os_log_error_impl(&dword_1CA237000, v58, OS_LOG_TYPE_ERROR, "[MemoriesMusic] one or both music curations or music features missing for memory (%@)", buf, 0xCu);

        a7 = v126;
        if (v126)
        {
LABEL_35:
          v51 = a7;
          v52 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v41, "uuid");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "stringWithFormat:", CFSTR("One or both music curations missing for asset collection (%@)"), v54);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -1, v53);
          v122 = 0;
          *v51 = (id)objc_claimAutoreleasedReturnValue();
          v32 = v123;
          goto LABEL_40;
        }
      }
      else if (a7)
      {
        goto LABEL_35;
      }
      v122 = 0;
      v56 = 4;
LABEL_42:

      if (v56)
        goto LABEL_51;
      ++v40;
    }
    while (v128 != v40);
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v144, 16);
    v128 = v63;
  }
  while (v63);
LABEL_51:

  v15 = v107;
  if ((v122 & 1) == 0)
  {
    v64 = mach_absolute_time();
    v65 = v138.numer;
    v66 = v138.denom;
    v67 = v112;
    v68 = v67;
    if (v109 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v68, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_BuildAndPersistRecipe", ", buf, 2u);
    }

    v12 = v111;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator_BuildAndPersistRecipe";
      v147 = 2048;
      v148 = (float)((float)((float)((float)(v64 - v108) * (float)v65) / (float)v66) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v68, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v69 = mach_absolute_time();
    v70 = info.numer;
    v71 = info.denom;
    v72 = v124;
    v73 = v72;
    if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v73, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", ", buf, 2u);
    }

    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v146 = "PGUpNextMusicCurator";
      v147 = 2048;
      v148 = (float)((float)((float)((float)(v69 - v115) * (float)v70) / (float)v71) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v73, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v74 = 0;
    goto LABEL_96;
  }
LABEL_85:
  v131[0] = MEMORY[0x1E0C809B0];
  v131[1] = 3221225472;
  v131[2] = __128__PGUpNextMusicCurator_curateMusicForUpNextMemoriesWithLocalIdentifiers_musicCurationOptions_photoLibrary_managerContext_error___block_invoke;
  v131[3] = &unk_1E8433828;
  v132 = v117;
  v133 = v116;
  v74 = objc_msgSend(v121, "performChangesAndWait:error:", v131, a7);
  v93 = mach_absolute_time();
  v94 = v138.numer;
  v95 = v138.denom;
  v96 = v112;
  v97 = v96;
  if (v109 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v97, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_BuildAndPersistRecipe", ", buf, 2u);
  }

  v12 = v111;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v146 = "PGUpNextMusicCurator_BuildAndPersistRecipe";
    v147 = 2048;
    v148 = (float)((float)((float)((float)(v93 - v108) * (float)v94) / (float)v95) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v97, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v98 = mach_absolute_time();
  v99 = info.numer;
  v100 = info.denom;
  v101 = v124;
  v102 = v101;
  if (v118 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v102, OS_SIGNPOST_INTERVAL_END, v113, "PGUpNextMusicCurator", ", buf, 2u);
  }

  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v146 = "PGUpNextMusicCurator";
    v147 = 2048;
    v148 = (float)((float)((float)((float)(v98 - v115) * (float)v99) / (float)v100) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v102, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

LABEL_96:
  v75 = v125;
  v76 = v110;
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
  return v74;
}

- (id)_appleMusicCurationForMemories:(id)a3 curatorContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  OS_os_log *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint32_t denom;
  uint32_t numer;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint32_t v37;
  uint32_t v38;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t spid;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (objc_class *)MEMORY[0x1E0D42A60];
  v16 = a3;
  v17 = (void *)objc_msgSend([v15 alloc], "initWithProgressReporter:", v14);
  objc_msgSend(v17, "childProgressReporterToCheckpoint:", 0.7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "childProgressReporterToCheckpoint:", 0.95);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "appleMusicFeatureExtractionContextWithCuratorContext:", v12);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGUpNextMusicCurator _musicCurationFeaturesForMemories:musicExtractionContext:managerContext:progressReporter:error:](self, "_musicCurationFeaturesForMemories:musicExtractionContext:managerContext:progressReporter:error:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v45 = v14;
    v46 = v19;
    v44 = v18;
    v21 = self->_loggingConnection;
    v22 = os_signpost_id_generate((os_log_t)v21);
    v23 = v21;
    v24 = v23;
    v25 = v22 - 1;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PGUpNextMusicCurator_AppleMusicCuration", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v43 = mach_absolute_time();
    objc_msgSend((id)objc_opt_class(), "_appleMusicCurationWithFeaturesByMemory:musicCuratorContext:managerContext:progressReporter:error:", v20, v12, v13, v46, a7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      spid = v22;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v26, "count"));
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __108__PGUpNextMusicCurator__appleMusicCurationForMemories_curatorContext_managerContext_progressReporter_error___block_invoke;
      v48[3] = &unk_1E8429DC8;
      v49 = v20;
      v28 = v27;
      v50 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v48);
      objc_msgSend(v45, "isCancelledWithProgress:", 1.0);
      v29 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v32 = v24;
      v33 = v32;
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_AppleMusicCuration", ", buf, 2u);
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "PGUpNextMusicCurator_AppleMusicCuration";
        v54 = 2048;
        v55 = (float)((float)((float)((float)(v29 - v43) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v34 = v50;
      v35 = v28;

      v14 = v45;
    }
    else
    {
      v36 = mach_absolute_time();
      v38 = info.numer;
      v37 = info.denom;
      v39 = v24;
      v40 = v39;
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v40, OS_SIGNPOST_INTERVAL_END, v22, "PGUpNextMusicCurator_AppleMusicCuration", ", buf, 2u);
      }

      v14 = v45;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "PGUpNextMusicCurator_AppleMusicCuration";
        v54 = 2048;
        v55 = (float)((float)((float)((float)(v36 - v43) * (float)v38) / (float)v37) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v35 = 0;
    }
    v18 = v44;

    v19 = v46;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)_flexMusicCurationForMemories:(id)a3 curatorContext:(id)a4 musicCurationOptions:(id)a5 managerContext:(id)a6 progressReporter:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  OS_os_log *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint32_t denom;
  uint32_t numer;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint32_t v40;
  uint32_t v41;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t spid;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = (objc_class *)MEMORY[0x1E0D42A60];
  v18 = a6;
  v19 = a3;
  v20 = (void *)objc_msgSend([v17 alloc], "initWithProgressReporter:", v16);
  objc_msgSend(v20, "childProgressReporterToCheckpoint:", 0.7);
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "childProgressReporterToCheckpoint:", 0.95);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "flexMusicFeatureExtractionContextWithCuratorContext:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v21;
  -[PGUpNextMusicCurator _musicCurationFeaturesForMemories:musicExtractionContext:managerContext:progressReporter:error:](self, "_musicCurationFeaturesForMemories:musicExtractionContext:managerContext:progressReporter:error:", v19, v22, v18, v21, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v47 = v16;
    v48 = v15;
    v24 = self->_loggingConnection;
    v25 = os_signpost_id_generate((os_log_t)v24);
    v26 = v24;
    v27 = v26;
    v28 = v25 - 1;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PGUpNextMusicCurator_FlexMusicCuration", ", buf, 2u);
    }
    spid = v25;

    info = 0;
    mach_timebase_info(&info);
    v46 = mach_absolute_time();
    objc_msgSend((id)objc_opt_class(), "_flexMusicCurationWithFeaturesByMemory:musicCurationOptions:musicCuratorContext:progressReporter:error:", v23, v48, v14, v50, a8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v29, "count"));
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __128__PGUpNextMusicCurator__flexMusicCurationForMemories_curatorContext_musicCurationOptions_managerContext_progressReporter_error___block_invoke;
      v51[3] = &unk_1E8429DF0;
      v52 = v23;
      v31 = v30;
      v53 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v51);
      objc_msgSend(v47, "isCancelledWithProgress:", 1.0);
      v32 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v35 = v27;
      v36 = v35;
      if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_FlexMusicCuration", ", buf, 2u);
      }

      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "PGUpNextMusicCurator_FlexMusicCuration";
        v57 = 2048;
        v58 = (float)((float)((float)((float)(v32 - v46) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v37 = v53;
      v38 = v31;

      v15 = v48;
    }
    else
    {
      v39 = mach_absolute_time();
      v41 = info.numer;
      v40 = info.denom;
      v42 = v27;
      v43 = v42;
      if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v43, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMusicCurator_FlexMusicCuration", ", buf, 2u);
      }

      v15 = v48;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "PGUpNextMusicCurator_FlexMusicCuration";
        v57 = 2048;
        v58 = (float)((float)((float)((float)(v39 - v46) * (float)v41) / (float)v40) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v38 = 0;
    }

    v16 = v47;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (id)_musicCurationFeaturesForMemories:(id)a3 musicExtractionContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  OS_os_log *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint32_t denom;
  uint32_t numer;
  NSObject *v26;
  NSObject *v27;
  id v28;
  uint64_t v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  mach_timebase_info info;
  uint8_t v51[4];
  const char *v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = self->_loggingConnection;
  v16 = os_signpost_id_generate((os_log_t)v15);
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PGUpNextMusicCurator_MusicCurationFeatureExtraction", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v30 = mach_absolute_time();
  *(_QWORD *)buf = 0;
  v45 = buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__16283;
  v48 = __Block_byref_object_dispose__16284;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__16283;
  v42 = __Block_byref_object_dispose__16284;
  v43 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __119__PGUpNextMusicCurator__musicCurationFeaturesForMemories_musicExtractionContext_managerContext_progressReporter_error___block_invoke;
  v32[3] = &unk_1E842BFB0;
  v19 = v11;
  v33 = v19;
  v20 = v14;
  v34 = v20;
  v21 = v12;
  v35 = v21;
  v36 = &v38;
  v37 = buf;
  objc_msgSend(v13, "performSynchronousConcurrentGraphReadUsingBlock:", v32);
  if (!*((_QWORD *)v45 + 5))
  {
    if (a7)
    {
      v22 = (void *)v39[5];
      if (v22)
        *a7 = objc_retainAutorelease(v22);
    }
  }
  v23 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v26 = v18;
  v27 = v26;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_END, v16, "PGUpNextMusicCurator_MusicCurationFeatureExtraction", ", v51, 2u);
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v51 = 136315394;
    v52 = "PGUpNextMusicCurator_MusicCurationFeatureExtraction";
    v53 = 2048;
    v54 = (float)((float)((float)((float)(v23 - v30) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v51, 0x16u);
  }
  v28 = *((id *)v45 + 5);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(buf, 8);

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __119__PGUpNextMusicCurator__musicCurationFeaturesForMemories_musicExtractionContext_managerContext_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "childProgressReporterForStep:outOf:", v4, objc_msgSend(*(id *)(a1 + 32), "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v8 + 40);
      +[PGMusicCurator extractMusicCurationFeaturesForMemory:graph:context:progressReporter:error:](PGMusicCurator, "extractMusicCurationFeaturesForMemory:graph:context:progressReporter:error:", v5, v3, v7, v6, &obj);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v8 + 40), obj);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      if (!v9)
        break;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v5);

      if (++v4 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_7;
    }
    *(_QWORD *)(v10 + 40) = 0;

  }
LABEL_7:

}

void __128__PGUpNextMusicCurator__flexMusicCurationForMemories_curatorContext_musicCurationOptions_managerContext_progressReporter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  PGMusicCurationAndFeatures *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[PGMusicCurationAndFeatures initWithFlexMusicCuration:features:]([PGMusicCurationAndFeatures alloc], "initWithFlexMusicCuration:features:", v6, v9);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
}

void __108__PGUpNextMusicCurator__appleMusicCurationForMemories_curatorContext_managerContext_progressReporter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  PGMusicCurationAndFeatures *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[PGMusicCurationAndFeatures initWithAppleMusicCuration:features:]([PGMusicCurationAndFeatures alloc], "initWithAppleMusicCuration:features:", v6, v9);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
}

void __128__PGUpNextMusicCurator_curateMusicForUpNextMemoriesWithLocalIdentifiers_musicCurationOptions_photoLibrary_managerContext_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMemoryPhotoKitPersister setStoryColorGradeKindFromPhotosGraphProperties:onMemoryChangeRequest:](PGMemoryPhotoKitPersister, "setStoryColorGradeKindFromPhotosGraphProperties:onMemoryChangeRequest:", v9, v10);
        objc_msgSend(v10, "setPhotosGraphData:", v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

+ (id)_appleMusicCurationWithFeaturesByMemory:(id)a3 musicCuratorContext:(id)a4 managerContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__16283;
    v36 = __Block_byref_object_dispose__16284;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__16283;
    v30 = __Block_byref_object_dispose__16284;
    v31 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __122__PGUpNextMusicCurator__appleMusicCurationWithFeaturesByMemory_musicCuratorContext_managerContext_progressReporter_error___block_invoke;
    v20[3] = &unk_1E8429D78;
    v21 = v12;
    v22 = v14;
    v24 = &v26;
    v25 = &v32;
    v16 = v15;
    v23 = v16;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v20);
    if (a7)
    {
      v17 = (void *)v27[5];
      if (v17)
        *a7 = objc_retainAutorelease(v17);
    }
    v18 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    v18 = (id)MEMORY[0x1E0C9AA70];
  }

  return v18;
}

+ (id)_flexMusicCurationWithFeaturesByMemory:(id)a3 musicCurationOptions:(id)a4 musicCuratorContext:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v26 = a7;
    objc_msgSend(v11, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:](PGMusicCurationRecentlyUsedSongs, "recentlyUsedFlexMusicSongsFromPhotoLibrary:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recentlyUsedBundledSongIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSongIDs:date:", v20, v18);

    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__16283;
    v44 = __Block_byref_object_dispose__16284;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__16283;
    v38 = __Block_byref_object_dispose__16284;
    v39 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __127__PGUpNextMusicCurator__flexMusicCurationWithFeaturesByMemory_musicCurationOptions_musicCuratorContext_progressReporter_error___block_invoke;
    v27[3] = &unk_1E8429DA0;
    v21 = v19;
    v28 = v21;
    v29 = v13;
    v30 = v14;
    v32 = &v34;
    v33 = &v40;
    v22 = v18;
    v31 = v22;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v27);
    if (v26)
    {
      v23 = (void *)v35[5];
      if (v23)
        *v26 = objc_retainAutorelease(v23);
    }
    v24 = (id)v41[5];

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA70];
  }

  return v24;
}

+ (id)_photosGraphPropertiesForMemory:(id)a3 musicCurationFeatures:(id)a4 appleMusicCuration:(id)a5 flexMusicCuration:(id)a6 isAppleMusicSubscriber:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;

  v9 = a7;
  v13 = a3;
  v14 = a6;
  v15 = a5;
  v16 = objc_msgSend(a4, "shouldAvoidColorGrading");
  +[PGStoryRecipeBuilder storyRecipeForMemory:appleMusicCuration:flexMusicCuration:shouldAvoidColorGrading:isAppleMusicSubscriber:error:](PGStoryRecipeBuilder, "storyRecipeForMemory:appleMusicCuration:flexMusicCuration:shouldAvoidColorGrading:isAppleMusicSubscriber:error:", v13, v15, v14, v16, v9, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17
    && (v18 = objc_alloc_init(MEMORY[0x1E0D752B0]),
        objc_msgSend(v18, "archivedDataWithRecipe:", v17),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v19))
  {
    objc_msgSend(v13, "photosGraphProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, CFSTR("storyRecipeData"));
    if ((v16 & 1) == 0)
    {
      objc_msgSend(v17, "currentStyle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "originalColorGradeCategory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("storyColorGradeCategory"));

    }
  }
  else if (a8)
  {
    +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -1, CFSTR("Unable to archive story recipe"));
    v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
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

void __127__PGUpNextMusicCurator__flexMusicCurationWithFeaturesByMemory_musicCurationOptions_musicCuratorContext_progressReporter_error___block_invoke(uint64_t *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  PGFlexMusicCurationParameters *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  PGFlexMusicCurationParameters *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "moodKeywords");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  v13 = [PGFlexMusicCurationParameters alloc];
  v14 = objc_msgSend(v7, "suggestedMood");
  v15 = a1[4];
  objc_msgSend(v7, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGFlexMusicCurationParameters initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:](v13, "initWithMood:moodKeywords:recentlyUsedSongs:entityUUID:useMoodKeywords:features:musicCuratorContext:", v14, v12, v15, v16, 0, v8, a1[5]);

  v18 = a1[6];
  v19 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v19 + 40);
  +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:progressReporter:error:](PGFlexMusicCurator, "curateFlexMusicWithCurationParameters:progressReporter:error:", v17, v18, &obj);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v19 + 40), obj);
  if (v20)
  {
    objc_msgSend((id)a1[4], "addFlexMusicCuration:date:", v20, a1[7]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "setObject:forKeyedSubscript:", v20, v7);
  }
  else
  {
    v21 = *(_QWORD *)(a1[9] + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = 0;

    *a4 = 1;
  }

}

void __122__PGUpNextMusicCurator__appleMusicCurationWithFeaturesByMemory_musicCuratorContext_managerContext_progressReporter_error___block_invoke(uint64_t *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id obj;

  v7 = a2;
  v8 = a1[4];
  v9 = a1[5];
  v10 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v10 + 40);
  +[PGMusicCurator curateMusicForFeatures:context:progressReporter:error:](PGMusicCurator, "curateMusicForFeatures:context:progressReporter:error:", a3, v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_msgSend((id)a1[4], "recentlyUsedSongs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addMusicCuration:date:", v11, a1[6]);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setObject:forKeyedSubscript:", v11, v7);
  }
  else
  {
    v13 = *(_QWORD *)(a1[8] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    *a4 = 1;
  }

}

@end
