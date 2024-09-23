@implementation PGGraphHighlightCollectionEnrichmentProcessor

- (PGGraphHighlightCollectionEnrichmentProcessor)initWithOptions:(id)a3
{
  id v5;
  PGGraphHighlightCollectionEnrichmentProcessor *v6;
  PGGraphHighlightCollectionEnrichmentProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphHighlightCollectionEnrichmentProcessor;
  v6 = -[PGGraphHighlightCollectionEnrichmentProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double Current;
  char v35;
  int v36;
  uint64_t v37;
  uint32_t denom;
  uint32_t numer;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  os_signpost_id_t spid;
  uint64_t v54;
  unint64_t v55;
  id v56;
  id aBlock;
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  _BYTE *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  mach_timebase_info info;
  uint8_t v70[4];
  int v71;
  __int16 v72;
  const char *v73;
  _BYTE buf[24];
  char v75;
  void *v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v56 = a4;
  v10 = a5;
  aBlock = a6;
  objc_msgSend(v9, "enrichmentLoggingConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  v55 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PGGraphHighlightCollectionEnrichmentProcessor", ", buf, 2u);
  }
  spid = v12;

  info = 0;
  mach_timebase_info(&info);
  v54 = mach_absolute_time();
  v15 = objc_msgSend(v10, "updateType");
  v16 = objc_msgSend(v10, "isResumingFullAnalysis");
  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", *MEMORY[0x1E0D72088]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v9, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPredicate:", v20);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSortDescriptors:", v22);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000302, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fetchedObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000303, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fetchedObjects");
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v32 = (void *)v26;
LABEL_12:

    goto LABEL_13;
  }
  if (v15 == 4)
    v27 = 1;
  else
    v27 = v16;
  if (v27 == 1)
  {
    objc_msgSend(v9, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSortDescriptors:", v30);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000302, v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fetchedObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000303, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fetchedObjects");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v15 == 2)
  {
    objc_msgSend(v9, "photoLibrary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 0, 127, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 3, 127, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "unionSet:", v25);
    objc_msgSend(v52, "unionSet:", v50);
    objc_msgSend(v10, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 1, 127, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v43, "mutableCopy");

    if (objc_msgSend(v52, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentHighlightsForHighlights:options:", v52, v19);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "fetchedObjects");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "addObjectsFromArray:", v45);
    }
    objc_msgSend(v51, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 2, 127, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "mutableCopy");

    if (objc_msgSend(v51, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentHighlightsForHighlights:options:", v51, v19);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "fetchedObjects");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "addObjectsFromArray:", v49);
    }
    objc_msgSend(v47, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v32 = 0;
  v24 = 0;
LABEL_13:
  if (!objc_msgSend(v24, "count") && !objc_msgSend(v32, "count"))
    goto LABEL_27;
  v33 = _Block_copy(aBlock);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v75 = 0;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  if (!v33)
    goto LABEL_21;
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v66[3] >= 0.01
    && (v66[3] = Current,
        v64 = 0,
        (*((void (**)(void *, char *, double))v33 + 2))(v33, &v64, 0.0),
        v35 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) | v64,
        (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v35) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v70 = 67109378;
      v71 = 104;
      v72 = 2080;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data"
            " Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v70, 0x12u);
    }
    v36 = 1;
  }
  else
  {
LABEL_21:
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __127__PGGraphHighlightCollectionEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
    v59[3] = &unk_1E8434F30;
    v60 = v33;
    v61 = &v65;
    v62 = buf;
    v63 = 0x3F847AE147AE147BLL;
    -[PGGraphHighlightCollectionEnrichmentProcessor _enrichYearHighlights:monthsHighlights:withManager:curationContext:enrichmentprogressBlock:](self, "_enrichYearHighlights:monthsHighlights:withManager:curationContext:enrichmentprogressBlock:", v32, v24, v9, v56, v59);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v36 = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v70 = 67109378;
        v71 = 110;
        v72 = 2080;
        v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v70, 0x12u);
      }
    }
    else
    {
      v36 = 0;
    }

  }
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(buf, 8);

  if (!v36)
  {
LABEL_27:
    v37 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v40 = v14;
    v41 = v40;
    if (v55 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v41, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphHighlightCollectionEnrichmentProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PGGraphHighlightCollectionEnrichmentProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v37 - v54) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

- (void)_enrichYearHighlights:(id)a3 monthsHighlights:(id)a4 withManager:(id)a5 curationContext:(id)a6 enrichmentprogressBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;
  double v15;
  char v16;
  void *v17;
  PGHighlightItemModelManager *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  double Current;
  char v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  double v29;
  char v30;
  NSObject *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t v35;
  id v36;
  NSObject *v37;
  double v38;
  char v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint32_t numer;
  uint32_t denom;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  double v48;
  char v49;
  NSObject *v50;
  os_signpost_id_t v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  NSDictionary *options;
  NSObject *v56;
  uint32_t v57;
  uint32_t v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  double v62;
  char v63;
  NSObject *v64;
  os_signpost_id_t v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  uint32_t v70;
  uint32_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  double v75;
  char v76;
  NSObject *v77;
  os_signpost_id_t v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  uint32_t v83;
  uint32_t v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  double v88;
  char v89;
  NSObject *v90;
  os_signpost_id_t v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  uint64_t v95;
  NSObject *v96;
  NSObject *v97;
  dispatch_time_t v98;
  double v99;
  char v100;
  uint64_t v101;
  uint32_t v102;
  uint32_t v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  double v107;
  char v108;
  NSObject *v109;
  id v110;
  os_signpost_id_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  void (**v118)(_QWORD, _QWORD, double);
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  id v122;
  id v123;
  id v124;
  os_signpost_id_t spid;
  NSObject *spida;
  NSObject *v127;
  void *v128;
  PGHighlightItemEnrichment *v129;
  void *v130;
  PGHighlightItemEnrichment *v131;
  id v132;
  id v133;
  PGYearEnrichmentRule *v134;
  PGMonthEnrichmentRule *v135;
  void *v136;
  id v137;
  char v138;
  _QWORD v139[4];
  NSObject *v140;
  NSObject *v141;
  _QWORD v142[4];
  id v143;
  PGHighlightItemModelManager *v144;
  id v145;
  id v146;
  mach_timebase_info v147;
  _QWORD v148[4];
  id v149;
  uint64_t *v150;
  uint64_t *v151;
  uint64_t v152;
  mach_timebase_info v153;
  _QWORD v154[4];
  id v155;
  uint64_t *v156;
  uint64_t *v157;
  uint64_t v158;
  mach_timebase_info v159;
  _QWORD v160[4];
  id v161;
  uint64_t *v162;
  uint64_t *v163;
  uint64_t v164;
  mach_timebase_info v165;
  _QWORD v166[4];
  id v167;
  uint64_t *v168;
  uint64_t *v169;
  uint64_t v170;
  _QWORD v171[4];
  id v172;
  uint64_t *v173;
  uint64_t *v174;
  uint64_t v175;
  mach_timebase_info info;
  _QWORD v177[4];
  id v178;
  uint64_t *v179;
  uint64_t *v180;
  uint64_t v181;
  _QWORD v182[4];
  id v183;
  uint64_t *v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t v187;
  double *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  char v194;
  int buf;
  _QWORD v196[5];

  *(_QWORD *)((char *)&v196[2] + 4) = *MEMORY[0x1E0C80C00];
  v137 = a3;
  v133 = a4;
  v12 = a5;
  v132 = a6;
  v13 = a7;
  v14 = _Block_copy(v13);
  v192 = &v191;
  v193 = 0x2020000000;
  v194 = 0;
  v187 = 0;
  v188 = (double *)&v187;
  v189 = 0x2020000000;
  v190 = 0;
  v191 = 0;
  if (!v14
    || (v15 = CFAbsoluteTimeGetCurrent(), v15 - v188[3] < 0.01)
    || (v188[3] = v15,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v14 + 2))(v14, &info, 0.0),
        v16 = *((_BYTE *)v192 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v192 + 24) = v16) == 0))
  {
    objc_msgSend(v12, "photoLibrary");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enrichmentLoggingConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PGHighlightItemModelManager initWithLibrary:]([PGHighlightItemModelManager alloc], "initWithLibrary:", v136);
    v135 = -[PGMonthEnrichmentRule initWithModelReader:loggingConnection:]([PGMonthEnrichmentRule alloc], "initWithModelReader:loggingConnection:", v18, v17);
    v134 = -[PGYearEnrichmentRule initWithModelReader:loggingConnection:]([PGYearEnrichmentRule alloc], "initWithModelReader:loggingConnection:", v18, v17);
    v131 = -[PGHighlightItemEnrichment initWithRule:modelWriter:]([PGHighlightItemEnrichment alloc], "initWithRule:modelWriter:", v135, v18);
    v129 = -[PGHighlightItemEnrichment initWithRule:modelWriter:]([PGHighlightItemEnrichment alloc], "initWithRule:modelWriter:", v134, v18);
    v19 = v17;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v137, "count");
      buf = 134217984;
      v196[0] = v20;
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "Extracting existing clusters from (%ld) backing year", (uint8_t *)&buf, 0xCu);
    }

    v182[0] = MEMORY[0x1E0C809B0];
    v182[1] = 3221225472;
    v182[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke;
    v182[3] = &unk_1E8434F30;
    v21 = v14;
    v183 = v21;
    v184 = &v187;
    v185 = &v191;
    v186 = 0x3F847AE147AE147BLL;
    +[PGHighlightItemRestorer restoreExistingHighlightItemListsFromBackingHighlightItems:usingModelReader:progressBlock:](PGHighlightItemRestorer, "restoreExistingHighlightItemListsFromBackingHighlightItems:usingModelReader:progressBlock:", v137, v18, v182);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v192 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_131:

        goto LABEL_132;
      }
      buf = 67109378;
      LODWORD(v196[0]) = 137;
      WORD2(v196[0]) = 2080;
      *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v22 = MEMORY[0x1E0C81028];
