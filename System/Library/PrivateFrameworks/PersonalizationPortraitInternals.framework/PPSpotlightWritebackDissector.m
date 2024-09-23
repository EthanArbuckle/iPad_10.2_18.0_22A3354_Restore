@implementation PPSpotlightWritebackDissector

- (PPSpotlightWritebackDissector)init
{
  void *v3;
  PPSpotlightWritebackDissector *v4;

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPSpotlightWritebackDissector initWithNamedEntityStore:significanceCheckEnabled:](self, "initWithNamedEntityStore:significanceCheckEnabled:", v3, 1);

  return v4;
}

- (PPSpotlightWritebackDissector)initWithNamedEntityStore:(id)a3 significanceCheckEnabled:(BOOL)a4
{
  id v7;
  PPSpotlightWritebackDissector *v8;
  uint64_t v9;
  PPUniversalSearchSpotlightIndexScorer *scorer;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSpotlightWritebackDissector;
  v8 = -[PPSpotlightWritebackDissector init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    scorer = v8->_scorer;
    v8->_scorer = (PPUniversalSearchSpotlightIndexScorer *)v9;

    objc_storeStrong((id *)&v8->_namedEntityStore, a3);
    v8->_significanceCheckEnabled = a4;
  }

  return v8;
}

- (BOOL)consumeContentFromBundleId:(id)a3 extractions:(id)a4 spotlightIdentifier:(id)a5 fileProtectionType:(id)a6 shouldContinueBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  PPEvictingMinPriorityQueue *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  double v58;
  double v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v73;
  uint64_t v74;
  SEL v75;
  PPSpotlightWritebackDissector *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  NSObject *obj;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t (**v87)(void);
  uint64_t v88;
  void *v89;
  _QWORD aBlock[7];
  _QWORD v91[4];
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *v109;
  _BYTE buf[24];
  id v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v87 = (uint64_t (**)(void))a7;
  if (!+[PPSpotlightWritebackDissector bundleIdIsAllowed:](PPSpotlightWritebackDissector, "bundleIdIsAllowed:", v13)|| objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D70E18])&& objc_msgSend(MEMORY[0x1E0D81590], "lockState") == 1)
  {
    v17 = 1;
    goto LABEL_55;
  }
  v75 = a2;
  v76 = self;
  v77 = v16;
  v80 = v15;
  v81 = v13;
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v18, "useRawNEExtractionScores");

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "maxNEExtractions");

  v79 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v82 = (void *)objc_opt_new();
  v22 = -[PPEvictingMinPriorityQueue initWithCapacity:]([PPEvictingMinPriorityQueue alloc], "initWithCapacity:", v20);
  v23 = objc_opt_new();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v78 = v14;
  obj = v14;
  v86 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
  if (!v86)
    goto LABEL_37;
  v84 = *(_QWORD *)v106;
  while (2)
  {
    v24 = 0;
    do
    {
      if (*(_QWORD *)v106 != v84)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v24);
      v26 = (void *)MEMORY[0x1C3BD6630]();
      if ((v87[2]() & 1) == 0)
      {
        pp_default_log_handle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v71, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: deferring while processing Portrait containers.", buf, 2u);
        }

        objc_autoreleasePoolPop(v26);
        v16 = v77;
        goto LABEL_52;
      }
      v88 = v24;
      v89 = v26;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      objc_msgSend(v25, "topics");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v102 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "item");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "topicIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addQidString:", v33);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
        }
        while (v29);
      }

      if (!v85)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v25, "entities");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v93, v112, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v94;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v94 != v44)
                objc_enumerationMutation(v34);
              v46 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
              v47 = (void *)MEMORY[0x1C3BD6630]();
              objc_msgSend(v46, "item");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "name");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v23, "addObject:", v49);

              objc_autoreleasePoolPop(v47);
            }
            v43 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v93, v112, 16);
          }
          while (v43);
        }
LABEL_34:
        v38 = v89;
        goto LABEL_35;
      }
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      objc_msgSend(v25, "entities");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
      if (!v35)
        goto LABEL_34;
      v36 = v35;
      v37 = *(_QWORD *)v98;
      v38 = v89;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v98 != v37)
            objc_enumerationMutation(v34);
          v40 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * k);
          v41 = (void *)MEMORY[0x1C3BD6630]();
          -[PPEvictingMinPriorityQueue addObject:](v22, "addObject:", v40);
          objc_autoreleasePoolPop(v41);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
      }
      while (v36);
