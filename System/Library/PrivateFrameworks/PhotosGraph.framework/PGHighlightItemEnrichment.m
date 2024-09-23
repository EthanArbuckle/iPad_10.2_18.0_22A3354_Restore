@implementation PGHighlightItemEnrichment

- (PGHighlightItemEnrichment)initWithRule:(id)a3 modelWriter:(id)a4
{
  id v7;
  id v8;
  PGHighlightItemEnrichment *v9;
  PGHighlightItemEnrichment *v10;
  PGNeighborScoreComputer *v11;
  PGNeighborScoreComputer *neighborScoreComputer;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGHighlightItemEnrichment;
  v9 = -[PGHighlightItemEnrichment init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rule, a3);
    objc_storeStrong((id *)&v10->_modelWriter, a4);
    v11 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v10->_neighborScoreComputer;
    v10->_neighborScoreComputer = v11;

  }
  return v10;
}

- (void)updateVisibilityStateForHighlightItemLists:(id)a3 withManager:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  double Current;
  _QWORD v14[4];
  id v15;
  PGHighlightItemEnrichment *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = _Block_copy(v10);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = (double *)&v21;
    v23 = 0x2020000000;
    v24 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke;
    v14[3] = &unk_1E842A8B8;
    v15 = v8;
    v16 = self;
    v12 = v11;
    v17 = v12;
    v18 = &v21;
    v19 = &v25;
    v20 = 0x3F847AE147AE147BLL;
    objc_msgSend(v9, "performSynchronousConcurrentGraphReadUsingBlock:", v14);
    if (*((_BYTE *)v26 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v30 = 87;
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else if (v12)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v22[3] >= 0.01)
      {
        v22[3] = Current;
        buf[0] = 0;
        (*((void (**)(id, uint8_t *, double))v12 + 2))(v12, buf, 1.0);
        *((_BYTE *)v26 + 24) |= buf[0];
      }
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
}

- (void)contextualKeyAssetForYearHighlightItemLists:(id)a3 withManager:(id)a4 curationContext:(id)a5 options:(id)a6 progressBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  double Current;
  char v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  PGHighlightItemEnrichment *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v12, "count"))
  {
    v17 = _Block_copy(v16);
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v37 = 0;
    v38 = (double *)&v37;
    v39 = 0x2020000000;
    v40 = 0;
    if (v17
      && (v18 = CFAbsoluteTimeGetCurrent(), v18 - v38[3] >= 0.01)
      && (v38[3] = v18,
          v36 = 0,
          (*((void (**)(void *, char *, double))v17 + 2))(v17, &v36, 0.0),
          v19 = *((_BYTE *)v42 + 24) | v36,
          (*((_BYTE *)v42 + 24) = v19) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v46 = 98;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      -[PGHighlightItemEnrichmentRule loggingConnection](self->_rule, "loggingConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke;
      v25[3] = &unk_1E842A8E0;
      v26 = v13;
      v27 = v15;
      v21 = v20;
      v28 = v21;
      v29 = v12;
      v22 = v17;
      v35 = 0x3F847AE147AE147BLL;
      v33 = &v37;
      v34 = &v41;
      v32 = v22;
      v30 = self;
      v31 = v14;
      objc_msgSend(v26, "performSynchronousConcurrentGraphReadUsingBlock:", v25);
      if (v17)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v38[3] >= 0.01)
        {
          v38[3] = Current;
          v36 = 0;
          (*((void (**)(id, char *, double))v22 + 2))(v22, &v36, 1.0);
          v24 = *((_BYTE *)v42 + 24) | v36;
          *((_BYTE *)v42 + 24) = v24;
          if (v24)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v46 = 143;
              v47 = 2080;
              v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

    }
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);

  }
}

- (void)_contextualKeyAssetForYearHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 curationContext:(id)a5 contextualOptions:(id)a6 options:(id)a7 availableContextualRules:(id)a8 progressBlock:(id)a9
{
  uint64_t v13;
  id v15;
  id v16;
  double Current;
  char v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  __int128 v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  char v45;
  __int128 v46;
  id v47;
  os_log_t oslog;
  id v49;
  void *v50;
  id obj;
  void (**v52)(void *, _QWORD *, double);
  id v53;
  id v54;
  id v55;
  char v56;
  _QWORD v57[4];
  void (**v58)(void *, _QWORD *, double);
  uint64_t *p_buf;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  double v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[4];
  _QWORD v85[4];
  uint64_t v86;
  double *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  int v94;
  _QWORD v95[3];
  _BYTE v96[128];
  uint64_t buf;
  __int128 v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;

  v13 = a4;
  v102 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v53 = a5;
  v54 = a6;
  v49 = a7;
  v15 = a8;
  v16 = a9;
  v50 = v15;
  if (objc_msgSend(v15, "count"))
  {
    v47 = v16;
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v86 = 0;
    v87 = (double *)&v86;
    v88 = 0x2020000000;
    v89 = 0;
    v52 = (void (**)(void *, _QWORD *, double))_Block_copy(v16);
    if (v52)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v87[3] >= 0.01)
      {
        v87[3] = Current;
        LOBYTE(v78) = 0;
        v52[2](v52, &v78, 0.0);
        v18 = *((_BYTE *)v91 + 24) | v78;
        *((_BYTE *)v91 + 24) = v18;
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf = 0x9804000202;
            LOWORD(v98) = 2080;
            *(_QWORD *)((char *)&v98 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHigh"
                                            "lightItemEnrichment.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
LABEL_49:
          _Block_object_dispose(&v86, 8);
          _Block_object_dispose(&v90, 8);

          v16 = v47;
          goto LABEL_50;
        }
      }
    }
    buf = 0;
    *(_QWORD *)&v98 = &buf;
    *((_QWORD *)&v98 + 1) = 0x3032000000;
    v99 = __Block_byref_object_copy__19440;
    v100 = __Block_byref_object_dispose__19441;
    v101 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2020000000;
    v85[3] = 0xFFEFFFFFFFFFFFFFLL;
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x2020000000;
    v84[3] = 0xFFEFFFFFFFFFFFFFLL;
    v78 = 0;
    v79 = &v78;
    v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__19440;
    v82 = __Block_byref_object_dispose__19441;
    v83 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__19440;
    v76 = __Block_byref_object_dispose__19441;
    v77 = 0;
    -[PGHighlightItemEnrichment modelWriter](self, "modelWriter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGHighlightItemEnrichmentRule loggingConnection](self->_rule, "loggingConnection");
    oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "count");
    v70 = 0u;
    v71 = 0u;
    v69 = 0u;
    v68 = 0u;
    obj = v15;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v96, 16);
    if (!v21)
    {
LABEL_41:

LABEL_43:
      if (v52)
      {
        v44 = CFAbsoluteTimeGetCurrent();
        if (v44 - v87[3] >= 0.01)
        {
          v87[3] = v44;
          v56 = 0;
          ((void (**)(void *, char *, double))v52)[2](v52, &v56, 1.0);
          v45 = *((_BYTE *)v91 + 24) | v56;
          *((_BYTE *)v91 + 24) = v45;
          if (v45)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v94 = 67109378;
              LODWORD(v95[0]) = 222;
              WORD2(v95[0]) = 2080;
              *(_QWORD *)((char *)v95 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHi"
                                             "ghlightItemEnrichment.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v94, 0x12u);
            }
          }
        }
      }
LABEL_48:

      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(&v78, 8);

      _Block_object_dispose(v84, 8);
      _Block_object_dispose(v85, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_49;
    }
    v23 = 1.0 / (double)v20;
    v24 = *(_QWORD *)v69;
    v25 = 0.0;
    *(_QWORD *)&v22 = 138412546;
    v46 = v22;