LABEL_11:
      _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_131;
    }
    if (v14)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v188[3] >= 0.01)
      {
        v188[3] = Current;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v21 + 2))(v21, &info, 0.1);
        v24 = *((_BYTE *)v192 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v192 + 24) = v24;
        if (v24)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_131;
          buf = 67109378;
          LODWORD(v196[0]) = 139;
          WORD2(v196[0]) = 2080;
          *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v22 = MEMORY[0x1E0C81028];
          goto LABEL_11;
        }
      }
    }
    v25 = v19;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v133, "count");
      buf = 134217984;
      v196[0] = v26;
      _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "Extracting existing clusters from (%ld) backing months", (uint8_t *)&buf, 0xCu);
    }

    v177[0] = MEMORY[0x1E0C809B0];
    v177[1] = 3221225472;
    v177[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_154;
    v177[3] = &unk_1E8434F30;
    v27 = v21;
    v178 = v27;
    v179 = &v187;
    v180 = &v191;
    v181 = 0x3F847AE147AE147BLL;
    +[PGHighlightItemRestorer restoreExistingHighlightItemListsFromBackingHighlightItems:usingModelReader:progressBlock:](PGHighlightItemRestorer, "restoreExistingHighlightItemListsFromBackingHighlightItems:usingModelReader:progressBlock:", v133, v18, v177);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v192 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_130:

        goto LABEL_131;
      }
      buf = 67109378;
      LODWORD(v196[0]) = 146;
      WORD2(v196[0]) = 2080;
      *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v28 = MEMORY[0x1E0C81028];
