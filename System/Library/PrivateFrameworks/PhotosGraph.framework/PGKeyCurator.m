@implementation PGKeyCurator

- (PGKeyCurator)initWithCurationCriteriaFactory:(id)a3
{
  id v5;
  PGKeyCurator *v6;
  uint64_t v7;
  CLSAssetsBeautifier *beautifier;
  uint64_t v9;
  CLSSimilarStacker *similarStacker;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGKeyCurator;
  v6 = -[PGKeyCurator init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B110]), "initWithSimilarityModelClass:", objc_opt_class());
    beautifier = v6->_beautifier;
    v6->_beautifier = (CLSAssetsBeautifier *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B260]), "initWithSimilarityModelClass:", objc_opt_class());
    similarStacker = v6->_similarStacker;
    v6->_similarStacker = (CLSSimilarStacker *)v9;

    objc_storeStrong((id *)&v6->_curationCriteriaFactory, a3);
  }

  return v6;
}

- (id)keyItemWithFeeder:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "allItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGKeyCurator keyItemInItems:options:criteria:debugInfo:progressBlock:](self, "keyItemInItems:options:criteria:debugInfo:progressBlock:", v16, v15, v14, v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)keyItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  double v39;
  id v40;
  id v41;
  void *v42;
  double *v43;
  double v44;
  id v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id obj;
  PGKeyCurator *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 buf;
  double v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!objc_msgSend(v12, "count"))
  {
    v17 = 0;
    goto LABEL_10;
  }
  -[PGKeyCurator _keyItemInItems:options:criteria:debugInfo:progressBlock:](self, "_keyItemInItems:options:criteria:debugInfo:progressBlock:", v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    if ((objc_msgSend(v13, "complete") & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Couldn't find a key item with complete == NO, retrying with complete == YES", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(v15, "resetWithReason:", CFSTR("Couldn't find a key item with complete == NO, retrying with complete == YES"));
      objc_msgSend(v13, "setComplete:", 1);
      -[PGKeyCurator _keyItemInItems:options:criteria:debugInfo:progressBlock:](self, "_keyItemInItems:options:criteria:debugInfo:progressBlock:", v12, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setComplete:", 0);
      if (v17)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v17, "clsIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v18;
          v19 = MEMORY[0x1E0C81028];
          v20 = "Found '%@' as key item with complete == YES";
LABEL_50:
          _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&buf, 0xCu);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    v55 = self;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Couldn't find a key item with complete == YES, try and use the highest content scoring non-utility item, or the if none the highest aesthetic scoring utility item", (uint8_t *)&buf, 2u);
    }
    v52 = v16;
    v53 = v15;
    objc_msgSend(v15, "resetWithReason:", CFSTR("Couldn't find a key item with complete == YES, try and use the highest content scoring non-utility item, or the if none the highest aesthetic scoring utility item"));
    v22 = objc_msgSend(v13, "isForMemories");
    v23 = objc_msgSend(v13, "allowGuestAsset");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v24 = v12;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v25)
    {
      v26 = v25;
      obj = v24;
      v50 = v13;
      v51 = v12;
      v27 = 0;
      v28 = 0;
      v29 = *(_QWORD *)v57;
      v30 = 0.0;
      v31 = 0.0;
      v32 = 0.0;
      v33 = 0.0;
      v34 = 0.0;
      v35 = 0.0;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v57 != v29)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          buf = 0uLL;
          v61 = 0.0;
          objc_msgSend(v37, "clsContentScore", v50, v51);
          *(_QWORD *)&buf = v38;
          if (!v14
            || -[PGKeyCurator item:passesCriteria:score:](v55, "item:passesCriteria:score:", v37, v14, (char *)&buf + 8))
          {
            objc_msgSend(v37, "clsAestheticScore");
            v61 = v39;
            if (objc_msgSend(v37, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v22, v23))
            {
              if (!v27
                || (*((BOOL (**)(double, double, double, double, double, double))ItemScoreIsBetterThanOtherItemScore
                    + 2))(*(double *)&buf, *((double *)&buf + 1), v61, v33, v34, v35))
              {
                v40 = v37;

                v34 = *((double *)&buf + 1);
                v33 = *(double *)&buf;
                v27 = v40;
                v35 = v61;
              }
            }
            else if (!v28
                   || (*((BOOL (**)(double, double, double, double, double, double))ItemScoreIsBetterThanOtherItemScore
                       + 2))(*(double *)&buf, *((double *)&buf + 1), v61, v30, v31, v32))
            {
              v41 = v37;

              v31 = *((double *)&buf + 1);
              v30 = *(double *)&buf;
              v28 = v41;
              v32 = v61;
            }
          }
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v26);
      v42 = obj;

      v43 = (double *)MEMORY[0x1E0D77DF0];
      v17 = v28;
      if (v28)
      {
        v44 = *MEMORY[0x1E0D77DF0];
        if (v30 != *MEMORY[0x1E0D77DF0] || v33 <= v44)
        {
          v33 = v30;
          v13 = v50;
          v12 = v51;
          goto LABEL_38;
        }
      }
      v46 = v27;

      v13 = v50;
      v12 = v51;
      if (v46)
      {
        v44 = *v43;
        v17 = v46;
LABEL_38:
        v15 = v53;
        if (v33 <= v44)
        {
          objc_msgSend(v53, "chooseItem:inItems:withReason:", v17, obj, CFSTR("Key utility item"));
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "clsIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v47;
            v48 = MEMORY[0x1E0C81028];
            v49 = "Found utility item '%@' for key item";
            goto LABEL_53;
          }
        }
        else
        {
          objc_msgSend(v53, "chooseItem:inItems:withReason:", v17, obj, CFSTR("Key non-utility item"));
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "clsIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v47;
            v48 = MEMORY[0x1E0C81028];
            v49 = "Found non-utility item '%@' for key item";
LABEL_53:
            _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, v49, (uint8_t *)&buf, 0xCu);

          }
        }

        v16 = v52;
        goto LABEL_10;
      }
    }
    else
    {

      v42 = v24;
    }
    v16 = v52;
    v15 = v53;
    if (!v14)
      goto LABEL_57;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Couldn't find a key item with criteria, retrying without criteria", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(v53, "resetWithReason:", CFSTR("Couldn't find a key item with criteria, retrying without criteria"));
    -[PGKeyCurator keyItemInItems:options:criteria:debugInfo:progressBlock:](v55, "keyItemInItems:options:criteria:debugInfo:progressBlock:", v42, v13, 0, v53, v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_57:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Couldn't find anything although we have items, this should never happen", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(v42, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "chooseItem:inItems:withReason:", v17, v42, CFSTR("At least it's an item"));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "clsIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v18;
        v19 = MEMORY[0x1E0C81028];
        v20 = "Found '%@' item for key item";
        goto LABEL_50;
      }
    }
  }