LABEL_35:

      objc_autoreleasePoolPop(v38);
      v24 = v88 + 1;
    }
    while (v88 + 1 != v86);
    v86 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
    if (v86)
      continue;
    break;
  }
LABEL_37:

  if ((v85 & 1) == 0)
    -[PPSpotlightWritebackDissector _getNamedEntityPortraitScores:priorityQueue:](v76, "_getNamedEntityPortraitScores:priorityQueue:", v23, v22);
  v50 = v87[2]();
  pp_default_log_handle();
  v51 = objc_claimAutoreleasedReturnValue();
  if ((v50 & 1) != 0)
  {
    v52 = v51;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      -[PPEvictingMinPriorityQueue count](v22, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v74;
      _os_log_debug_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEBUG, "PPSpotlightWritebackDissector: namedEntityPriorityQueue contains %f items", buf, 0xCu);
    }

    -[PPEvictingMinPriorityQueue extractSortedMutableArray](v22, "extractSortedMutableArray");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = MEMORY[0x1E0C809B0];
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke;
    v91[3] = &unk_1E7E1E7C8;
    v55 = v82;
    v92 = v55;
    objc_msgSend(v53, "enumerateObjectsUsingBlock:", v91);

    pp_default_log_handle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = objc_msgSend(v55, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v57;
      _os_log_impl(&dword_1C392E000, v56, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: namedEntityScores contains %tu items", buf, 0xCu);
    }

    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      if ((v87[2]() & 1) != 0)
      {
        -[PPUniversalSearchSpotlightIndexScorer computeSpotlightIndexScoreFromPortraitExtractions:](v76->_scorer, "computeSpotlightIndexScoreFromPortraitExtractions:", v79);
        v59 = v58;
        pp_default_log_handle();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          *(double *)&buf[4] = v59;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v80;
          *(_WORD *)&buf[22] = 2112;
          v111 = v81;
          _os_log_debug_impl(&dword_1C392E000, v60, OS_LOG_TYPE_DEBUG, "PPSpotlightWritebackDissector: spotlightIndexScore of %g for CSSI item %@ from %@", buf, 0x20u);
        }

        v23 = objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPortraitStaticScore:](v23, "setPortraitStaticScore:", v61);

        objc_msgSend(v21, "encodeAsData");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPortraitFeatureVector:](v23, "setPortraitFeatureVector:", v62);

        objc_msgSend(MEMORY[0x1E0D70C88], "featureVectorVersion");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPortraitFeatureVectorVersion:](v23, "setPortraitFeatureVectorVersion:", v63);

        -[NSObject setPortraitNamedEntities:](v23, "setPortraitNamedEntities:", v55);
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v80, 0, v23);
        v17 = 1;
        objc_msgSend(v64, "setIsUpdate:", 1);
        v65 = objc_alloc(MEMORY[0x1E0CA6B38]);
        v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PersonalizationPortrait-harvestQueueWriteback-%@"), v81);
        v16 = v77;
        v67 = (void *)objc_msgSend(v65, "initWithName:protectionClass:bundleIdentifier:", v66, v77, v81);

        v109 = v64;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LODWORD(v111) = 0;
        aBlock[0] = v54;
        aBlock[1] = 3221225472;
        aBlock[2] = __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke_86;
        aBlock[3] = &unk_1E7E14DE8;
        aBlock[5] = buf;
        aBlock[6] = v75;
        aBlock[4] = v76;
        v69 = _Block_copy(aBlock);
        v70 = _Block_copy(v69);

        _Block_object_dispose(buf, 8);
        objc_msgSend(v67, "indexSearchableItems:completionHandler:", v68, v70);

      }
      else
      {
        pp_default_log_handle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: deferring before writing back.", buf, 2u);
        }
        v17 = 0;
        v16 = v77;
      }
      goto LABEL_53;
    }
    v17 = 1;
    v15 = v80;
    v13 = v81;
    v16 = v77;
    v14 = v78;
  }
  else
  {
    v73 = v51;
    v16 = v77;
    obj = v51;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v73, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: deferring after fetching scores.", buf, 2u);
    }
LABEL_52:

    v17 = 0;
LABEL_53:

    v15 = v80;
    v13 = v81;
    v14 = v78;
  }

LABEL_55:
  return v17;
}

