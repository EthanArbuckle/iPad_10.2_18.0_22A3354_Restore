@implementation PSFeatureCache

void __69___PSFeatureCache_initWithPredictionContext_candidates_caches_store___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Timer has triggered, refreshing cache", v3, 2u);
    }

    objc_msgSend(WeakRetained, "invalidateAndRefreshCache");
  }

}

uint64_t __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "candidateForDeduping");
}

uint64_t __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "candidateIdentifier");
}

id __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "candidateForDeduping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v3, "candidateIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "bucketSums");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "bucketHasEver");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v7 = v8;
          goto LABEL_9;
        }
LABEL_8:
        v7 = 0;
LABEL_9:

        goto LABEL_10;
      }

    }
    goto LABEL_8;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

uint64_t __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(v3, "timestamp"),
        v6 = v5,
        objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate"),
        v6 >= v7))
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v4, "itemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containsObject:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_3(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id obj;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  id *v111;
  uint64_t v112;
  uint64_t v113;
  __CFString *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("self");
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = a1;
  if (v6)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_6:

      goto LABEL_8;
    }
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v7, v6);
      goto LABEL_6;
    }
  }
LABEL_8:
  objc_msgSend(a1[7], "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v10, v5);

  }
  objc_msgSend(a1[8], "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(a1[8], "setObject:forKeyedSubscript:", v12, v5);

  }
  objc_msgSend(a1[9], "objectForKeyedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(a1[9], "setObject:forKeyedSubscript:", v14, v5);

  }
  objc_msgSend(v3, "featureValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "featureValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "histogramValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = v5;
    if (v17)
    {
      objc_msgSend(v3, "featureName");
      BMMLSEDurableFeatureStorefeatureNameAsString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSHistogramFeatures computeFactorNameForFeature:](_PSHistogramFeatures, "computeFactorNameForFeature:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111[7], "objectForKeyedSubscript:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v22 = (void *)objc_opt_new();
        objc_msgSend(v111[7], "objectForKeyedSubscript:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v19);

      }
      objc_msgSend(v111[8], "objectForKeyedSubscript:", v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v26 = (void *)objc_opt_new();
        objc_msgSend(v111[8], "objectForKeyedSubscript:", v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v19);

      }
      objc_msgSend(v111[9], "objectForKeyedSubscript:", v5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v30 = (void *)objc_opt_new();
        objc_msgSend(v111[9], "objectForKeyedSubscript:", v5);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v19);

      }
      objc_msgSend(v111[10], "objectForKeyedSubscript:", v19);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        v33 = (void *)objc_opt_new();
        objc_msgSend(v111[10], "setObject:forKeyedSubscript:", v33, v19);

      }
      objc_msgSend(v111[11], "objectForKeyedSubscript:", v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
      {
        v35 = (void *)objc_opt_new();
        objc_msgSend(v111[11], "setObject:forKeyedSubscript:", v35, v19);

      }
      objc_msgSend(v3, "featureValue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "histogramValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bucketList");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        v101 = v18;
        v102 = v3;
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v100 = v38;
        obj = v38;
        v39 = v111;
        v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v125, 16);
        if (v106)
        {
          v105 = *(_QWORD *)v121;
          do
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v121 != v105)
                objc_enumerationMutation(obj);
              v108 = v40;
              v41 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v40);
              objc_msgSend(v41, "counts", v100, v101, v102);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = v41;
              objc_msgSend(v41, "bucketName");
              v43 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39[10], "objectForKeyedSubscript:", v19);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v43);

              objc_msgSend(v39[11], "objectForKeyedSubscript:", v19);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", v43);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v46)
              {
                v47 = (void *)objc_opt_new();
                objc_msgSend(v39[11], "objectForKeyedSubscript:", v19);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, v43);

              }
              v115 = (void *)v43;
              v118 = 0u;
              v119 = 0u;
              v116 = 0u;
              v117 = 0u;
              v109 = v42;
              v112 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
              if (v112)
              {
                v110 = *(_QWORD *)v117;
                do
                {
                  v49 = 0;
                  do
                  {
                    if (*(_QWORD *)v117 != v110)
                      objc_enumerationMutation(v109);
                    v50 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v49);
                    objc_msgSend(v50, "interval");
                    BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalAsString();
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111[7], "objectForKeyedSubscript:", v114);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "objectForKeyedSubscript:", v19);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "objectForKeyedSubscript:", v51);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v54)
                    {
                      v55 = (void *)objc_opt_new();
                      objc_msgSend(v111[7], "objectForKeyedSubscript:", v114);
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "objectForKeyedSubscript:", v19);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "setObject:forKeyedSubscript:", v55, v51);

                    }
                    objc_msgSend(v111[8], "objectForKeyedSubscript:", v114);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "objectForKeyedSubscript:", v19);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "objectForKey:", v51);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v60)
                    {
                      objc_msgSend(v111[8], "objectForKeyedSubscript:", v114);
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v61, "objectForKeyedSubscript:", v19);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "setObject:forKeyedSubscript:", &unk_1E442B228, v51);

                    }
                    v113 = v49;
                    objc_msgSend(v111[11], "objectForKeyedSubscript:", v19);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "objectForKeyedSubscript:", v115);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "objectForKeyedSubscript:", v51);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v65)
                    {
                      objc_msgSend(v111[11], "objectForKeyedSubscript:", v19);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v66, "objectForKeyedSubscript:", v115);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "setObject:forKeyedSubscript:", &unk_1E442B228, v51);

                    }
                    v68 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v111[8], "objectForKeyedSubscript:", v114);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "objectForKeyedSubscript:", v19);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "objectForKeyedSubscript:", v51);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "numberWithUnsignedInt:", objc_msgSend(v50, "value") + objc_msgSend(v71, "intValue"));
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111[8], "objectForKeyedSubscript:", v114);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "objectForKeyedSubscript:", v19);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "setObject:forKeyedSubscript:", v72, v51);

                    v75 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v111[11], "objectForKeyedSubscript:", v19);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "objectForKeyedSubscript:", v115);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "objectForKeyedSubscript:", v51);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "numberWithUnsignedInt:", objc_msgSend(v50, "value") + objc_msgSend(v78, "intValue"));
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111[11], "objectForKeyedSubscript:", v19);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "objectForKeyedSubscript:", v115);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "setObject:forKeyedSubscript:", v79, v51);

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v50, "value"));
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111[7], "objectForKeyedSubscript:", v114);
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "objectForKeyedSubscript:", v19);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "objectForKeyedSubscript:", v51);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "setObject:forKeyedSubscript:", v82, v115);

                    v49 = v113 + 1;
                  }
                  while (v112 != v113 + 1);
                  v112 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
                }
                while (v112);
              }

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v107, "hasEver"));
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v111;
              v5 = v114;
              objc_msgSend(v111[9], "objectForKeyedSubscript:", v114);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "objectForKeyedSubscript:", v19);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "setObject:forKeyedSubscript:", v86, v115);

              v40 = v108 + 1;
            }
            while (v108 + 1 != v106);
            v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v125, 16);
          }
          while (v106);
        }

        v3 = v102;
        v38 = v100;
        v18 = v101;
      }

    }
    else if (v6)
    {
      objc_msgSend(v111[5], "objectForKeyedSubscript:", v6);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (v89)
      {
        objc_msgSend(v3, "featureName");
        BMMLSEDurableFeatureStorefeatureNameAsString();
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "featureValue");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "hasIntValue");
        v103 = v6;
        v93 = v3;
        if (v92)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v91, "intValue"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v94 = 0;
        }
        v95 = objc_msgSend(v91, "hasDoubleValue");
        if (v95)
        {
          v96 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v91, "doubleValue");
          objc_msgSend(v96, "numberWithDouble:");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v97 = 0;
        }
        objc_msgSend(v91, "stringValue");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v91, "hasBoolValue") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v91, "BOOLValue"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "addFeatureWithIntValue:doubleValue:stringValue:BOOLValue:timeBucket:forKey:", v94, v97, v98, v99, 0, v90);

        }
        else
        {
          objc_msgSend(v89, "addFeatureWithIntValue:doubleValue:stringValue:BOOLValue:timeBucket:forKey:", v94, v97, v98, 0, 0, v90);
        }

        if (v95)
        if (v92)

        v3 = v93;
        v5 = v114;
        v6 = v103;
      }

    }
  }

}