LABEL_9:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v69 != v24)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v26);
      v28 = (void *)MEMORY[0x1CAA4EB2C]();
      v25 = v23 + v25;
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __168__PGHighlightItemEnrichment__contextualKeyAssetForYearHighlightItemList_sharingFilter_curationContext_contextualOptions_options_availableContextualRules_progressBlock___block_invoke;
      v57[3] = &unk_1E842A908;
      p_buf = &buf;
      v60 = v85;
      v61 = v84;
      v62 = &v78;
      v63 = &v72;
      v58 = v52;
      v64 = &v86;
      v67 = v25;
      v66 = 0x3F847AE147AE147BLL;
      v65 = &v90;
      objc_msgSend(v27, "enumerateContextualKeyAssetsForYearHighlight:sharingFilter:withOptions:modelReader:curationContext:usingBlock:", v55, v13, v54, v19, v53, v57);
      if (*((_BYTE *)v91 + 24))
      {
        v29 = 1;
        v30 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v94 = 67109378;
          LODWORD(v95[0]) = 184;
          WORD2(v95[0]) = 2080;
          *(_QWORD *)((char *)v95 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
          _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v94, 0x12u);
        }
        v31 = 0;
        goto LABEL_34;
      }
      v32 = *(_QWORD *)(v98 + 40);
      if (v32)
        break;
      v29 = 0;
      v31 = 1;
LABEL_34:

      objc_autoreleasePoolPop(v28);
      if (!v31)
      {

        if ((v29 | 2) != 2)
          goto LABEL_48;
        goto LABEL_43;
      }
      if (v21 == ++v26)
      {
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v96, 16);
        v21 = v43;
        if (v43)
          goto LABEL_9;
        goto LABEL_41;
      }
    }
    objc_msgSend(v19, "setContextualKeyAsset:forHighlightItem:sharingFilter:", v32, v55, v13);
    objc_msgSend(v19, "setContextualKeyAsset:forHighlightItem:sharingFilter:", *(_QWORD *)(v98 + 40), v73[5], v13);
    objc_msgSend(v19, "setContextualKeyAsset:forHighlightItem:sharingFilter:", *(_QWORD *)(v98 + 40), v79[5], v13);
    v33 = objc_msgSend(v19, "visibilityStateForHighlightItem:sharingFilter:", v79[5], v13);
    if (objc_msgSend((id)v79[5], "kind") || (MEMORY[0x1CAA4E418](v33) & 1) != 0)
    {
      if (objc_msgSend((id)v79[5], "kind", v46) != 3)
      {
LABEL_33:
        v31 = 0;
        v29 = 2;
        goto LABEL_34;
      }
      v34 = (void *)MEMORY[0x1CAA4EB2C]();
      +[PGContextualRuleUtils dayHighlightContainingAsset:](PGContextualRuleUtils, "dayHighlightContainingAsset:", *(_QWORD *)(v98 + 40));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_msgSend(v19, "setContextualKeyAsset:forHighlightItem:sharingFilter:", *(_QWORD *)(v98 + 40), v35, v13);
LABEL_32:

        objc_autoreleasePoolPop(v34);
        goto LABEL_33;
      }
      if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        v35 = 0;
        goto LABEL_32;
      }
      v37 = v79[5];
      v38 = *(_QWORD *)(v98 + 40);
      v94 = v46;
      v95[0] = v37;
      LOWORD(v95[1]) = 2112;
      *(_QWORD *)((char *)&v95[1] + 2) = v38;
      v39 = oslog;
      v40 = "Cannot find child highlight of day group %@ containing asset %@";
    }
    else
    {
      if (objc_msgSend((id)v79[5], "type") != 5 && objc_msgSend((id)v79[5], "type") != 6)
      {
        objc_msgSend(v19, "addVisibleHighlight:inMonth:withHighlightFilter:", v79[5], v73[5], v13);
        goto LABEL_33;
      }
      v34 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(MEMORY[0x1E0CD1708], "fetchParentDayGroupHighlightForHighlight:options:", v79[5], 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v19, "setContextualKeyAsset:forHighlightItem:sharingFilter:", *(_QWORD *)(v98 + 40), v35, v13);
        if ((MEMORY[0x1CAA4E418](objc_msgSend(v35, "visibilityState")) & 1) == 0)
          objc_msgSend(v19, "addVisibleHighlight:inMonth:withHighlightFilter:", v35, v73[5], v13);
        goto LABEL_32;
      }
      if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      v41 = v79[5];
      v42 = *(_QWORD *)(v98 + 40);
      v94 = v46;
      v95[0] = v41;
      LOWORD(v95[1]) = 2112;
      *(_QWORD *)((char *)&v95[1] + 2) = v42;
      v39 = oslog;
      v40 = "Cannot find parent day group highlight of %@ containing asset %@";
    }
    _os_log_error_impl(&dword_1CA237000, v39, OS_LOG_TYPE_ERROR, v40, (uint8_t *)&v94, 0x16u);
    goto LABEL_31;
  }
