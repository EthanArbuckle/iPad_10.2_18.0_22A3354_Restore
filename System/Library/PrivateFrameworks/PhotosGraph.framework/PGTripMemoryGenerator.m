@implementation PGTripMemoryGenerator

+ (unint64_t)memoryCategory
{
  return 19;
}

+ (unint64_t)memoryCategorySubcategory
{
  return 12001;
}

+ (id)tripTypeNodesInGraph:(id)a3
{
  return +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "concludedTripTypeNodesInGraph:", a3);
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
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
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  double v37;
  char v38;
  double Current;
  char v40;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  _QWORD v51[4];
  id v52;
  PGTripMemoryGenerator *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  int buf;
  int v74;
  __int16 v75;
  const char *v76;
  _QWORD v77[2];
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = a4;
  v48 = _Block_copy(v46);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  objc_msgSend((id)objc_opt_class(), "tripTypeNodesInGraph:", v6);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphHighlightTypeNode highlightGroupOfType](PGGraphHighlightTypeNode, "highlightGroupOfType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", v47, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transposed");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "sources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = 0;
    *(_QWORD *)&v79 = &v78;
    *((_QWORD *)&v79 + 1) = 0x2020000000;
    v80 = 0;
    v13 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphHighlightGroupNode highlightOfHighlightGroup](PGGraphHighlightGroupNode, "highlightOfHighlightGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v14;
    +[PGGraphHighlightNode momentInHighlight](PGGraphHighlightNode, "momentInHighlight");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chain:", v16);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D429D8];
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "adjacencyWithSources:relation:targetsClass:", v11, v45, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator momentNodesWithBlockedFeatureCache](self, "momentNodesWithBlockedFeatureCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "momentNodesWithBlockedFeature");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "momentNodesAtSensitiveLocationsInGraph:", v6);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "subtractingTargetsWith:", v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "subtractingTargetsWith:", v43);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGTripMemoryGenerator featuredLocationOrAreaNodesByTripNodeForTripNodes:](self, "featuredLocationOrAreaNodesByTripNodeForTripNodes:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sources");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "intersectingSourcesWith:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "targets");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "interestingWithAlternateJunkingSubsetFromMomentNodes:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "sources");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = 3221225472;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[2] = __77__PGTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
    v51[3] = &unk_1E8429378;
    v60 = &v78;
    v63 = 1.0 / (double)v12;
    v31 = v48;
    v59 = v31;
    v61 = &v65;
    v64 = 0x3F847AE147AE147BLL;
    v62 = &v69;
    v32 = v26;
    v52 = v32;
    v53 = self;
    v33 = v29;
    v54 = v33;
    v55 = v49;
    v56 = v6;
    v57 = v11;
    v34 = v42;
    v58 = v34;
    objc_msgSend(v30, "enumerateUUIDs:", v51);

    if (*((_BYTE *)v70 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        v74 = 119;
        v75 = 2080;
        v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/TripMemoryGenerators/PGTripMemoryGenerator.m";
        v35 = MEMORY[0x1E0C81028];
LABEL_5:
        _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      if (!v31
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v66[3] < 0.01)
        || (v66[3] = Current,
            v50 = 0,
            (*((void (**)(id, char *, double))v31 + 2))(v31, &v50, 1.0),
            v40 = *((_BYTE *)v70 + 24) | v50,
            (*((_BYTE *)v70 + 24) = v40) == 0))
      {
        v36 = v34;
        goto LABEL_19;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        v74 = 120;
        v75 = 2080;
        v76 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/TripMemoryGenerators/PGTripMemoryGenerator.m";
        v35 = MEMORY[0x1E0C81028];
        goto LABEL_5;
      }
    }
    v36 = (id)MEMORY[0x1E0C9AA60];
LABEL_19:

    _Block_object_dispose(&v78, 8);
    goto LABEL_20;
  }
  if (v48)
  {
    v37 = CFAbsoluteTimeGetCurrent();
    if (v37 - v66[3] >= 0.01)
    {
      v66[3] = v37;
      LOBYTE(buf) = 0;
      (*((void (**)(void *, int *, double))v48 + 2))(v48, &buf, 1.0);
      v38 = *((_BYTE *)v70 + 24) | buf;
      *((_BYTE *)v70 + 24) = v38;
      if (v38)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v78 = 0x4004000202;
          LOWORD(v79) = 2080;
          *(_QWORD *)((char *)&v79 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/TripMem"
                                          "oryGenerators/PGTripMemoryGenerator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v78, 0x12u);
        }
      }
    }
  }
  v36 = (id)MEMORY[0x1E0C9AA60];