LABEL_10:

  return v17;
}

- (id)keyItemIdentifierWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PGKeyAssetCurationOptions *v17;
  PGKeyAssetCurationOptions *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  v12 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __61__PGKeyCurator_keyItemIdentifierWithItems_options_debugInfo___block_invoke;
  v25[3] = &unk_1E8430348;
  v13 = v12;
  v26 = v13;
  v14 = v8;
  v27 = v14;
  v15 = v11;
  v28 = v15;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v25);

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("useSummarizer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = -[PGKeyAssetCurationOptions initWithDictionaryRepresentation:]([PGKeyAssetCurationOptions alloc], "initWithDictionaryRepresentation:", v14);
  else
    v17 = objc_alloc_init(PGKeyAssetCurationOptions);
  v18 = v17;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B140]), "initWithItems:", v15);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("meaningForCriteria"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[PGCurationCriteriaFactory curationCriteriaWithCollection:meaningLabel:inGraph:client:](self->_curationCriteriaFactory, "curationCriteriaWithCollection:meaningLabel:inGraph:client:", 0, v20, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  -[PGKeyCurator keyItemInItems:options:criteria:debugInfo:progressBlock:](self, "keyItemInItems:options:criteria:debugInfo:progressBlock:", v15, v18, v21, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v19, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "clsIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)bestItemIdentifierWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5 criteria:(id)a6 curationOptions:(id)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v12 = a4;
  v13 = (objc_class *)MEMORY[0x1E0C99DE8];
  v14 = a7;
  v15 = a6;
  v16 = a3;
  v17 = objc_alloc_init(v13);
  v18 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __87__PGKeyCurator_bestItemIdentifierWithItems_options_debugInfo_criteria_curationOptions___block_invoke;
  v26[3] = &unk_1E8430348;
  v19 = v18;
  v27 = v19;
  v20 = v12;
  v28 = v20;
  v21 = v17;
  v29 = v21;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v26);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B140]), "initWithItems:", v21);
  -[PGKeyCurator keyItemInItems:options:criteria:debugInfo:progressBlock:](self, "keyItemInItems:options:criteria:debugInfo:progressBlock:", v21, v14, v15, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend(v22, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v23, "clsIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_keyItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  id v11;
  id v12;
  double Current;
  char v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CLSSimilarStacker *similarStacker;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t m;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  uint64_t v56;
  PGKeyCuratorSubcluster *v57;
  double v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void (**v66)(void *, _BYTE *, double);
  id v67;
  id v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  void *v72;
  void (**v73)(void *, _BYTE *, double);
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t j;
  id obj;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  void (**v93)(void *, _BYTE *, double);
  uint64_t *v94;
  uint64_t *v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  double *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _QWORD v122[2];
  _QWORD v123[3];
  uint8_t v124[128];
  uint8_t buf[8];
  __int16 v126;
  const char *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v11 = a4;
  v12 = a5;
  v75 = a6;
  v65 = a7;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v111 = 0;
  v112 = (double *)&v111;
  v113 = 0x2020000000;
  v114 = 0;
  v66 = (void (**)(void *, _BYTE *, double))_Block_copy(v65);
  if (v66)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v112[3] >= 0.01)
    {
      v112[3] = Current;
      v110 = 0;
      v66[2](v66, &v110, 0.0);
      v14 = *((_BYTE *)v116 + 24) | v110;
      *((_BYTE *)v116 + 24) = v14;
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 284;
          v126 = 2080;
          v127 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curat"
                 "ion/PGKeyCurator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_9;
      }
    }
  }
  v15 = objc_msgSend(v67, "count");
  if (!v15)
  {
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  if (v15 == 1)
  {
    objc_msgSend(v67, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v11, "complete"))
      v18 = 4;
    else
      v18 = 2;
    +[PGCurationManager summaryClusteringForDuration:](PGCurationManager, "summaryClusteringForDuration:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDiffuseDensityClusteringMaximumDistance:", 28800.0);
    objc_msgSend(v19, "setConciseDensityClusteringMaximumDistance:", 2700.0);
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke;
    v105[3] = &unk_1E8434F30;
    v73 = v66;
    v106 = v73;
    v107 = &v111;
    v109 = 0x3F847AE147AE147BLL;
    v108 = &v115;
    v64 = v19;
    objc_msgSend(v19, "densityClustersWithItems:progressBlock:", v67, v105);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = v20;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v124, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v102 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0D716A0], "clusterWithObjects:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v25);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v124, 16);
      }
      while (v22);
    }

    objc_msgSend(v75, "setClusters:withReason:", v21, CFSTR("Summarizer"));
    if (objc_msgSend(v11, "useIconicScore"))
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("iconicScoreBucket"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = v26;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v123[1] = v27;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("keyItem.clsIdentifier"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v123[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 3);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v26;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("keyItem.clsIdentifier"), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v122[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v70 = objc_msgSend(v11, "isForMemories");
    v69 = objc_msgSend(v11, "allowGuestAsset");
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v68 = v21;
    v74 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
    if (v74)
    {
      v76 = 0;
      v71 = *(_QWORD *)v98;
      do
      {
        for (j = 0; j != v74; ++j)
        {
          if (*(_QWORD *)v98 != v71)
            objc_enumerationMutation(v68);
          v29 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
          objc_msgSend(v75, "debugInfoForCluster:", v29);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          similarStacker = self->_similarStacker;
          objc_msgSend(v29, "objects");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 3221225472;
          v92[2] = __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke_2;
          v92[3] = &unk_1E8434F30;
          v93 = v73;
          v94 = &v111;
          v96 = 0x3F847AE147AE147BLL;
          v95 = &v115;
          -[CLSSimilarStacker stackSimilarItems:withSimilarity:timestampSupport:progressBlock:](similarStacker, "stackSimilarItems:withSimilarity:timestampSupport:progressBlock:", v31, 0, 0, v92);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v34 = v32;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v88, v120, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v89;
            do
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v89 != v36)
                  objc_enumerationMutation(v34);
                objc_msgSend(MEMORY[0x1E0D716A0], "clusterWithObjects:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * k));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "addObject:", v38);

              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v88, v120, 16);
            }
            while (v35);
          }

          objc_msgSend(v82, "setClusters:withReason:", v33, CFSTR("Stack Similar"));
          v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v34, "count"));
          v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v34, "count"));
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          v79 = v34;
          v39 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v84, v119, 16);
          if (v39)
          {
            v40 = *(_QWORD *)v85;
            v41 = 0.0;
            do
            {
              for (m = 0; m != v39; ++m)
              {
                if (*(_QWORD *)v85 != v40)
                  objc_enumerationMutation(v79);
                v43 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * m);
                -[PGKeyCurator bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:](self, "bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:", v43, v11, v12, objc_msgSend(v11, "useIconicScore"), 0.0);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (v44)
                {
                  *(double *)buf = 0.0;
                  -[PGKeyCurator item:passesCriteria:score:](self, "item:passesCriteria:score:", v44, v12, buf);
                  objc_msgSend(v81, "addObject:", v44);
                  if (v12)
                  {
                    v45 = *(double *)buf;
                    objc_msgSend(v44, "clsContentScore");
                    v47 = (v45 + v46) * 0.5;
                  }
                  else
                  {
                    objc_msgSend(v44, "clsContentScore");
                    v47 = v49;
                  }
                  if (objc_msgSend(v11, "useIconicScore"))
                  {
                    objc_msgSend(v44, "clsIconicScore");
                    v51 = v50;
                    objc_msgSend(v44, "curationModel");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "iconicScoreModel");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v53, "minimumMeaningfulIconicScore");
                    if (v51 < v54)
                      v55 = 0.0;
                    else
                      v55 = v51;
                    v56 = objc_msgSend(v53, "bucketForIconicScore:", v55);

                  }
                  else
                  {
                    v56 = 0;
                  }
                  v57 = -[PGKeyCuratorSubcluster initWithItems:keyItem:score:iconicScoreBucket:]([PGKeyCuratorSubcluster alloc], "initWithItems:keyItem:score:iconicScoreBucket:", v43, v44, v56, v47);
                  objc_msgSend(v80, "addObject:", v57);
                  v58 = *(double *)buf;
                  objc_msgSend(v82, "dedupItems:toItem:withDedupingType:", v43, v44, 1);
                  if (!v12)
                    v58 = -0.0;

                  v41 = v41 + v58;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v43);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "setState:ofItems:withReason:", 2, v48, CFSTR("No key item"));

                }
              }
              v39 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v84, v119, 16);
            }
            while (v39);
          }
          else
          {
            v41 = 0.0;
          }

          v59 = objc_msgSend(v81, "count");
          if (v59)
            v41 = v41 / (double)v59;
          -[PGKeyCurator bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:](self, "bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:", v81, v11, v12, objc_msgSend(v11, "useIconicScore"), fmin(v41, 0.5));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setState:ofItem:withReason:", 3, v60, CFSTR("Key item in subcluster"));
          objc_msgSend(v80, "sortUsingDescriptors:", v72);
          -[PGKeyCurator clusterWithSubclusters:keyItem:](self, "clusterWithSubclusters:keyItem:", v80, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v76;
          if (!v76
            || (v62 = v76,
                -[PGKeyCurator cluster:isBetterThanCluster:forMemories:allowGuestAsset:](self, "cluster:isBetterThanCluster:forMemories:allowGuestAsset:", v61, v76, v70, v69)))
          {
            v63 = v61;

            v76 = v63;
          }

        }
        v74 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
      }
      while (v74);
    }
    else
    {
      v76 = 0;
    }

    objc_msgSend(v76, "keyItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v75, "forceState:ofItem:withReason:", 4, v16, CFSTR("Key item in town"));

  }