LABEL_50:

}

- (void)enrichHighlightItemLists:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  double v8;
  double Current;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  PGHighlightItemEnrichmentRule *rule;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;
  id obj;
  void (**v37)(void *, _BYTE *, double);
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  uint8_t buf[4];
  _BYTE v44[18];
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0.0;
    v37 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
    if (v37)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current >= 0.01)
      {
        v42 = 0;
        v37[2](v37, &v42, 0.0);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v44 = 232;
            *(_WORD *)&v44[4] = 2080;
            *(_QWORD *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_54:

          goto LABEL_55;
        }
        v8 = Current;
      }
    }
    -[PGHighlightItemEnrichmentRule loggingConnection](self->_rule, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    -[PGHighlightItemEnrichment modelWriter](self, "modelWriter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v10;
      v13 = objc_msgSend(v6, "count");
      rule = self->_rule;
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v44 = v13;
      *(_WORD *)&v44[8] = 2112;
      *(_QWORD *)&v44[10] = rule;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_DEFAULT, "Enriching %ld time unit list using rule %@", buf, 0x16u);

    }
    v15 = objc_msgSend(v6, "count", v7);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v35 = v6;
    obj = v6;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 1.0 / (double)v15;
      v19 = *(_QWORD *)v39;
      v20 = 0.0;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (objc_msgSend(v11, "visibilityStateForHighlightItem:sharingFilter:", v22, 0))
          {
            v23 = (void *)MEMORY[0x1CAA4EB2C]();
            -[PGHighlightItemEnrichmentRule keyAssetForHighlightItemList:sharingFilter:](self->_rule, "keyAssetForHighlightItemList:sharingFilter:", v22, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v22, "setKeyAssetPrivate:", v24);
            }
            else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v44 = v22;
              _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Failed to enrich highlight %@: no private key asset found", buf, 0xCu);
            }
            objc_autoreleasePoolPop(v23);
          }
          else
          {
            v24 = 0;
          }
          if (objc_msgSend(v11, "visibilityStateForHighlightItem:sharingFilter:", v22, 1))
          {
            v25 = (void *)MEMORY[0x1CAA4EB2C]();
            -[PGHighlightItemEnrichmentRule keyAssetForHighlightItemList:sharingFilter:](self->_rule, "keyAssetForHighlightItemList:sharingFilter:", v22, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(v22, "setKeyAssetShared:", v26);
            }
            else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v44 = v22;
              _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Failed to enrich highlight %@: no shared key asset found", buf, 0xCu);
            }
            objc_autoreleasePoolPop(v25);
          }
          else
          {
            v26 = 0;
          }
          if (objc_msgSend(v22, "sharingComposition") == 2)
          {
            if (v24 && v26)
            {
              v27 = +[PGHighlightEnrichmentUtilities mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:](PGHighlightEnrichmentUtilities, "mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:keyAssetShared:shouldCompareHighlight:", v24, v26, 1);
            }
            else if (v24)
            {
              v27 = 1;
            }
            else
            {
              v27 = 2 * (v26 != 0);
            }
          }
          else
          {
            v27 = 0;
          }
          v28 = (void *)MEMORY[0x1CAA4EB2C](objc_msgSend(v22, "setMixedSharingCompositionKeyAssetRelationship:", v27));
          -[PGHighlightItemEnrichmentRule promotionScoreForHighlightItemList:](self->_rule, "promotionScoreForHighlightItemList:", v22);
          v30 = v29;
          objc_msgSend(v22, "setPromotionScore:");
          objc_autoreleasePoolPop(v28);
          v31 = v10;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v33 = objc_msgSend(0, "count");
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)v44 = v22;
            *(_WORD *)&v44[8] = 2112;
            *(_QWORD *)&v44[10] = v24;
            v45 = 2048;
            v46 = v33;
            v47 = 2048;
            v48 = v30;
            _os_log_debug_impl(&dword_1CA237000, v31, OS_LOG_TYPE_DEBUG, "Enriched %@ with:\n\tKey asset: %@\n\tCurated assets count: %lu\n\tPromotion score: %.2f", buf, 0x2Au);
          }

          v20 = v18 + v20;
          if (v37)
          {
            v32 = CFAbsoluteTimeGetCurrent();
            if (v32 - v8 >= 0.01)
            {
              v42 = 0;
              v37[2](v37, &v42, v20);
              if (v42)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v44 = 314;
                  *(_WORD *)&v44[4] = 2080;
                  *(_QWORD *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v7 = v34;
                v6 = v35;
                goto LABEL_53;
              }
              v8 = v32;
            }
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
        if (v17)
          continue;
        break;
      }
    }

    v7 = v34;
    v6 = v35;
    if (v37)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        v42 = 0;
        v37[2](v37, &v42, 1.0);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v44 = 317;
            *(_WORD *)&v44[4] = 2080;
            *(_QWORD *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_53:

    goto LABEL_54;
  }
