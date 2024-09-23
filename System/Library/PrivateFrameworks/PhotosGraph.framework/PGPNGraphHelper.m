@implementation PGPNGraphHelper

+ (id)_createSocialGraphWithPersonClusterManager:(id)a3 persons:(id)a4 moments:(id)a5 inferredMePersonLocalIdentifier:(id *)a6 updateBlock:(id)a7
{
  id v11;
  PGMutableGraph *v12;
  unint64_t v13;
  id v14;
  float v15;
  uint64_t v16;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  const __CFString *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  PGMutableGraph *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  PGMutableGraph *v64;
  id v65;
  id v66;
  id *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void (**v74)(id, _BYTE *, float);
  void *v75;
  void *context;
  uint64_t v77;
  id v78;
  PGMutableGraph *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id obja;
  id obj;
  _QWORD v85[4];
  PGMutableGraph *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  char v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  void *v101;
  _QWORD v102[4];
  _QWORD v103[4];
  _BYTE v104[128];
  _QWORD v105[6];
  _QWORD v106[6];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v73 = a4;
  v11 = a5;
  v74 = (void (**)(id, _BYTE *, float))a7;
  if (!v11)
  {
    objc_msgSend(v69, "pn_fetchMoments");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_alloc_init(PGMutableGraph);
  v68 = a6;
  if (a6)
    v78 = *a6;
  else
    v78 = 0;
  v96 = 0;
  v13 = objc_msgSend(v11, "count");
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v14 = v11;
  v72 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
  if (v72)
  {
    v70 = v14;
    v71 = *(_QWORD *)v93;
    v15 = 0.0 / (float)v13;
    v79 = v12;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v93 != v71)
          objc_enumerationMutation(v14);
        v17 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1CAA4EB2C]();
        v74[2](v74, &v96, v15);
        if (v96)
        {
          objc_autoreleasePoolPop(v18);

          v56 = 0;
          goto LABEL_43;
        }
        context = v18;
        v77 = v16;
        v105[0] = CFSTR("utcs");
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v17, "startDate");
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obja, "timeIntervalSince1970");
        objc_msgSend(v19, "numberWithDouble:");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v106[0] = v81;
        v105[1] = CFSTR("utce");
        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v17, "endDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSince1970");
        objc_msgSend(v20, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v106[1] = v22;
        v105[2] = CFSTR("tzs");
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v17, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        objc_msgSend(v23, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v106[2] = v25;
        v105[3] = CFSTR("tze");
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v17, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSince1970");
        objc_msgSend(v26, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v106[3] = v28;
        v105[4] = CFSTR("cnt");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "estimatedAssetCount"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v106[4] = v29;
        v105[5] = CFSTR("lclid");
        objc_msgSend(v17, "localIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v106[5] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 6);
        v31 = objc_claimAutoreleasedReturnValue();

        v12 = v79;
        v75 = (void *)v31;
        -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](v79, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("Moment"), 100, v31, 0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        obj = v73;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v89;
          do
          {
            v35 = 0;
            v82 = v33;
            do
            {
              if (*(_QWORD *)v89 != v34)
                objc_enumerationMutation(obj);
              v36 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v35);
              v37 = (void *)MEMORY[0x1CAA4EB2C]();
              objc_msgSend(v36, "backingMomentIdentifiers");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "localIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v38, "containsObject:", v39);

              if (v40)
              {
                v41 = v17;
                objc_msgSend(v36, "anonymizedName");
                v42 = objc_claimAutoreleasedReturnValue();
                v43 = (void *)v42;
                v44 = &stru_1E8436F28;
                if (v42)
                  v44 = (__CFString *)v42;
                v45 = v44;

                objc_msgSend(v36, "localIdentifier");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v102[0] = CFSTR("name");
                v102[1] = CFSTR("id");
                v103[0] = v45;
                v103[1] = v46;
                v102[2] = CFSTR("usercreated");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v36, "isVerified"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v103[2] = v47;
                v102[3] = CFSTR("fav");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v36, "favorite"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v103[3] = v48;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 4);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                if (v78)
                {
                  objc_msgSend(v36, "localIdentifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v78, "isEqualToString:", v50);

                  if (v51)
                    v52 = CFSTR("Me");
                  else
                    v52 = CFSTR("People");
                }
                else
                {
                  v52 = CFSTR("People");
                }
                v12 = v79;
                -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](v79, "addUniqueNodeWithLabel:domain:properties:didCreate:", v52, 300, v49, 0);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](v79, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PRESENT"), v53, v80, 300, 0);

                v17 = v41;
                v33 = v82;
              }
              objc_autoreleasePoolPop(v37);
              ++v35;
            }
            while (v33 != v35);
            v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
          }
          while (v33);
        }

        objc_autoreleasePoolPop(context);
        v16 = v77 + 1;
        v14 = v70;
      }
      while (v77 + 1 != v72);
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
      if (v72)
        continue;
      break;
    }
  }

  if (!v78)
  {
    -[PGGraph inferMeNodeFromSocialGroups](v12, "inferMeNodeFromSocialGroups");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      v55 = (void *)v54;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v98 = v55;
        _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "inferredMeNode found %@", buf, 0xCu);
      }
      if (v68)
      {
        objc_msgSend(v55, "localIdentifier");
        *v68 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!objc_msgSend(v73, "count"))
        goto LABEL_42;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "sortedArrayUsingDescriptors:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v59, "firstObject");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "localIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraph personNodeForPersonLocalIdentifier:](v12, "personNodeForPersonLocalIdentifier:", v61);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v98 = v55;
        v99 = 2112;
        v100 = v60;
        _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "inferredMeNode fallback found %@ - backing person: %@", buf, 0x16u);
      }

      if (!v55)
        goto LABEL_42;
    }
    objc_msgSend(v55, "propertyDictionary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](v12, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("Me"), 300, v62, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __122__PGPNGraphHelper__createSocialGraphWithPersonClusterManager_persons_moments_inferredMePersonLocalIdentifier_updateBlock___block_invoke;
    v85[3] = &unk_1E8436610;
    v64 = v12;
    v86 = v64;
    v87 = v63;
    v65 = v63;
    objc_msgSend(v55, "enumerateEdgesWithLabel:domain:usingBlock:", CFSTR("PRESENT"), 300, v85);
    v66 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v66, "removeNode:", v55);
    -[MAGraph executeGraphChangeRequest:](v64, "executeGraphChangeRequest:", v66);

  }