LABEL_20:

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

  return v36;
}

- (id)featuredLocationOrAreaNodesByTripNodeForTripNodes:(id)a3
{
  MABinaryAdjacency *featuredLocationOrAreaNodesByTripNode;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MABinaryAdjacency *v13;
  MABinaryAdjacency *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  featuredLocationOrAreaNodesByTripNode = self->_featuredLocationOrAreaNodesByTripNode;
  if (!featuredLocationOrAreaNodesByTripNode)
  {
    v5 = (void *)MEMORY[0x1E0D42A68];
    v6 = a3;
    +[PGGraphHighlightGroupNodeCollection locationFeatureOfHighlightGroup](PGGraphHighlightGroupNodeCollection, "locationFeatureOfHighlightGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    +[PGGraphHighlightGroupNodeCollection areaFeatureOfHighlightGroup](PGGraphHighlightGroupNodeCollection, "areaFeatureOfHighlightGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "union:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D429D8];
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "adjacencyWithSources:relation:targetsClass:", v6, v10, v12);
    v13 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();

    v14 = self->_featuredLocationOrAreaNodesByTripNode;
    self->_featuredLocationOrAreaNodesByTripNode = v13;

    featuredLocationOrAreaNodesByTripNode = self->_featuredLocationOrAreaNodesByTripNode;
  }
  return featuredLocationOrAreaNodesByTripNode;
}

- (id)relevantKeyCurationFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v6 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  objc_msgSend(a3, "memoryFeatureNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "uuids");
    v12 = objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "curationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper keyAssetFetchResultForHighlightGroupUUIDs:curationManager:allowGuestAsset:](PGMemoryGenerationHelper, "keyAssetFetchResultForHighlightGroupUUIDs:curationManager:allowGuestAsset:", v12, v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v15, v16, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        -[NSObject anyObject](v12, "anyObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v20;
        _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] No key asset found for trip %@", (uint8_t *)&v21, 0xCu);

      }
      v17 = 0;
    }

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = 67109120;
      LODWORD(v22) = objc_msgSend(v11, "count");
      _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] One trip highlight group expected, found %d", (uint8_t *)&v21, 8u);
    }
    v17 = 0;
  }

  return v17;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGTripMemoryGenerator;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v7, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastPassMovieAdditionEnabled:", 1);
  return v5;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  objc_super v27;

  v7 = a5;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PGTripMemoryGenerator;
  -[PGMemoryGenerator relevantFeederForTriggeredMemory:inGraph:allowGuestAsset:progressReporter:](&v27, sel_relevantFeederForTriggeredMemory_inGraph_allowGuestAsset_progressReporter_, a3, v10, v7, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetFetchResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CD1390];
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "curationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v12, 22, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v16, "count") > 0xC)
  {
    +[PGMemoryGeneratorUtils filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:withGraph:](PGMemoryGeneratorUtils, "filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:withGraph:", v16, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v26, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchPropertySets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v18, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v19, v20, v21, v22, 0, 0);

    -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v23, v24, v10);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v11;
  }

  return v17;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  PGTripMemoryTitleGenerator *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _DWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  objc_msgSend(a3, "memoryFeatureNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphLocationNodeCollection, "subsetInCollection:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection subsetInCollection:](PGGraphAreaNodeCollection, "subsetInCollection:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject count](v13, "count");
    if (v15 + objc_msgSend(v14, "count"))
    {
      +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightTypeNodeCollection, "subsetInCollection:", v11);
      v16 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v16, "count"))
      {
        -[NSObject labels](v16, "labels");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", CFSTR("ShortTrip"));

        v17 = -[PGTripMemoryTitleGenerator initWithHighlightGroupNodeAsCollection:type:titleGenerationContext:]([PGTripMemoryTitleGenerator alloc], "initWithHighlightGroupNodeAsCollection:type:titleGenerationContext:", v12, v19, v10);
LABEL_14:

        goto LABEL_15;
      }
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22[0]) = 0;
        _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] No trip type nodes found", (uint8_t *)v22, 2u);
      }

    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22[0]) = 0;
        _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] No location or area nodes found", (uint8_t *)v22, 2u);
      }
    }
    v17 = 0;
    goto LABEL_14;
  }
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v22[0] = 67109120;
    v22[1] = objc_msgSend(v12, "count");
    _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGTripMemoryGenerator] One trip highlight group expected, found %d", (uint8_t *)v22, 8u);
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredLocationOrAreaNodesByTripNode, 0);
}

