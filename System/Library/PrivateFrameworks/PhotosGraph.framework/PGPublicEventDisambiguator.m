@implementation PGPublicEventDisambiguator

- (PGPublicEventDisambiguator)initWithSceneTaxonomy:(id)a3
{
  id v5;
  PGPublicEventDisambiguator *v6;
  PGPublicEventDisambiguator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGPublicEventDisambiguator;
  v6 = -[PGPublicEventDisambiguator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sceneTaxonomy, a3);

  return v7;
}

- (id)disambiguateEvents:(id)a3 forTimeLocationTuple:(id)a4 momentNode:(id)a5 graph:(id)a6 meaningfulEventProcessorCache:(id)a7 serviceManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  PGPublicEventMatchingOptions *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  char v38;
  uint64_t v39;
  double v40;
  uint64_t j;
  void *v42;
  double v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  _BOOL4 v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void *v83;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id obj;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[4];
  id v130;
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint8_t v134[128];
  uint8_t v135[4];
  uint64_t v136;
  __int16 v137;
  const __CFString *v138;
  __int16 v139;
  void *v140;
  _BYTE buf[12];
  __int16 v142;
  void *v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v17;
  -[PGPublicEventDisambiguator publicEventCriteriaByCategoryInGraph:](self, "publicEventCriteriaByCategoryInGraph:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v16;
  v93 = v15;
  v89 = v19;
  v90 = v18;
  v21 = -[PGPublicEventMatchingOptions initWithTimeLocationTuple:momentNode:meaningfulEventProcessorCache:serviceManager:]([PGPublicEventMatchingOptions alloc], "initWithTimeLocationTuple:momentNode:meaningfulEventProcessorCache:serviceManager:", v15, v16, v18, v19);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = v14;
  v101 = v20;
  v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
  if (v96)
  {
    v95 = *(_QWORD *)v122;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v122 != v95)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v22);
        objc_msgSend(v23, "name");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "categories");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v104 = v24;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
        if (!v25)
        {
LABEL_35:
          if (PGIsAppleInternal_onceToken != -1)
            dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
          if (PGIsAppleInternal_isAppleInternal)
          {
            v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v104, "count"));
            v109 = 0u;
            v110 = 0u;
            v111 = 0u;
            v112 = 0u;
            v50 = v104;
            v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
            if (v51)
            {
              v52 = v51;
              v53 = *(_QWORD *)v110;
              do
              {
                for (i = 0; i != v52; ++i)
                {
                  if (*(_QWORD *)v110 != v53)
                    objc_enumerationMutation(v50);
                  objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "category");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "addObject:", v55);

                }
                v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
              }
              while (v52);
            }

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138478083;
              *(_QWORD *)&buf[4] = v98;
              v142 = 2113;
              v143 = v49;
              _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: not matching allowed categories. event categories: %{private}@", buf, 0x16u);
            }

          }
          goto LABEL_48;
        }
        v26 = v25;
        v97 = v22;
        v27 = 0;
        v28 = *(_QWORD *)v118;
        v102 = *(_QWORD *)v118;
        do
        {
          v29 = 0;
          v103 = v26;
          do
          {
            if (*(_QWORD *)v118 != v28)
              objc_enumerationMutation(v104);
            objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * v29), "category");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "count");
            v33 = v32 != 0;
            if (!v32)
              goto LABEL_32;
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v107 = v31;
            v34 = v31;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
            if (v35)
            {
              v36 = v35;
              v105 = v30;
              v37 = 0;
              v38 = 0;
              v39 = *(_QWORD *)v114;
              v40 = 1.79769313e308;
              while (1)
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v114 != v39)
                    objc_enumerationMutation(v34);
                  v42 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                  *(_QWORD *)buf = 0;
                  LOBYTE(v125) = 0;
                  if (objc_msgSend(v42, "isMatchingEvent:matchingOptions:withHighConfidence:matchingDistance:", v23, v21, &v125, buf))
                  {
                    if ((v38 & 1) == 0)
                    {
                      v43 = *(double *)buf;
LABEL_24:
                      v37 = v125 != 0;
                      v38 = 1;
                      v40 = v43;
                      continue;
                    }
                    v43 = *(double *)buf;
                    if (!v37 && v125 != 0)
                      goto LABEL_24;
                    v38 = 1;
                    if ((_BYTE)v125)
                    {
                      if (*(double *)buf < v40)
                        goto LABEL_24;
                    }
                  }
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
                if (!v36)
                {

                  v44 = v38 & v37;
                  v20 = v101;
                  v28 = v102;
                  v26 = v103;
                  v30 = v105;
                  v31 = v107;
                  v33 = 1;
                  if ((v44 & 1) != 0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "muid"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v100, "objectForKeyedSubscript:", v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                    v33 = 1;
                    v31 = v107;
                    if (!v46)
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = v105;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "muid"));
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v100, "setObject:forKeyedSubscript:", v47, v48);

                      v31 = v107;
                      objc_msgSend(v99, "addObject:", v23);
                      goto LABEL_31;
                    }
                  }
                  goto LABEL_32;
                }
              }
            }

            v31 = v107;