LABEL_10:
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);

  return v16;
}

- (BOOL)item:(id)a3 passesCriteria:(id)a4 score:(double *)a5
{
  return objc_msgSend(a4, "passesForItem:score:", a3, a5);
}

- (id)clusterWithSubclusters:(id)a3 keyItem:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  PGKeyCuratorCluster *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "score");
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }
  v13 = -[PGKeyCuratorCluster initWithSubclusters:keyItem:score:]([PGKeyCuratorCluster alloc], "initWithSubclusters:keyItem:score:", v5, v6, v10 / (double)(unint64_t)objc_msgSend(v5, "count"));

  return v13;
}

- (BOOL)scoreLevelOfCluster:(id)a3 isAboveScoreLevelOfCluster:(id)a4
{
  BOOL (**v5)(double, double);
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v5 = (BOOL (**)(double, double))ContentScoreLevelIsBetterThanOtherContentScoreLevel;
  v6 = a4;
  objc_msgSend(a3, "keyItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clsContentScore");
  v9 = v8;
  objc_msgSend(v6, "keyItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "clsContentScore");
  LOBYTE(v5) = v5[2](v9, v11);

  return (char)v5;
}

- (BOOL)cluster:(id)a3 scoresBetterThanCluster:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  BOOL v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  char v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "subclusters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v7, "subclusters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 <= v11)
  {
    objc_msgSend(v6, "score");
    v14 = v13;
    objc_msgSend(v7, "score");
    v17 = v14 < v15 || v9 < v11 >> 1;
    if (v9 < (3 * v11) >> 2 || v14 <= v15)
    {
      LOBYTE(v12) = !v17
                 && -[PGKeyCurator scoreLevelOfCluster:isAboveScoreLevelOfCluster:](self, "scoreLevelOfCluster:isAboveScoreLevelOfCluster:", v6, v7);
    }
    else
    {
      objc_msgSend(v6, "keyItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clsContentScore");
      v20 = v19;
      objc_msgSend(v7, "keyItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "clsContentScore");
      LOBYTE(v12) = v20 > v22;
      v23 = v20 > v22 || v17;
      if ((v23 & 1) == 0)
        LOBYTE(v12) = -[PGKeyCurator scoreLevelOfCluster:isAboveScoreLevelOfCluster:](self, "scoreLevelOfCluster:isAboveScoreLevelOfCluster:", v6, v7);

    }
  }
  else
  {
    v12 = !-[PGKeyCurator cluster:scoresBetterThanCluster:](self, "cluster:scoresBetterThanCluster:", v7, v6);
  }

  return v12;
}