LABEL_55:

}

- (PGHighlightItemEnrichmentRule)rule
{
  return self->_rule;
}

- (PGHighlightItemListModelWriter)modelWriter
{
  return self->_modelWriter;
}

- (PGNeighborScoreComputer)neighborScoreComputer
{
  return self->_neighborScoreComputer;
}

- (void)setNeighborScoreComputer:(id)a3
{
  objc_storeStrong((id *)&self->_neighborScoreComputer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_modelWriter, 0);
  objc_storeStrong((id *)&self->_rule, 0);
}

void __168__PGHighlightItemEnrichment__contextualKeyAssetForYearHighlightItemList_sharingFilter_curationContext_contextualOptions_options_availableContextualRules_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5, double a6)
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double Current;
  uint64_t v23;
  uint64_t v24;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  objc_msgSend(v13, "promotionScore");
  v16 = v15;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_QWORD *)(v17 + 40))
    goto LABEL_8;
  v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v18 < a6)
    goto LABEL_8;
  if (v18 == a6)
  {
    v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v16 > v19)
    {
LABEL_8:
      objc_storeStrong((id *)(v17 + 40), a2);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a6;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v16;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a4);
      goto LABEL_9;
    }
    if (v16 == v19)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "compare:", v21);

      if (v24 == -1)
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (Current - *(double *)(v23 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v23 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 104));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        *a5 = 1;
    }
  }

}

void __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGContextualOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  PGContextualOptions *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  double Current;
  uint64_t v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  id obj;
  PGContextualOptions *v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  uint64_t v35;
  double v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  uint64_t v40;
  double v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [PGContextualOptions alloc];
  v29 = v3;
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "curationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGContextualOptions initWithGraph:photoLibrary:curationManager:options:loggingConnection:](v4, "initWithGraph:photoLibrary:curationManager:options:loggingConnection:", v5, v6, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v31 = v8;
  -[PGContextualOptions availableContextualRules](v8, "availableContextualRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 56), "count");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = *(id *)(a1 + 56);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 1.0 / (double)v10;
    v14 = *(_QWORD *)v44;
    v15 = 0.0;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v16);
      v15 = v13 + v15;
      if (*(_QWORD *)(a1 + 80))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        if (Current - *(double *)(v19 + 24) >= *(double *)(a1 + 104))
        {
          *(double *)(v19 + 24) = Current;
          v42 = 0;
          (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(v15);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) |= v42;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
            goto LABEL_19;
        }
      }
      v20 = objc_msgSend(v17, "sharingComposition");
      if (!v20)
        break;
      if (v20 == 1)
        goto LABEL_16;
      if (v20 == 2)
      {
        v21 = 1;
        goto LABEL_14;
      }
LABEL_17:
      if (v12 == ++v16)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
    v21 = 0;
