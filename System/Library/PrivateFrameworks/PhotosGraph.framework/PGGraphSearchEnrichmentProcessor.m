@implementation PGGraphSearchEnrichmentProcessor

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  PGSearchComputationCache *v21;
  void *v22;
  id v23;
  id v24;
  PGSearchComputationCache *v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  NSObject *v34;
  PGGraphSearchEnrichmentProcessor *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  PGSearchComputationCache *v40;
  id v41;
  id v42;
  _BYTE *v43;
  mach_timebase_info info;
  _BYTE buf[24];
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "enrichmentLoggingConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PGGraphSearchEnrichmentProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v32 = mach_absolute_time();
  v18 = -[PGGraphSearchEnrichmentProcessor _shouldProcessGraphUpdate:](self, "_shouldProcessGraphUpdate:", v12);
  v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Run search processor to donate graph data to Search enrichment", buf, 2u);
    }
    objc_msgSend(v10, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGSearchComputationCache persistentStoreURLWithManager:](PGSearchComputationCache, "persistentStoreURLWithManager:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PGSearchComputationCache initWithPersistentStoreURL:photoLibrary:]([PGSearchComputationCache alloc], "initWithPersistentStoreURL:photoLibrary:", v31, v20);
    if (objc_msgSend(v12, "isResumingFullAnalysis"))
      -[PGSearchComputationCache invalidateCache](v21, "invalidateCache");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v46 = 1;
    objc_msgSend(v10, "curationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
    v33[3] = &unk_1E842DB38;
    v43 = buf;
    v34 = v17;
    v35 = self;
    v36 = v12;
    v23 = v20;
    v37 = v23;
    v24 = v22;
    v38 = v24;
    v39 = v11;
    v25 = v21;
    v40 = v25;
    v42 = v13;
    v41 = v10;
    objc_msgSend(v41, "performSynchronousConcurrentGraphReadUsingBlock:", v33);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      -[PGSearchComputationCache save](v25, "save");

    _Block_object_dispose(buf, 8);
  }
  else if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Should not run search processor since there are no changes needed to donate to Search enrichment", buf, 2u);
  }
  v26 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v29 = v17;
  v30 = v29;
  if (v15 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v30, OS_SIGNPOST_INTERVAL_END, v15, "PGGraphSearchEnrichmentProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "PGGraphSearchEnrichmentProcessor";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v26 - v32) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (BOOL)_shouldProcessGraphUpdate:(id)a3
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  char v7;

  v3 = a3;
  if ((objc_msgSend(v3, "hasHighlightsToInsert") & 1) != 0 || (objc_msgSend(v3, "hasHighlightsToDelete") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasHighlightsToUpdate");
  if ((objc_msgSend(v3, "hasMomentsToInsert") & 1) != 0
    || (objc_msgSend(v3, "hasMomentsToDelete") & 1) != 0
    || ((v4 | objc_msgSend(v3, "hasMomentsToUpdate")) & 1) != 0
    || (objc_msgSend(v3, "hasPersonsToDelete") & 1) != 0
    || (objc_msgSend(v3, "identifiersForMomentRelatedToUpdatedPersons"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v3, "isResumingFullAnalysis");
  }

  return v7;
}

- (void)_processGraphUpdateInventory:(id)a3 onGraph:(id)a4 photoLibrary:(id)a5 curationManager:(id)a6 curationContext:(id)a7 searchComputationCache:(id)a8 progressBlock:(id)a9 loggingConnection:(id)a10 completionBlock:(id)a11
{
  id v16;
  double v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  double Current;
  char v31;
  int v32;
  _BOOL4 v33;
  void *v34;
  id v35;
  void *v36;
  BOOL v37;
  id v38;
  double v39;
  char v40;
  NSObject *v41;
  const char *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  double v55;
  char v56;
  void *v57;
  void *v58;
  PGSearchEntityPersister *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  double v67;
  char v68;
  uint32_t v69;
  double v70;
  char v71;
  void *v72;
  void *v73;
  double v74;
  char v75;
  void *v76;
  uint64_t v77;
  id v78;
  NSObject *v79;
  double v80;
  char v81;
  PGZeroKeywordComputer *v82;
  id v83;
  NSObject *v84;
  double v85;
  char v86;
  double v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  double v96;
  char v97;
  PGSearchMetadataComputer *v98;
  void *v99;
  PGZeroKeywordComputer *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void (**v116)(id, void *, void *);
  id v117;
  id v118;
  id v119;
  void *v120;
  PGSearchKeywordComputer *v121;
  NSObject *oslog;
  PGSearchEntityAccumulator *v123;
  id v124;
  id v125;
  void *v126;
  id v127;
  _QWORD v128[4];
  id v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t v132;
  _QWORD v133[4];
  id v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  _QWORD v138[4];
  id v139;
  uint64_t *v140;
  uint64_t *v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  id v151;
  _QWORD v152[4];
  id v153;
  uint64_t *v154;
  uint64_t *v155;
  uint64_t v156;
  id v157;
  _QWORD v158[4];
  id v159;
  uint64_t *v160;
  uint64_t *v161;
  uint64_t v162;
  _QWORD v163[4];
  id v164;
  uint64_t *v165;
  uint64_t *v166;
  uint64_t v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  char v172;
  uint64_t v173;
  double *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  char v180;
  _QWORD v181[7];
  _QWORD v182[7];
  _QWORD v183[2];
  _QWORD v184[2];
  _BYTE v185[128];
  _BYTE v186[128];
  uint8_t v187[128];
  uint8_t buf[4];
  _BYTE v189[14];
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v125 = a3;
  v127 = a4;
  v119 = a5;
  v117 = a6;
  v118 = a7;
  v124 = a8;
  v16 = a9;
  oslog = a10;
  v115 = v16;
  v116 = (void (**)(id, void *, void *))a11;
  v177 = 0;
  v178 = &v177;
  v179 = 0x2020000000;
  v180 = 0;
  v173 = 0;
  v174 = (double *)&v173;
  v175 = 0x2020000000;
  v176 = 0;
  v126 = _Block_copy(v16);
  if (!v126
    || (v17 = CFAbsoluteTimeGetCurrent(), v17 - v174[3] < 0.01)
    || (v174[3] = v17,
        v172 = 0,
        (*((void (**)(void *, char *, double))v126 + 2))(v126, &v172, 0.0),
        v18 = *((_BYTE *)v178 + 24) | v172,
        (*((_BYTE *)v178 + 24) = v18) == 0))
  {
    +[PGGraphSynonymSupportHelper synonymsByIndexCategoryMaskForGraph:](PGGraphSynonymSupportHelper, "synonymsByIndexCategoryMaskForGraph:", v127);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = -[PGSearchEntityAccumulator initWithSynonymsByCategoryMask:]([PGSearchEntityAccumulator alloc], "initWithSynonymsByCategoryMask:", v120);
    v121 = -[PGSearchKeywordComputer initWithGraph:searchComputationCache:]([PGSearchKeywordComputer alloc], "initWithGraph:searchComputationCache:", v127, v124);
    objc_msgSend(v125, "momentsToProcessForMomentUpdateTypes:includeMomentsToIngest:", 31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v19, "count"));
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v168, v187, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v169;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v169 != v23)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * i), "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v25);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v168, v187, 16);
      }
      while (v22);
    }

    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v20, v127);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "uuids");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v163[0] = MEMORY[0x1E0C809B0];
    v163[1] = 3221225472;
    v163[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke;
    v163[3] = &unk_1E8434F30;
    v28 = v126;
    v164 = v28;
    v165 = &v173;
    v167 = 0x3F847AE147AE147BLL;
    v166 = &v177;
    v113 = (void *)v26;
    -[PGSearchKeywordComputer assetSearchKeywordsByMomentUUIDWithEventUUIDs:ofType:searchEntityAccumulator:progressBlock:](v121, "assetSearchKeywordsByMomentUUIDWithEventUUIDs:ofType:searchEntityAccumulator:progressBlock:", v26, 0, v123, v163);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v178 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_123:

        goto LABEL_124;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v189 = 131;
      *(_WORD *)&v189[4] = 2080;
      *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
      v29 = MEMORY[0x1E0C81028];
LABEL_16:
      _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_123;
    }
    if (v126)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v174[3] >= 0.01)
      {
        v174[3] = Current;
        v172 = 0;
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v172, 0.1);
        v31 = *((_BYTE *)v178 + 24) | v172;
        *((_BYTE *)v178 + 24) = v31;
        if (v31)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_123;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v189 = 133;
          *(_WORD *)&v189[4] = 2080;
          *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v29 = MEMORY[0x1E0C81028];
          goto LABEL_16;
        }
      }
    }
    v32 = _os_feature_enabled_impl();
    v33 = os_log_type_enabled(oslog, OS_LOG_TYPE_INFO);
    if (v32)
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] search entity donation is enabled", buf, 2u);
      }
      v34 = (void *)MEMORY[0x1E0D42A58];
      v158[0] = v27;
      v158[1] = 3221225472;
      v158[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_165;
      v158[3] = &unk_1E8434F30;
      v35 = v28;
      v159 = v35;
      v160 = &v173;
      v162 = 0x3F847AE147AE147BLL;
      v161 = &v177;
      objc_msgSend(v34, "progressReporterWithProgressBlock:", v158);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = 0;
      v37 = -[PGSearchEntityAccumulator accumulatePersonAndPetRelationshipsFromGraph:progressReporter:error:](v123, "accumulatePersonAndPetRelationshipsFromGraph:progressReporter:error:", v127, v36, &v157);
      v38 = v157;
      if (v126
        && (v39 = CFAbsoluteTimeGetCurrent(), v39 - v174[3] >= 0.01)
        && (v174[3] = v39,
            v172 = 0,
            (*((void (**)(id, char *, double))v35 + 2))(v35, &v172, 0.5),
            v40 = *((_BYTE *)v178 + 24) | v172,
            (*((_BYTE *)v178 + 24) = v40) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v189 = 150;
          *(_WORD *)&v189[4] = 2080;
          *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v41 = MEMORY[0x1E0C81028];
          v42 = "Cancelled at line %d in file %s";
LABEL_69:
          v69 = 18;
LABEL_72:
          _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, v42, buf, v69);
        }
      }
      else
      {
        if (v37)
        {
          v57 = (void *)MEMORY[0x1E0D42A58];
          v152[0] = v27;
          v152[1] = 3221225472;
          v152[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_166;
          v152[3] = &unk_1E8434F30;
          v153 = v35;
          v154 = &v173;
          v156 = 0x3F847AE147AE147BLL;
          v155 = &v177;
          objc_msgSend(v57, "progressReporterWithProgressBlock:", v152);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[PGSearchEntityPersister initWithPhotoLibrary:]([PGSearchEntityPersister alloc], "initWithPhotoLibrary:", v119);
          v151 = 0;
          LOBYTE(v57) = -[PGSearchEntityPersister persistSearchEntitiesFromSearchEntityProvider:progressReporter:error:](v59, "persistSearchEntitiesFromSearchEntityProvider:progressReporter:error:", v123, v58, &v151);
          v60 = v151;
          if ((v57 & 1) == 0 && os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v189 = v60;
            _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "[PGGraphSearchEnrichmentProcessor] Error returned by persistSearchEntitiesFromSearchEntityProvider(): (%@)", buf, 0xCu);
          }

        }
        else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v189 = v38;
          _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "[PGGraphSearchEnrichmentProcessor] Error returned by accumulatePersonAndPetRelationshipsFromGraph(): (%@)", buf, 0xCu);
        }
        if (v126
          && (v67 = CFAbsoluteTimeGetCurrent(), v67 - v174[3] >= 0.01)
          && (v174[3] = v67,
              v172 = 0,
              (*((void (**)(id, char *, double))v35 + 2))(v35, &v172, 1.0),
              v68 = *((_BYTE *)v178 + 24) | v172,
              (*((_BYTE *)v178 + 24) = v68) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v189 = 167;
            *(_WORD *)&v189[4] = 2080;
            *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            v41 = MEMORY[0x1E0C81028];
            v42 = "Cancelled at line %d in file %s";
            goto LABEL_69;
          }
        }
        else if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v42 = "[PGGraphSearchEnrichmentProcessor] search entity accumulation and persistence is complete";
          v41 = oslog;
          v69 = 2;
          goto LABEL_72;
        }
      }

      goto LABEL_123;
    }
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] search entity donation is not enabled", buf, 2u);
    }
    v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v125, "uuidsOfHighlightsToDelete");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 0, 127, 1);
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v147, v186, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v148;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v148 != v46)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * j), "uuid");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v48);

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v147, v186, 16);
      }
      while (v45);
    }

    objc_msgSend(v125, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 3, 127, 1);
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v143, v185, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v144;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v144 != v51)
            objc_enumerationMutation(v49);
          v53 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * k);
          if ((MEMORY[0x1CAA4E40C](objc_msgSend(v53, "type")) & 1) != 0)
          {
            objc_msgSend(v53, "uuid");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addObject:", v54);

          }
        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v143, v185, 16);
      }
      while (v50);
    }

    if (v126)
    {
      v55 = CFAbsoluteTimeGetCurrent();
      if (v55 - v174[3] >= 0.01)
      {
        v174[3] = v55;
        v172 = 0;
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v172, 0.2);
        v56 = *((_BYTE *)v178 + 24) | v172;
        *((_BYTE *)v178 + 24) = v56;
        if (v56)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v189 = 197;
            *(_WORD *)&v189[4] = 2080;
            *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_122;
        }
      }
    }
    objc_msgSend(v125, "identifiersForMomentRelatedToUpdatedPersons");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "collectionByFormingUnionWith:", v61);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "highlightNodes");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "concludedTripTypeNodesInGraph:", v127);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "highlightNodes");
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v111, "highlightGroupNodes");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "collectionByIntersecting:", v63);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v111, "collectionByFormingUnionWith:", v109);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "uuids");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "unionSet:", v64);

    v138[0] = MEMORY[0x1E0C809B0];
    v138[1] = 3221225472;
    v138[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_169;
    v138[3] = &unk_1E8434F30;
    v65 = v28;
    v139 = v65;
    v140 = &v173;
    v141 = &v177;
    v142 = 0x3F847AE147AE147BLL;
    -[PGSearchKeywordComputer searchKeywordsByEventWithEventUUIDs:ofType:photoLibrary:progressBlock:](v121, "searchKeywordsByEventWithEventUUIDs:ofType:photoLibrary:progressBlock:", v43, 1, v119, v138);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v178 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_121:

LABEL_122:
        goto LABEL_123;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v189 = 218;
      *(_WORD *)&v189[4] = 2080;
      *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
      v66 = MEMORY[0x1E0C81028];
LABEL_61:
      _os_log_impl(&dword_1CA237000, v66, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_121;
    }
    if (v126)
    {
      v70 = CFAbsoluteTimeGetCurrent();
      if (v70 - v174[3] >= 0.01)
      {
        v174[3] = v70;
        v172 = 0;
        (*((void (**)(id, char *, double))v65 + 2))(v65, &v172, 0.3);
        v71 = *((_BYTE *)v178 + 24) | v172;
        *((_BYTE *)v178 + 24) = v71;
        if (v71)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_121;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v189 = 220;
          *(_WORD *)&v189[4] = 2080;
          *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v66 = MEMORY[0x1E0C81028];
          goto LABEL_61;
        }
      }
    }
    v183[0] = *MEMORY[0x1E0D72B50];
    objc_msgSend(v43, "allObjects");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v184[0] = v72;
    v183[1] = *MEMORY[0x1E0D72B60];
    objc_msgSend(v107, "allObjects");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v184[1] = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v184, v183, 2);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v126)
    {
      v74 = CFAbsoluteTimeGetCurrent();
      if (v74 - v174[3] >= 0.01)
      {
        v174[3] = v74;
        v172 = 0;
        (*((void (**)(id, char *, double))v65 + 2))(v65, &v172, 0.4);
        v75 = *((_BYTE *)v178 + 24) | v172;
        *((_BYTE *)v178 + 24) = v75;
        if (v75)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v189 = 227;
            *(_WORD *)&v189[4] = 2080;
            *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_120;
        }
      }
    }
    objc_msgSend(v113, "allObjects");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v125, "isResumingFullAnalysis");
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_171;
    v133[3] = &unk_1E8434F30;
    v78 = v65;
    v134 = v78;
    v135 = &v173;
    v136 = &v177;
    v137 = 0x3F847AE147AE147BLL;
    -[PGSearchKeywordComputer searchableAssetUUIDsBySocialGroupWithEventUUIDs:ofType:inPhotoLibrary:isFullAnalysis:progressBlock:](v121, "searchableAssetUUIDsBySocialGroupWithEventUUIDs:ofType:inPhotoLibrary:isFullAnalysis:progressBlock:", v76, 0, v119, v77, v133);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v178 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_119:

LABEL_120:
        goto LABEL_121;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v189 = 232;
      *(_WORD *)&v189[4] = 2080;
      *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
      v79 = MEMORY[0x1E0C81028];
LABEL_87:
      _os_log_impl(&dword_1CA237000, v79, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_119;
    }
    if (v126)
    {
      v80 = CFAbsoluteTimeGetCurrent();
      if (v80 - v174[3] >= 0.01)
      {
        v174[3] = v80;
        v172 = 0;
        (*((void (**)(id, char *, double))v78 + 2))(v78, &v172, 0.5);
        v81 = *((_BYTE *)v178 + 24) | v172;
        *((_BYTE *)v178 + 24) = v81;
        if (v81)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_119;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v189 = 234;
          *(_WORD *)&v189[4] = 2080;
          *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
          v79 = MEMORY[0x1E0C81028];
          goto LABEL_87;
        }
      }
    }
    v82 = -[PGZeroKeywordComputer initWithPhotoLibrary:curationManager:searchComputationCache:]([PGZeroKeywordComputer alloc], "initWithPhotoLibrary:curationManager:searchComputationCache:", v119, v117, v124);
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_173;
    v128[3] = &unk_1E8434F30;
    v83 = v78;
    v129 = v83;
    v130 = &v173;
    v131 = &v177;
    v132 = 0x3F847AE147AE147BLL;
    v100 = v82;
    -[PGZeroKeywordComputer zeroKeywordsWithGraph:curationContext:options:progressBlock:](v82, "zeroKeywordsWithGraph:curationContext:options:progressBlock:", v127, v118, MEMORY[0x1E0C9AA70], v128);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v178 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v189 = 240;
        *(_WORD *)&v189[4] = 2080;
        *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
        v84 = MEMORY[0x1E0C81028];