void __77__PGTripMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  double Current;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  double v23;
  double v24;
  PGGraphHighlightGroupNodeCollection *v25;
  uint64_t v26;
  void *v27;
  PGGraphHighlightGroupNodeCollection *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PGGraphMemory *v35;
  uint64_t v36;
  PGGraphMemory *v37;
  int v38;
  id v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                          + 24);
  if (!*(_QWORD *)(a1 + 88)
    || (Current = CFAbsoluteTimeGetCurrent(),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8),
        Current - *(double *)(v9 + 24) < *(double *)(a1 + 128))
    || (*(double *)(v9 + 24) = Current,
        LOBYTE(v38) = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 88) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8)
                                                                                + 24)) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "processedScenesAndFacesCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "allMomentNodesInCollectionHaveScenesProcessed:", v10);

    if ((v12 & 1) != 0)
    {
      v13 = objc_msgSend(*(id *)(a1 + 48), "intersectsCollection:", v10);
      v14 = *(void **)(a1 + 40);
      if ((v13 & 1) != 0)
      {
        objc_msgSend(v14, "memoryGenerationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "numberOfAssetsInExtendedCurationForMomentNodes:", v10);

        v17 = *(void **)(a1 + 40);
        if (v16 > 0xC)
        {
          objc_msgSend(v17, "memoryGenerationContext");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "averageContentScoreForMomentNodes:", v10);
          v24 = v23;

          if (v24 > 0.5)
          {
            objc_msgSend(*(id *)(a1 + 56), "targetsForSourceIdentifier:", a2);
            v18 = objc_claimAutoreleasedReturnValue();
            v25 = [PGGraphHighlightGroupNodeCollection alloc];
            v26 = *(_QWORD *)(a1 + 64);
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
            v28 = -[MAElementCollection initWithGraph:elementIdentifiers:](v25, "initWithGraph:elementIdentifiers:", v26, v27);

            -[PGGraphHighlightNodeCollection featureNodeCollection](v28, "featureNodeCollection");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject featureNodeCollection](v18, "featureNodeCollection");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "collectionByFormingUnionWith:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 40), "featuredLocationOrAreaNodesByTripNodeForTripNodes:", *(_QWORD *)(a1 + 72));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "targetsForSourceIdentifier:", a2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "collectionByFormingUnionWith:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = [PGGraphMemory alloc];
            v36 = objc_msgSend((id)objc_opt_class(), "memoryCategory");
            v37 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:](v35, "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", v36, objc_msgSend((id)objc_opt_class(), "memoryCategorySubcategory"), v10, v34);
            objc_msgSend(*(id *)(a1 + 80), "addObject:", v37);

            goto LABEL_16;
          }
          objc_msgSend(*(id *)(a1 + 40), "loggingConnection");
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            goto LABEL_16;
          v38 = 138412546;
          v39 = v7;
          v40 = 2048;
          v41 = v24;
          v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, average moment content score not high enough (%f)";
          v20 = v18;
          v21 = 22;
          goto LABEL_15;
        }
        objc_msgSend(v17, "loggingConnection");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v38 = 138412546;
          v39 = v7;
          v40 = 1024;
          LODWORD(v41) = v16;
          v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, not enough assets in extended curation (%d)";
          v20 = v18;
          v21 = 18;
LABEL_15:
          _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v38, v21);
        }
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v14, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v38 = 138412290;
      v39 = v7;
      v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, no interesting moment nodes found";
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v38 = 138412290;
      v39 = v7;
      v19 = "[PGTripMemoryGenerator] Not creating memory for trip with uuid %@, not all moments in trip have scenes processed";
    }
    v20 = v18;
    v21 = 12;
    goto LABEL_15;
  }
  *a4 = 1;
LABEL_17:

}

@end