LABEL_22:
      _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_130;
    }
    if (v14)
    {
      v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v188[3] >= 0.01)
      {
        v188[3] = v29;
        LOBYTE(info.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v27 + 2))(v27, &info, 0.2);
        v30 = *((_BYTE *)v192 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v192 + 24) = v30;
        if (v30)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_130;
          buf = 67109378;
          LODWORD(v196[0]) = 148;
          WORD2(v196[0]) = 2080;
          *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v28 = MEMORY[0x1E0C81028];
          goto LABEL_22;
        }
      }
    }
    v31 = v25;
    v32 = os_signpost_id_generate(v31);
    v33 = v31;
    v34 = v33;
    spid = v32;
    v35 = v32 - 1;
    if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v34, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MonthEventsSelection", ", (uint8_t *)&buf, 2u);
    }
    v127 = v34;

    info = 0;
    mach_timebase_info(&info);
    v121 = mach_absolute_time();
    v171[0] = MEMORY[0x1E0C809B0];
    v171[1] = 3221225472;
    v171[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_155;
    v171[3] = &unk_1E8434F30;
    v36 = v27;
    v172 = v36;
    v173 = &v187;
    v174 = &v191;
    v175 = 0x3F847AE147AE147BLL;
    -[PGHighlightItemEnrichment updateVisibilityStateForHighlightItemLists:withManager:progressBlock:](v131, "updateVisibilityStateForHighlightItemLists:withManager:progressBlock:", v128, v12, v171);
    if (*((_BYTE *)v192 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_129:

        goto LABEL_130;
      }
      buf = 67109378;
      LODWORD(v196[0]) = 156;
      WORD2(v196[0]) = 2080;
      *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v37 = MEMORY[0x1E0C81028];
LABEL_34:
      _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_129;
    }
    if (v14)
    {
      v38 = CFAbsoluteTimeGetCurrent();
      if (v38 - v188[3] >= 0.01)
      {
        v188[3] = v38;
        LOBYTE(v165.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v36 + 2))(v36, &v165, 0.3);
        v39 = *((_BYTE *)v192 + 24) | LOBYTE(v165.numer);
        *((_BYTE *)v192 + 24) = v39;
        if (v39)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_129;
          buf = 67109378;
          LODWORD(v196[0]) = 158;
          WORD2(v196[0]) = 2080;
          *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v37 = MEMORY[0x1E0C81028];
          goto LABEL_34;
        }
      }
    }
    v166[0] = MEMORY[0x1E0C809B0];
    v166[1] = 3221225472;
    v166[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_156;
    v166[3] = &unk_1E8434F30;
    v40 = v36;
    v167 = v40;
    v168 = &v187;
    v169 = &v191;
    v170 = 0x3F847AE147AE147BLL;
    -[PGHighlightItemEnrichment updateVisibilityStateForHighlightItemLists:withManager:progressBlock:](v129, "updateVisibilityStateForHighlightItemLists:withManager:progressBlock:", v130, v12, v166);
    if (*((_BYTE *)v192 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_128:

        goto LABEL_129;
      }
      buf = 67109378;
      LODWORD(v196[0]) = 163;
      WORD2(v196[0]) = 2080;
      *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v41 = MEMORY[0x1E0C81028];
LABEL_43:
      _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_128;
    }
    v118 = (void (**)(_QWORD, _QWORD, double))v40;
    v42 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v45 = v127;
    v46 = v45;
    if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v46, OS_SIGNPOST_INTERVAL_END, spid, "MonthEventsSelection", ", (uint8_t *)&buf, 2u);
    }

    v47 = v46;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      buf = 136315394;
      v196[0] = "MonthEventsSelection";
      LOWORD(v196[1]) = 2048;
      *(double *)((char *)&v196[1] + 2) = (float)((float)((float)((float)(v42 - v121) * (float)numer) / (float)denom)
                                                / 1000000.0);
      _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
    }

    if (v14)
    {
      v48 = CFAbsoluteTimeGetCurrent();
      if (v48 - v188[3] >= 0.01)
      {
        v188[3] = v48;
        LOBYTE(v165.numer) = 0;
        ((void (**)(_QWORD, mach_timebase_info *, double))v118)[2](v118, &v165, 0.4);
        v49 = *((_BYTE *)v192 + 24) | LOBYTE(v165.numer);
        *((_BYTE *)v192 + 24) = v49;
        if (v49)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_128;
          buf = 67109378;
          LODWORD(v196[0]) = 167;
          WORD2(v196[0]) = 2080;
          *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v41 = MEMORY[0x1E0C81028];
          goto LABEL_43;
        }
      }
    }
    v50 = v47;
    v51 = os_signpost_id_generate(v50);
    v52 = v50;
    v53 = v52;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "MonthAndYearContextualKeyAssetsComputation", ", (uint8_t *)&buf, 2u);
    }
    spida = v53;

    v165 = 0;
    mach_timebase_info(&v165);
    v54 = mach_absolute_time();
    options = self->_options;
    v160[0] = MEMORY[0x1E0C809B0];
    v160[1] = 3221225472;
    v160[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_158;
    v160[3] = &unk_1E8434F30;
    v122 = v118;
    v161 = v122;
    v162 = &v187;
    v163 = &v191;
    v164 = 0x3F847AE147AE147BLL;
    -[PGHighlightItemEnrichment contextualKeyAssetForYearHighlightItemLists:withManager:curationContext:options:progressBlock:](v129, "contextualKeyAssetForYearHighlightItemLists:withManager:curationContext:options:progressBlock:", v130, v12, v132, options, v160);
    if (*((_BYTE *)v192 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_127:

        goto LABEL_128;
      }
      buf = 67109378;
      LODWORD(v196[0]) = 175;
      WORD2(v196[0]) = 2080;
      *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v56 = MEMORY[0x1E0C81028];
LABEL_60:
      _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_127;
    }
    v119 = mach_absolute_time();
    v58 = v165.numer;
    v57 = v165.denom;
    v59 = spida;
    v60 = v59;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v60, OS_SIGNPOST_INTERVAL_END, v51, "MonthAndYearContextualKeyAssetsComputation", ", (uint8_t *)&buf, 2u);
    }

    v61 = v60;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      buf = 136315394;
      v196[0] = "MonthAndYearContextualKeyAssetsComputation";
      LOWORD(v196[1]) = 2048;
      *(double *)((char *)&v196[1] + 2) = (float)((float)((float)((float)(v119 - v54) * (float)v58) / (float)v57)
                                                / 1000000.0);
      _os_log_impl(&dword_1CA237000, v61, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
    }

    if (v14)
    {
      v62 = CFAbsoluteTimeGetCurrent();
      if (v62 - v188[3] >= 0.01)
      {
        v188[3] = v62;
        LOBYTE(v159.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v122 + 2))(v122, &v159, 0.6);
        v63 = *((_BYTE *)v192 + 24) | LOBYTE(v159.numer);
        *((_BYTE *)v192 + 24) = v63;
        if (v63)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_127;
          buf = 67109378;
          LODWORD(v196[0]) = 179;
          WORD2(v196[0]) = 2080;
          *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v56 = MEMORY[0x1E0C81028];
          goto LABEL_60;
        }
      }
    }
    v64 = v61;
    v65 = os_signpost_id_generate(v64);
    v66 = v64;
    v67 = v66;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "MonthsEnrichment", ", (uint8_t *)&buf, 2u);
    }
    v120 = v67;

    v159 = 0;
    mach_timebase_info(&v159);
    v68 = mach_absolute_time();
    v154[0] = MEMORY[0x1E0C809B0];
    v154[1] = 3221225472;
    v154[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_160;
    v154[3] = &unk_1E8434F30;
    v123 = v122;
    v155 = v123;
    v156 = &v187;
    v157 = &v191;
    v158 = 0x3F847AE147AE147BLL;
    -[PGHighlightItemEnrichment enrichHighlightItemLists:progressBlock:](v131, "enrichHighlightItemLists:progressBlock:", v128, v154);
    if (*((_BYTE *)v192 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_126:

        goto LABEL_127;
      }
      buf = 67109378;
      LODWORD(v196[0]) = 187;
      WORD2(v196[0]) = 2080;
      *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
      v69 = MEMORY[0x1E0C81028];
LABEL_77:
      _os_log_impl(&dword_1CA237000, v69, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      goto LABEL_126;
    }
    v116 = mach_absolute_time();
    v71 = v159.numer;
    v70 = v159.denom;
    v72 = v67;
    v73 = v72;
    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v73, OS_SIGNPOST_INTERVAL_END, v65, "MonthsEnrichment", ", (uint8_t *)&buf, 2u);
    }

    v74 = v73;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      buf = 136315394;
      v196[0] = "MonthsEnrichment";
      LOWORD(v196[1]) = 2048;
      *(double *)((char *)&v196[1] + 2) = (float)((float)((float)((float)(v116 - v68) * (float)v71) / (float)v70)
                                                / 1000000.0);
      _os_log_impl(&dword_1CA237000, v74, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
    }

    +[PGHighlightItemList updateParentHighlightItemLists:withChildHighlightItems:](PGHighlightItemList, "updateParentHighlightItemLists:withChildHighlightItems:", v130, v128);
    if (v14)
    {
      v75 = CFAbsoluteTimeGetCurrent();
      if (v75 - v188[3] >= 0.01)
      {
        v188[3] = v75;
        LOBYTE(v153.numer) = 0;
        (*((void (**)(id, mach_timebase_info *, double))v123 + 2))(v123, &v153, 0.7);
        v76 = *((_BYTE *)v192 + 24) | LOBYTE(v153.numer);
        *((_BYTE *)v192 + 24) = v76;
        if (v76)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_126;
          buf = 67109378;
          LODWORD(v196[0]) = 194;
          WORD2(v196[0]) = 2080;
          *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnri"
                                          "chmentProcessor.m";
          v69 = MEMORY[0x1E0C81028];
          goto LABEL_77;
        }
      }
    }
    v77 = v74;
    v78 = os_signpost_id_generate(v77);
    v79 = v77;
    v80 = v79;
    if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v80, OS_SIGNPOST_INTERVAL_BEGIN, v78, "YearsEnrichment", ", (uint8_t *)&buf, 2u);
    }
    v117 = v80;

    v153 = 0;
    mach_timebase_info(&v153);
    v81 = mach_absolute_time();
    v148[0] = MEMORY[0x1E0C809B0];
    v148[1] = 3221225472;
    v148[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_163;
    v148[3] = &unk_1E8434F30;
    v124 = v123;
    v149 = v124;
    v150 = &v187;
    v151 = &v191;
    v152 = 0x3F847AE147AE147BLL;
    -[PGHighlightItemEnrichment enrichHighlightItemLists:progressBlock:](v129, "enrichHighlightItemLists:progressBlock:", v130, v148);
    if (*((_BYTE *)v192 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v196[0]) = 202;
        WORD2(v196[0]) = 2080;
        *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
        v82 = MEMORY[0x1E0C81028];
LABEL_94:
        _os_log_impl(&dword_1CA237000, v82, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      v113 = mach_absolute_time();
      v84 = v153.numer;
      v83 = v153.denom;
      v85 = v80;
      v86 = v85;
      if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v86, OS_SIGNPOST_INTERVAL_END, v78, "YearsEnrichment", ", (uint8_t *)&buf, 2u);
      }

      v87 = v86;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        buf = 136315394;
        v196[0] = "YearsEnrichment";
        LOWORD(v196[1]) = 2048;
        *(double *)((char *)&v196[1] + 2) = (float)((float)((float)((float)(v113 - v81) * (float)v84) / (float)v83)
                                                  / 1000000.0);
        _os_log_impl(&dword_1CA237000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }

      if (!v14
        || (v88 = CFAbsoluteTimeGetCurrent(), v88 - v188[3] < 0.01)
        || (v188[3] = v88,
            LOBYTE(v147.numer) = 0,
            (*((void (**)(id, mach_timebase_info *, double))v124 + 2))(v124, &v147, 0.8),
            v89 = *((_BYTE *)v192 + 24) | LOBYTE(v147.numer),
            (*((_BYTE *)v192 + 24) = v89) == 0))
      {
        v90 = v87;
        v91 = os_signpost_id_generate(v90);
        v92 = v90;
        v93 = v92;
        if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v93, OS_SIGNPOST_INTERVAL_BEGIN, v91, "HighlightCollectionEnrichmentCommit", ", (uint8_t *)&buf, 2u);
        }

        v147 = 0;
        mach_timebase_info(&v147);
        v114 = v91 - 1;
        v111 = v91;
        v112 = mach_absolute_time();
        v94 = dispatch_group_create();
        dispatch_group_enter(v94);
        v95 = MEMORY[0x1E0C809B0];
        v142[0] = MEMORY[0x1E0C809B0];
        v142[1] = 3221225472;
        v142[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_165;
        v142[3] = &unk_1E8434200;
        v143 = v130;
        v144 = v18;
        v145 = v128;
        v146 = v136;
        v139[0] = v95;
        v139[1] = 3221225472;
        v139[2] = __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_2;
        v139[3] = &unk_1E8434228;
        v96 = v93;
        v140 = v96;
        v97 = v94;
        v141 = v97;
        objc_msgSend(v146, "performChanges:completionHandler:", v142, v139);
        while (1)
        {
          v98 = dispatch_time(0, 100000000);
          if (!dispatch_group_wait(v97, v98))
            break;
          if (v14)
          {
            v99 = CFAbsoluteTimeGetCurrent();
            if (v99 - v188[3] >= 0.01)
            {
              v188[3] = v99;
              LOBYTE(buf) = 0;
              (*((void (**)(id, int *, double))v124 + 2))(v124, &buf, 0.9);
              v100 = *((_BYTE *)v192 + 24) | buf;
              *((_BYTE *)v192 + 24) = v100;
              if (v100)
                break;
            }
          }
        }
        v101 = mach_absolute_time();
        v102 = v147.numer;
        v103 = v147.denom;
        v104 = v96;
        v105 = v104;
        if (v114 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v105, OS_SIGNPOST_INTERVAL_END, v111, "HighlightCollectionEnrichmentCommit", ", (uint8_t *)&buf, 2u);
        }
        v115 = v101;

        v106 = v105;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
        {
          buf = 136315394;
          v196[0] = "HighlightCollectionEnrichmentCommit";
          LOWORD(v196[1]) = 2048;
          *(double *)((char *)&v196[1] + 2) = (float)((float)((float)((float)(v115 - v112) * (float)v102) / (float)v103)
                                                    / 1000000.0);
          _os_log_impl(&dword_1CA237000, v106, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
        }

        if (v14)
        {
          v107 = CFAbsoluteTimeGetCurrent();
          if (v107 - v188[3] >= 0.01)
          {
            v188[3] = v107;
            v138 = 0;
            (*((void (**)(id, char *, double))v124 + 2))(v124, &v138, 1.0);
            v108 = *((_BYTE *)v192 + 24) | v138;
            *((_BYTE *)v192 + 24) = v108;
            if (v108)
            {
              v109 = MEMORY[0x1E0C81028];
              v110 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
              {
                buf = 67109378;
                LODWORD(v196[0]) = 271;
                WORD2(v196[0]) = 2080;
                *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanaly"
                                                "sis/PhotosGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCo"
                                                "llectionEnrichmentProcessor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
              }

            }
          }
        }

        goto LABEL_125;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v196[0]) = 206;
        WORD2(v196[0]) = 2080;
        *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
        v82 = MEMORY[0x1E0C81028];
        goto LABEL_94;
      }
    }
LABEL_125:

    goto LABEL_126;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109378;
    LODWORD(v196[0]) = 119;
    WORD2(v196[0]) = 2080;
    *(_QWORD *)((char *)v196 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphHighlightCollectionEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_132:
  _Block_object_dispose(&v187, 8);
  _Block_object_dispose(&v191, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_154(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_155(uint64_t a1, _BYTE *a2, double a3)
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

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_156(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_158(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2 + 0.4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_160(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_163(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_165(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v48 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(a1[5], "consumeHighlightItemList:", v7);
        objc_autoreleasePoolPop(v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v4);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = a1[6];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        v15 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(a1[5], "consumeHighlightItemList:", v14);
        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v11);
  }

  objc_msgSend(a1[5], "highlightUUIDsWithVisibilityStateChange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "highlightUUIDsWithContextualKeyAssetChange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setByAddingObjectsFromSet:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind == %d || kind == %d) && uuid in %@"), 0, 3, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredicate:", v20);

  v35 = v19;
  objc_msgSend(MEMORY[0x1E0CD1708], "fetchHighlightsWithOptions:", v19);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v40;
    v24 = 0x1E0CD1000uLL;
    do
    {
      v25 = 0;
      v37 = v22;
      do
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v25);
        objc_msgSend(*(id *)(v24 + 1808), "changeRequestForPhotosHighlight:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsObject:", v28))
        {
          objc_msgSend(v27, "setVisibilityState:", objc_msgSend(a1[5], "visibilityStateForHighlightItem:sharingFilter:", v26, 0));
          objc_msgSend(v27, "setVisibilityStateShared:", objc_msgSend(a1[5], "visibilityStateForHighlightItem:sharingFilter:", v26, 1));
          objc_msgSend(v27, "setVisibilityStateMixed:", objc_msgSend(a1[5], "visibilityStateForHighlightItem:sharingFilter:", v26, 2));
        }
        if (objc_msgSend(v17, "containsObject:", v28))
        {
          v29 = v23;
          v30 = v17;
          v31 = v16;
          v32 = v24;
          objc_msgSend(a1[5], "contextualKeyAssetForHighlightItem:sharingFilter:", v26, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
            objc_msgSend(v27, "setKeyAssetPrivate:", v33);
          objc_msgSend(a1[5], "contextualKeyAssetForHighlightItem:sharingFilter:", v26, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v27, "setKeyAssetShared:", v34);
            if (v33)
              objc_msgSend(v27, "setMixedSharingCompositionKeyAssetRelationship:", +[PGHighlightEnrichmentUtilities mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:](PGHighlightEnrichmentUtilities, "mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:", v33, v34, 1));
          }

          v24 = v32;
          v16 = v31;
          v17 = v30;
          v23 = v29;
          v22 = v37;
        }

        ++v25;
      }
      while (v22 != v25);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v22);
  }

}

void __140__PGGraphHighlightCollectionEnrichmentProcessor__enrichYearHighlights_monthsHighlights_withManager_curationContext_enrichmentprogressBlock___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Failed to persist years and months enrichments: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __127__PGGraphHighlightCollectionEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end
