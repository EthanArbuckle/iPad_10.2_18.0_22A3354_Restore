@implementation PGTripFoodieMemoryGenerator

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  double v31;
  char v32;
  double Current;
  char v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  double v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  int buf;
  int v62;
  __int16 v63;
  const char *v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40 = _Block_copy(v7);
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = (double *)&v53;
  v55 = 0x2020000000;
  v56 = 0;
  +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", CFSTR("Food"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentNodes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "concludedTripTypeNodesInGraph:", v6);
  v36 = v7;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "highlightGroupNodes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphHighlightGroupNode momentInHighlight](PGGraphHighlightGroupNode, "momentInHighlight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", v39, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "intersectingTargetsWith:", v38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:](PGFoodieMemoryGenerator, "incompatibleMomentNodesInGraph:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subtractingTargetsWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryGenerator momentNodesWithBlockedFeatureCache](self, "momentNodesWithBlockedFeatureCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "momentNodesWithBlockedFeature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "subtractingTargetsWith:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "targets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
  v51[3] = &unk_1E8433910;
  v21 = v8;
  v52 = v21;
  objc_msgSend(v19, "filteredCollectionUsingBlock:", v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "intersectingTargetsWith:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "sources");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v65 = 0;
    *(_QWORD *)&v66 = &v65;
    *((_QWORD *)&v66 + 1) = 0x2020000000;
    v67 = 0;
    v42[0] = v20;
    v42[1] = 3221225472;
    v42[2] = __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_160;
    v42[3] = &unk_1E842C748;
    v46 = &v65;
    v49 = 1.0 / (double)v25;
    v27 = v40;
    v50 = 0x3F847AE147AE147BLL;
    v47 = &v53;
    v48 = &v57;
    v45 = v27;
    v42[4] = self;
    v43 = v21;
    v28 = v26;
    v44 = v28;
    objc_msgSend(v23, "enumerateTargetsBySourceWithBlock:", v42);
    if (*((_BYTE *)v58 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        v62 = 77;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/FoodieMemoryGenerators/PGTripFoodieMemoryGenerator.m";
        v29 = MEMORY[0x1E0C81028];
LABEL_5:
        _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      if (!v27
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v54[3] < 0.01)
        || (v54[3] = Current,
            v41 = 0,
            (*((void (**)(id, char *, double))v27 + 2))(v27, &v41, 1.0),
            v34 = *((_BYTE *)v58 + 24) | v41,
            (*((_BYTE *)v58 + 24) = v34) == 0))
      {
        v30 = v28;
        goto LABEL_19;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        v62 = 78;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/FoodieMemoryGenerators/PGTripFoodieMemoryGenerator.m";
        v29 = MEMORY[0x1E0C81028];
        goto LABEL_5;
      }
    }
    v30 = (id)MEMORY[0x1E0C9AA60];
LABEL_19:

    _Block_object_dispose(&v65, 8);
    goto LABEL_20;
  }
  if (v40)
  {
    v31 = CFAbsoluteTimeGetCurrent();
    if (v31 - v54[3] >= 0.01)
    {
      v54[3] = v31;
      LOBYTE(buf) = 0;
      (*((void (**)(void *, int *, double))v40 + 2))(v40, &buf, 1.0);
      v32 = *((_BYTE *)v58 + 24) | buf;
      *((_BYTE *)v58 + 24) = v32;
      if (v32)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v65 = 0x2A04000202;
          LOWORD(v66) = 2080;
          *(_QWORD *)((char *)&v66 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/FoodieM"
                                          "emoryGenerators/PGTripFoodieMemoryGenerator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v65, 0x12u);
        }
      }
    }
  }
  v30 = (id)MEMORY[0x1E0C9AA60];
LABEL_20:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  return v30;
}

BOOL __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", a2, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "numberOfRelevantAssets") > 1;

  return v3;
}

void __83__PGTripFoodieMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_160(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  double Current;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  PGLocationTripTitleUtility *v16;
  void *v17;
  void *v18;
  PGLocationTripTitleUtility *v19;
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
  NSObject *v30;
  PGGraphMemory *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 88)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24);
  if (*(_QWORD *)(a1 + 56)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v10 + 24) = Current,
        LOBYTE(v32) = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "uuids");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "processedScenesAndFacesCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "allMomentNodesInCollectionHaveScenesProcessed:", v8);

    if ((v14 & 1) != 0)
    {
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v8, *(_QWORD *)(a1 + 40));
      v15 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)-[NSObject numberOfRelevantAssets](v15, "numberOfRelevantAssets") >= 0xD)
      {
        v16 = [PGLocationTripTitleUtility alloc];
        objc_msgSend(v8, "temporarySet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "locationHelper");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PGLocationTripTitleUtility initWithMomentNodes:filterMomentsAndCities:locationHelper:](v16, "initWithMomentNodes:filterMomentsAndCities:locationHelper:", v17, 1, v18);

        if (-[PGLocationTripTitleUtility tripTitleType](v19, "tripTitleType") - 3 >= 0xFFFFFFFFFFFFFFFELL)
        {
          -[PGLocationTripTitleUtility usedLocationNodes](v19, "usedLocationNodes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "anyObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "locationOrAreaNodeCollection");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "addressNodes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "momentNodes");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "collectionByIntersecting:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v25, "count"))
          {
            objc_msgSend(*(id *)(a1 + 40), "featureNodeCollection");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "featureNodeCollection");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "collectionByFormingUnionWith:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "featureNodeCollection");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "collectionByFormingUnionWith:", v29);
            v30 = objc_claimAutoreleasedReturnValue();

            v31 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", 9, 6011, v25, v30);
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v31);

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v32 = 138412290;
              v33 = v12;
              _os_log_error_impl(&dword_1CA237000, v30, OS_LOG_TYPE_ERROR, "[PGTripFoodieMemoryGenerator] No moment nodes at trip's used location nodes address for trip with uuid %@", (uint8_t *)&v32, 0xCu);
            }
          }

          v8 = v25;
        }

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v32 = 138412290;
        v33 = v12;
        _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[PGTripFoodieMemoryGenerator] Not creating foodie memory for trip with uuid %@, not all moments in trip have scenes processed", (uint8_t *)&v32, 0xCu);
      }
    }

  }
}

@end
