@implementation PGSemanticalDeduper

- (id)sceneprintByItemIdentifierWithItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA4EB2C](v6);
        objc_msgSend(v10, "clsSceneprint", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v10, "clsIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5
{
  double v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  const __CFString *v44;
  id v45;
  uint64_t v46;
  void *v47;
  int v48;
  uint64_t v49;
  double v50;
  uint64_t i;
  void *v52;
  double v53;
  double v54;
  int v55;
  int v56;
  id v57;
  double Current;
  NSObject *v59;
  char v60;
  int v61;
  double v62;
  char v63;
  void *v64;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id obj;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v88;
  void *context;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t v113;
  double v114;
  double v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  id v121;
  _QWORD v122[4];
  id v123;
  uint64_t *v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  uint64_t v128;
  double *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  char v135;
  uint8_t v136[128];
  uint8_t buf[4];
  _BYTE v138[18];
  __int16 v139;
  const __CFString *v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  v83 = a4;
  v69 = a5;
  v132 = 0;
  v133 = &v132;
  v134 = 0x2020000000;
  v135 = 0;
  v128 = 0;
  v129 = (double *)&v128;
  v130 = 0x2020000000;
  v131 = 0;
  v76 = _Block_copy(v69);
  if (v76
    && (v7 = CFAbsoluteTimeGetCurrent(), v7 - v129[3] >= 0.01)
    && (v129[3] = v7,
        v127 = 0,
        (*((void (**)(void *, char *, double))v76 + 2))(v76, &v127, 0.0),
        v8 = *((_BYTE *)v133 + 24) | v127,
        (*((_BYTE *)v133 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v138 = 54;
      *(_WORD *)&v138[4] = 2080;
      *(_QWORD *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGSemanticalDeduper.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v81 = objc_msgSend(v75, "count");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_36043);
    objc_msgSend(v10, "setMaximumDistance:", 90.0);
    objc_msgSend(v10, "setMinimumNumberOfObjects:", 1);
    v122[0] = MEMORY[0x1E0C809B0];
    v122[1] = 3221225472;
    v122[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_2;
    v122[3] = &unk_1E8434F30;
    v72 = v76;
    v123 = v72;
    v124 = &v128;
    v126 = 0x3F847AE147AE147BLL;
    v125 = &v132;
    v68 = v10;
    objc_msgSend(v10, "performWithDataset:progressBlock:", v75, v122);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v133 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v138 = 68;
        *(_WORD *)&v138[4] = 2080;
        *(_QWORD *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGSemanticalDeduper.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v9 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[PGSemanticalDeduper itemsNeedingSceneprintInTimeClusters:](self, "itemsNeedingSceneprintInTimeClusters:", v71);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSemanticalDeduper sceneprintByItemIdentifierWithItems:](self, "sceneprintByItemIdentifierWithItems:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B260]), "initWithSimilarityModelClass:", objc_opt_class());
      v120[0] = MEMORY[0x1E0C809B0];
      v120[1] = 3221225472;
      v120[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_23;
      v120[3] = &unk_1E842DB80;
      v66 = v11;
      v121 = v66;
      objc_msgSend(v12, "setSceneprintGetterBlock:", v120);
      v79 = v12;
      if (v76
        && (v13 = CFAbsoluteTimeGetCurrent(), v13 - v129[3] >= 0.01)
        && (v129[3] = v13,
            v127 = 0,
            (*((void (**)(id, char *, double))v72 + 2))(v72, &v127, 0.2),
            v14 = *((_BYTE *)v133 + 24) | v127,
            (*((_BYTE *)v133 + 24) = v14) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v138 = 80;
          *(_WORD *)&v138[4] = 2080;
          *(_QWORD *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGSemanticalDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v9 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v15 = objc_msgSend(v71, "count");
        v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        obj = v71;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v143, 16);
        if (v16)
        {
          v17 = 0.8 / (double)v15;
          v74 = *(_QWORD *)v117;
          v18 = 0.2;
          do
          {
            v80 = 0;
            v73 = v16;
            do
            {
              if (*(_QWORD *)v117 != v74)
                objc_enumerationMutation(obj);
              v19 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v80);
              v77 = (void *)MEMORY[0x1CAA4EB2C]();
              objc_msgSend(v19, "objects");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v78, "count");
              if (v20 >= 2)
              {
                v109[0] = MEMORY[0x1E0C809B0];
                v109[1] = 3221225472;
                v109[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_26;
                v109[3] = &unk_1E84311C8;
                v21 = v72;
                v110 = v21;
                v111 = &v128;
                v114 = v18;
                v115 = v17;
                v113 = 0x3F847AE147AE147BLL;
                v112 = &v132;
                objc_msgSend(v79, "stackSimilarItems:withSimilarity:timestampSupport:progressBlock:", v78, 2, 0, v109);
                v22 = objc_claimAutoreleasedReturnValue();
                v23 = (void *)v22;
                if (*((_BYTE *)v133 + 24))
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v138 = 97;
                    *(_WORD *)&v138[4] = 2080;
                    *(_QWORD *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Curation/PGSemanticalDeduper.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  goto LABEL_94;
                }
                if (self->_usesAdaptiveSimilarStacking)
                {
                  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v107 = 0u;
                  v108 = 0u;
                  v105 = 0u;
                  v106 = 0u;
                  v26 = v23;
                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v142, 16);
                  if (!v27)
                    goto LABEL_48;
                  v28 = *(_QWORD *)v106;
LABEL_31:
                  v29 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v106 != v28)
                      objc_enumerationMutation(v26);
                    v30 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v29);
                    v31 = objc_msgSend(v30, "count");
                    if (v31 >= 4 && 3 * v31 > v81)
                    {
                      v98[0] = MEMORY[0x1E0C809B0];
                      v98[1] = 3221225472;
                      v98[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_27;
                      v98[3] = &unk_1E84311C8;
                      v99 = v21;
                      v100 = &v128;
                      v103 = v18;
                      v104 = v17;
                      v102 = 0x3F847AE147AE147BLL;
                      v101 = &v132;
                      objc_msgSend(v79, "adaptiveStackSimilarItems:progressBlock:", v30, v98);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = v33;
                      if (*((_BYTE *)v133 + 24))
                      {
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v138 = 111;
                          *(_WORD *)&v138[4] = 2080;
                          *(_QWORD *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanaly"
                                                "sis/PhotosGraph/Framework/Curation/PGSemanticalDeduper.m";
                          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

LABEL_94:
LABEL_95:
                        v61 = 0;
                        goto LABEL_96;
                      }
                      if (objc_msgSend(v33, "count"))
                      {
                        objc_msgSend(v25, "addObjectsFromArray:", v34);
                        v35 = MEMORY[0x1E0C81028];
                        v36 = MEMORY[0x1E0C81028];
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                        {
                          v37 = objc_msgSend(v34, "count");
                          *(_DWORD *)buf = 134218240;
                          *(_QWORD *)v138 = v31;
                          *(_WORD *)&v138[8] = 2048;
                          *(_QWORD *)&v138[10] = v37;
                          _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "Semantically deduping cluster of %lu items is too lossy, deduping at first split to %lu items", buf, 0x16u);
                        }

                      }
                      else
                      {
                        objc_msgSend(v25, "addObject:", v30);
                      }

                    }
                    else
                    {
                      objc_msgSend(v25, "addObject:", v30);
                    }
                    if (v27 == ++v29)
                    {
                      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v142, 16);
                      if (!v27)
                      {
LABEL_48:

                        goto LABEL_50;
                      }
                      goto LABEL_31;
                    }
                  }
                }
                v25 = (id)v22;
LABEL_50:
                v96 = 0u;
                v97 = 0u;
                v94 = 0u;
                v95 = 0u;
                v84 = v25;
                v38 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v94, v141, 16);
                if (!v38)
                  goto LABEL_83;
                v86 = *(_QWORD *)v95;
                while (2)
                {
                  v39 = 0;
                  v88 = v38;
LABEL_53:
                  if (*(_QWORD *)v95 != v86)
                    objc_enumerationMutation(v84);
                  v40 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v39);
                  context = (void *)MEMORY[0x1CAA4EB2C]();
                  v41 = objc_msgSend(v40, "count");
                  -[PGDeduper requiredItemsInItems:](self, "requiredItemsInItems:", v40);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "count");
                  if (v43)
                  {
                    objc_msgSend(v85, "addObjectsFromArray:", v42);
                    if (v41 > v43)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 134218498;
                        v44 = CFSTR("it is");
                        if (v43 > 1)
                          v44 = CFSTR("they are");
                        *(_QWORD *)v138 = v41;
                        *(_WORD *)&v138[8] = 2048;
                        *(_QWORD *)&v138[10] = v43;
                        v139 = 2112;
                        v140 = v44;
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Semantically deduped %lu items to %lu because %@ required", buf, 0x20u);
                      }
                      objc_msgSend(v83, "dedupItems:toRequiredItems:withDedupingType:", v40, v42, 2);
                    }
LABEL_81:

                    objc_autoreleasePoolPop(context);
                    if (++v39 == v88)
                    {
                      v38 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v94, v141, 16);
                      if (!v38)
                      {
LABEL_83:

                        v24 = v110;
LABEL_84:

                        goto LABEL_85;
                      }
                      continue;
                    }
                    goto LABEL_53;
                  }
                  break;
                }
                if (v41 < 2)
                {
                  objc_msgSend(v40, "firstObject");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47)
LABEL_79:
                    objc_msgSend(v85, "addObject:", v47);
                }
                else
                {
                  v92 = 0u;
                  v93 = 0u;
                  v90 = 0u;
                  v91 = 0u;
                  v45 = v40;
                  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, v136, 16);
                  v82 = v41;
                  v47 = 0;
                  if (v46)
                  {
                    v48 = 0;
                    v49 = *(_QWORD *)v91;
                    v50 = -1.79769313e308;
                    do
                    {
                      for (i = 0; i != v46; ++i)
                      {
                        if (*(_QWORD *)v91 != v49)
                          objc_enumerationMutation(v45);
                        v52 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                        objc_msgSend(v52, "clsContentScore");
                        v54 = v53;
                        v55 = objc_msgSend(v52, "isFavorite");
                        v56 = v55;
                        if (!v47 || v54 > v50 && ((v48 ^ 1 | v55) & 1) != 0)
                        {
                          v57 = v52;

                          v47 = v57;
                          v50 = v54;
                          v48 = v56;
                        }
                      }
                      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v90, v136, 16);
                    }
                    while (v46);
                  }

                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)v138 = v82;
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Semantically deduped %lu assets to 1", buf, 0xCu);
                  }
                  if (v47)
                  {
                    objc_msgSend(v83, "dedupItems:toItem:withDedupingType:", v45, v47, 2);
                    goto LABEL_79;
                  }
                }

                goto LABEL_81;
              }
              if (v20 == 1)
              {
                objc_msgSend(v78, "firstObject");
                v24 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "addObject:", v24);
                goto LABEL_84;
              }