LABEL_42:
  v56 = v12;
LABEL_43:

  return v56;
}

+ (id)_socialGroupsLocalIdentifiersInGraph:(id)a3 includeMeNode:(BOOL)a4 includeCouples:(BOOL)a5 includeInvalid:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "meNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke;
  aBlock[3] = &unk_1E842E230;
  v28 = a5;
  v29 = a4;
  v26 = v12;
  v14 = v10;
  v27 = v14;
  v15 = v12;
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_2;
  v23[3] = &unk_1E8430A18;
  v24 = _Block_copy(aBlock);
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_3;
  v20[3] = &unk_1E8430A40;
  v22 = a6;
  v21 = v24;
  v16 = v24;
  objc_msgSend(v9, "enumerateSocialGroupsIncludingMeNode:validGroupsBlock:invalidGroupsBlock:averageWeight:", 0, v23, v20, 0);

  v17 = v21;
  v18 = v14;

  return v18;
}

+ (id)suggestedMeIdentifierWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  return 0;
}

+ (id)verifiedPeopleSocialGroupsWithPhotoLibrary:(id)a3 updateBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PGManager *v24;
  PGGraphBuilder *v25;
  PGGraphIngestSocialGroupsProcessor *v26;
  PGGraphUpdate *v27;
  void *v28;
  id v29;
  id v30;
  PGGraphUpdate *v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D77ED0]);
  v8 = (void *)objc_msgSend(v7, "initWithPhotoLibrary:rawClusters:includesPets:", v5, MEMORY[0x1E0C9AA70], 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77EA0]), "initWithPhotoLibrary:", v8);
  objc_msgSend(v9, "pn_fetchPersonsWithType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E20];
  v38 = v10;
  objc_msgSend(v10, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v19), "backingMomentIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "unionSet:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v17);
  }

  objc_msgSend(v14, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pn_fetchMomentsWithLocalIdentifiers:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v34 = objc_msgSend(v15, "count");
    v35 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134218240;
    v44 = v34;
    v45 = 2048;
    v46 = v35;
    _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Generating graph with %lu persons, %lu moments", buf, 0x16u);
  }
  +[PGPNGraphHelper _createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:](PGPNGraphHelper, "_createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:", v9, v15, v22, 0, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v37 = v9;
    v24 = -[PGManager initWithGraph:photoLibrary:]([PGManager alloc], "initWithGraph:photoLibrary:", v23, v5);
    v36 = v22;
    v25 = -[PGGraphBuilder initWithGraph:manager:]([PGGraphBuilder alloc], "initWithGraph:manager:", v23, v24);
    v26 = -[PGGraphIngestSocialGroupsProcessor initWithGraphBuilder:]([PGGraphIngestSocialGroupsProcessor alloc], "initWithGraphBuilder:", v25);
    v27 = -[PGGraphUpdate initWithPhotoLibrary:updateType:]([PGGraphUpdate alloc], "initWithPhotoLibrary:updateType:", v5, 3);
    v28 = v8;
    v29 = v5;
    v30 = v6;
    v31 = v27;
    -[PGGraphIngestSocialGroupsProcessor runWithGraphUpdate:progressBlock:](v26, "runWithGraphUpdate:progressBlock:", v27, &__block_literal_global_39058);
    v32 = v23;

    v6 = v30;
    v5 = v29;
    v8 = v28;

    v22 = v36;
    v9 = v37;
  }

  return v23;
}

+ (id)multiLevelSocialGroupsWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlyInteresting == YES"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredSetUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") <= 3)
  {
    v12 = v8;

    v11 = v12;
  }
  v13 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v74 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "backingMomentIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unionSet:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v16);
  }

  objc_msgSend(v13, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pn_fetchMomentsWithLocalIdentifiers:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v49 = objc_msgSend(v14, "count");
    v50 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 134218240;
    v79 = v49;
    v80 = 2048;
    v81 = v50;
    _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Generating graph with %lu persons, %lu moments", buf, 0x16u);
  }
  v22 = v9;
  +[PGPNGraphHelper _createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:](PGPNGraphHelper, "_createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:", v7, v14, v21, 0, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v63 = v8;
    objc_msgSend(v23, "meNode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localIdentifier");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    +[PGPNGraphHelper _socialGroupsLocalIdentifiersInGraph:includeMeNode:includeCouples:includeInvalid:](PGPNGraphHelper, "_socialGroupsLocalIdentifiersInGraph:includeMeNode:includeCouples:includeInvalid:", v24, 1, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 134218242;
      v79 = v28;
      v80 = 2112;
      v81 = (uint64_t)v27;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Found %lu social groups, %@", buf, 0x16u);
    }
    if (objc_msgSend(v27, "count"))
    {
      v29 = (void *)MEMORY[0x1E0CB3880];
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __89__PGPNGraphHelper_multiLevelSocialGroupsWithPersonClusterManager_forPersons_updateBlock___block_invoke;
      v70[3] = &unk_1E842E278;
      v62 = v27;
      v71 = v62;
      v26 = v26;
      v72 = v26;
      objc_msgSend(v29, "predicateWithBlock:", v70);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "filteredSetUsingPredicate:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v31, "count") < 3)
      {
        v44 = 1;
      }
      else
      {
        v57 = v24;
        v58 = v21;
        v59 = v22;
        v60 = v7;
        v64 = (void *)objc_opt_new();
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v61 = v31;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v67;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v67 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
              objc_msgSend(v37, "localIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isEqualToString:", v26);

              if ((v39 & 1) == 0)
              {
                objc_msgSend(v37, "backingMomentIdentifiers");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "unionSet:", v40);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
          }
          while (v34);
        }

        objc_msgSend(v64, "allObjects");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v60;
        objc_msgSend(v60, "pn_fetchMomentsWithLocalIdentifiers:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v53 = objc_msgSend(v32, "count");
          v54 = objc_msgSend(v42, "count");
          *(_DWORD *)buf = 134218240;
          v79 = v53;
          v80 = 2048;
          v81 = v54;
          _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Generating extra graph with %lu persons, %lu moments", buf, 0x16u);
        }
        v65 = v26;
        v56 = v42;
        v22 = v59;
        +[PGPNGraphHelper _createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:](PGPNGraphHelper, "_createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:", v60, v32, v42, &v65, v59);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v65;

        v44 = v43 != 0;
        v31 = v61;
        if (v43)
        {
          +[PGPNGraphHelper _socialGroupsLocalIdentifiersInGraph:includeMeNode:includeCouples:includeInvalid:](PGPNGraphHelper, "_socialGroupsLocalIdentifiersInGraph:includeMeNode:includeCouples:includeInvalid:", v43, 1, 0, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v45, "count"))
          {
            objc_msgSend(v62, "arrayByAddingObjectsFromArray:", v45);
            v46 = objc_claimAutoreleasedReturnValue();

            v24 = v57;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v47 = objc_msgSend(v45, "count");
              *(_DWORD *)buf = 134218242;
              v79 = v47;
              v80 = 2112;
              v81 = (uint64_t)v45;
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Adding %lu extra social groups, %@", buf, 0x16u);
            }
            v31 = v61;
          }
          else
          {
            v46 = (uint64_t)v62;
            v24 = v57;
          }

          v62 = (id)v46;
        }
        else
        {
          v24 = v57;
        }

        v26 = v55;
        v21 = v58;
      }

      if (!v44)
      {
        v48 = (void *)MEMORY[0x1E0C9AA60];
        v51 = v62;
        goto LABEL_43;
      }
      v27 = v62;
    }
    v51 = v27;
    v48 = v51;