LABEL_31:
            v33 = 1;
LABEL_32:
            v27 |= v33;

            ++v29;
          }
          while (v29 != v26);
          v26 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
        }
        while (v26);
        v22 = v97;
        if ((v27 & 1) == 0)
          goto LABEL_35;
LABEL_48:

        ++v22;
      }
      while (v22 != v96);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    }
    while (v96);
  }

  v56 = v99;
  v57 = v100;
  v58 = objc_msgSend(v56, "count");
  if (v58 == 1)
  {
    v61 = v92;
    v60 = v93;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v56, "anyObject");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "name");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v88;
      _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event: electing single matched event %{private}@", buf, 0xCu);

    }
    v59 = v56;
  }
  else if (v58)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    v108 = v56;
    objc_msgSend(v56, "allObjects");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = ___PGFilterMatchingPublicEvents_block_invoke;
    v129[3] = &unk_1E8431BB8;
    v106 = v57;
    v63 = v57;
    v130 = v63;
    objc_msgSend(v62, "sortedArrayUsingComparator:", v129);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v65, "muid"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "floatValue");
    v69 = v68;

    objc_msgSend(v59, "addObject:", v65);
    if ((unint64_t)objc_msgSend(v64, "count") >= 2)
    {
      v70 = 1;
      while (1)
      {
        objc_msgSend(v64, "objectAtIndexedSubscript:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v71, "muid"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "doubleValue");
        v75 = v74;

        v76 = v75 - v69 <= 35.0;
        if (v69 > 100.0)
          v76 = v75 <= v69 * 1.35;
        if (!v76)
          break;
        objc_msgSend(v59, "addObject:", v71);

        if (++v70 >= (unint64_t)objc_msgSend(v64, "count"))
          goto LABEL_64;
      }

    }
LABEL_64:

    v61 = v92;
    v60 = v93;
    v20 = v101;
    v57 = v106;
    v56 = v108;
  }
  else
  {
    v59 = v56;
    v61 = v92;
    v60 = v93;
  }
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  if (PGIsAppleInternal_isAppleInternal)
  {
    v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v78 = v59;
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v125, buf, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v126;
      do
      {
        for (k = 0; k != v80; ++k)
        {
          if (*(_QWORD *)v126 != v81)
            objc_enumerationMutation(v78);
          objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * k), "name");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addObject:", v83);

        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v125, buf, 16);
      }
      while (v80);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v85 = objc_msgSend(v77, "count");
      objc_msgSend(v77, "componentsJoinedByString:", CFSTR(", "));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v135 = 134218499;
      v136 = v85;
      v137 = 2112;
      v138 = CFSTR("high");
      v139 = 2113;
      v140 = v86;
      _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event: found %lu %@ confidence events. %{private}@", v135, 0x20u);

    }
    v20 = v101;
    v61 = v92;
    v60 = v93;
  }

  return v59;
}