LABEL_96:
        _os_log_impl(&dword_1CA237000, v84, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v126
        || (v85 = CFAbsoluteTimeGetCurrent(), v85 - v174[3] < 0.01)
        || (v174[3] = v85,
            v172 = 0,
            (*((void (**)(id, char *, double))v83 + 2))(v83, &v172, 0.6),
            v86 = *((_BYTE *)v178 + 24) | v172,
            (*((_BYTE *)v178 + 24) = v86) == 0))
      {
        v98 = -[PGSearchMetadataComputer initWithGraph:]([PGSearchMetadataComputer alloc], "initWithGraph:", v127);
        -[PGSearchMetadataComputer searchMetadataWithOptions:](v98, "searchMetadataWithOptions:", MEMORY[0x1E0C9AA70]);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (v126
          && (v87 = CFAbsoluteTimeGetCurrent(), v87 - v174[3] >= 0.01)
          && (v174[3] = v87,
              v172 = 0,
              (*((void (**)(id, char *, double))v83 + 2))(v83, &v172, 0.7),
              v88 = *((_BYTE *)v178 + 24) | v172,
              (*((_BYTE *)v178 + 24) = v88) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v189 = 247;
            *(_WORD *)&v189[4] = 2080;
            *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          v89 = objc_msgSend(v125, "isResumingFullAnalysis");
          v90 = *MEMORY[0x1E0D72B40];
          v181[0] = *MEMORY[0x1E0D72B48];
          v181[1] = v90;
          v182[0] = v106;
          v182[1] = v112;
          v91 = *MEMORY[0x1E0D72B80];
          v181[2] = *MEMORY[0x1E0D72B70];
          v181[3] = v91;
          v182[2] = v102;
          v182[3] = v101;
          v92 = *MEMORY[0x1E0D72B78];
          v181[4] = *MEMORY[0x1E0D72B68];
          v181[5] = v92;
          v182[4] = v99;
          v182[5] = v120;
          v181[6] = *MEMORY[0x1E0D72B58];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v89);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v182[6] = v93;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v182, v181, 7);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          v116[2](v116, v103, v94);
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            v95 = CFSTR("NO");
            if ((_DWORD)v89)
              v95 = CFSTR("YES");
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v189 = v95;
            _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Finished processing, isGraphRebuild: %@", buf, 0xCu);
          }
          if (v126)
          {
            v96 = CFAbsoluteTimeGetCurrent();
            if (v96 - v174[3] >= 0.01)
            {
              v174[3] = v96;
              v172 = 0;
              (*((void (**)(id, char *, double))v83 + 2))(v83, &v172, 1.0);
              v97 = *((_BYTE *)v178 + 24) | v172;
              *((_BYTE *)v178 + 24) = v97;
              if (v97)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v189 = 264;
                  *(_WORD *)&v189[4] = 2080;
                  *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
            }
          }

        }
        goto LABEL_118;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v189 = 242;
        *(_WORD *)&v189[4] = 2080;
        *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
        v84 = MEMORY[0x1E0C81028];
        goto LABEL_96;
      }
    }
