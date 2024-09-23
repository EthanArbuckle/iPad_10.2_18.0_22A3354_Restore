@implementation PGMeaningfulEventMemoryGenerator

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;
  id v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  void *v43;
  unint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint8_t *v72;
  double v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint8_t v78[4];
  int v79;
  __int16 v80;
  const char *v81;
  _QWORD v82[2];
  uint8_t buf[8];
  __int128 v84;
  uint64_t v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[5];

  v88[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeaningNodeCollection, "nodesInGraph:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_invalidMeaningLabelsForMemories");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "collectionBySubtracting:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "count"))
    {
      if (*((_BYTE *)v75 + 24))
      {
        *((_BYTE *)v75 + 24) = 1;
      }
      else
      {
        v37 = objc_msgSend(v8, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v75 + 24) = v37;
        if ((v37 & 1) == 0)
        {
          v36 = v60;
LABEL_49:

          v9 = v12;
          goto LABEL_50;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 57;
        LOWORD(v84) = 2080;
        *(_QWORD *)((char *)&v84 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemo"
                                        "ryGenerators/PGMeaningfulEventMemoryGenerator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v36 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_49;
    }
    objc_msgSend(v12, "reliableMeaningEdges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "momentNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "momentNodesWithContentScoreAbove:", 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v15, "count"))
    {
      if (*((_BYTE *)v75 + 24))
      {
        *((_BYTE *)v75 + 24) = 1;
      }
      else
      {
        v38 = objc_msgSend(v8, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v75 + 24) = v38;
        if ((v38 & 1) == 0)
        {
          v36 = v60;
          goto LABEL_48;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 64;
        LOWORD(v84) = 2080;
        *(_QWORD *)((char *)&v84 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemo"
                                        "ryGenerators/PGMeaningfulEventMemoryGenerator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v36 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_48;
    }
    objc_msgSend(v15, "momentNodesWithMinimumNumberOfExtendedCuratedAssets:", 13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      -[PGMemoryGenerator momentNodesWithBlockedFeatureCache](self, "momentNodesWithBlockedFeatureCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "momentNodesWithBlockedFeature");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "collectionBySubtracting:", v58);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v15, "count"))
      {
        if (*((_BYTE *)v75 + 24))
        {
          *((_BYTE *)v75 + 24) = 1;
        }
        else
        {
          v41 = objc_msgSend(v8, "isCancelledWithProgress:", 1.0);
          *((_BYTE *)v75 + 24) = v41;
          if ((v41 & 1) == 0)
          {
            v36 = v60;
            goto LABEL_47;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 76;
          LOWORD(v84) = 2080;
          *(_QWORD *)((char *)&v84 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/Meaning"
                                          "MemoryGenerators/PGMeaningfulEventMemoryGenerator.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v36 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_47;
      }
      -[PGMemoryGenerator memoryGenerationContext](self, "memoryGenerationContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "momentNodesAtSensitiveLocationsInGraph:", v6);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "collectionBySubtracting:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGGraphMeaningNodeCollection meaningNodesWithMeaning:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaning:inGraph:", 12, v6);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMeaningNodeCollection meaningNodesWithMeaning:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaning:inGraph:", 13, v6);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = CFSTR("Concert");
      v88[1] = CFSTR("Performance");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v19, v6);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = v21;
      objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v23);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGGraphPublicEventNodeCollection publicEventNodesWithCategories:inGraph:](PGGraphPublicEventNodeCollection, "publicEventNodesWithCategories:inGraph:", v55, v6);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = CFSTR("Lunch");
      v86[1] = CFSTR("Dinner");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
      v24 = objc_claimAutoreleasedReturnValue();
      +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v24, v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphBusinessNodeCollection restaurantBusinessNodesInGraph:](PGGraphBusinessNodeCollection, "restaurantBusinessNodesInGraph:", v6);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)v24;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&v84 = buf;
      *((_QWORD *)&v84 + 1) = 0x2020000000;
      v85 = 0;
      v44 = objc_msgSend(v57, "count");
      v26 = (void *)MEMORY[0x1E0D42A68];
      +[PGGraphMomentNode dateOfMoment](PGGraphMomentNode, "dateOfMoment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v27;
      +[PGGraphDateNode monthDayOfDate](PGGraphDateNode, "monthDayOfDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v82[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "chain:", v29);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v57, v54, objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
      v61[3] = &unk_1E84336D8;
      v62 = v12;
      v71 = &v74;
      v30 = v8;
      v63 = v30;
      v72 = buf;
      v31 = v25;
      v64 = v31;
      v32 = v45;
      v65 = v32;
      v46 = v51;
      v66 = v46;
      v50 = v49;
      v67 = v50;
      v52 = v48;
      v68 = v52;
      v33 = v47;
      v69 = v33;
      v34 = v60;
      v70 = v34;
      v73 = 1.0 / (double)v44;
      objc_msgSend(v53, "enumerateTargetsBySourceWithBlock:", v61);
      if (*((_BYTE *)v75 + 24))
      {
        *((_BYTE *)v75 + 24) = 1;
      }
      else
      {
        v39 = objc_msgSend(v30, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v75 + 24) = v39;
        if ((v39 & 1) == 0)
        {
          v36 = v34;
LABEL_36:

          _Block_object_dispose(buf, 8);
          v15 = v57;
LABEL_47:

          goto LABEL_48;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v78 = 67109378;
        v79 = 142;
        v80 = 2080;
        v81 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/PGMeaningfulEventMemoryGenerator.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v78, 0x12u);
      }
      v36 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_36;
    }
    if (*((_BYTE *)v75 + 24))
    {
      *((_BYTE *)v75 + 24) = 1;
    }
    else
    {
      v40 = objc_msgSend(v8, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v75 + 24) = v40;
      if ((v40 & 1) == 0)
      {
        v36 = v60;
LABEL_41:
        v15 = v16;
LABEL_48:

        goto LABEL_49;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 70;
      LOWORD(v84) = 2080;
      *(_QWORD *)((char *)&v84 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGe"
                                      "nerators/PGMeaningfulEventMemoryGenerator.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v36 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_41;
  }
  if (*((_BYTE *)v75 + 24))
  {
    *((_BYTE *)v75 + 24) = 1;
  }
  else
  {
    v35 = objc_msgSend(v8, "isCancelledWithProgress:", 1.0);
    *((_BYTE *)v75 + 24) = v35;
    if ((v35 & 1) == 0)
    {
      v36 = v60;
      goto LABEL_50;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 49;
    LOWORD(v84) = 2080;
    *(_QWORD *)((char *)&v84 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenera"
                                    "tors/PGMeaningfulEventMemoryGenerator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v36 = (id)MEMORY[0x1E0C9AA60];
LABEL_50:

  _Block_object_dispose(&v74, 8);
  return v36;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  PGMeaningfulEventMemoryGenerator *v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "memoryMomentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "memoryFeatureNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "childMeaningNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v10, "childMeaningNodes");
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  objc_msgSend(v10, "labels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("HolidayEvent"));
  v27 = self;
  -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "curationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "curationCriteriaFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v16)
  {
    objc_msgSend(v19, "curationCriteriaWithMeaningLabel:featureNodes:inGraph:client:", v15, v9, v7, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "anyNode");
    v26 = v9;
    v22 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "curationCriteriaWithCollection:meaningLabel:inGraph:client:", v23, v15, v7, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v22;
    v9 = v26;
  }

  v28.receiver = v27;
  v28.super_class = (Class)PGMeaningfulEventMemoryGenerator;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v28, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v6, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setCurationCriteria:", v21);
  return v24;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  PGMeaningfulEventTitleGenerator *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PGMeaningfulEventTitleGenerator *v23;
  NSObject *v24;
  void *v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  objc_msgSend(v10, "memoryMomentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") != 1)
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v28 = objc_msgSend(v12, "count");
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGMeaningfulEventMemoryGenerator] One moment node expected, found %d", buf, 8u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v10, "memoryFeatureNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (-[NSObject count](v14, "count") != 1)
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v28 = -[NSObject count](v14, "count");
      _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[PGMeaningfulEventMemoryGenerator] One meaning node expected, found %d", buf, 8u);
    }

LABEL_9:
    v23 = 0;
    goto LABEL_10;
  }
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMeaningEdgeCollection, "edgesFromNodes:toNodes:", v12, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "anyEdge");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [PGMeaningfulEventTitleGenerator alloc];
  objc_msgSend(v12, "anyNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "meaningLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = objc_msgSend(v15, "isReliable");
  objc_msgSend(v10, "memoryFeatureNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v11 = v19;
  v23 = -[PGMeaningfulEventTitleGenerator initWithCollection:meaningLabel:meaningIsReliable:titleGenerationContext:featureNodes:](v16, "initWithCollection:meaningLabel:meaningIsReliable:titleGenerationContext:featureNodes:", v17, v18, v22, v19, v21);

LABEL_10:
  return v23;
}

- (NSDate)lowerBoundLocalDate
{
  return self->_lowerBoundLocalDate;
}

- (void)setLowerBoundLocalDate:(id)a3
{
  objc_storeStrong((id *)&self->_lowerBoundLocalDate, a3);
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (unint64_t)meaning
{
  return self->_meaning;
}

- (void)setMeaning:(unint64_t)a3
{
  self->_meaning = a3;
}

- (NSString)meaningfulEventUUID
{
  return self->_meaningfulEventUUID;
}

- (void)setMeaningfulEventUUID:(id)a3
{
  objc_storeStrong((id *)&self->_meaningfulEventUUID, a3);
}

- (BOOL)skipsCollectionTitle
{
  return self->_skipsCollectionTitle;
}

- (void)setSkipsCollectionTitle:(BOOL)a3
{
  self->_skipsCollectionTitle = a3;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (void)setMemoryCategory:(unint64_t)a3
{
  self->_memoryCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningfulEventUUID, 0);
  objc_storeStrong((id *)&self->_lowerBoundLocalDate, 0);
}

void __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "reliableMeaningNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionByIntersecting:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "distinctMeaningNodesSubset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2;
  v16[3] = &unk_1E84336B0;
  v27 = *(_QWORD *)(a1 + 104);
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 112);
  v17 = v12;
  v28 = v13;
  v18 = *(id *)(a1 + 48);
  v15 = v7;
  v19 = v15;
  v20 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 64);
  v22 = *(id *)(a1 + 72);
  v23 = *(id *)(a1 + 80);
  v24 = *(id *)(a1 + 88);
  v14 = v8;
  v25 = v14;
  v26 = *(id *)(a1 + 96);
  objc_msgSend(v11, "enumerateIdentifiersAsCollectionsWithBlock:", v16);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    *a4 = 1;
  else
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = *(double *)(a1 + 120)
                                                                 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8)
                                                                             + 24);

}

void __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  char v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PGGraphMemory *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
  }
  else
  {
    v23 = v6;
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24));
    v6 = v23;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    *a4 = 1;
    goto LABEL_15;
  }
  v24 = v6;
  v9 = objc_msgSend(v6, "intersectsCollection:", *(_QWORD *)(a1 + 40));
  v6 = v24;
  if (!v9
    || (objc_msgSend(*(id *)(a1 + 48), "businessNodes"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "intersectsCollection:", *(_QWORD *)(a1 + 56)),
        v10,
        v6 = v24,
        v11))
  {
    objc_msgSend(v6, "featureNodeCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "featureNodeCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionByFormingUnionWith:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "isEqual:", *(_QWORD *)(a1 + 64)))
    {
      objc_msgSend(*(id *)(a1 + 48), "birthdayPersonNodes");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v24, "isEqual:", *(_QWORD *)(a1 + 72)))
      {
        if (!objc_msgSend(*(id *)(a1 + 80), "containsCollection:", v24))
          goto LABEL_14;
        objc_msgSend(*(id *)(a1 + 48), "publicEventNodes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "collectionByIntersecting:", *(_QWORD *)(a1 + 88));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "performerNodes");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "collectionByFormingUnionWith:", v22);
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v22;
LABEL_13:

        v14 = (void *)v17;
LABEL_14:
        objc_msgSend(*(id *)(a1 + 96), "featureNodeCollection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "collectionByFormingUnionWith:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", 16, 11001, *(_QWORD *)(a1 + 48), v19);
        objc_msgSend(*(id *)(a1 + 104), "addObject:", v20);

        v6 = v24;
        goto LABEL_15;
      }
      objc_msgSend(*(id *)(a1 + 48), "celebratedHolidayNodes");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    objc_msgSend(v14, "collectionByFormingUnionWith:", v15);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_15:

}

+ (id)_invalidMeaningLabelsForMemories
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObject:", CFSTR("Gathering"));
  objc_msgSend(v2, "addObject:", CFSTR("Restaurant"));
  objc_msgSend(v2, "addObject:", CFSTR("Breakfast"));
  return v2;
}

@end