- (void)collectConsolidatedAddressesForMomentNodes:(id)a3 largeFrequentLocationNodes:(id)a4 consolidatedAddresses:(id *)a5 consolidatedAddressesByMomentIdentifier:(id *)a6 momentNodesForConsolidatedAddresses:(id *)a7 progressBlock:(id)a8
{
  id v14;
  id v15;
  void *v16;
  double v17;
  char v18;
  id *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  double Current;
  char v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v32 = a4;
  v15 = a8;
  v16 = _Block_copy(v15);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  v31 = v15;
  if (!v16
    || (v17 = CFAbsoluteTimeGetCurrent(), v17 - v44[3] < 0.01)
    || (v44[3] = v17,
        v42 = 0,
        (*((void (**)(void *, char *, double))v16 + 2))(v16, &v42, 0.0),
        v18 = *((_BYTE *)v48 + 24) | v42,
        (*((_BYTE *)v48 + 24) = v18) == 0))
  {
    v19 = a7;
    v20 = a5;
    objc_msgSend(MEMORY[0x1E0C99E20], "set", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke;
    v33[3] = &unk_1E8431B90;
    v24 = v16;
    v41 = 0x3F847AE147AE147BLL;
    v39 = &v43;
    v40 = &v47;
    v38 = v24;
    v33[4] = self;
    v34 = v32;
    v25 = v21;
    v35 = v25;
    v26 = v23;
    v36 = v26;
    v27 = v22;
    v37 = v27;
    objc_msgSend(v14, "enumerateNodesUsingBlock:", v33);
    if (*((_BYTE *)v48 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_DWORD *)buf = 67109378;
      v52 = 248;
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGPublicEventDisambiguator.m";
      v28 = MEMORY[0x1E0C81028];
    }
    else
    {
      *v19 = objc_retainAutorelease(v25);
      *v20 = objc_retainAutorelease(v27);
      *a6 = objc_retainAutorelease(v26);
      if (!v16)
        goto LABEL_15;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v44[3] < 0.01)
        goto LABEL_15;
      v44[3] = Current;
      v42 = 0;
      (*((void (**)(id, char *, double))v24 + 2))(v24, &v42, 1.0);
      v30 = *((_BYTE *)v48 + 24) | v42;
      *((_BYTE *)v48 + 24) = v30;
      if (!v30 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)buf = 67109378;
      v52 = 254;
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGPublicEventDisambiguator.m";
      v28 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v52 = 194;
    v53 = 2080;
    v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ingest"
          "/Ingest Processing/PGPublicEventDisambiguator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_16:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

}

- (id)_frequentLocationNodesForMomentNode:(id)a3 largeFrequentLocationNodes:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(a3, "frequentLocationNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") && objc_msgSend(v6, "intersectsSet:", v5))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)publicEventCriteriaByCategoryInGraph:(id)a3
{
  NSDictionary *publicEventCriteriaByCategory;
  NSDictionary *v5;
  NSDictionary *v6;

  publicEventCriteriaByCategory = self->_publicEventCriteriaByCategory;
  if (!publicEventCriteriaByCategory)
  {
    +[PGPublicEventCriteriaFactory publicEventCriteriaByCategoryForGraph:sceneTaxonomy:](PGPublicEventCriteriaFactory, "publicEventCriteriaByCategoryForGraph:sceneTaxonomy:", a3, self->_sceneTaxonomy);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_publicEventCriteriaByCategory;
    self->_publicEventCriteriaByCategory = v5;

    publicEventCriteriaByCategory = self->_publicEventCriteriaByCategory;
  }
  return publicEventCriteriaByCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_publicEventCriteriaByCategory, 0);
}

void __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  double Current;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  char v25;

  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  if (*(_QWORD *)(a1 + 72)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v8 + 24) = Current,
        v25 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(0.5),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_frequentLocationNodesForMomentNode:largeFrequentLocationNodes:", v5, *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") != 0;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke_2;
    v20 = &unk_1E8431B68;
    v12 = v5;
    v21 = v12;
    v24 = v11;
    v13 = v10;
    v22 = v13;
    v14 = v9;
    v23 = v14;
    objc_msgSend(v12, "enumerateConsolidatedAddressesUsingBlock:", &v17);
    if (objc_msgSend(v14, "count", v17, v18, v19, v20))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
      v15 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

      objc_msgSend(*(id *)(a1 + 64), "unionSet:", v14);
    }

  }
  objc_autoreleasePoolPop(v6);

}

void __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "addressNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPersonHomeOrWorkAddress"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "coordinate");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.8f, %.8f}"), v5, v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v31 = v7;
      v32 = 2113;
      v33 = v8;
      _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Not considering address %{private}@ at home/work for Moment %{private}@", buf, 0x16u);

LABEL_17:
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v3, "coordinates");
      v27 = v9;
      v28 = v10;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v7 = *(id *)(a1 + 40);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "addressNode");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "coordinate");
            v21 = v16;
            v22 = v17;

            CLLocationCoordinate2DGetDistanceFrom();
            if (v18 <= 200.0)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.8f, %.8f}"), v27, v28, v21, v22, (_QWORD)v23);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412547;
                v31 = v19;
                v32 = 2113;
                v33 = v20;
                _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PublicEvents] Not considering address (%@) close to frequent location for Moment %{private}@", buf, 0x16u);

              }
              goto LABEL_17;
            }
          }
          v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

}

@end