LABEL_43:

    v8 = v63;
    goto LABEL_44;
  }
  v48 = (void *)MEMORY[0x1E0C9AA60];
LABEL_44:

  return v48;
}

+ (id)socialGroupsOverTheYearsWithPersonClusterManager:(id)a3 forPersons:(id)a4 updateBlock:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __objc2_class **v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __objc2_class **v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *context;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v49 = a4;
  v48 = a5;
  v47 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v50 = v7;
  objc_msgSend(v7, "pn_fetchMoments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v51 = v9;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v57 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v13, "addObject:", v19);
        objc_msgSend(v19, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v12);
        if (v21 > 31556926.0
          || (objc_msgSend(v51, "lastObject"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v22,
              v19 == v22))
        {
          v23 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v10, "addObject:", v23);

          v24 = v20;
          objc_msgSend(v13, "removeAllObjects");
          v12 = v24;
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    }
    while (v16);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v10;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
  if (v25)
  {
    v26 = v25;
    v46 = *(_QWORD *)v53;
    v27 = off_1E83FA000;
    while (2)
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v53 != v46)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        v30 = (void *)MEMORY[0x1CAA4EB2C]();
        -[__objc2_class _createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:](v27[471], "_createSocialGraphWithPersonClusterManager:persons:moments:inferredMePersonLocalIdentifier:updateBlock:", v50, v49, v29, 0, v48);
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          objc_autoreleasePoolPop(v30);

          objc_autoreleasePoolPop(context);
          v38 = (void *)MEMORY[0x1E0C9AA60];
          v37 = v47;
          goto LABEL_23;
        }
        v32 = (void *)v31;
        v33 = v27;
        -[__objc2_class _socialGroupsLocalIdentifiersInGraph:includeMeNode:includeCouples:includeInvalid:](v27[471], "_socialGroupsLocalIdentifiersInGraph:includeMeNode:includeCouples:includeInvalid:", v31, 1, 1, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObjectsFromArray:", v34);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v41 = objc_msgSend(v29, "count");
          objc_msgSend(v29, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "startDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lastObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "endDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "count");
          *(_DWORD *)buf = 134219010;
          v61 = v41;
          v62 = 2112;
          v63 = v44;
          v64 = 2112;
          v65 = v35;
          v66 = 2048;
          v67 = v36;
          v68 = 2112;
          v69 = v34;
          _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Created graph from %lu moments: %@ - %@.\nFound %lu social groups: %@", buf, 0x34u);

        }
        objc_autoreleasePoolPop(v30);
        v27 = v33;
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
      if (v26)
        continue;
      break;
    }
  }

  objc_autoreleasePoolPop(context);
  v37 = v47;
  objc_msgSend(v47, "allObjects");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v38;
}

+ (id)densityClusteringForObjects:(id)a3 maximumDistance:(double)a4 minimumNumberOfObjects:(unint64_t)a5 withDistanceBlock:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", v10);
  objc_msgSend(v11, "setMaximumDistance:", a4);
  objc_msgSend(v11, "setMinimumNumberOfObjects:", a5);
  objc_msgSend(v11, "performWithDataset:progressBlock:", v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "objects", (_QWORD)v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v13;
}

uint64_t __89__PGPNGraphHelper_multiLevelSocialGroupsWithPersonClusterManager_forPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "containsObject:", v3, (_QWORD)v11)
          && !objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40)))
        {
          v9 = 0;
          goto LABEL_12;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_12:

  return v9;
}

void __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "localIdentifier", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (*(_BYTE *)(a1 + 48) || (unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    if (*(_BYTE *)(a1 + 49) && objc_msgSend(*(id *)(a1 + 32), "length"))
      objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4, (_QWORD)v11);
  }

}

uint64_t __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__PGPNGraphHelper__socialGroupsLocalIdentifiersInGraph_includeMeNode_includeCouples_includeInvalid___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __122__PGPNGraphHelper__createSocialGraphWithPersonClusterManager_persons_moments_inferredMePersonLocalIdentifier_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "targetNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PRESENT"), v3, v4, 300, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

}

@end