- (void)_getNamedEntityPortraitScores:(id)a3 priorityQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  PPSpotlightWritebackDissector *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "storeNewExtractions");

    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scoreThreshold");
    v12 = v11;

    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    +[PPSpotlightWritebackDissector sharedCache](PPSpotlightWritebackDissector, "sharedCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_2;
    v23 = &unk_1E7E14E78;
    v24 = v6;
    v25 = v14;
    v16 = v13;
    LOBYTE(v31) = v9;
    v26 = v16;
    v29 = &__block_literal_global_94;
    v30 = v12;
    v27 = v7;
    v28 = self;
    v17 = v14;
    objc_msgSend(v15, "runWithLockAcquired:", &v20);

    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v16, "count", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
      *(_DWORD *)buf = 134217984;
      v33 = v19;
      _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: %lu named entities to query", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_scorer, 0);
}

void __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  id obj;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v36;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v10;
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v10, "cachingDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceDate:", v13);
          v15 = v14;

          if (v15 > 3600.0)
            objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v8);

        }
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
        if (*(_BYTE *)(a1 + 88))
        {
          pp_default_log_handle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: Storing uncached extraction with score of 0", buf, 2u);
          }

          (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(0.0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);

        }
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v5);
  }

  pp_default_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(*(id *)(a1 + 48), "count");
    *(_DWORD *)buf = 134217984;
    v40 = v19;
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: Querying Portrait for %lu extracted named entities", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setMatchingNames:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "getMinItemWithoutPopping");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "score");
    v23 = v22;

    v24 = *(void **)(*(_QWORD *)(a1 + 64) + 16);
    v34 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_101;
    v28[3] = &unk_1E7E14E50;
    v29 = v3;
    v30 = *(id *)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 80);
    v31 = *(id *)(a1 + 56);
    v33 = v23;
    LOBYTE(v24) = objc_msgSend(v24, "iterRankedNamedEntitiesWithQuery:error:block:", v20, &v34, v28);
    v25 = v34;
    if ((v24 & 1) == 0)
    {
      pp_default_log_handle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = (uint64_t)v25;
        _os_log_error_impl(&dword_1C392E000, v26, OS_LOG_TYPE_ERROR, "PPSpotlightWritebackDissector: Error querying portrait for NEs: %@", buf, 0xCu);
      }

    }
  }

}

void __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_101(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  PPSpotlightWritebackDissectorCacheEntry *v6;
  uint64_t v7;
  PPSpotlightWritebackDissectorCacheEntry *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0x200)
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v6 = [PPSpotlightWritebackDissectorCacheEntry alloc];
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "score");
  v8 = -[PPSpotlightWritebackDissectorCacheEntry initWithCachingDate:score:](v6, "initWithCachingDate:score:", v7);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v5, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v11);

  objc_msgSend(v5, "score");
  if (v12 >= *(double *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 48), "count");
    if (v13 >= (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "capacity"))
    {
      objc_msgSend(v5, "score");
      if (v14 < *(double *)(a1 + 64))
      {
        pp_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 64);
          v17 = 134217984;
          v18 = v16;
          _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: Terminating processing of scored portrait NEs scoring lower than %f", (uint8_t *)&v17, 0xCu);
        }

        *a3 = 1;
      }
    }
  }

}

id __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke(double a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D70BC0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithName:category:language:", v5, 0, CFSTR("unknown"));

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v6, a1);
  return v7;
}

void __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = v3;
  objc_msgSend(v3, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "score");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v13, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v12);

  }
}

void __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke_86(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = (unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 + 1, v5));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PPSpotlightWritebackDissector.m"), 190, CFSTR("This block should not be run more than once"));

    if (!v4)
      goto LABEL_8;
  }
  else if (!v3)
  {
    goto LABEL_8;
  }
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPSpotlightWritebackDissector: Error indexing updated CSSI: %@", (uint8_t *)&v9, 0xCu);
  }

LABEL_8:
}

+ (id)sharedCache
{
  if (sharedCache__pasOnceToken4 != -1)
    dispatch_once(&sharedCache__pasOnceToken4, &__block_literal_global_393);
  return (id)objc_msgSend((id)sharedCache__pasExprOnceResult, "result");
}

+ (BOOL)bundleIdIsAllowed:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D70E28]) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D70E18]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __44__PPSpotlightWritebackDissector_sharedCache__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_65, 10.0);
  v2 = (void *)sharedCache__pasExprOnceResult;
  sharedCache__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __44__PPSpotlightWritebackDissector_sharedCache__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 512);
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  return v2;
}

@end