- (BOOL)cluster:(id)a3 isBetterThanCluster:(id)a4 forMemories:(BOOL)a5 allowGuestAsset:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  BOOL v16;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "keyItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v7, v6);

  objc_msgSend(v11, "keyItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v7, v6);

  v16 = (v13 & 1) == 0 && v15
     || (v13 ^ 1 | v15) == 1
     && -[PGKeyCurator cluster:scoresBetterThanCluster:](self, "cluster:scoresBetterThanCluster:", v10, v11);

  return v16;
}

- (id)itemsByIconicScoreBucketWithItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "clsIconicScore", (_QWORD)v18);
        v12 = v11;
        objc_msgSend(v10, "curationModel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "iconicScoreModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "bucketForIconicScore:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v15);
        }
        objc_msgSend(v16, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)bestItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 minimumCriteriaScore:(double)a6 useIconicScore:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  id v42;
  void *v44;
  id v45;
  id v46;
  unsigned int v47;
  id obj;
  uint64_t v49;
  void *v50;
  BOOL v51;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v7 = a7;
  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v7)
  {
    v47 = objc_msgSend(v12, "promoteAutoplayableItems");
    if (objc_msgSend(v12, "promoteAutoplayableItems"))
      v14 = objc_msgSend(v12, "avoidPromotingAutoplayableItemsWhenUsingIconicScore") ^ 1;
    else
      v14 = 0;
    v45 = v13;
    objc_msgSend(v12, "setPromoteAutoplayableItems:", v14);
    v46 = v11;
    -[PGKeyCurator itemsByIconicScoreBucketWithItems:](self, "itemsByIconicScoreBucketWithItems:", v11);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "allKeys");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sortedArrayUsingSelector:", sel_compare_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reverseObjectEnumerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v17;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v18)
    {
      v19 = v18;
      v51 = 0;
      v15 = 0;
      v49 = *(_QWORD *)v55;
LABEL_8:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v49)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
        if (!objc_msgSend(v21, "intValue"))
          break;
        objc_msgSend(v50, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        -[PGKeyCurator bestItemInItems:options:criteria:minimumCriteriaScore:triedAndFailedToDoBetter:](self, "bestItemInItems:options:criteria:minimumCriteriaScore:triedAndFailedToDoBetter:", v22, v12, 0, &v53, a6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "curationModel");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "iconicScoreModel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "curationModel");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "iconicScoreModel");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "similarIconicScoreThreshold");
          v30 = v29;
          v31 = objc_msgSend(v26, "version");
          v32 = objc_msgSend(v28, "version");
          objc_msgSend(v15, "clsIconicScore");
          v34 = v33;
          objc_msgSend(v24, "clsIconicScore");
          v36 = v35;
          objc_msgSend(v24, "clsContentScore");
          v38 = v37;
          objc_msgSend(v15, "clsContentScore");
          if (!v15 || v51 && v53 == 0 || v53 == v51 && v31 == v32 && v34 - v36 <= v30 && v38 - v39 >= 0.05)
          {
            v40 = v24;

            v51 = v53 != 0;
            v15 = v40;
          }

        }
        if (v19 == ++v20)
        {
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
          if (v19)
            goto LABEL_8;
          break;
        }
      }
    }
    else
    {
      v51 = 0;
      v15 = 0;
    }

    objc_msgSend(v12, "setPromoteAutoplayableItems:", v47);
    if (v15 && !v51)
    {
      v15 = v15;

      v41 = v15;
      v13 = v45;
      v11 = v46;
      goto LABEL_32;
    }

    v13 = v45;
    v11 = v46;
  }
  else
  {
    v15 = 0;
  }
  v53 = 0;
  -[PGKeyCurator bestItemInItems:options:criteria:minimumCriteriaScore:triedAndFailedToDoBetter:](self, "bestItemInItems:options:criteria:minimumCriteriaScore:triedAndFailedToDoBetter:", v11, v12, v13, &v53, a6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53 && v15)
  {
    v42 = v15;

    v41 = v42;
  }