LABEL_118:

    goto LABEL_119;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v189 = 112;
    *(_WORD *)&v189[4] = 2080;
    *(_QWORD *)&v189[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphSearchEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_124:
  _Block_object_dispose(&v173, 8);
  _Block_object_dispose(&v177, 8);

}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_165(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.4 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_166(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_169(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_171(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __189__PGGraphSearchEnrichmentProcessor__processGraphUpdateInventory_onGraph_photoLibrary_curationManager_curationContext_searchComputationCache_progressBlock_loggingConnection_completionBlock___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_151;
    v13[3] = &unk_1E842DB10;
    v10 = *(_QWORD *)(a1 + 80);
    v11 = *(_QWORD *)(a1 + 96);
    v14 = *(id *)(a1 + 88);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v8, "_processGraphUpdateInventory:onGraph:photoLibrary:curationManager:curationContext:searchComputationCache:progressBlock:loggingConnection:completionBlock:", v4, v3, v5, v6, v7, v10, v11, v9, v13);

  }
  else
  {
    v12 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA237000, v12, OS_LOG_TYPE_FAULT, "[PGGraphSearchEnrichmentProcessor] Search enrichment will not run because the graph is unavailable", buf, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
  }

}

void __114__PGGraphSearchEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestSearchIndexGraphUpdates:supportingData:withCompletion:", v7, v6, 0);

  v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PGGraphSearchEnrichmentProcessor] Donate the graph data to Search enrichment", v10, 2u);
  }
}

@end