LABEL_14:
    v22 = *(void **)(a1 + 64);
    v23 = *(_QWORD *)(a1 + 72);
    v24 = *(_QWORD *)(a1 + 40);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_2;
    v37[3] = &unk_1E8434F58;
    v38 = *(id *)(a1 + 80);
    v40 = *(_QWORD *)(a1 + 104);
    v41 = v15;
    v39 = *(_OWORD *)(a1 + 88);
    objc_msgSend(v22, "_contextualKeyAssetForYearHighlightItemList:sharingFilter:curationContext:contextualOptions:options:availableContextualRules:progressBlock:", v17, 0, v23, v31, v24, v9, v37);
    LODWORD(v22) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);

    if ((_DWORD)v22)
      goto LABEL_19;
    if (v21)
    {
LABEL_16:
      v25 = *(void **)(a1 + 64);
      v26 = *(_QWORD *)(a1 + 72);
      v27 = *(_QWORD *)(a1 + 40);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_3;
      v32[3] = &unk_1E8434F58;
      v33 = *(id *)(a1 + 80);
      v35 = *(_QWORD *)(a1 + 104);
      v36 = v15;
      v34 = *(_OWORD *)(a1 + 88);
      objc_msgSend(v25, "_contextualKeyAssetForYearHighlightItemList:sharingFilter:curationContext:contextualOptions:options:availableContextualRules:progressBlock:", v17, 1, v26, v31, v27, v9, v32);
      v28 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);

      if (v28)
        goto LABEL_19;
      goto LABEL_17;
    }
    goto LABEL_17;
  }
LABEL_19:

}

void __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_3(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double Current;
  uint64_t v13;
  int v14;
  int v15;
  __int16 v16;
  void (**v17)(void *, _QWORD);
  id v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  __int16 v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id location;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  objc_msgSend(v18, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_initWeak(&location, *(id *)(a1 + 40));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    v8 = 0.0;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      v11 = (void *)MEMORY[0x1CAA4EB2C]();
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_10;
      Current = CFAbsoluteTimeGetCurrent();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (Current - *(double *)(v13 + 24) >= *(double *)(a1 + 72)
        && (*(double *)(v13 + 24) = Current,
            v23 = 0,
            (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(v8),
            (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= v23) != 0))
      {
        v14 = 0;
      }
      else
      {
LABEL_10:
        v15 = objc_msgSend(v10, "kind");
        aBlock[0] = MEMORY[0x1E0C809B0];
        v16 = v15 == 2 ? 4 : 2;
        aBlock[1] = 3221225472;
        aBlock[2] = __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_2;
        aBlock[3] = &unk_1E842A890;
        objc_copyWeak(&v21, &location);
        aBlock[4] = v10;
        v20 = v3;
        v22 = v16;
        v17 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
        v17[2](v17, 0);
        v17[2](v17, 1);
        v17[2](v17, 2);

        objc_destroyWeak(&v21);
        v8 = 1.0 / (double)v4 + v8;
        v14 = 1;
      }
      objc_autoreleasePoolPop(v11);
      if (!v14)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_destroyWeak(&location);
}

void __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  __int16 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(WeakRetained, "rule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "neighborScoreComputer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_3;
  v11[3] = &unk_1E842A868;
  v12 = a2;
  v11[4] = WeakRetained;
  v11[5] = &v13;
  objc_msgSend(v5, "enumerateChildVisibilityStateForHighlightItemList:sharingFilter:withGraph:neighborScoreComputer:usingBlock:", v6, a2, v7, v8, v11);

  if (*((_BYTE *)v14 + 24))
    v9 = *(unsigned __int16 *)(a1 + 56);
  else
    v9 = 0;
  objc_msgSend(WeakRetained, "modelWriter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVisibilityState:forHighlightItemList:sharingFilter:", v9, *(_QWORD *)(a1 + 32), a2);

  _Block_object_dispose(&v13, 8);
}

uint64_t __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "modelWriter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisibilityState:forHighlightItem:sharingFilter:", a3, v6, *(unsigned __int16 *)(a1 + 48));

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    result = 1;
  }
  else
  {
    result = MEMORY[0x1CAA4E418](a3);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v8 + 24) = result;
  return result;
}

@end