LABEL_32:

  return v41;
}

- (id)bestItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 minimumCriteriaScore:(double)a6 triedAndFailedToDoBetter:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  double v20;
  _BOOL4 v21;
  BOOL *v22;
  double v23;
  _BOOL4 v24;
  PGKeyCurator *v25;
  int v26;
  unint64_t v27;
  int v28;
  int v29;
  int v30;
  BOOL *v31;
  id v32;
  void *v33;
  id *p_isa;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  BOOL *v41;
  void *v42;
  void *v43;
  int v44;
  double v45;
  double v46;
  double v47;
  char v49;
  char v50;
  int v51;
  int v52;
  int v53;
  void *v54;
  _QWORD v55[4];
  char v56;
  char v57;
  _QWORD v58[4];
  char v59;
  char v60;
  _QWORD v61[4];
  id v62;
  PGKeyCurator *v63;
  double v64;
  char v65;
  double v66[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v54 = v12;
  -[CLSAssetsBeautifier bestItemInItems:](self->_beautifier, "bestItemInItems:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_msgSend(v13, "isForMemories");
    v17 = objc_msgSend(v13, "allowGuestAsset");
    v66[0] = 1.0;
    if (v14)
      v18 = !-[PGKeyCurator item:passesCriteria:score:](self, "item:passesCriteria:score:", v15, v14, v66);
    else
      v18 = 0;
    v53 = objc_msgSend(v15, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v16, v17);
    v19 = objc_msgSend(v13, "wantsGoodSquareCropScore");
    v50 = v16;
    if (v19 && objc_msgSend(v15, "clsPeopleCount"))
    {
      objc_msgSend(v15, "clsSquareCropScore");
      v21 = v20 < *MEMORY[0x1E0D77DF8];
    }
    else
    {
      v21 = 0;
    }
    v51 = objc_msgSend(v13, "promoteAutoplayableItems");
    v49 = v17;
    v22 = a7;
    if (v51)
    {
      objc_msgSend(v15, "clsAutoplaySuggestionScore");
      v24 = v23 <= 0.71;
    }
    else
    {
      v24 = 0;
    }
    v25 = self;
    if (v18)
    {

      v15 = 0;
    }
    if (v66[0] < a6)
      v26 = 1;
    else
      v26 = v18;
    v27 = objc_msgSend(v54, "count", v66[0]);
    v28 = v27 > 1;
    if (v27 < 2)
      v29 = 1;
    else
      v29 = v26;
    v30 = v53;
    if (!(v29 | v53))
      v28 = v24 || v21;
    if (v28 == 1)
    {
      v52 = v26;
      v31 = v22;
      if (v22)
        *v22 = 1;
      v32 = v54;
      v33 = v32;
      p_isa = (id *)&v25->super.isa;
      if (v14 || v19)
      {
        v36 = (void *)MEMORY[0x1E0CB3880];
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke;
        v61[3] = &unk_1E842E118;
        v65 = v19;
        v62 = v14;
        v63 = v25;
        v64 = a6;
        objc_msgSend(v36, "predicateWithBlock:", v61);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "filteredArrayUsingPredicate:", v37);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v53;
      }
      else
      {
        v35 = v32;
      }
      if (v51)
      {
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_2;
        v58[3] = &__block_descriptor_34_e49_B24__0___CLSInvestigationItem__8__NSDictionary_16l;
        v59 = v50;
        v60 = v49;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v58);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "filteredArrayUsingPredicate:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v39, "count"))
        {
          objc_msgSend(p_isa[1], "bestItemInItems:", v39);
          v40 = (id)objc_claimAutoreleasedReturnValue();

          v30 = v53;
          if (v40)
            goto LABEL_41;
        }
        else
        {

          v30 = v53;
        }
      }
      if ((v52 | v30 | v21) == 1)
      {
        v41 = v31;
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_3;
        v55[3] = &__block_descriptor_34_e49_B24__0___CLSInvestigationItem__8__NSDictionary_16l;
        v56 = v50;
        v57 = v49;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v55);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "filteredArrayUsingPredicate:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v43, "count"))
        {
          objc_msgSend(p_isa[1], "bestItemInItems:", v43);
          v40 = (id)objc_claimAutoreleasedReturnValue();

          v31 = v41;
          v30 = v53;
          if (v40)
            goto LABEL_41;
        }
        else
        {

          v31 = v41;
          v30 = v53;
        }
      }
      if ((v52 | v21) != 1)
      {
        v40 = 0;
        goto LABEL_53;
      }
      objc_msgSend(p_isa[1], "bestItemInItems:", v35);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (!v40)
      {
LABEL_53:

        goto LABEL_54;
      }
