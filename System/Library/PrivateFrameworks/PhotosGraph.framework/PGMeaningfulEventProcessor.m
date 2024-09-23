@implementation PGMeaningfulEventProcessor

+ (id)processRequiredCriteria:(id)a3 forMoment:(id)a4 meaningfulEventProcessorCache:(id)a5 serviceManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PGMeaningfulEventMatchingCriteria *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  PGMeaningfulEventMatchingCriteria *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  PGMeaningfulEventMatchingCriteria *v25;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = -[PGMeaningfulEventMatchingCriteria initWithMoment:cache:serviceManager:]([PGMeaningfulEventMatchingCriteria alloc], "initWithMoment:cache:serviceManager:", v13, v12, v11);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__PGMeaningfulEventProcessor_processRequiredCriteria_forMoment_meaningfulEventProcessorCache_serviceManager___block_invoke;
  v23[3] = &unk_1E8428070;
  v24 = v16;
  v25 = v14;
  v27 = v10;
  v28 = a1;
  v26 = v15;
  v17 = v10;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v23);
  objc_msgSend(a1, "_postProcessResults:forMoment:", v18, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_postProcessResults:(id)a3 forMoment:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    objc_msgSend(a1, "_postProcessBirthdaysWithResults:forMoment:", v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

+ (id)_legacyMeaningResultForResult:(id)a3 requiredCriteriaByIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString **v9;
  void *v10;
  void *v11;
  PGMeaningfulEventMatchingResult *v12;
  uint64_t v13;
  double v14;
  PGMeaningfulEventMatchingResult *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "requiredCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AmusementPark")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("Festival")) & 1) != 0)
  {
    v9 = kPGGraphNodeMeaningEntertainment;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Concert")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Dance")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Theater")) & 1) != 0)
  {
    v9 = kPGGraphNodeMeaningPerformance;
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Wedding")))
      goto LABEL_12;
    v9 = kPGGraphNodeMeaningGathering;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v12 = [PGMeaningfulEventMatchingResult alloc];
  v13 = objc_msgSend(v5, "isMatching");
  objc_msgSend(v5, "score");
  v15 = -[PGMeaningfulEventMatchingResult initWithIsMatching:score:isReliable:requiredCriteria:](v12, "initWithIsMatching:score:isReliable:requiredCriteria:", v13, objc_msgSend(v5, "isReliable"), v11, v14);

LABEL_13:
  return v15;
}