void __53___PSFeatureCache_replaceEphemeralFeaturesWithCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(a2, "candidateForDeduping");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA70];
  v8 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "addEntriesFromDictionary:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "Saving features to virtual feature store", buf, 2u);
  }

  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v18 = v5;
    _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_DEFAULT, "Fetched device identifier %{private}@", buf, 0xCu);
  }

  +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37___PSFeatureCache_saveToVirtualStore__block_invoke_134;
  v13[3] = &unk_1E44012D8;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v10;
  v11 = v4;
  v16 = v11;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_DEFAULT, "Finished saving to virtual feature store", buf, 2u);
  }

}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_134(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  _PSFeatureDictionary *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  uint64_t v22;
  id v23;

  v5 = a2;
  v6 = a3;
  +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1A1AFCA24]();
    v10 = -[_PSFeatureDictionary initWithDictionary:]([_PSFeatureDictionary alloc], "initWithDictionary:", v6);
    -[_PSFeatureDictionary addEntriesFromDictionary:overwrite:](v10, "addEntriesFromDictionary:overwrite:", a1[4], 0);
    v11 = (void *)objc_opt_new();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __37___PSFeatureCache_saveToVirtualStore__block_invoke_2;
    v21 = &unk_1E44012B0;
    v22 = a1[5];
    v12 = v11;
    v23 = v12;
    -[_PSFeatureDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", &v18);
    v13 = objc_alloc(MEMORY[0x1E0D020C0]);
    objc_msgSend(v5, "candidateIdentifier", v18, v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1[5], "deviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithItemIdentifier:featureVersion:featureVector:deviceIdentifier:shareSessionIdentifier:", v14, 0, v12, v15, a1[6]);

    objc_msgSend(*(id *)(a1[5] + 168), "sendEvent:", v16);
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __37___PSFeatureCache_saveToVirtualStore__block_invoke_134_cold_1((uint64_t)v5, v17);

    objc_autoreleasePoolPop(v9);
  }

}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AFCA24]();
  v8 = BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString();
  if (!(_DWORD)v8)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_2((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "privacyMitigateFeatures:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D020C8]), "initWithFeatureName:featureValue:featureItselfVersion:featureFreshnessInHours:eventVolumeToComputeFeature:timeSpentToComputeFeature:", v8, v16, 0, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_1((uint64_t)v5, v16, v18, v19, v20, v21, v22, v23);
  }

  objc_autoreleasePoolPop(v7);
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_134_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "Sent data to virtual feature store about candidate %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, a2, a3, "There is a feature with incorrect type being computed, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37___PSFeatureCache_saveToVirtualStore__block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, a2, a3, "Unknown feature: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