LABEL_41:
      if (v14 && (objc_msgSend(p_isa, "item:passesCriteria:score:", v40, v14, v66) | v52) != 1)
        goto LABEL_53;
      v44 = v30 | v52 | v21;
      if ((v44 & 1) == 0 && ((v51 ^ 1) & 1) == 0)
      {
        objc_msgSend(v40, "clsContentScore");
        v45 = *MEMORY[0x1E0D77DD8];
        if (v46 < *MEMORY[0x1E0D77DD8])
        {
          objc_msgSend(v15, "clsContentScore");
          if (v47 >= v45)
            goto LABEL_53;
        }
LABEL_50:
        v40 = v40;

        if (v31)
          *v31 = 0;
        v15 = v40;
        goto LABEL_53;
      }
      if (v44)
        goto LABEL_50;
      goto LABEL_53;
    }
  }
LABEL_54:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationCriteriaFactory, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
  objc_storeStrong((id *)&self->_beautifier, 0);
}

BOOL __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  uint64_t v8;
  _BOOL8 v9;
  double v11;

  v5 = a2;
  v6 = a3;
  v11 = 0.0;
  if (*(_BYTE *)(a1 + 56))
  {
    if (objc_msgSend(v5, "clsPeopleCount"))
    {
      objc_msgSend(v5, "clsSquareCropScore");
      if (v7 < *MEMORY[0x1E0D77DF8])
        goto LABEL_7;
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (!v8)
  {
    v9 = 1;
    goto LABEL_9;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "item:passesCriteria:score:", v5, v8, &v11))
LABEL_7:
    v9 = 0;
  else
    v9 = v11 >= *(double *)(a1 + 48);
LABEL_9:

  return v9;
}

BOOL __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  double v5;

  v3 = a2;
  if ((objc_msgSend(v3, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33)) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "clsAutoplaySuggestionScore");
    v4 = v5 > 0.71;
  }

  return v4;
}

uint64_t __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33)) ^ 1;
}

void __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __87__PGKeyCurator_bestItemIdentifierWithItems_options_debugInfo_criteria_curationOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "curationModelForItemInfo:options:", v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PGCuratorInvestigationItem itemWithUUID:itemInfo:curationModel:](PGCuratorInvestigationItem, "itemWithUUID:itemInfo:curationModel:", v8, v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
}

void __61__PGKeyCurator_keyItemIdentifierWithItems_options_debugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "curationModelForItemInfo:options:", v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PGCuratorInvestigationItem itemWithUUID:itemInfo:curationModel:](PGCuratorInvestigationItem, "itemWithUUID:itemInfo:curationModel:", v8, v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
}

@end