+ (id)_postProcessBirthdaysWithResults:(id)a3 forMoment:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  id v53;
  void *v54;
  PGGraphPersonNodeCollection *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  PGGraphPersonNodeCollection *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  double v70;
  uint64_t m;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  PGGraphPersonNodeCollection *v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  id obj;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  PGGraphPersonNodeCollection *v102;
  id v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
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
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v83 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v83, "hasEdgeWithLabel:domain:", CFSTR("CELEBRATING"), 401);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v122 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
        objc_msgSend(v9, "requiredCriteria");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Birthday"));
        if ((v12 & 1) == 0)
        {
          v13 = objc_msgSend(v11, "isEqualToString:", CFSTR("WeakBirthday"));
          v14 = v91;
          if (!v13)
            goto LABEL_13;
        }
        if (!v95
          || (objc_msgSend(v10, "additionalInfo"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("birthday.isOnDate")),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "BOOLValue"),
              v16,
              v15,
              v17))
        {
          if (v12)
            v14 = v94;
          else
            v14 = v93;
LABEL_13:
          objc_msgSend(v14, "addObject:", v9);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
    }
    while (v6);
  }

  v18 = objc_msgSend(v94, "count");
  v19 = objc_msgSend(v93, "count") + v18;
  if (!v95 || (v20 = objc_msgSend(v91, "count"), v20 + v19 != objc_msgSend(obj, "count")))
  {
    if (v19 == 1)
    {
      v22 = (id)objc_msgSend(v91, "mutableCopy");
      objc_msgSend(v22, "unionSet:", v94);
      objc_msgSend(v22, "unionSet:", v93);
      goto LABEL_49;
    }
    if (!v19)
    {
      v21 = v91;
      goto LABEL_22;
    }
    v81 = v91;
    v23 = v94;
    if (!v18)
      v23 = v93;
    v24 = v23;
    objc_msgSend(v83, "graph");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "meNode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v88 = v24;
    v26 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
    if (v26)
    {
      v27 = 0;
      v96 = 0;
      v28 = *(_QWORD *)v118;
      v29 = 1;
      do
      {
        v30 = 0;
        v31 = v27;
        do
        {
          if (*(_QWORD *)v118 != v28)
            objc_enumerationMutation(v88);
          v32 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v30);
          objc_msgSend(v32, "requiredCriteria");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "peopleTrait");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "nodes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
            v29 &= objc_msgSend(v31, "isEqual:", v27);
          if (v25)
          {
            if (objc_msgSend(v27, "containsNode:", v25))
            {
              if (!v96 || (objc_msgSend(v32, "score"), v36 = v35, objc_msgSend(v96, "score"), v36 > v37))
              {
                v38 = v32;

                v96 = v38;
              }
            }
          }

          ++v30;
          v31 = v27;
        }
        while (v26 != v30);
        v26 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
      }
      while (v26);

      if ((v29 & 1) == 0)
      {
        objc_msgSend(v96, "requiredCriteria");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "additionalInfo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("birthday.isOnDate"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "BOOLValue");

        if (v96)
          v43 = v42;
        else
          v43 = 0;
        if (v43 == 1)
        {
          objc_msgSend(v81, "addObject:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v89 = v88;
          v45 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
          if (v45)
          {
            v46 = *(_QWORD *)v114;
            do
            {
              for (j = 0; j != v45; ++j)
              {
                if (*(_QWORD *)v114 != v46)
                  objc_enumerationMutation(v89);
                v48 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                objc_msgSend(v48, "requiredCriteria");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "additionalInfo");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("birthday.isOnDate"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "BOOLValue");

                if (v52)
                  objc_msgSend(v87, "addObject:", v48);

              }
              v45 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
            }
            while (v45);
          }

          if (objc_msgSend(v87, "count"))
          {
            v53 = v87;

            v54 = v53;
          }
          else
          {
            v54 = v89;
          }
          v88 = v54;
          if ((unint64_t)objc_msgSend(v54, "count") >= 2)
          {
            v55 = -[MAElementCollection initWithGraph:]([PGGraphPersonNodeCollection alloc], "initWithGraph:", v82);
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            v90 = v88;
            v56 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
            if (v56)
            {
              v57 = *(_QWORD *)v110;
              do
              {
                for (k = 0; k != v56; ++k)
                {
                  if (*(_QWORD *)v110 != v57)
                    objc_enumerationMutation(v90);
                  objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * k), "requiredCriteria");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "peopleTrait");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "nodes");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v61, "localIdentifiers");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "anyObject");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v63, "length"))
                  {
                    -[MAElementCollection collectionByFormingUnionWith:](v55, "collectionByFormingUnionWith:", v61);
                    v64 = objc_claimAutoreleasedReturnValue();

                    v55 = (PGGraphPersonNodeCollection *)v64;
                  }

                }
                v56 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
              }
              while (v56);
            }

            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v90, "count"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = 0;
            v106 = &v105;
            v107 = 0x2020000000;
            v108 = 0;
            v101[0] = MEMORY[0x1E0C809B0];
            v101[1] = 3221225472;
            v101[2] = __73__PGMeaningfulEventProcessor__postProcessBirthdaysWithResults_forMoment___block_invoke;
            v101[3] = &unk_1E8427898;
            v66 = v55;
            v102 = v66;
            v85 = v65;
            v103 = v85;
            v104 = &v105;
            objc_msgSend(v83, "enumeratePersonEdgesAndNodesUsingBlock:", v101);
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v67 = objc_claimAutoreleasedReturnValue();
            v68 = v106[3];
            v97 = 0u;
            v98 = 0u;
            v99 = 0u;
            v100 = 0u;
            v84 = v90;
            v69 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v97, v125, 16);
            v80 = v66;
            v88 = (id)v67;
            if (v69)
            {
              v70 = (double)v68 * 0.7;
              v86 = *(_QWORD *)v98;
              do
              {
                for (m = 0; m != v69; ++m)
                {
                  if (*(_QWORD *)v98 != v86)
                    objc_enumerationMutation(v84);
                  v72 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * m);
                  objc_msgSend(v72, "requiredCriteria", v80);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "peopleTrait");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "nodes");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v75, "localIdentifiers");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "anyObject");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v77, "length"))
                  {
                    objc_msgSend(v85, "objectForKeyedSubscript:", v77);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v79 = objc_msgSend(v78, "unsignedIntegerValue");

                    if (v70 <= (double)v79)
                      objc_msgSend(v88, "addObject:", v72);
                  }

                }
                v69 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v97, v125, 16);
              }
              while (v69);
            }

            _Block_object_dispose(&v105, 8);
          }
          objc_msgSend(v81, "unionSet:", v88, v80);

        }
        goto LABEL_48;
      }
    }
    else
    {

      v96 = 0;
      v27 = 0;
    }
    objc_msgSend(v81, "unionSet:", v88);
LABEL_48:
    v22 = v81;

    goto LABEL_49;
  }
  v21 = obj;
LABEL_22:
  v22 = v21;
LABEL_49:

  return v22;
}

void __73__PGMeaningfulEventProcessor__postProcessBirthdaysWithResults_forMoment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsNode:", v5))
  {
    objc_msgSend(v5, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_msgSend(v10, "numberOfAssets");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (v7 > *(_QWORD *)(v9 + 24))
        *(_QWORD *)(v9 + 24) = v7;
    }

  }
}

void __109__PGMeaningfulEventProcessor_processRequiredCriteria_forMoment_meaningfulEventProcessorCache_serviceManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    v25 = v6;
    v26 = v5;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      v27 = *(_QWORD *)v32;
      while (2)
      {
        v11 = 0;
        v28 = v9;
        do
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(*(id *)(a1 + 40), "matchingResultWithCriteria:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isMatching"))
          {
            objc_msgSend(v12, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isReliable");
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
            objc_msgSend(*(id *)(a1 + 64), "_legacyMeaningResultForResult:requiredCriteriaByIdentifier:", v14, *(_QWORD *)(a1 + 56));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v29 = v16;
              v30 = v15;
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
              objc_msgSend(v17, "requiredCriteria");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v17, "isReliable"))
                objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);
              +[PGLogging sharedLogging](PGLogging, "sharedLogging", v25, v26);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "loggingConnection");
              v21 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v14, "requiredCriteria");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "identifier");
                v23 = v7;
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v36 = v19;
                v37 = 2114;
                v38 = v24;
                _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[MeaningInference] Adding legacy meaning %{public}@ for meaning %{public}@", buf, 0x16u);

                v7 = v23;
                v10 = v27;

              }
              v9 = v28;
              v15 = v30;
              v16 = v29;
            }
            if ((v16 & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

              objc_autoreleasePoolPop(v13);
              goto LABEL_20;
            }

          }
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_20:

    v6 = v25;
    v5 = v26;
  }

}

@end