LABEL_85:
              v18 = v17 + v18;
              if (v76)
              {
                Current = CFAbsoluteTimeGetCurrent();
                if (Current - v129[3] >= 0.01)
                {
                  v129[3] = Current;
                  v127 = 0;
                  (*((void (**)(id, char *, double))v72 + 2))(v72, &v127, v18);
                  v59 = MEMORY[0x1E0C81028];
                  v60 = *((_BYTE *)v133 + 24) | v127;
                  *((_BYTE *)v133 + 24) = v60;
                  if (v60)
                  {
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v138 = 197;
                      *(_WORD *)&v138[4] = 2080;
                      *(_QWORD *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Curation/PGSemanticalDeduper.m";
                      _os_log_impl(&dword_1CA237000, v59, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
                    goto LABEL_95;
                  }
                }
              }
              v61 = 1;
LABEL_96:

              objc_autoreleasePoolPop(v77);
              if (!v61)
              {

                goto LABEL_105;
              }
              ++v80;
            }
            while (v80 != v73);
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v143, 16);
          }
          while (v16);
        }

        if (v76
          && (v62 = CFAbsoluteTimeGetCurrent(), v62 - v129[3] >= 0.01)
          && (v129[3] = v62,
              v127 = 0,
              (*((void (**)(id, char *, double))v72 + 2))(v72, &v127, 1.0),
              v63 = *((_BYTE *)v133 + 24) | v127,
              (*((_BYTE *)v133 + 24) = v63) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v138 = 201;
            *(_WORD *)&v138[4] = 2080;
            *(_QWORD *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGSemanticalDeduper.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_105:
          v9 = (id)MEMORY[0x1E0C9AA60];
          v64 = v85;
        }
        else
        {
          v64 = v85;
          v9 = v85;
        }

      }
    }

  }
  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v132, 8);

  return v9;
}

- (id)itemsNeedingSceneprintInTimeClusters:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "objects", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v12, "count") >= 2)
            objc_msgSend(v4, "addObjectsFromArray:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)usesAdaptiveSimilarStacking
{
  return self->_usesAdaptiveSimilarStacking;
}

- (void)setUsesAdaptiveSimilarStacking:(BOOL)a3
{
  self->_usesAdaptiveSimilarStacking = a3;
}

BOOL __60__PGSemanticalDeduper_itemsNeedingSceneprintInTimeClusters___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clsPeopleCount") == 0;
}

void __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
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

id __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "clsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_26(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72) * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_27(uint64_t a1, _BYTE *a2)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

double __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "cls_universalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_universalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = fabs(v7);

  return v8;
}

@end
