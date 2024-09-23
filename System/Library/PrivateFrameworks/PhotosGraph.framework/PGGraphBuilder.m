@implementation PGGraphBuilder

- (void)checkAndInsertPersonIsAroundEdgeFromMeNode:(id)a3 toMomentNode:(id)a4 withClueCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[PGGraphBuilder serviceManager](self, "serviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "universalDateInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __103__PGGraphBuilder_Presence__checkAndInsertPersonIsAroundEdgeFromMeNode_toMomentNode_withClueCollection___block_invoke;
  v17[3] = &unk_1E8428C18;
  v13 = v11;
  v18 = v13;
  v14 = v12;
  v19 = v14;
  v20 = &v21;
  objc_msgSend(v10, "enumerateLocationClues:", v17);
  if (*((_BYTE *)v22 + 24))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v16 = -[PGGraphPeoplePersonIsAroundEdge initFromPersonNode:toMomentNode:]([PGGraphPeoplePersonIsAroundEdge alloc], "initFromPersonNode:toMomentNode:", v8, v9);
    objc_msgSend(v15, "addEdge:", v16);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v15);

  }
  _Block_object_dispose(&v21, 8);

}

void __103__PGGraphBuilder_Presence__checkAndInsertPersonIsAroundEdgeFromMeNode_toMomentNode_withClueCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D71860];
  v9 = v6;
  objc_msgSend(v6, "horizontalAccuracy");
  if ((objc_msgSend(v7, "horizontalAccuracyIsCoarse:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "locationOfInterestCloseToLocation:inDateInterval:", v9, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (BOOL)_shouldUpdateCurationScore:(double)a3 withNewCurationScore:(double)a4
{
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  double v11;
  BOOL v12;
  BOOL v13;
  BOOL v16;

  if (a3 != 0.0 && *MEMORY[0x1E0D77DE0] != a3 && *MEMORY[0x1E0D77DE0] == a4)
    return 0;
  v5 = *MEMORY[0x1E0D77DD8];
  v6 = *MEMORY[0x1E0D77DD0];
  v7 = a3 <= a4 || v6 <= a3;
  v8 = v7 || v5 > a3;
  v9 = v8 || v5 > a4;
  if (!v9 && v6 > a4)
    return 0;
  v11 = *MEMORY[0x1E0D77DE8];
  if (a3 > a4)
  {
    v12 = v5 <= a3 || v11 > a3;
    v13 = v12 || v5 <= a4;
    if (!v13 && v11 <= a4)
      return 0;
  }
  v16 = v11 <= a4;
  if (*MEMORY[0x1E0D77DE0] > a4)
    v16 = 1;
  if (*MEMORY[0x1E0D77DE0] > a3)
    v16 = 1;
  if (v11 <= a3)
    v16 = 1;
  return a3 <= a4 || v16;
}

- (void)_persistCurationScores:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphBuilder photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__PGGraphBuilder_Curation___persistCurationScores___block_invoke;
    v10[3] = &unk_1E8435668;
    v11 = v4;
    v9 = 0;
    v6 = objc_msgSend(v5, "performChangesAndWait:error:", v10, &v9);
    v7 = v9;

    if ((v6 & 1) == 0)
    {
      -[PGGraphBuilder loggingConnection](self, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Error saving curation scores to database: %@", buf, 0xCu);
      }

    }
  }

}

- (void)addCurationScore:(double)a3 forAsset:(id)a4
{
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "cacheCurationScore:", a3);
  v6 = self->_curationScoreByAsset;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_curationScoreByAsset, "setObject:forKeyedSubscript:", v7, v9);

  if ((unint64_t)-[NSMutableDictionary count](self->_curationScoreByAsset, "count") < 0xC8)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)-[NSMutableDictionary copy](self->_curationScoreByAsset, "copy");
    -[NSMutableDictionary removeAllObjects](self->_curationScoreByAsset, "removeAllObjects");
  }
  objc_sync_exit(v6);

  if (v8)
    -[PGGraphBuilder _persistCurationScores:](self, "_persistCurationScores:", v8);

}

- (void)persistPendingScores
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  id v8;

  v3 = self->_curationScoreByAsset;
  objc_sync_enter(v3);
  v8 = (id)-[NSMutableDictionary copy](self->_curationScoreByAsset, "copy");
  -[NSMutableDictionary removeAllObjects](self->_curationScoreByAsset, "removeAllObjects");
  objc_sync_exit(v3);

  -[PGGraphBuilder _persistCurationScores:](self, "_persistCurationScores:", v8);
  v4 = self->_interactionScoreByAsset;
  objc_sync_enter(v4);
  v5 = (void *)-[NSMutableDictionary copy](self->_interactionScoreByAsset, "copy");
  -[NSMutableDictionary removeAllObjects](self->_interactionScoreByAsset, "removeAllObjects");
  objc_sync_exit(v4);

  -[PGGraphBuilder _persistInteractionScores:](self, "_persistInteractionScores:", v5);
  v6 = self->_generativeMemoryCreationEligibilityStateByAsset;
  objc_sync_enter(v6);
  v7 = (void *)-[NSMutableDictionary copy](self->_generativeMemoryCreationEligibilityStateByAsset, "copy");
  -[NSMutableDictionary removeAllObjects](self->_generativeMemoryCreationEligibilityStateByAsset, "removeAllObjects");
  objc_sync_exit(v6);

  -[PGGraphBuilder _persistGenerativeMemoryCreationEligibilityState:](self, "_persistGenerativeMemoryCreationEligibilityState:", v7);
}

- (void)_persistInteractionScores:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphBuilder photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PGGraphBuilder_Curation___persistInteractionScores___block_invoke;
    v10[3] = &unk_1E8435668;
    v11 = v4;
    v9 = 0;
    v6 = objc_msgSend(v5, "performChangesAndWait:error:", v10, &v9);
    v7 = v9;

    if ((v6 & 1) == 0)
    {
      -[PGGraphBuilder loggingConnection](self, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Error saving interaction scores to database: %@", buf, 0xCu);
      }

    }
  }

}

- (void)_persistGenerativeMemoryCreationEligibilityState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphBuilder photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PGGraphBuilder_Curation___persistGenerativeMemoryCreationEligibilityState___block_invoke;
    v10[3] = &unk_1E8435668;
    v11 = v4;
    v9 = 0;
    v6 = objc_msgSend(v5, "performChangesAndWait:error:", v10, &v9);
    v7 = v9;

    if ((v6 & 1) == 0)
    {
      -[PGGraphBuilder loggingConnection](self, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Error persisting eligibility state to database: %@", buf, 0xCu);
      }

    }
  }

}

- (void)addInteractionScore:(float)a3 forAsset:(id)a4
{
  NSMutableDictionary *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = self->_interactionScoreByAsset;
  objc_sync_enter(v6);
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_interactionScoreByAsset, "setObject:forKeyedSubscript:", v8, v10);

  if ((unint64_t)-[NSMutableDictionary count](self->_interactionScoreByAsset, "count") < 0xC8)
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)-[NSMutableDictionary copy](self->_interactionScoreByAsset, "copy");
    -[NSMutableDictionary removeAllObjects](self->_interactionScoreByAsset, "removeAllObjects");
  }
  objc_sync_exit(v6);

  if (v9)
    -[PGGraphBuilder _persistInteractionScores:](self, "_persistInteractionScores:", v9);

}

- (void)addGenerativeMemoryCreationEligibilityState:(signed __int16)a3 forAsset:(id)a4
{
  uint64_t v4;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  v6 = self->_generativeMemoryCreationEligibilityStateByAsset;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_generativeMemoryCreationEligibilityStateByAsset, "setObject:forKeyedSubscript:", v7, v9);

  if ((unint64_t)-[NSMutableDictionary count](self->_generativeMemoryCreationEligibilityStateByAsset, "count") < 0xC8)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)-[NSMutableDictionary copy](self->_generativeMemoryCreationEligibilityStateByAsset, "copy");
    -[NSMutableDictionary removeAllObjects](self->_generativeMemoryCreationEligibilityStateByAsset, "removeAllObjects");
  }
  objc_sync_exit(v6);

  if (v8)
    -[PGGraphBuilder _persistGenerativeMemoryCreationEligibilityState:](self, "_persistGenerativeMemoryCreationEligibilityState:", v8);

}

- (void)insertAssetCurationScoreInLibraryForFeeder:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  double Current;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  _BOOL4 v33;
  double v34;
  double v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[12];
  id obj;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  uint8_t buf[4];
  _BYTE v58[18];
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  v9 = 0.0;
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v56 = 0;
      v8[2](v8, &v56, 0.0);
      if (v56)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = 218;
          *(_WORD *)&v58[4] = 2080;
          *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Curation.m";
          v11 = MEMORY[0x1E0C81028];
          goto LABEL_53;
        }
        goto LABEL_54;
      }
      v9 = Current;
    }
  }
  if (!v6 || -[PGGraphBuilder keepsExistingAssetCurationScores](self, "keepsExistingAssetCurationScores"))
    goto LABEL_48;
  v41 = v7;
  v42 = v6;
  objc_msgSend(v6, "allItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77E18], "scoringContextWithAssets:aestheticScoreThresholdToBeAwesome:", v12, self->_topTierAestheticScore);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (!v13)
  {
    v50 = 0;
    *(_QWORD *)&v47[4] = 0;
    v45 = 0;
    v46 = 0;
    goto LABEL_47;
  }
  v14 = v13;
  v45 = 0;
  v46 = 0;
  *(_DWORD *)&v47[8] = 0;
  v50 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v53;
  v17 = *MEMORY[0x1E0D77DD8];
  v18 = *MEMORY[0x1E0D77DE8];
  v44 = *MEMORY[0x1E0D77DF0];
  v19 = (unsigned __int16)*MEMORY[0x1E0D71F80];
  *(_QWORD *)v47 = (unsigned __int16)*MEMORY[0x1E0D71F78];
  while (2)
  {
    v20 = 0;
    v49 = v15;
    v43 = v15 + v14;
    do
    {
      if (*(_QWORD *)v53 != v16)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v20);
      v22 = (void *)MEMORY[0x1CAA4EB2C]();
      if (v8)
      {
        if (!((v49 + v20) % 10))
        {
          v23 = CFAbsoluteTimeGetCurrent();
          if (v23 - v9 >= 0.01)
          {
            buf[0] = 0;
            v8[2](v8, buf, 0.1);
            v9 = v23;
            if (buf[0])
            {
              objc_autoreleasePoolPop(v22);

              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v58 = 306;
                *(_WORD *)&v58[4] = 2080;
                *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/PGGraphBuilder+Curation.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              v7 = v41;
              v6 = v42;
              goto LABEL_54;
            }
          }
        }
      }
      objc_msgSend(v21, "clsInteractionScore");
      v25 = v24;
      objc_msgSend(v21, "curationModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "interactionScoreWithAsset:", v21);
      v28 = v27;

      if (vabds_f32(v28, v25) >= 0.001)
      {
        *(float *)&v29 = v28;
        -[PGGraphBuilder addInteractionScore:forAsset:](self, "addInteractionScore:forAsset:", v21, v29);
      }
      objc_msgSend(v21, "scoreInContext:", v51);
      v31 = v30;
      if (v30 >= v17)
      {
        ++v50;
      }
      else if (v30 >= v18)
      {
        ++*(_QWORD *)&v47[4];
      }
      else if (v30 <= v44)
      {
        ++v45;
      }
      else
      {
        ++v46;
      }
      objc_msgSend(v21, "sceneAnalysisProperties");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v19 != (unsigned __int16)objc_msgSend(v32, "sceneAnalysisVersion")
         && *(_DWORD *)v47 != (unsigned __int16)objc_msgSend(v21, "faceAnalysisVersion");

      objc_msgSend(v21, "curationScore");
      v35 = v34;
      if ((objc_msgSend(MEMORY[0x1E0CD1390], "isScore:closeToValue:", v31, v34) & 1) != 0)
        goto LABEL_34;
      if (v33
        || -[PGGraphBuilder _shouldUpdateCurationScore:withNewCurationScore:](self, "_shouldUpdateCurationScore:withNewCurationScore:", v35, v31))
      {
        -[PGGraphBuilder addCurationScore:forAsset:](self, "addCurationScore:forAsset:", v21, v31);
LABEL_34:
        if (v33)
        {
          v36 = -[PGGraphBuilder generativeMemoryCreationEligibleStateWithAsset:](self, "generativeMemoryCreationEligibleStateWithAsset:", v21);
          if ((_DWORD)v36 != objc_msgSend(v21, "generativeMemoryCreationEligibilityState"))
            -[PGGraphBuilder addGenerativeMemoryCreationEligibilityState:forAsset:](self, "addGenerativeMemoryCreationEligibilityState:forAsset:", v36, v21);
        }
        goto LABEL_40;
      }
      -[PGGraphBuilder loggingConnection](self, "loggingConnection");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v21, "localIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(double *)v58 = v35;
        *(_WORD *)&v58[8] = 2048;
        *(double *)&v58[10] = v31;
        v59 = 2114;
        v60 = v38;
        _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "Keeping previous curationScore (%.3f) over the new one (%.3f) for asset %{public}@", buf, 0x20u);

      }
LABEL_40:
      objc_autoreleasePoolPop(v22);
      ++v20;
    }
    while (v14 != v20);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    v15 = v43;
    if (v14)
      continue;
    break;
  }
LABEL_47:

  v39 = self->_numberOfDefaultAssets + v46;
  self->_numberOfUtilityAssets += v45;
  self->_numberOfDefaultAssets = v39;
  v40 = self->_numberOfBetterAssets + v50;
  self->_numberOfImprovedAssets += *(_QWORD *)&v47[4];
  self->_numberOfBetterAssets = v40;

  v7 = v41;
  v6 = v42;
LABEL_48:
  if (v8)
  {
    if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
    {
      v56 = 0;
      v8[2](v8, &v56, 1.0);
      if (v56)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = 316;
          *(_WORD *)&v58[4] = 2080;
          *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Curation.m";
          v11 = MEMORY[0x1E0C81028];
LABEL_53:
          _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }
LABEL_54:

}

- (void)computeAndPersistTopTierAestheticScores
{
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[PGGraphBuilder photoLibrary](self, "photoLibrary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "topTierAestheticScoreForRatio:inPhotoLibrary:", v9, 0.01);
  self->_topTierAestheticScore = v3;
  objc_msgSend((id)objc_opt_class(), "topTierAestheticScoreForRatio:inPhotoLibrary:", v9, 0.05);
  v5 = v4;
  -[PGGraph infoNode](self->_graph, "infoNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");

  +[PGGraphInfoNode topTierScorePropertiesWithAestheticScore:aestheticScoreForTripKeyAsset:](PGGraphInfoNode, "topTierScorePropertiesWithAestheticScore:aestheticScoreForTripKeyAsset:", self->_topTierAestheticScore, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v8, v7, 0);

}

- (void)persistPersonalHighAestheticsThreshold:(double)a3 personalGoodAestheticsThreshold:(double)a4
{
  void *v7;
  uint64_t v8;
  id v9;

  -[PGGraph infoNode](self->_graph, "infoNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");

  +[PGGraphInfoNode personalAestheticsPropertiesWithHighAestheticsThreshold:goodAestheticsThreshold:](PGGraphInfoNode, "personalAestheticsPropertiesWithHighAestheticsThreshold:goodAestheticsThreshold:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, v8, 0);

}

- (void)computeAndPersistAssetStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[PGGraphBuilder photoLibrary](self, "photoLibrary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 210, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[PGGraph infoNode](self->_graph, "infoNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "identifier");

  +[PGGraphInfoNode numberOfSelfies:](PGGraphInfoNode, "numberOfSelfies:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v11, v10, 0);

}

- (signed)generativeMemoryCreationEligibleStateWithAsset:(id)a3
{
  PNSafeAssetAnalyzer *safeAssetAnalyzer;
  id v5;
  void *v6;

  safeAssetAnalyzer = self->_safeAssetAnalyzer;
  v5 = a3;
  -[PGGraphBuilder curationContext](self, "curationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(safeAssetAnalyzer) = -[PNSafeAssetAnalyzer eligibilityStateWithAsset:curationContext:](safeAssetAnalyzer, "eligibilityStateWithAsset:curationContext:", v5, v6);

  return (__int16)safeAssetAnalyzer;
}

uint64_t __77__PGGraphBuilder_Curation___persistGenerativeMemoryCreationEligibilityState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_155);
}

void __77__PGGraphBuilder_Curation___persistGenerativeMemoryCreationEligibilityState___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CD13B0];
  v5 = a3;
  objc_msgSend(v4, "changeRequestForAsset:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortValue");

  objc_msgSend(v7, "setGenerativeMemoryCreationEligibilityState:", v6);
}

uint64_t __54__PGGraphBuilder_Curation___persistInteractionScores___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_154);
}

void __54__PGGraphBuilder_Curation___persistInteractionScores___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  int v6;
  int v7;
  double v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CD13B0];
  v5 = a3;
  objc_msgSend(v4, "changeRequestForAsset:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  LODWORD(v8) = v7;
  objc_msgSend(v9, "setInteractionScore:", v8);

}

uint64_t __51__PGGraphBuilder_Curation___persistCurationScores___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1246);
}

void __51__PGGraphBuilder_Curation___persistCurationScores___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CD13B0];
  v5 = a3;
  objc_msgSend(v4, "changeRequestForAsset:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v8, "setCurationScore:", v7);
}

+ (double)topTierAestheticScoreForRatio:(double)a3 inPhotoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (unint64_t)((double)(unint64_t)objc_msgSend(v7, "count") * a3);
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("overallAestheticScore != %f"), *MEMORY[0x1E0D781A0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v12);

  objc_msgSend(v9, "setFetchLimit:", v8 + 1);
  objc_msgSend(v9, "setChunkSizeForFetch:", 1);
  objc_msgSend(v9, "setCacheSizeForFetch:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "overallAestheticScore");
    v16 = v15;
  }
  else
  {
    v16 = 1.0;
  }

  return v16;
}

- (void)deleteAllMeaningNodesAndEdges
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeaningNodeCollection, "nodesInGraph:", self->_graph);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNodes:", v3);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v4);

}

- (void)addMeaningToMeaningfulEventNode:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5
{
  double v5;

  v5 = 0.0;
  if (a5)
    v5 = 1.0;
  -[PGGraphBuilder addMeaningToMeaningfulEventNode:meaningLabel:meaningConfidence:meaningIsHighPrecision:isV1Algorithm:](self, "addMeaningToMeaningfulEventNode:meaningLabel:meaningConfidence:meaningIsHighPrecision:isV1Algorithm:", a3, a4, v5);
}

- (void)addMeaningToMeaningfulEventNode:(id)a3 meaningLabel:(id)a4 meaningConfidence:(double)a5 meaningIsHighPrecision:(BOOL)a6 isV1Algorithm:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  double v19;
  id v20;
  char v21;
  uint8_t buf[16];

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  if (objc_msgSend(v13, "length"))
  {
    v21 = 0;
    -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", v13, 700, 0, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      -[PGGraphBuilder addParentMeaningHierarchyForMeaningNode:](self, "addParentMeaningHierarchyForMeaningNode:", v14);
    v15 = objc_msgSend((id)objc_opt_class(), "edgeDomainForMeaningNodeLabel:isV1Algorithm:", v13, v7);
    if (v21)
    {
      v16 = 0;
    }
    else
    {
      if ((_DWORD)v15 == 702)
        -[PGGraphBuilder _findAlternativeMeaningEdgeToMeaningfulEventNode:withMeaningNode:](self, "_findAlternativeMeaningEdgeToMeaningfulEventNode:withMeaningNode:", v12, v14);
      else
        -[PGGraphBuilder _findMeaningEdgeToMeaningfulEventNode:withMeaningNode:](self, "_findMeaningEdgeToMeaningfulEventNode:withMeaningNode:", v12, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[PGGraphMeaningEdge propertyDictionaryWithConfidence:isHighPrecision:](PGGraphMeaningEdge, "propertyDictionaryWithConfidence:isHighPrecision:", v8, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v16, "confidence");
      if (v19 < a5)
        -[MAGraph persistModelProperties:forEdgeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forEdgeWithIdentifier:clobberExisting:", v18, objc_msgSend(v16, "identifier"), 0);
    }
    else
    {
      v20 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("MEANING"), v12, v14, v15, v18);
    }

  }
  else
  {
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA237000, v17, OS_LOG_TYPE_FAULT, "[PGGraphBuilder+Meaning] Trying to ingest meaning node with an empty meaningLabel", buf, 2u);
    }

  }
}

- (void)addParentMeaningHierarchyForMeaningNode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PGGraphBuilder_Meaning__addParentMeaningHierarchyForMeaningNode___block_invoke;
  v7[3] = &unk_1E8428ED0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[PGGraph traverseParentMeaningsForMeaningLabel:usingBlock:](PGGraph, "traverseParentMeaningsForMeaningLabel:usingBlock:", v5, v7);

}

- (id)_findAlternativeMeaningEdgeToMeaningfulEventNode:(id)a3 withMeaningNode:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10236;
  v17 = __Block_byref_object_dispose__10237;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PGGraphBuilder_Meaning___findAlternativeMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke;
  v10[3] = &unk_1E8428EF8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateMeaningEdgesAndNodesWithDomain:block:", 702, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_findMeaningEdgeToMeaningfulEventNode:(id)a3 withMeaningNode:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10236;
  v17 = __Block_byref_object_dispose__10237;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__PGGraphBuilder_Meaning___findMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke;
  v10[3] = &unk_1E8428EF8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateMeaningEdgesAndNodesUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __81__PGGraphBuilder_Meaning___findMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __92__PGGraphBuilder_Meaning___findAlternativeMeaningEdgeToMeaningfulEventNode_withMeaningNode___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

void __67__PGGraphBuilder_Meaning__addParentMeaningHierarchyForMeaningNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t v9[15];
  char v10;

  v5 = a2;
  v6 = v5;
  v10 = 0;
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addUniqueNodeWithLabel:domain:properties:didCreate:", v6, 700, 0, &v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("SUBMEANING_OF"), *(_QWORD *)(a1 + 40), v7, 700, 0);
    *a3 = v10 ^ 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGGraphBuilder+Meaning] Trying to insert a node with empty meaningLabel", v9, 2u);
    }
  }

}

+ (unsigned)edgeDomainForMeaningNodeLabel:(id)a3 isV1Algorithm:(BOOL)a4
{
  _BOOL4 v4;
  unsigned __int16 v5;
  _BOOL4 v6;
  unsigned __int16 v7;
  unsigned __int16 v8;

  v4 = a4;
  v5 = 700;
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled", a3))
  {
    v6 = +[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings](PGEventLabelingConfiguration, "usePrimaryMeaningDomainForEventLabelingMeanings");
    if (v4)
      v7 = 700;
    else
      v7 = 702;
    if (v4)
      v8 = 702;
    else
      v8 = 700;
    if (v6)
      return v8;
    else
      return v7;
  }
  return v5;
}

- (id)insertSpecialPOIAmusementParkNodeFromMomentNode:(id)a3
{
  id v4;
  PGSpecialPOIResolver *v5;
  void *v6;
  PGSpecialPOIResolver *v7;
  id v8;
  void *v9;
  PGGraphPOINode *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [PGSpecialPOIResolver alloc];
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGSpecialPOIResolver initWithMomentNodes:](v5, "initWithMomentNodes:", v6);

  if (-[PGSpecialPOIResolver anyMomentHasPOIAmusementPark](v7, "anyMomentHasPOIAmusementPark"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    +[PGGraphPOINodeCollection poiNodesForLabel:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabel:inGraph:", CFSTR("AmusementPark"), self->_graph);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "anyNode");
      v10 = (PGGraphPOINode *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "collection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPOIEdgeCollection, "edgesFromNodes:toNodes:", v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = -[PGGraphPOINode initWithLabel:]([PGGraphPOINode alloc], "initWithLabel:", CFSTR("AmusementPark"));
      objc_msgSend(v8, "addNode:", v10);
      v12 = 0;
    }
    if (!objc_msgSend(v12, "count"))
    {
      v13 = -[PGGraphPOIEdge initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:]([PGGraphPOIEdge alloc], "initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:", v4, v10, 0, 1, 1.0);
      objc_msgSend(v8, "addEdge:", v13);

    }
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)insertPOINodeWithPlace:(id)a3 fromMomentNode:(id)a4 hasInsertedSpecialPOIAmusementParkNode:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  PGGraphPOINode *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PGGraphPOIEdge *v20;
  id v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "placeInterestType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraph poiLabelForPOIType:](PGGraph, "poiLabelForPOIType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (!v5
      || (v13 = objc_msgSend(v11, "isEqualToString:", CFSTR("AmusementPark")),
          v14 = objc_msgSend(v12, "isEqualToString:", CFSTR("Entertainment")),
          v15 = 0,
          (v13 & 1) == 0)
      && (v14 & 1) == 0)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0D42A30]);
      +[PGGraphPOINodeCollection poiNodesForLabel:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabel:inGraph:", v12, self->_graph);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(v17, "anyNode");
        v15 = (PGGraphPOINode *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "collection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPOIEdgeCollection, "edgesFromNodes:toNodes:", v18, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = -[PGGraphPOINode initWithLabel:]([PGGraphPOINode alloc], "initWithLabel:", v12);
        objc_msgSend(v16, "addNode:", v15);
        v19 = 0;
      }
      if (!objc_msgSend(v19, "count"))
      {
        v20 = [PGGraphPOIEdge alloc];
        objc_msgSend(v8, "confidence");
        v21 = -[PGGraphPOIEdge initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:](v20, "initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:", v9, v15, 0, 0);
        objc_msgSend(v16, "addEdge:", v21);

      }
      -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v16);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)insertROINodeWithPlace:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "placeInterestType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGGraphBuilder _roiTypeForPlaceInterestType:](self, "_roiTypeForPlaceInterestType:", v8);

  if (v9)
  {
    objc_msgSend(v6, "confidence");
    -[PGGraphBuilder insertROINodeWithType:fromMomentNode:confidence:](self, "insertROINodeWithType:fromMomentNode:confidence:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_roiTypeForPlaceInterestType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B028]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B010]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B018]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B020]) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4B030]))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)insertROINodeWithType:(unint64_t)a3 fromMomentNode:(id)a4 confidence:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  if (a3)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    +[PGGraphROINodeCollection roiNodesOfType:inGraph:](PGGraphROINodeCollection, "roiNodesOfType:inGraph:", a3, self->_graph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "anyNode");
      a3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphROIEdgeCollection, "edgesFromNodes:toNodes:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a3 = -[PGGraphROINode initWithROIType:]([PGGraphROINode alloc], "initWithROIType:", a3);
      objc_msgSend(v9, "addNode:", a3);
      v12 = 0;
    }
    if (!objc_msgSend(v12, "count"))
    {
      v13 = -[PGGraphROIEdge initFromMomentNode:toROINode:confidence:]([PGGraphROIEdge alloc], "initFromMomentNode:toROINode:confidence:", v8, a3, a5);
      objc_msgSend(v9, "addEdge:", v13);

    }
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v9);

  }
  return (id)a3;
}

- (id)insertROINodeWithType:(unint64_t)a3
{
  PGGraphROINode *v3;
  void *v5;
  id v6;

  v3 = (PGGraphROINode *)a3;
  if (a3)
  {
    +[PGGraphROINodeCollection roiNodesOfType:inGraph:](PGGraphROINodeCollection, "roiNodesOfType:inGraph:", a3, self->_graph);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "anyNode");
      v3 = (PGGraphROINode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = -[PGGraphROINode initWithROIType:]([PGGraphROINode alloc], "initWithROIType:", v3);
      v6 = objc_alloc_init(MEMORY[0x1E0D42A30]);
      objc_msgSend(v6, "addNode:", v3);
      -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v6);

    }
  }
  return v3;
}

- (id)insertROIWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueMeaningCluesForKey:", CFSTR("ROI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PGGraphBuilder_Place__insertROIWithClueCollection_fromMomentNode___block_invoke;
  v16[3] = &unk_1E8429600;
  v16[4] = self;
  v17 = v6;
  v11 = v9;
  v18 = v11;
  v12 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);
  v13 = v18;
  v14 = v11;

  return v14;
}

- (id)insertPOIWithFeeder:(id)a3 fromMomentNode:(id)a4 isNearHomeOrWork:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
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
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
    -[PGGraphBuilder insertSpecialPOIAmusementParkNodeFromMomentNode:](self, "insertSpecialPOIAmusementParkNodeFromMomentNode:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder poiCache](self, "poiCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPlacesResolver resolvePlacesForMomentNode:feeder:poiCache:](PGGraphPlacesResolver, "resolvePlacesForMomentNode:feeder:poiCache:", v9, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v13;
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
          -[PGGraphBuilder insertPOINodeWithPlace:fromMomentNode:hasInsertedSpecialPOIAmusementParkNode:](self, "insertPOINodeWithPlace:fromMomentNode:hasInsertedSpecialPOIAmusementParkNode:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), v9, v11 != 0, (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v10, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

  }
  return v10;
}

- (id)insertBusiness:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  PGGraphBusinessNode *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PGGraphBusinessNode *v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  PGGraphBusinessCategoryNode *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  id v46;
  void *v47;
  uint64_t v48;
  PGGraphPlaceBusinessEdge *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  PGGraphBuilder *v62;
  PGGraphBuilder *v63;
  __CFString *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  v9 = objc_msgSend(v6, "muid");
  objc_msgSend(v6, "name");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v10, "length"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v77 = v9;
      _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "Inserting business w/o name: muid %lu", buf, 0xCu);
    }

    v10 = &stru_1E8436F28;
  }
  +[PGGraphBusinessNodeCollection businessNodeForBusinessMuid:inGraph:](PGGraphBusinessNodeCollection, "businessNodeForBusinessMuid:inGraph:", v9, self->_graph);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v7, "collection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPlaceBusinessEdgeCollection, "edgesFromNodes:toNodes:", v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "anyNode");
    v16 = (PGGraphBusinessNode *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = v13;
    objc_msgSend(v6, "region");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "center");
    v19 = v18;
    v21 = v20;
    v22 = [PGGraphBusinessNode alloc];
    v23 = objc_msgSend(v6, "venueCapacity");
    v58 = v17;
    objc_msgSend(v17, "radius");
    v16 = -[PGGraphBusinessNode initWithMuid:name:venueCapacity:coordinates:radius:](v22, "initWithMuid:name:venueCapacity:coordinates:radius:", v9, v10, v23, v19, v21, v24);
    objc_msgSend(v8, "addNode:", v16);
    v25 = (void *)MEMORY[0x1E0C99E60];
    v59 = v6;
    objc_msgSend(v6, "businessCategories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphBusinessCategoryNodeCollection businessCategoryNodesForCategories:inGraph:](PGGraphBusinessCategoryNodeCollection, "businessCategoryNodesForCategories:inGraph:", v27, self->_graph);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v28, "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v28;
    v32 = objc_msgSend(v28, "count");
    v61 = v27;
    if (v32 < objc_msgSend(v27, "count"))
    {
      v62 = self;
      v64 = v10;
      objc_msgSend(v28, "categories");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v34 = v27;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v73 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
            if ((objc_msgSend(v33, "containsObject:", v39) & 1) == 0)
            {
              v40 = -[PGGraphBusinessCategoryNode initWithLabel:]([PGGraphBusinessCategoryNode alloc], "initWithLabel:", v39);
              objc_msgSend(v8, "addNode:", v40);
              objc_msgSend(v31, "addObject:", v40);

            }
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
        }
        while (v36);
      }

      self = v62;
      v10 = v64;
    }
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v41 = v31;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v69 != v44)
            objc_enumerationMutation(v41);
          v46 = -[PGGraphBusinessCategoryEdge initFromBusinessNode:toBusinessCategoryNode:]([PGGraphBusinessCategoryEdge alloc], "initFromBusinessNode:toBusinessCategoryNode:", v16, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j));
          objc_msgSend(v8, "addEdge:", v46);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      }
      while (v43);
    }

    v15 = 0;
    v6 = v59;
    v13 = v66;
  }
  if (!objc_msgSend(v15, "count"))
  {
    v65 = v10;
    objc_msgSend(v6, "dateInterval");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = self;
    v67 = v13;
    if (v47)
      v48 = objc_msgSend(v6, "hasRoutineVisit");
    else
      v48 = 0;
    v49 = [PGGraphPlaceBusinessEdge alloc];
    objc_msgSend(v6, "routineVisitConfidence");
    v51 = v50;
    objc_msgSend(v47, "startDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "endDate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[PGGraphPlaceBusinessEdge initFromMomentNode:toBusinessNode:confidence:hasRoutineInfo:universalStartDate:universalEndDate:](v49, "initFromMomentNode:toBusinessNode:confidence:hasRoutineInfo:universalStartDate:universalEndDate:", v7, v16, v48, v52, v53, v51);

    objc_msgSend(v8, "addEdge:", v54);
    self = v63;
    v10 = v65;
    v13 = v67;
  }
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v8);
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "localStartDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v77 = (uint64_t)v10;
    v78 = 2113;
    v79 = v57;
    _os_log_debug_impl(&dword_1CA237000, v55, OS_LOG_TYPE_DEBUG, "Insert business %{private}@ to momentNode %{private}@", buf, 0x16u);

  }
  return v16;
}

- (id)connectPublicEventNode:(id)a3 withBusinessNode:(id)a4
{
  return -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PUBLIC_EVENT_BUSINESS"), a3, a4, 900, 0);
}

void __68__PGGraphBuilder_Place__insertROIWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "insertROINodeWithPlace:fromMomentNode:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    v3 = v4;
  }

}

- (void)_insertVisualLookupScene:(id)a3 fromMomentNode:(id)a4 changeRequest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PGGraphVisualLookupSceneNode *v11;
  PGGraphVisualLookupSceneNode *v12;
  uint64_t v13;
  void *v14;
  PGGraphVisualLookupSceneEdge *v15;
  double v16;
  id v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v18, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_visualLookupSceneNodeBySceneName, "objectForKeyedSubscript:", v10);
  v11 = (PGGraphVisualLookupSceneNode *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_3;
  v12 = [PGGraphVisualLookupSceneNode alloc];
  v13 = objc_msgSend(v18, "sceneIdentifier");
  objc_msgSend(v18, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGGraphVisualLookupSceneNode initWithSceneIdentifier:name:sceneDomain:isSensitive:](v12, "initWithSceneIdentifier:name:sceneDomain:isSensitive:", v13, v14, 0, 0);

  objc_msgSend(v9, "addNode:", v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_visualLookupSceneNodeBySceneName, "setObject:forKeyedSubscript:", v11, v10);
  if (v11)
  {
LABEL_3:
    v15 = [PGGraphVisualLookupSceneEdge alloc];
    objc_msgSend(v18, "confidence");
    v17 = -[PGGraphVisualLookupSceneEdge initFromMomentNode:toVisualLookupSceneNode:confidence:numberOfAssets:](v15, "initFromMomentNode:toVisualLookupSceneNode:confidence:numberOfAssets:", v8, v11, objc_msgSend(v18, "numberOfAssets"), v16);
    objc_msgSend(v9, "addEdge:", v17);

  }
}

- (void)_insertEntityNetScene:(id)a3 fromMomentNode:(id)a4 withEntityNetSceneTaxonomy:(id)a5 changeRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PGGraphEntityNetSceneEdge *v16;
  double v17;
  id v18;
  void *v19;
  PGGraphEntityNetSceneNode *v20;
  double v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v22, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sceneNodeBySceneName, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      || (-[NSMutableSet containsObject:](self->_entityNetSceneTaxonomyNodesNotIndexedInSearch, "containsObject:", v13) & 1) != 0)
    {
      goto LABEL_7;
    }
    if (objc_msgSend(v22, "numberOfSearchConfidenceAssets"))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_entityNetSceneNodeBySceneName, "objectForKeyedSubscript:", v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v11, "nodeForName:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
          goto LABEL_8;
        v14 = v19;
        if ((objc_msgSend(v19, "isIndexed") & 1) == 0)
        {
          -[NSMutableSet addObject:](self->_entityNetSceneTaxonomyNodesNotIndexedInSearch, "addObject:", v13);
          goto LABEL_7;
        }
        v20 = [PGGraphEntityNetSceneNode alloc];
        objc_msgSend(v22, "relevance");
        v15 = -[PGGraphSceneNode initWithSceneTaxonomyNode:level:](v20, "initWithSceneTaxonomyNode:level:", v14, (unint64_t)v21);
        objc_msgSend(v12, "addNode:", v15);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entityNetSceneNodeBySceneName, "setObject:forKeyedSubscript:", v15, v13);

        if (!v15)
          goto LABEL_8;
      }
      v16 = [PGGraphEntityNetSceneEdge alloc];
      objc_msgSend(v22, "confidence");
      v18 = -[PGGraphSceneEdge initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:](v16, "initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:", v10, v15, objc_msgSend(v22, "isReliable"), objc_msgSend(v22, "numberOfAssets"), objc_msgSend(v22, "numberOfHighConfidenceAssets"), objc_msgSend(v22, "numberOfSearchConfidenceAssets"), v17, objc_msgSend(v22, "numberOfDominantSceneAssets"));
      objc_msgSend(v12, "addEdge:", v18);

      v14 = (void *)v15;
LABEL_7:

    }
  }
LABEL_8:

}

- (id)insertScene:(id)a3 fromMomentNode:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0D42A30];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  -[PGGraphBuilder _insertScene:fromMomentNode:changeRequest:](self, "_insertScene:fromMomentNode:changeRequest:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v9);
  return v10;
}

- (id)_insertScene:(id)a3 fromMomentNode:(id)a4 changeRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableDictionary *sceneNodeBySceneName;
  PGGraphSceneNode *v13;
  PGGraphSceneEdge *v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  PGGraphSceneNode *v19;
  double v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sceneNodeBySceneName = self->_sceneNodeBySceneName;
  if (!sceneNodeBySceneName)
    __assert_rtn("-[PGGraphBuilder(Scene) _insertScene:fromMomentNode:changeRequest:]", "PGGraphBuilder+Scene.m", 90, "_sceneNodeBySceneName != nil");
  -[NSMutableDictionary objectForKeyedSubscript:](sceneNodeBySceneName, "objectForKeyedSubscript:", v11);
  v13 = (PGGraphSceneNode *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_3;
  -[PGGraphBuilder sceneTaxonomy](self, "sceneTaxonomy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "nodeForName:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "Unknown scene '%@'", buf, 0xCu);
    }

    v13 = 0;
    goto LABEL_10;
  }
  v19 = [PGGraphSceneNode alloc];
  objc_msgSend(v8, "relevance");
  v13 = -[PGGraphSceneNode initWithSceneTaxonomyNode:level:](v19, "initWithSceneTaxonomyNode:level:", v18, (unint64_t)v20);
  objc_msgSend(v10, "addNode:", v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sceneNodeBySceneName, "setObject:forKeyedSubscript:", v13, v11);

  if (!v13)
  {
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
LABEL_3:
  v14 = [PGGraphSceneEdge alloc];
  objc_msgSend(v8, "confidence");
  v16 = -[PGGraphSceneEdge initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:](v14, "initFromMomentNode:toSceneNode:confidence:isReliable:numberOfAssets:numberOfHighConfidenceAssets:numberOfSearchConfidenceAssets:numberOfDominantSceneAssets:", v9, v13, objc_msgSend(v8, "isReliable"), objc_msgSend(v8, "numberOfAssets"), objc_msgSend(v8, "numberOfHighConfidenceAssets"), objc_msgSend(v8, "numberOfSearchConfidenceAssets"), v15, objc_msgSend(v8, "numberOfDominantSceneAssets"));
  objc_msgSend(v10, "addEdge:", v16);
LABEL_11:

  return v16;
}

- (id)insertScenesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  PGGraphBuilder *v20;
  id v21;
  id v22;
  id v23;

  v6 = a4;
  objc_msgSend(a3, "meaningCluesForKey:", CFSTR("Scene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __71__PGGraphBuilder_Scene__insertScenesWithClueCollection_fromMomentNode___block_invoke;
  v19 = &unk_1E8429630;
  v20 = self;
  v21 = v6;
  v22 = v9;
  v10 = v8;
  v23 = v10;
  v11 = v9;
  v12 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v16);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v11, v16, v17, v18, v19, v20);
  v13 = v23;
  v14 = v10;

  return v14;
}

- (void)insertVisualLookupScenesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  PGGraphBuilder *v15;
  id v16;
  id v17;

  v6 = a4;
  objc_msgSend(a3, "meaningCluesForKey:", CFSTR("VisualLookupScene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __83__PGGraphBuilder_Scene__insertVisualLookupScenesWithClueCollection_fromMomentNode___block_invoke;
  v14 = &unk_1E8429660;
  v15 = self;
  v10 = v6;
  v16 = v10;
  v9 = v8;
  v17 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);
  if (objc_msgSend(v9, "numberOfChanges"))
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v9, v10, v11, v12, v13, v14, v15, v16);

}

- (void)insertEntityNetScenesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, void *);
  void *v14;
  PGGraphBuilder *v15;
  id v16;
  id v17;

  v6 = a4;
  objc_msgSend(a3, "meaningCluesForKey:", CFSTR("EntityNetScene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __80__PGGraphBuilder_Scene__insertEntityNetScenesWithClueCollection_fromMomentNode___block_invoke;
  v14 = &unk_1E8429660;
  v15 = self;
  v10 = v6;
  v16 = v10;
  v9 = v8;
  v17 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);
  if (objc_msgSend(v9, "numberOfChanges"))
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v9, v10, v11, v12, v13, v14, v15, v16);

}

void __80__PGGraphBuilder_Scene__insertEntityNetScenesWithClueCollection_fromMomentNode___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "entityNetSceneTaxonomy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_insertEntityNetScene:fromMomentNode:withEntityNetSceneTaxonomy:changeRequest:", v5, v4, v6, a1[6]);

}

uint64_t __83__PGGraphBuilder_Scene__insertVisualLookupScenesWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertVisualLookupScene:fromMomentNode:changeRequest:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __71__PGGraphBuilder_Scene__insertScenesWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_insertScene:fromMomentNode:changeRequest:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
    v3 = v4;
  }

}

- (void)insertPersonNodesForShareParticipants:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  PGGraphBuilder *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder graph](self, "graph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesForShareParticipantIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForShareParticipantIdentifiers:inGraph:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __71__PGGraphBuilder_SharedLibrary__insertPersonNodesForShareParticipants___block_invoke;
  v28[3] = &unk_1E8435398;
  v18 = v5;
  v29 = v18;
  v30 = self;
  objc_msgSend(v17, "enumerateNodesUsingBlock:", v28);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v18, "allValues", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[PGGraphBuilder insertPersonNodeForShareParticipant:](self, "insertPersonNodeForShareParticipant:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    }
    while (v21);
  }

}

- (void)insertPersonNodeForShareParticipant:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PGGraphIngestShareParticipantContainer *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "isCurrentUser"))
  {
    -[PGGraphBuilder serviceManager](self, "serviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mePerson");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CD16C0];
    -[PGGraphBuilder photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchPersonForShareParticipant:options:", v15, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PGGraphBuilder serviceManager](self, "serviceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphBuilder photoLibrary](self, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "personForName:inPhotoLibrary:", v11, v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  v13 = -[PGGraphIngestShareParticipantContainer initWithShareParticipant:person:]([PGGraphIngestShareParticipantContainer alloc], "initWithShareParticipant:person:", v15, v5);
  -[PGGraphBuilder insertPersonNodeForPerson:](self, "insertPersonNodeForPerson:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPeopleDomainBuildingHelper cacheAuthorNode:forShareParticipant:](self->_peopleDomainBuildingHelper, "cacheAuthorNode:forShareParticipant:", v14, v15);

}

void __71__PGGraphBuilder_SharedLibrary__insertPersonNodesForShareParticipants___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "shareParticipantLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v9, "shareParticipantLocalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "cacheAuthorNode:forShareParticipant:", v9, v6);
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v9, "shareParticipantLocalIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v8);

    }
  }

}

+ (BOOL)isSharedLibraryEnabledForLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CD15E0];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchActiveLibraryScopeWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

+ (id)sharedLibraryParticipantsForLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD17A8], "fetchParticipantsInShare:options:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_uuidForPlacemark:(id)a3 forNodeLabel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Number")))
  {
    objc_msgSend(v5, "subThoroughfare");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v8);

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Street")))
  {
LABEL_6:
    objc_msgSend(v5, "thoroughfare");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v10);

    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("District")))
  {
LABEL_9:
    objc_msgSend(v5, "subLocality");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v12);

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("City")))
  {
LABEL_12:
    objc_msgSend(v5, "locality");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v14);

    goto LABEL_15;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("County")))
  {
LABEL_15:
    objc_msgSend(v5, "subAdministrativeArea");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v16);

    goto LABEL_18;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("State")))
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Country")))
      goto LABEL_24;
    goto LABEL_21;
  }
LABEL_18:
  objc_msgSend(v5, "administrativeArea");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v18);

LABEL_21:
  objc_msgSend(v5, "ISOcountryCode");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v20);

LABEL_24:
  return v7;
}

- (void)insertAreasOfInterestForProjectedPlacemark:(id)a3 fromAddressNode:(id)a4 changeRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  char v23;
  BOOL v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v8, "areasOfInterest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

  v14 = objc_msgSend(v13, "count");
  objc_msgSend(v8, "popularityScoresOrderedByAOI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == objc_msgSend(v15, "count"))
  {
    if (v14)
    {
      if (v14 == 1)
        v16 = objc_msgSend(v8, "isIsland");
      else
        v16 = 0;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __101__PGGraphBuilder_Location__insertAreasOfInterestForProjectedPlacemark_fromAddressNode_changeRequest___block_invoke;
      v18[3] = &unk_1E8429FB8;
      v22 = v14;
      v18[4] = self;
      v19 = v15;
      v23 = v16;
      v20 = v10;
      v21 = v9;
      v24 = v14 != 1;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);

    }
  }
  else
  {
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Length of areasOfInterest and popularityScoresOrderedByAOI arrays are different", buf, 2u);
    }

  }
}

- (void)insertLocationHierarchyWithProjectedPlacemark:(id)a3 fromAddressNode:(id)a4 changeRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGGraphLocationStreetNode *v11;
  void *v12;
  void *v13;
  PGGraphLocationNumberNode *v14;
  void *v15;
  PGGraphLocationNumberNode *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  PGGraphLocationStreetNode *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  PGGraphLocationDistrictNode *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  PGGraphLocationCityNode *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  PGGraphLocationCountyNode *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  PGGraphLocationStateNode *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  PGGraphLocationCountryNode *v43;
  void *v44;
  PGGraphLocationCountryNode *v45;
  BOOL v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  PGGraphLanguageNode *v60;
  id v61;
  id v62;
  void *v63;
  PGGraphLocationStreetNode *v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "identifier"))
  {
    v11 = (PGGraphLocationStreetNode *)v9;
    objc_msgSend(v8, "subThoroughfare");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PGGraphBuilder _uuidForPlacemark:forNodeLabel:](self, "_uuidForPlacemark:forNodeLabel:", v8, CFSTR("Number"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [PGGraphLocationNumberNode alloc];
      objc_msgSend(v8, "subThoroughfare");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PGGraphNamedLocationNode initWithName:uuid:](v14, "initWithName:uuid:", v15, v13);

      v17 = -[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v16);
      if (!v17)
        objc_msgSend(v10, "addNode:", v16);
      v18 = -[PGGraphLocationNumberEdge initFromLocationNode:toLocationNumberNode:]([PGGraphLocationNumberEdge alloc], "initFromLocationNode:toLocationNumberNode:", v11, v16);
      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v18))
        objc_msgSend(v10, "addEdge:", v18);
      if (v17)
        goto LABEL_40;

    }
    else
    {
      v16 = (PGGraphLocationNumberNode *)v11;
    }
    objc_msgSend(v8, "thoroughfare");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[PGGraphBuilder _uuidForPlacemark:forNodeLabel:](self, "_uuidForPlacemark:forNodeLabel:", v8, CFSTR("Street"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = [PGGraphLocationStreetNode alloc];
      objc_msgSend(v8, "thoroughfare");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PGGraphNamedLocationNode initWithName:uuid:](v21, "initWithName:uuid:", v22, v20);

      v23 = -[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v11);
      if (!v23)
        objc_msgSend(v10, "addNode:", v11);
      v24 = -[PGGraphLocationStreetEdge initFromLocationNode:toStreetNode:]([PGGraphLocationStreetEdge alloc], "initFromLocationNode:toStreetNode:", v16, v11);
      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v24))
        objc_msgSend(v10, "addEdge:", v24);
      if (v23)
        goto LABEL_49;

    }
    else
    {
      v11 = (PGGraphLocationStreetNode *)v16;
    }
    objc_msgSend(v8, "subLocality");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[PGGraphBuilder _uuidForPlacemark:forNodeLabel:](self, "_uuidForPlacemark:forNodeLabel:", v8, CFSTR("District"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = [PGGraphLocationDistrictNode alloc];
      objc_msgSend(v8, "subLocality");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PGGraphNamedLocationNode initWithName:uuid:](v26, "initWithName:uuid:", v27, v13);

      v28 = -[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v16);
      if (!v28)
        objc_msgSend(v10, "addNode:", v16);
      v18 = -[PGGraphLocationDistrictEdge initFromLocationNode:toDistrictNode:]([PGGraphLocationDistrictEdge alloc], "initFromLocationNode:toDistrictNode:", v11, v16);
      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v18))
        objc_msgSend(v10, "addEdge:", v18);
      if (v28)
        goto LABEL_40;

    }
    else
    {
      v16 = (PGGraphLocationNumberNode *)v11;
    }
    objc_msgSend(v8, "locality");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[PGGraphBuilder _uuidForPlacemark:forNodeLabel:](self, "_uuidForPlacemark:forNodeLabel:", v8, CFSTR("City"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = [PGGraphLocationCityNode alloc];
      objc_msgSend(v8, "locality");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PGGraphNamedLocationNode initWithName:uuid:](v30, "initWithName:uuid:", v31, v20);

      v32 = -[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v11);
      if (!v32)
        objc_msgSend(v10, "addNode:", v11);
      v24 = -[PGGraphLocationCityEdge initFromLocationNode:toCityNode:]([PGGraphLocationCityEdge alloc], "initFromLocationNode:toCityNode:", v16, v11);
      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v24))
        objc_msgSend(v10, "addEdge:", v24);
      if (v32)
        goto LABEL_49;

    }
    else
    {
      v11 = (PGGraphLocationStreetNode *)v16;
    }
    objc_msgSend(v8, "subAdministrativeArea");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[PGGraphBuilder _uuidForPlacemark:forNodeLabel:](self, "_uuidForPlacemark:forNodeLabel:", v8, CFSTR("County"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = [PGGraphLocationCountyNode alloc];
      objc_msgSend(v8, "subAdministrativeArea");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PGGraphNamedLocationNode initWithName:uuid:](v34, "initWithName:uuid:", v35, v13);

      v36 = -[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v16);
      if (!v36)
        objc_msgSend(v10, "addNode:", v16);
      v18 = -[PGGraphLocationCountyEdge initFromLocationNode:toCountyNode:]([PGGraphLocationCountyEdge alloc], "initFromLocationNode:toCountyNode:", v11, v16);
      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v18))
        objc_msgSend(v10, "addEdge:", v18);
      if (v36)
      {
LABEL_40:

LABEL_50:
        goto LABEL_51;
      }

    }
    else
    {
      v16 = (PGGraphLocationNumberNode *)v11;
    }
    objc_msgSend(v8, "administrativeArea");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[PGGraphBuilder _uuidForPlacemark:forNodeLabel:](self, "_uuidForPlacemark:forNodeLabel:", v8, CFSTR("State"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = [PGGraphLocationStateNode alloc];
      objc_msgSend(v8, "administrativeArea");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PGGraphNamedLocationNode initWithName:uuid:](v38, "initWithName:uuid:", v39, v20);

      v40 = -[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v11);
      if (!v40)
        objc_msgSend(v10, "addNode:", v11);
      v24 = -[PGGraphLocationStateEdge initFromLocationNode:toStateNode:]([PGGraphLocationStateEdge alloc], "initFromLocationNode:toStateNode:", v16, v11);
      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v24))
        objc_msgSend(v10, "addEdge:", v24);
      if (v40)
      {
LABEL_49:

        v11 = (PGGraphLocationStreetNode *)v16;
        goto LABEL_50;
      }

    }
    else
    {
      v11 = (PGGraphLocationStreetNode *)v16;
    }
    objc_msgSend(v8, "ISOcountryCode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v8, "ISOcountryCode");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = [PGGraphLocationCountryNode alloc];
      objc_msgSend(v8, "ISOcountryCode");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[PGGraphNamedLocationNode initWithName:uuid:](v43, "initWithName:uuid:", v44, v42);

      v46 = -[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v45);
      if (!v46)
        objc_msgSend(v10, "addNode:", v45);
      v47 = -[PGGraphLocationCountryEdge initFromLocationNode:toCountryNode:]([PGGraphLocationCountryEdge alloc], "initFromLocationNode:toCountryNode:", v11, v45);
      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v47))
        objc_msgSend(v10, "addEdge:", v47);
      if (!v46)
      {
        v62 = v47;
        v63 = v42;
        v64 = v11;
        v65 = v9;
        v48 = (void *)MEMORY[0x1E0C99DC8];
        v66 = v8;
        objc_msgSend(v8, "ISOcountryCode");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "languagesForRegion:subdivision:withThreshold:filter:", v49, 0, 2, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        +[PGGraphLanguageNodeCollection nodesWithLocaleIdentifiers:inGraph:](PGGraphLanguageNodeCollection, "nodesWithLocaleIdentifiers:inGraph:", v50, self->_graph);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __104__PGGraphBuilder_Location__insertLocationHierarchyWithProjectedPlacemark_fromAddressNode_changeRequest___block_invoke;
        v71[3] = &unk_1E8432EF0;
        v53 = v52;
        v72 = v53;
        objc_msgSend(v51, "enumerateNodesUsingBlock:", v71);
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v54 = v50;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v68 != v57)
                objc_enumerationMutation(v54);
              v59 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
              objc_msgSend(v53, "objectForKeyedSubscript:", v59);
              v60 = (PGGraphLanguageNode *)objc_claimAutoreleasedReturnValue();
              if (!v60)
              {
                v60 = -[PGGraphLanguageNode initWithLocaleIdentifier:]([PGGraphLanguageNode alloc], "initWithLocaleIdentifier:", v59);
                objc_msgSend(v10, "addNode:", v60);
              }
              v61 = -[PGGraphLanguageEdge initFromLocationNode:toLanguageNode:]([PGGraphLanguageEdge alloc], "initFromLocationNode:toLanguageNode:", v45, v60);
              objc_msgSend(v10, "addEdge:", v61);

            }
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
          }
          while (v56);
        }

        v9 = v65;
        v8 = v66;
        v42 = v63;
        v11 = v64;
        v47 = v62;
      }

    }
    goto LABEL_50;
  }
LABEL_51:

}

- (id)insertAddressNodeWithProjectedPlacemark:(id)a3 atEventLocation:(id)a4 usingImprovedPlacemark:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0D42A30];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  -[PGGraphBuilder insertAddressNodeWithProjectedPlacemark:atEventLocation:usingImprovedPlacemark:changeRequest:](self, "insertAddressNodeWithProjectedPlacemark:atEventLocation:usingImprovedPlacemark:changeRequest:", v10, v9, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v11);
  return v12;
}

- (id)insertAddressNodeWithProjectedPlacemark:(id)a3 atEventLocation:(id)a4 usingImprovedPlacemark:(BOOL)a5 changeRequest:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  PGGraphAddressNode *v24;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  uint64_t v41;
  CLLocationCoordinate2D v42;
  CLLocationCoordinate2D v43;

  v7 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "coordinate");
  v15 = v14;
  v17 = v16;

  objc_msgSend(v11, "coordinate");
  v19 = v18;
  v21 = v20;
  v28 = v18;
  v30 = v20;
  v42.latitude = v15;
  v42.longitude = v17;
  if (!CLLocationCoordinate2DIsValid(v42)
    || v15 == 0.0 && v17 == 0.0
    || (v43.latitude = v19, v43.longitude = v21, !CLLocationCoordinate2DIsValid(v43))
    || v19 == 0.0 && v21 == 0.0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging", *(_QWORD *)&v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "loggingConnection");
    v23 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478851;
      v32 = v10;
      v33 = 2049;
      v34 = v15;
      v35 = 2049;
      v36 = v17;
      v37 = 2049;
      v38 = v19;
      v39 = 2049;
      v40 = v21;
      _os_log_error_impl(&dword_1CA237000, v23, OS_LOG_TYPE_ERROR, "Coordinate invalid for placemark %{private}@ projection(%{private}f, %{private}f), photoCoordinate (%{private}f, %{private}f).", buf, 0x34u);
    }
    v24 = 0;
  }
  else
  {
    if (objc_msgSend(v10, "isOcean", *(_QWORD *)&v28))
    {
      CLLocationCoordinate2DGetDistanceFrom();
      if (v26 >= 10000.0)
      {
        v15 = v29;
        v17 = v30;
      }
      v27 = 3;
    }
    else if (objc_msgSend(MEMORY[0x1E0D71860], "locationIsCoarse:", v11))
    {
      v27 = 2;
    }
    else
    {
      v27 = v7;
    }
    -[PGGraphBuilder _uuidForPlacemark:forNodeLabel:](self, "_uuidForPlacemark:forNodeLabel:", v10, CFSTR("Number"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = -[PGGraphAddressNode initWithLocationMode:coordinate:name:]([PGGraphAddressNode alloc], "initWithLocationMode:coordinate:name:", v27, v23, v15, v17);
    if (!-[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v24))
      objc_msgSend(v12, "addNode:", v24);
    -[PGGraphBuilder insertAreasOfInterestForProjectedPlacemark:fromAddressNode:changeRequest:](self, "insertAreasOfInterestForProjectedPlacemark:fromAddressNode:changeRequest:", v10, v24, v12);
    -[PGGraphBuilder insertLocationHierarchyWithProjectedPlacemark:fromAddressNode:changeRequest:](self, "insertLocationHierarchyWithProjectedPlacemark:fromAddressNode:changeRequest:", v10, v24, v12);
  }

  return v24;
}

- (id)insertLocationHierarchyWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  PGGraphBuilder *v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke;
  v26[3] = &unk_1E8429FE0;
  v11 = v9;
  v27 = v11;
  objc_msgSend(v6, "enumerateTimeClues:", v26);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke_2;
  v19[3] = &unk_1E842A008;
  v25 = objc_msgSend(v11, "count");
  v20 = v11;
  v21 = v6;
  v22 = self;
  v23 = v7;
  v12 = v8;
  v24 = v12;
  v13 = v7;
  v14 = v6;
  v15 = v11;
  objc_msgSend(v14, "enumerateLocationClues:", v19);
  v16 = v24;
  v17 = v12;

  return v17;
}

- (id)insertAddressNodeWithPlacemark:(id)a3 location:(id)a4 relevance:(double)a5 numberOfAssets:(unint64_t)a6 duringDateInterval:(id)a7 fromMomentNode:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  __objc2_class *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  unint64_t v38;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = 0;
  if (v14 && v15)
  {
    -[PGGraphBuilder serviceManager](self, "serviceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = a6;
    if ((objc_msgSend(MEMORY[0x1E0D71860], "locationIsCoarse:", v15) & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(v19, "locationOfInterestCloseToLocation:inDateInterval:", v15, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphBuilder locationCache](self, "locationCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "placemarkWithLocationCache:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 && (objc_msgSend(v23, "isEqual:", v14) & 1) == 0)
      {
        v24 = v23;

        v20 = 1;
        v14 = v24;
      }
      else
      {
        v20 = 0;
      }

    }
    objc_msgSend(v15, "coordinate");
    v26 = v25;
    v28 = v27;
    v29 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    -[PGGraphBuilder insertAddressNodeWithProjectedPlacemark:atEventLocation:usingImprovedPlacemark:changeRequest:](self, "insertAddressNodeWithProjectedPlacemark:atEventLocation:usingImprovedPlacemark:changeRequest:", v14, v15, v20, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v30;
    if (v30)
    {
      v37 = v19;
      if (objc_msgSend(v30, "isPrecise")
        && objc_msgSend(v19, "isRemoteLocation:inDateInterval:", v15, v16))
      {
        v31 = PGGraphRemoteAddressEdge;
      }
      else
      {
        v31 = PGGraphAddressEdge;
      }
      v32 = [v31 alloc];
      objc_msgSend(v16, "startDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v32, "initFromMomentNode:toAddressNode:relevance:universalStartDate:universalEndDate:photoCoordinate:numberOfAssets:", v17, v18, v33, v34, v38, a5, v26, v28);

      if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v35))
        objc_msgSend(v29, "addEdge:", v35);

      v19 = v37;
    }
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v29, v37);

  }
  return v18;
}

- (id)insertLocationMobilityNodeWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v21;

  v6 = a3;
  v7 = a4;
  -[PGGraphBuilder serviceManager](self, "serviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v7, "universalStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalEndDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

  v21 = 0.0;
  objc_msgSend(v8, "predominantLocationMobilityForDateInterval:confidence:", v12, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || (v14 = v21, v21 < 0.2))
  {
    objc_msgSend(v6, "locationMobilityClue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "value");
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "confidence");
      v21 = v18;
      v13 = (void *)v17;
    }

    if (!v13)
    {
      v19 = 0;
      goto LABEL_9;
    }
    v14 = v21;
  }
  -[PGGraphBuilder insertLocationMobilityNodeWithMobility:fromMomentNode:confidence:](self, "insertLocationMobilityNodeWithMobility:fromMomentNode:confidence:", v13, v7, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v19;
}

- (id)insertLocationMobilityNodeWithMobility:(id)a3 fromMomentNode:(id)a4 confidence:(double)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  PGGraphMobilityNode *v12;
  id v13;

  v8 = (objc_class *)MEMORY[0x1E0D42A30];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v12 = -[PGGraphMobilityNode initWithLabel:]([PGGraphMobilityNode alloc], "initWithLabel:", v10);

  if (!-[MAGraph findAndResolveUniqueNode:](self->_graph, "findAndResolveUniqueNode:", v12))
    objc_msgSend(v11, "addNode:", v12);
  v13 = -[PGGraphMobilityEdge initFromMomentNode:toMobilityNode:confidence:]([PGGraphMobilityEdge alloc], "initFromMomentNode:toMobilityNode:confidence:", v9, v12, a5);

  if (!-[MAGraph findAndResolveUniqueEdge:](self->_graph, "findAndResolveUniqueEdge:", v13))
    objc_msgSend(v11, "addEdge:", v13);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v11);

  return v12;
}

- (void)setCanUseLocationDomain:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  -[PGGraph infoNode](self->_graph, "infoNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");

  +[PGGraphInfoNode locationPropertiesWithCanUseLocationDomain:](PGGraphInfoNode, "locationPropertiesWithCanUseLocationDomain:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v7, v6, 0);

}

uint64_t __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __85__PGGraphBuilder_Location__insertLocationHierarchyWithClueCollection_fromMomentNode___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (*(_QWORD *)(a1 + 72) <= a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "universalStartDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "universalEndDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(*(id *)(a1 + 32), "count");
        v18 = 134218498;
        v19 = a3;
        v20 = 2048;
        v21 = v17;
        v22 = 2112;
        v23 = v8;
        _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Index of location (%lu) mismatches number of time input clues (%lu). Will use start date of clue collection %@", (uint8_t *)&v18, 0x20u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "universalStartDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "universalEndDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
    v14 = *(void **)(a1 + 48);
    objc_msgSend(v5, "score");
    objc_msgSend(v14, "insertAddressNodeWithPlacemark:location:relevance:numberOfAssets:duringDateInterval:fromMomentNode:", v6, v12, objc_msgSend(v5, "numberOfAssets"), v13, *(_QWORD *)(a1 + 56), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v16);

  }
}

void __104__PGGraphBuilder_Location__insertLocationHierarchyWithProjectedPlacemark_fromAddressNode_changeRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localeIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __101__PGGraphBuilder_Location__insertAreasOfInterestForProjectedPlacemark_fromAddressNode_changeRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  void *v7;
  PGGraphAreaNode *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (double)(unint64_t)(*(_QWORD *)(a1 + 64) - a3) * 0.5 / (double)*(unint64_t *)(a1 + 64) + 0.5;
  +[PGGraphAreaNode filterWithName:](PGGraphAreaNode, "filterWithName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "anyNodeMatchingFilter:", v7);
  v8 = (PGGraphAreaNode *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  if (!v8)
  {
    v8 = -[PGGraphAreaNode initWithName:isBlocked:popularityScore:]([PGGraphAreaNode alloc], "initWithName:isBlocked:popularityScore:", v5, *(unsigned __int8 *)(a1 + 72), v10);
    objc_msgSend(*(id *)(a1 + 48), "addNode:", v8);
    v12 = -[PGGraphAreaEdge initFromAddressNode:toAreaNode:relevance:]([PGGraphAreaEdge alloc], "initFromAddressNode:toAreaNode:relevance:", *(_QWORD *)(a1 + 56), v8, v6);
LABEL_17:
    objc_msgSend(*(id *)(a1 + 48), "addEdge:", v12);
    goto LABEL_18;
  }
  if (!*(_BYTE *)(a1 + 73) && *(unsigned __int8 *)(a1 + 72) != -[PGGraphAreaNode isBlocked](v8, "isBlocked"))
  {
    if (*(_BYTE *)(a1 + 72))
    {
      +[PGGraphAreaNode setIsBlocked:onNodeForIdentifier:inGraph:](PGGraphAreaNode, "setIsBlocked:onNodeForIdentifier:inGraph:", 1, -[MANode identifier](v8, "identifier"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v18 = 138477827;
        v19 = v5;
        _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Inconsistent blocked state for area %{private}@", (uint8_t *)&v18, 0xCu);
      }

    }
  }
  -[PGGraphAreaNode popularityScore](v8, "popularityScore");
  if (v14 != v11)
  {
    v15 = v14;
    objc_msgSend((id)*MEMORY[0x1E0D4B0B8], "doubleValue");
    if (v15 == v16)
    {
      +[PGGraphAreaNode setPopularityScore:onNodeForIdentifier:inGraph:](PGGraphAreaNode, "setPopularityScore:onNodeForIdentifier:inGraph:", -[MANode identifier](v8, "identifier"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = 138477827;
        v19 = v5;
        _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Inconsistent popularity score for area %{private}@.", (uint8_t *)&v18, 0xCu);
      }

    }
  }
  v12 = -[PGGraphAreaEdge initFromAddressNode:toAreaNode:relevance:]([PGGraphAreaEdge alloc], "initFromAddressNode:toAreaNode:relevance:", *(_QWORD *)(a1 + 56), v8, v6);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "findAndResolveUniqueEdge:", v12) & 1) == 0)
    goto LABEL_17;
LABEL_18:

}

- (PGGraphBuilder)initWithGraph:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  PGGraphBuilder *v9;
  PGGraphBuilder *v10;
  uint64_t v11;
  PHPhotoLibrary *photoLibrary;
  uint64_t v13;
  CLSSceneTaxonomyHierarchy *sceneTaxonomy;
  uint64_t v15;
  CLSSceneTaxonomyHierarchy *entityNetSceneTaxonomy;
  uint64_t v17;
  PGCurationManager *curationManager;
  uint64_t v19;
  CLSServiceManager *serviceManager;
  uint64_t v21;
  OS_os_log *loggingConnection;
  void *v23;
  double v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *curationScoreByAsset;
  NSMutableDictionary *v27;
  NSMutableDictionary *interactionScoreByAsset;
  NSMutableDictionary *v29;
  NSMutableDictionary *generativeMemoryCreationEligibilityStateByAsset;
  uint64_t v31;
  PNSafeAssetAnalyzer *safeAssetAnalyzer;
  PGGraphTimeDomainBuildingHelper *v33;
  PGGraphTimeDomainBuildingHelper *timeDomainBuildingHelper;
  PGGraphPeopleDomainBuildingHelper *v35;
  PGGraphPeopleDomainBuildingHelper *peopleDomainBuildingHelper;
  uint64_t v37;
  NSSet *sharedLibraryParticipants;
  void *v39;
  PGMutableGraph *graph;
  uint64_t v41;
  id v42;
  PGEventLabelingFeaturesFileCache *eventLabelingFeaturesCache;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  CLSLocationCache *locationCache;
  uint64_t v48;
  CLSAOICache *aoiCache;
  uint64_t v50;
  CLSPOICache *poiCache;
  uint64_t v52;
  CLSROICache *roiCache;
  uint64_t v54;
  CLSNatureCache *natureCache;
  uint64_t v56;
  CLSPublicEventManager *publicEventManager;
  id v59;
  objc_super v60;
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v60.receiver = self;
  v60.super_class = (Class)PGGraphBuilder;
  v9 = -[PGGraphBuilder init](&v60, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    objc_msgSend(v8, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
    sceneTaxonomy = v10->_sceneTaxonomy;
    v10->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v13;

    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 0);
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v15;
    }
    else
    {
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = 0;
    }

    objc_msgSend(v8, "curationManager");
    v17 = objc_claimAutoreleasedReturnValue();
    curationManager = v10->_curationManager;
    v10->_curationManager = (PGCurationManager *)v17;

    objc_msgSend(v8, "serviceManager");
    v19 = objc_claimAutoreleasedReturnValue();
    serviceManager = v10->_serviceManager;
    v10->_serviceManager = (CLSServiceManager *)v19;

    objc_msgSend(v8, "ingestLoggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v10->_loggingConnection;
    v10->_loggingConnection = (OS_os_log *)v21;

    v10->_keepsExistingAssetCurationScores = objc_msgSend(v8, "photoLibraryIsReadonly");
    -[PGGraph infoNode](v10->_graph, "infoNode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topTierAestheticScore");
    v10->_topTierAestheticScore = v24;
    v10->_numberOfUtilityAssets = objc_msgSend(v23, "numberOfUtilityAssets");
    v10->_numberOfDefaultAssets = objc_msgSend(v23, "numberOfDefaultAssets");
    v10->_numberOfImprovedAssets = objc_msgSend(v23, "numberOfImprovedAssets");
    v10->_numberOfBetterAssets = objc_msgSend(v23, "numberOfBetterAssets");
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    curationScoreByAsset = v10->_curationScoreByAsset;
    v10->_curationScoreByAsset = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    interactionScoreByAsset = v10->_interactionScoreByAsset;
    v10->_interactionScoreByAsset = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    generativeMemoryCreationEligibilityStateByAsset = v10->_generativeMemoryCreationEligibilityStateByAsset;
    v10->_generativeMemoryCreationEligibilityStateByAsset = v29;

    if (v10->_photoLibrary)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77ED8]), "initWithPhotoLibrary:", v10->_photoLibrary);
      safeAssetAnalyzer = v10->_safeAssetAnalyzer;
      v10->_safeAssetAnalyzer = (PNSafeAssetAnalyzer *)v31;
    }
    else
    {
      safeAssetAnalyzer = v10->_safeAssetAnalyzer;
      v10->_safeAssetAnalyzer = 0;
    }

    v33 = -[PGGraphTimeDomainBuildingHelper initWithGraph:]([PGGraphTimeDomainBuildingHelper alloc], "initWithGraph:", v10->_graph);
    timeDomainBuildingHelper = v10->_timeDomainBuildingHelper;
    v10->_timeDomainBuildingHelper = v33;

    v35 = objc_alloc_init(PGGraphPeopleDomainBuildingHelper);
    peopleDomainBuildingHelper = v10->_peopleDomainBuildingHelper;
    v10->_peopleDomainBuildingHelper = v35;

    -[PGGraphBuilder _buildSceneNodeCache](v10, "_buildSceneNodeCache");
    if (v10->_photoLibrary)
    {
      v10->_isSharedLibraryEnabled = +[PGGraphBuilder isSharedLibraryEnabledForLibrary:](PGGraphBuilder, "isSharedLibraryEnabledForLibrary:");
      +[PGGraphBuilder sharedLibraryParticipantsForLibrary:](PGGraphBuilder, "sharedLibraryParticipantsForLibrary:", v10->_photoLibrary);
    }
    else
    {
      v10->_isSharedLibraryEnabled = 0;
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    }
    v37 = objc_claimAutoreleasedReturnValue();
    sharedLibraryParticipants = v10->_sharedLibraryParticipants;
    v10->_sharedLibraryParticipants = (NSSet *)v37;

    if (+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled"))
    {
      -[PHPhotoLibrary urlForApplicationDataFolderIdentifier:](v10->_photoLibrary, "urlForApplicationDataFolderIdentifier:", 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      graph = v10->_graph;
      v59 = 0;
      +[PGEventLabelingFeaturesFileCache cacheForMomentGraphRebuildWithGraphServiceURL:graph:error:](PGEventLabelingFeaturesFileCache, "cacheForMomentGraphRebuildWithGraphServiceURL:graph:error:", v39, graph, &v59);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v59;
      eventLabelingFeaturesCache = v10->_eventLabelingFeaturesCache;
      v10->_eventLabelingFeaturesCache = (PGEventLabelingFeaturesFileCache *)v41;

      if (!v10->_eventLabelingFeaturesCache)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "loggingConnection");
        v45 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v42;
          _os_log_error_impl(&dword_1CA237000, v45, OS_LOG_TYPE_ERROR, "[PGGraphBuilder] Error initializing EventLabeling cache: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v39 = v10->_eventLabelingFeaturesCache;
      v10->_eventLabelingFeaturesCache = 0;
    }

    objc_msgSend(v8, "locationCache");
    v46 = objc_claimAutoreleasedReturnValue();
    locationCache = v10->_locationCache;
    v10->_locationCache = (CLSLocationCache *)v46;

    objc_msgSend(v8, "aoiCache");
    v48 = objc_claimAutoreleasedReturnValue();
    aoiCache = v10->_aoiCache;
    v10->_aoiCache = (CLSAOICache *)v48;

    objc_msgSend(v8, "poiCache");
    v50 = objc_claimAutoreleasedReturnValue();
    poiCache = v10->_poiCache;
    v10->_poiCache = (CLSPOICache *)v50;

    objc_msgSend(v8, "roiCache");
    v52 = objc_claimAutoreleasedReturnValue();
    roiCache = v10->_roiCache;
    v10->_roiCache = (CLSROICache *)v52;

    objc_msgSend(v8, "natureCache");
    v54 = objc_claimAutoreleasedReturnValue();
    natureCache = v10->_natureCache;
    v10->_natureCache = (CLSNatureCache *)v54;

    objc_msgSend(v8, "publicEventManager");
    v56 = objc_claimAutoreleasedReturnValue();
    publicEventManager = v10->_publicEventManager;
    v10->_publicEventManager = (CLSPublicEventManager *)v56;

  }
  return v10;
}

- (PGGraphBuilder)initWithGraph:(id)a3 locationCache:(id)a4
{
  id v7;
  id v8;
  PGGraphBuilder *v9;
  PGGraphBuilder *v10;
  uint64_t v11;
  CLSSceneTaxonomyHierarchy *sceneTaxonomy;
  uint64_t v13;
  CLSSceneTaxonomyHierarchy *entityNetSceneTaxonomy;
  PGGraphTimeDomainBuildingHelper *v15;
  PGGraphTimeDomainBuildingHelper *timeDomainBuildingHelper;
  PGGraphPeopleDomainBuildingHelper *v17;
  PGGraphPeopleDomainBuildingHelper *peopleDomainBuildingHelper;
  uint64_t v19;
  CLSServiceManager *serviceManager;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PGGraphBuilder;
  v9 = -[PGGraphBuilder init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
    sceneTaxonomy = v10->_sceneTaxonomy;
    v10->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v11;

    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 0);
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v13;
    }
    else
    {
      entityNetSceneTaxonomy = v10->_entityNetSceneTaxonomy;
      v10->_entityNetSceneTaxonomy = 0;
    }

    objc_storeStrong((id *)&v10->_loggingConnection, MEMORY[0x1E0C81028]);
    v15 = -[PGGraphTimeDomainBuildingHelper initWithGraph:]([PGGraphTimeDomainBuildingHelper alloc], "initWithGraph:", v10->_graph);
    timeDomainBuildingHelper = v10->_timeDomainBuildingHelper;
    v10->_timeDomainBuildingHelper = v15;

    v17 = objc_alloc_init(PGGraphPeopleDomainBuildingHelper);
    peopleDomainBuildingHelper = v10->_peopleDomainBuildingHelper;
    v10->_peopleDomainBuildingHelper = v17;

    -[PGGraphBuilder _buildSceneNodeCache](v10, "_buildSceneNodeCache");
    objc_storeStrong((id *)&v10->_locationCache, a4);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B258]), "initWithLocationCache:", v10->_locationCache);
    serviceManager = v10->_serviceManager;
    v10->_serviceManager = (CLSServiceManager *)v19;

  }
  return v10;
}

- (PGGraphBuilder)initWithGraph:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGGraphBuilder *v11;

  v4 = (objc_class *)MEMORY[0x1E0D4B1C0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)MEMORY[0x1E0D4B1C0];
  +[PGManager graphServicesURLWithPhotoLibrary:](PGManager, "graphServicesURLWithPhotoLibrary:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlWithParentURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithURL:", v9);

  v11 = -[PGGraphBuilder initWithGraph:locationCache:](self, "initWithGraph:locationCache:", v5, v10);
  return v11;
}

- (CLSCurationContext)curationContext
{
  PGGraphBuilder *v2;
  uint64_t v3;
  CLSCurationContext *curationContext;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_curationContext)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v2->_photoLibrary);
    curationContext = v2->_curationContext;
    v2->_curationContext = (CLSCurationContext *)v3;

  }
  objc_sync_exit(v2);

  return v2->_curationContext;
}

- (id)featureProviderWithProgressBlock:(id)a3
{
  id v4;
  PGGraphBuilder *v5;
  PGAssetCollectionFeatureProvider *v6;
  PGMomentFeatureSpecificationFactory *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  PGAssetCollectionFeatureProvider *v17;
  PGAssetCollectionFeatureProvider *featureProvider;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, _BYTE *);
  void *v23;
  id v24;
  id v25;
  PGMomentFeatureSpecificationFactory *v26;
  id v27;
  uint8_t *v28;
  _QWORD *v29;
  _QWORD v30[4];
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_featureProvider)
    goto LABEL_2;
  v7 = -[PGMomentFeatureSpecificationFactory initWithSceneTaxonomy:loggingConnection:]([PGMomentFeatureSpecificationFactory alloc], "initWithSceneTaxonomy:loggingConnection:", v5->_sceneTaxonomy, v5->_loggingConnection);
  -[PGMomentFeatureSpecificationFactory allSupportedFeatureTypes](v7, "allSupportedFeatureTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v11);
    *(_QWORD *)buf = 0;
    v32 = buf;
    v33 = 0x2020000000;
    v34 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    *(double *)&v30[3] = 1.0 / (double)v10;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __51__PGGraphBuilder_featureProviderWithProgressBlock___block_invoke;
    v23 = &unk_1E842A2F0;
    v28 = buf;
    v29 = v30;
    v13 = v12;
    v24 = v13;
    v14 = v9;
    v25 = v14;
    v26 = v7;
    v15 = v11;
    v27 = v15;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", &v20);
    if ((objc_msgSend(v15, "isCancelled", v20, v21, v22, v23) & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      v17 = -[PGAssetCollectionFeatureProvider initWithFeatureSpecifications:]([PGAssetCollectionFeatureProvider alloc], "initWithFeatureSpecifications:", v14);
      featureProvider = v5->_featureProvider;
      v5->_featureProvider = v17;

      v16 = 0;
    }

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGGraphBuilder] No supported feature types", buf, 2u);
    }
    v16 = 1;
  }

  if (!v16)
  {
LABEL_2:
    objc_sync_exit(v5);

    v6 = v5->_featureProvider;
  }
  else
  {
    objc_sync_exit(v5);

    v6 = 0;
  }

  return v6;
}

- (void)prepareGraphForRebuild
{
  objc_msgSend((id)objc_opt_class(), "prepareGraphForRebuild:", self->_graph);
}

- (id)_cleanUpMoments:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v4 = v3;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v10, "startDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "endDate");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (v14
            || objc_msgSend(v11, "compare:", v12) == 1
            || objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v11) < 1826
            || objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v13) >= 2201)
          {
            objc_msgSend(v5, "addObject:", v10);
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "loggingConnection");
            v16 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = (uint64_t)v11;
              v29 = 2112;
              v30 = v13;
              _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Moment to insert has bogus dates (%@ -> %@)", buf, 0x16u);
            }

          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v7);
    }

    v17 = objc_msgSend(v5, "count");
    if (v17)
    {
      v18 = v17;
      v19 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v19, "minusSet:", v5);

      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v28 = v18;
        _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "Found %lu bogus moments, removing them from Moments to insert", buf, 0xCu);
      }

      v4 = v19;
    }

  }
  return v4;
}

- (id)_insertMomentNodeForClueCollection:(id)a3 feeder:(id)a4 insertedAndUpdatedPersonNodes:(id *)a5 graphUpdate:(id)a6 progressBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(void *, mach_timebase_info *, double);
  double Current;
  char v18;
  void *v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  OS_os_log *v23;
  void *v24;
  id v25;
  double v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  void (**v31)(void *, mach_timebase_info *, double);
  void *v32;
  PGCurationManager *curationManager;
  void *v34;
  double v35;
  char v36;
  double v37;
  char v38;
  PGGraphBuilderMomentEnvelope *v39;
  id v40;
  double v41;
  char v42;
  double v43;
  char v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  double v48;
  char v49;
  double v50;
  char v51;
  double v52;
  char v53;
  double v54;
  char v55;
  void *v56;
  OS_os_log *v57;
  double v58;
  char v59;
  NSObject *v60;
  id v61;
  id v62;
  double v63;
  char v64;
  id v65;
  double v66;
  char v67;
  id v68;
  void *v69;
  double v70;
  char v71;
  NSObject *v72;
  void *v73;
  double v74;
  char v75;
  OS_os_log *v76;
  os_signpost_id_t v77;
  NSObject *v78;
  NSObject *v79;
  void *v80;
  PGEventLabelingFeaturesFileCache *eventLabelingFeaturesCache;
  void *v82;
  PHPhotoLibrary *photoLibrary;
  BOOL v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  uint32_t denom;
  uint32_t numer;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  double v94;
  char v95;
  NSObject *v96;
  id v97;
  void *v98;
  void *v100;
  void *v101;
  uint64_t v102;
  os_signpost_id_t spid;
  unint64_t v104;
  id v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void (**v109)(void *, mach_timebase_info *, double);
  void *v110;
  void *v111;
  PGGraphBuilderMomentEnvelope *v112;
  void *v113;
  void *context;
  id v115;
  id *v116;
  void *v117;
  id v118;
  _QWORD v119[4];
  void (**v120)(void *, mach_timebase_info *, double);
  uint64_t *v121;
  uint64_t *v122;
  uint64_t v123;
  mach_timebase_info info;
  _QWORD v125[4];
  void (**v126)(void *, mach_timebase_info *, double);
  uint64_t *v127;
  uint64_t *v128;
  uint64_t v129;
  unsigned __int8 v130;
  _QWORD v131[4];
  void (**v132)(void *, mach_timebase_info *, double);
  uint64_t *v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t v136;
  double *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  char v143;
  uint8_t buf[4];
  _BYTE v145[18];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v15);
  v140 = 0;
  v141 = &v140;
  v142 = 0x2020000000;
  v143 = 0;
  v136 = 0;
  v137 = (double *)&v136;
  v138 = 0x2020000000;
  v139 = 0;
  if (v16)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v137[3] >= 0.01)
    {
      v137[3] = Current;
      LOBYTE(info.numer) = 0;
      v16[2](v16, &info, 0.0);
      v18 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v141 + 24) = v18;
      if (v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v145 = 324;
          *(_WORD *)&v145[4] = 2080;
          *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_10:
        v25 = 0;
        goto LABEL_150;
      }
    }
  }
  v116 = a5;
  objc_msgSend(v12, "universalEndDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "universalStartDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v20);
  v22 = v21 > 172800.0;

  if (v22)
  {
    v23 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "assetCollection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v145 = v24;
      _os_log_impl(&dword_1CA237000, (os_log_t)v23, OS_LOG_TYPE_INFO, "Don't insert [%@] because its time interval is more than 2 days", buf, 0xCu);

    }
    goto LABEL_10;
  }
  context = (void *)MEMORY[0x1CAA4EB2C]();
  if (v16)
  {
    v26 = CFAbsoluteTimeGetCurrent();
    if (v26 - v137[3] >= 0.01)
    {
      v137[3] = v26;
      LOBYTE(info.numer) = 0;
      v16[2](v16, &info, 0.1);
      v27 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v141 + 24) = v27;
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v145 = 336;
          *(_WORD *)&v145[4] = 2080;
          *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v28 = 0;
        v29 = 0;
        v30 = 1;
        goto LABEL_144;
      }
    }
  }
  v115 = -[PGGraphIngestMomentContainer initMomentContainerWithFeeder:clueCollection:curationManager:topTierAestheticScore:curationContext:]([PGGraphIngestMomentContainer alloc], "initMomentContainerWithFeeder:clueCollection:curationManager:topTierAestheticScore:curationContext:", v13, v12, self->_curationManager, self->_curationContext, self->_topTierAestheticScore);
  v131[0] = MEMORY[0x1E0C809B0];
  v131[1] = 3221225472;
  v131[2] = __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke;
  v131[3] = &unk_1E8434F30;
  v31 = v16;
  v132 = v31;
  v133 = &v136;
  v134 = &v140;
  v135 = 0x3F847AE147AE147BLL;
  -[PGGraphBuilder insertAssetCurationScoreInLibraryForFeeder:progressBlock:](self, "insertAssetCurationScoreInLibraryForFeeder:progressBlock:", v13, v131);
  objc_msgSend(v13, "assetCollection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "uuid");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    curationManager = self->_curationManager;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v117);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationManager invalidateCurationCacheForMomentUUIDs:](curationManager, "invalidateCurationCacheForMomentUUIDs:", v34);

  }
  if (!v16
    || (v35 = CFAbsoluteTimeGetCurrent(), v35 - v137[3] < 0.01)
    || (v137[3] = v35,
        LOBYTE(info.numer) = 0,
        v31[2](v31, &info, 0.2),
        v36 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v141 + 24) = v36) == 0))
  {
    -[PGGraphBuilder insertMomentNodeForMoment:](self, "insertMomentNodeForMoment:", v115);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "loggingConnection");
      v47 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "assetCollection");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v145 = v98;
        _os_log_error_impl(&dword_1CA237000, v47, OS_LOG_TYPE_ERROR, "Failed to insert moment: \"%@\", buf, 0xCu);

      }
      goto LABEL_45;
    }
    if (v16)
    {
      v37 = CFAbsoluteTimeGetCurrent();
      if (v37 - v137[3] >= 0.01)
      {
        v137[3] = v37;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.4);
        v38 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v38;
        if (v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 357;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v28 = 0;
          goto LABEL_46;
        }
      }
    }
    v39 = -[PGGraphBuilderMomentEnvelope initWithMomentNode:]([PGGraphBuilderMomentEnvelope alloc], "initWithMomentNode:", v29);
    v40 = -[PGGraphBuilder insertDateNodesWithClueCollection:fromMomentNode:](self, "insertDateNodesWithClueCollection:fromMomentNode:", v12, v29);
    v112 = v39;
    if (v16)
    {
      v41 = CFAbsoluteTimeGetCurrent();
      if (v41 - v137[3] >= 0.01)
      {
        v137[3] = v41;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.5);
        v42 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v42;
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 363;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v28 = 0;
          v30 = 1;
          goto LABEL_142;
        }
      }
    }
    -[PGGraphBuilder insertScenesWithClueCollection:fromMomentNode:](self, "insertScenesWithClueCollection:fromMomentNode:", v12, v29);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilderMomentEnvelope setSceneEdges:](v39, "setSceneEdges:", v113);
    if (v16)
    {
      v43 = CFAbsoluteTimeGetCurrent();
      if (v43 - v137[3] >= 0.01)
      {
        v137[3] = v43;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.6);
        v44 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v44;
        if (v44)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 368;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            v45 = MEMORY[0x1E0C81028];
LABEL_60:
            _os_log_impl(&dword_1CA237000, v45, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_61;
          }
          goto LABEL_61;
        }
      }
    }
    if (_os_feature_enabled_impl())
    {
      -[PGGraphBuilder insertVisualLookupScenesWithClueCollection:fromMomentNode:](self, "insertVisualLookupScenesWithClueCollection:fromMomentNode:", v12, v29);
      if (v16)
      {
        v48 = CFAbsoluteTimeGetCurrent();
        if (v48 - v137[3] >= 0.01)
        {
          v137[3] = v48;
          LOBYTE(info.numer) = 0;
          v31[2](v31, &info, 0.7);
          v49 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
          *((_BYTE *)v141 + 24) = v49;
          if (v49)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v145 = 372;
              *(_WORD *)&v145[4] = 2080;
              *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/PGGraphBuilder.m";
              v45 = MEMORY[0x1E0C81028];
              goto LABEL_60;
            }
LABEL_61:
            v28 = 0;
            v30 = 1;
LABEL_141:

LABEL_142:
            goto LABEL_143;
          }
        }
      }
    }
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      -[PGGraphBuilder insertEntityNetScenesWithClueCollection:fromMomentNode:](self, "insertEntityNetScenesWithClueCollection:fromMomentNode:", v12, v29);
      if (v16)
      {
        v50 = CFAbsoluteTimeGetCurrent();
        if (v50 - v137[3] >= 0.01)
        {
          v137[3] = v50;
          LOBYTE(info.numer) = 0;
          v31[2](v31, &info, 0.75);
          v51 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
          *((_BYTE *)v141 + 24) = v51;
          if (v51)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v145 = 377;
              *(_WORD *)&v145[4] = 2080;
              *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/PGGraphBuilder.m";
              v45 = MEMORY[0x1E0C81028];
              goto LABEL_60;
            }
            goto LABEL_61;
          }
        }
      }
    }
    -[PGGraphBuilder insertLocationHierarchyWithClueCollection:fromMomentNode:](self, "insertLocationHierarchyWithClueCollection:fromMomentNode:", v12, v29);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v52 = CFAbsoluteTimeGetCurrent();
      if (v52 - v137[3] >= 0.01)
      {
        v137[3] = v52;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.8);
        v53 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v53;
        if (v53)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 382;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v28 = 0;
LABEL_73:
          v30 = 1;
LABEL_140:

          goto LABEL_141;
        }
      }
    }
    v130 = 0;
    -[PGGraphBuilder insertPeopleWithClueCollection:fromMomentNode:addressNodes:isNearPeopleAddress:](self, "insertPeopleWithClueCollection:fromMomentNode:addressNodes:isNearPeopleAddress:", v12, v29, v111, &v130);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v54 = CFAbsoluteTimeGetCurrent();
      if (v54 - v137[3] >= 0.01)
      {
        v137[3] = v54;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.9);
        v55 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v55;
        if (v55)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 388;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_73;
        }
      }
    }
    -[PGGraph meNode](self->_graph, "meNode");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PGGraphBuilder isSharedLibraryEnabled](self, "isSharedLibraryEnabled")
      && objc_msgSend(v29, "sharingComposition"))
    {
      objc_msgSend(v13, "shareParticipants");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphBuilder insertShareParticipantsAsAuthors:forMomentNode:](self, "insertShareParticipantsAsAuthors:forMomentNode:", v56, v29);

      if (v110 && objc_msgSend(v29, "sharingComposition") == 1)
        -[PGGraphBuilder checkAndInsertPersonIsAroundEdgeFromMeNode:toMomentNode:withClueCollection:](self, "checkAndInsertPersonIsAroundEdgeFromMeNode:toMomentNode:withClueCollection:", v110, v29, v12);
    }
    else if (v110)
    {
      -[PGGraphBuilder insertMeAsAuthor:forMomentNode:](self, "insertMeAsAuthor:forMomentNode:", v110, v29);
    }
    else
    {
      v57 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA237000, (os_log_t)v57, OS_LOG_TYPE_FAULT, "[PGGraphBuilder][_insertMomentNodeForClueCollection:feeder:] Graph should have Me node during moment ingestion", buf, 2u);
      }

    }
    if (v16)
    {
      v58 = CFAbsoluteTimeGetCurrent();
      if (v58 - v137[3] >= 0.01)
      {
        v137[3] = v58;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.91);
        v59 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v59;
        if (v59)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 404;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            v60 = MEMORY[0x1E0C81028];
LABEL_101:
            _os_log_impl(&dword_1CA237000, v60, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_102;
          }
          goto LABEL_102;
        }
      }
    }
    if (objc_msgSend(v111, "count"))
      v61 = -[PGGraphBuilder insertPOIWithFeeder:fromMomentNode:isNearHomeOrWork:](self, "insertPOIWithFeeder:fromMomentNode:isNearHomeOrWork:", v13, v29, v130);
    v62 = -[PGGraphBuilder insertROIWithClueCollection:fromMomentNode:](self, "insertROIWithClueCollection:fromMomentNode:", v12, v29);
    if (v16)
    {
      v63 = CFAbsoluteTimeGetCurrent();
      if (v63 - v137[3] >= 0.01)
      {
        v137[3] = v63;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.93);
        v64 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v64;
        if (v64)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 412;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            v60 = MEMORY[0x1E0C81028];
            goto LABEL_101;
          }
LABEL_102:
          v30 = 1;
LABEL_139:

          goto LABEL_140;
        }
      }
    }
    v65 = -[PGGraphBuilder insertPartOfDayNodesWithClueCollection:fromMomentNode:](self, "insertPartOfDayNodesWithClueCollection:fromMomentNode:", v12, v29);
    if (v16)
    {
      v66 = CFAbsoluteTimeGetCurrent();
      if (v66 - v137[3] >= 0.01)
      {
        v137[3] = v66;
        LOBYTE(info.numer) = 0;
        v31[2](v31, &info, 0.97);
        v67 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v141 + 24) = v67;
        if (v67)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 416;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            v60 = MEMORY[0x1E0C81028];
            goto LABEL_101;
          }
          goto LABEL_102;
        }
      }
    }
    v68 = -[PGGraphBuilder insertLocationMobilityNodeWithClueCollection:fromMomentNode:](self, "insertLocationMobilityNodeWithClueCollection:fromMomentNode:", v12, v29);
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_203;
    v125[3] = &unk_1E8434F30;
    v109 = v31;
    v126 = v109;
    v127 = &v136;
    v128 = &v140;
    v129 = 0x3F847AE147AE147BLL;
    -[PGGraphBuilder featureProviderWithProgressBlock:](self, "featureProviderWithProgressBlock:", v125);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && (v70 = CFAbsoluteTimeGetCurrent(), v70 - v137[3] >= 0.01)
      && (v137[3] = v70,
          LOBYTE(info.numer) = 0,
          v109[2](v109, &info, 0.98),
          v71 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer),
          (*((_BYTE *)v141 + 24) = v71) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v145 = 423;
        *(_WORD *)&v145[4] = 2080;
        *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/PGGraphBuilder.m";
        v72 = MEMORY[0x1E0C81028];
LABEL_113:
        _os_log_impl(&dword_1CA237000, v72, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      objc_msgSend(v13, "allItems");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphBuilder insertMomentFeaturesForMomentNode:momentEnvelope:assets:featureProvider:atMomentIngest:curationContext:](self, "insertMomentFeaturesForMomentNode:momentEnvelope:assets:featureProvider:atMomentIngest:curationContext:", v29, v112, v73, v69, 1, self->_curationContext);
      v108 = v69;

      if (!v16
        || (v74 = CFAbsoluteTimeGetCurrent(), v74 - v137[3] < 0.01)
        || (v137[3] = v74,
            LOBYTE(info.numer) = 0,
            v109[2](v109, &info, 0.99),
            v75 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer),
            (*((_BYTE *)v141 + 24) = v75) == 0))
      {
        if (self->_eventLabelingFeaturesCache)
        {
          v76 = self->_loggingConnection;
          v77 = os_signpost_id_generate((os_log_t)v76);
          v78 = v76;
          v79 = v78;
          spid = v77;
          v104 = v77 - 1;
          if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v79, OS_SIGNPOST_INTERVAL_BEGIN, v77, "PGEventLabelingFeaturesFileCache", ", buf, 2u);
          }

          info = 0;
          mach_timebase_info(&info);
          v102 = mach_absolute_time();
          v106 = v79;
          v80 = (void *)MEMORY[0x1E0D42A58];
          v119[0] = MEMORY[0x1E0C809B0];
          v119[1] = 3221225472;
          v119[2] = __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_204;
          v119[3] = &unk_1E8434F30;
          v120 = v109;
          v121 = &v136;
          v122 = &v140;
          v123 = 0x3F847AE147AE147BLL;
          objc_msgSend(v80, "progressReporterWithProgressBlock:", v119);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          eventLabelingFeaturesCache = self->_eventLabelingFeaturesCache;
          objc_msgSend(v13, "assetFetchResult");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          photoLibrary = self->_photoLibrary;
          v118 = 0;
          v84 = -[PGEventLabelingFeaturesFileCache writeFeaturesForMomentNode:assetFetchResult:photoLibrary:progressReporter:error:](eventLabelingFeaturesCache, "writeFeaturesForMomentNode:assetFetchResult:photoLibrary:progressReporter:error:", v29, v82, photoLibrary, v107, &v118);
          v105 = v118;

          v85 = v106;
          if (!v84)
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "loggingConnection");
            v87 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v29, "localIdentifier");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "description");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v145 = v100;
              *(_WORD *)&v145[8] = 2112;
              *(_QWORD *)&v145[10] = v101;
              _os_log_error_impl(&dword_1CA237000, v87, OS_LOG_TYPE_ERROR, "[EventLabeling] Error caching features for moment %@: %@", buf, 0x16u);

              v85 = v106;
            }

          }
          v88 = mach_absolute_time();
          numer = info.numer;
          denom = info.denom;
          v91 = v85;
          v92 = v91;
          if (v104 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v92, OS_SIGNPOST_INTERVAL_END, spid, "PGEventLabelingFeaturesFileCache", ", buf, 2u);
          }

          v93 = v92;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v145 = "PGEventLabelingFeaturesFileCache";
            *(_WORD *)&v145[8] = 2048;
            *(double *)&v145[10] = (float)((float)((float)((float)(v88 - v102) * (float)numer) / (float)denom)
                                         / 1000000.0);
            _os_log_impl(&dword_1CA237000, v93, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }

        }
        if (v16)
        {
          v94 = CFAbsoluteTimeGetCurrent();
          v69 = v108;
          if (v94 - v137[3] < 0.01
            || (v137[3] = v94,
                LOBYTE(info.numer) = 0,
                v109[2](v109, &info, 1.0),
                v95 = *((_BYTE *)v141 + 24) | LOBYTE(info.numer),
                (*((_BYTE *)v141 + 24) = v95) == 0))
          {
            v30 = 0;
            goto LABEL_138;
          }
          v96 = MEMORY[0x1E0C81028];
          v97 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v145 = 444;
            *(_WORD *)&v145[4] = 2080;
            *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v30 = 1;
        }
        else
        {
          v30 = 0;
        }
        v69 = v108;
        goto LABEL_138;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v145 = 427;
        *(_WORD *)&v145[4] = 2080;
        *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/PGGraphBuilder.m";
        v72 = MEMORY[0x1E0C81028];
        goto LABEL_113;
      }
    }
    v30 = 1;
LABEL_138:

    goto LABEL_139;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v145 = 349;
    *(_WORD *)&v145[4] = 2080;
    *(_QWORD *)&v145[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Ingest/PGGraphBuilder.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_45:
  v28 = 0;
  v29 = 0;
LABEL_46:
  v30 = 1;
LABEL_143:

LABEL_144:
  objc_autoreleasePoolPop(context);
  if (v30)
  {
    v25 = 0;
  }
  else
  {
    if (v116)
      *v116 = objc_retainAutorelease(v28);
    v25 = v29;
  }

LABEL_150:
  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v140, 8);

  return v25;
}

- (id)momentNodesWhereMeIsPresent
{
  PGGraphMomentNodeCollection *momentNodesWhereMeIsPresent;
  void *v4;
  void *v5;
  PGGraphMomentNodeCollection *v6;
  PGGraphMomentNodeCollection *v7;

  momentNodesWhereMeIsPresent = self->_momentNodesWhereMeIsPresent;
  if (!momentNodesWhereMeIsPresent)
  {
    -[PGGraphBuilder graph](self, "graph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "meNodeCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "momentNodesWithPresence");
    v6 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    v7 = self->_momentNodesWhereMeIsPresent;
    self->_momentNodesWhereMeIsPresent = v6;

    momentNodesWhereMeIsPresent = self->_momentNodesWhereMeIsPresent;
  }
  return momentNodesWhereMeIsPresent;
}

- (void)_buildSceneNodeCache
{
  NSMutableDictionary *v3;
  NSMutableDictionary *sceneNodeBySceneName;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *visualLookupSceneNodeBySceneName;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *entityNetSceneNodeBySceneName;
  NSMutableSet *v12;
  NSMutableSet *entityNetSceneTaxonomyNodesNotIndexedInSearch;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sceneNodeBySceneName = self->_sceneNodeBySceneName;
  self->_sceneNodeBySceneName = v3;

  +[PGGraphNodeCollection nodesInGraph:](PGGraphSceneNodeCollection, "nodesInGraph:", self->_graph);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__PGGraphBuilder__buildSceneNodeCache__block_invoke;
  v18[3] = &unk_1E8432370;
  v18[4] = self;
  v15 = v5;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v18);
  if (_os_feature_enabled_impl())
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    visualLookupSceneNodeBySceneName = self->_visualLookupSceneNodeBySceneName;
    self->_visualLookupSceneNodeBySceneName = v7;

    +[PGGraphNodeCollection nodesInGraph:](PGGraphVisualLookupSceneNodeCollection, "nodesInGraph:", self->_graph);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __38__PGGraphBuilder__buildSceneNodeCache__block_invoke_2;
    v17[3] = &unk_1E842FA38;
    v17[4] = self;
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v17);

  }
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entityNetSceneNodeBySceneName = self->_entityNetSceneNodeBySceneName;
    self->_entityNetSceneNodeBySceneName = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    entityNetSceneTaxonomyNodesNotIndexedInSearch = self->_entityNetSceneTaxonomyNodesNotIndexedInSearch;
    self->_entityNetSceneTaxonomyNodesNotIndexedInSearch = v12;

    +[PGGraphNodeCollection nodesInGraph:](PGGraphEntityNetSceneNodeCollection, "nodesInGraph:", self->_graph);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __38__PGGraphBuilder__buildSceneNodeCache__block_invoke_3;
    v16[3] = &unk_1E842A318;
    v16[4] = self;
    objc_msgSend(v14, "enumerateNodesUsingBlock:", v16);

  }
}

- (void)performBatchUpdatesWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  OS_os_log *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  char v18;
  NSObject *v19;
  id v20;
  int v21;
  _BOOL4 v22;
  NSObject *v23;
  id v24;
  int v25;
  _BOOL4 v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  mach_timebase_info v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  double v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  mach_timebase_info v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  mach_timebase_info v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  os_signpost_id_t v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  mach_timebase_info v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  int v69;
  _BOOL4 v70;
  NSObject *v71;
  id v72;
  int v73;
  _BOOL4 v74;
  NSObject *v75;
  id v76;
  int v77;
  _BOOL4 v78;
  NSObject *v79;
  os_signpost_id_t v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  mach_timebase_info v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  os_signpost_id_t v90;
  NSObject *v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  mach_timebase_info v95;
  NSObject *v96;
  NSObject *v97;
  NSObject *v98;
  NSObject *v99;
  os_signpost_id_t v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  mach_timebase_info v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  int v109;
  NSObject *v110;
  id v111;
  int v112;
  _BOOL4 v113;
  NSObject *v114;
  id v115;
  int v116;
  _BOOL4 v117;
  NSObject *v118;
  id v119;
  int v120;
  _BOOL4 v121;
  NSObject *v122;
  id v123;
  int v124;
  _BOOL4 v125;
  void *v126;
  int v127;
  NSObject *v128;
  id v129;
  int v130;
  _BOOL4 v131;
  uint64_t v132;
  uint32_t denom;
  uint32_t numer;
  NSObject *v135;
  NSObject *v136;
  NSObject *v137;
  double Current;
  char v139;
  NSObject *v140;
  id v141;
  int v142;
  _BOOL4 v143;
  uint64_t v144;
  unint64_t v145;
  os_signpost_id_t spid;
  id v147;
  _QWORD v148[4];
  id v149;
  uint64_t *v150;
  uint64_t *v151;
  double v152;
  uint64_t v153;
  _QWORD v154[4];
  id v155;
  uint64_t *v156;
  uint64_t *v157;
  double v158;
  __int128 v159;
  _QWORD v160[4];
  id v161;
  uint64_t *v162;
  uint64_t *v163;
  double v164;
  __int128 v165;
  _QWORD v166[4];
  id v167;
  uint64_t *v168;
  uint64_t *v169;
  double v170;
  __int128 v171;
  _QWORD v172[4];
  id v173;
  uint64_t *v174;
  uint64_t *v175;
  double v176;
  __int128 v177;
  mach_timebase_info v178;
  _QWORD v179[4];
  id v180;
  uint64_t *v181;
  uint64_t *v182;
  int64x2_t v183;
  uint64_t v184;
  mach_timebase_info info;
  uint64_t v186;
  double *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t *v191;
  uint64_t v192;
  char v193;
  uint8_t buf[4];
  _BYTE v195[10];
  double v196;
  const char *v197;
  uint64_t v198;

  v198 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v147 = a4;
  v9 = a5;
  v10 = _Block_copy(v9);
  v190 = 0;
  v191 = &v190;
  v192 = 0x2020000000;
  v193 = 0;
  v186 = 0;
  v187 = (double *)&v186;
  v188 = 0x2020000000;
  v189 = 0;
  if (!v10
    || (v11 = CFAbsoluteTimeGetCurrent(), v11 - v187[3] < 0.01)
    || (v187[3] = v11,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v10 + 2))(v10, &info, 0.0),
        v18 = *((_BYTE *)v191 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v191 + 24) = v18) == 0)
    && -[MAGraph noFatalError](self->_graph, "noFatalError"))
  {
    v12 = self->_loggingConnection;
    v13 = os_signpost_id_generate((os_log_t)v12);
    v14 = v12;
    v15 = v14;
    v145 = v13 - 1;
    spid = v13;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PerformBatchUpdate", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v144 = mach_absolute_time();
    if (objc_msgSend(v8, "hasAnythingToDo"))
    {
      v16 = (void *)MEMORY[0x1CAA4EB2C]();
      v179[0] = MEMORY[0x1E0C809B0];
      v179[1] = 3221225472;
      v179[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke;
      v179[3] = &unk_1E84311C8;
      v183 = vdupq_n_s64(0x3FB999999999999AuLL);
      v180 = v10;
      v181 = &v186;
      v184 = 0x3F847AE147AE147BLL;
      v182 = &v190;
      -[PGGraphBuilder performPreprocessingWithGraphUpdate:withRecipe:progressBlock:](self, "performPreprocessingWithGraphUpdate:withRecipe:progressBlock:", v8, v147, v179);
      if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
      {
        v23 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = *((unsigned __int8 *)v191 + 24);
          v26 = -[MAGraph noFatalError](self->_graph, "noFatalError");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v195 = v25;
          *(_WORD *)&v195[4] = 1024;
          *(_DWORD *)&v195[6] = !v26;
          v196 = 1.51430681e-269;
          v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph"
                 "/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }

        v17 = 0;
      }
      else
      {
        v17 = 1;
      }

      objc_autoreleasePoolPop(v16);
      if (!v17)
        goto LABEL_130;
    }
    if (objc_msgSend(v8, "hasHighlightsToDelete"))
    {
      v27 = v15;
      v28 = os_signpost_id_generate(v27);
      v29 = v27;
      v30 = v29;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "DeleteHighlights", ", buf, 2u);
      }

      v178 = 0;
      mach_timebase_info(&v178);
      v31 = mach_absolute_time();
      -[PGGraphBuilder deleteHighlightsWithGraphUpdate:](self, "deleteHighlightsWithGraphUpdate:", v8);
      v32 = mach_absolute_time();
      v33 = v178;
      v34 = v30;
      v35 = v34;
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v35, OS_SIGNPOST_INTERVAL_END, v28, "DeleteHighlights", ", buf, 2u);
      }

      v36 = v35;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v195 = "DeleteHighlights";
        *(_WORD *)&v195[8] = 2048;
        v196 = (float)((float)((float)((float)(v32 - v31) * (float)v33.numer) / (float)v33.denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
      {
        v67 = MEMORY[0x1E0C81028];
        v68 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          v69 = *((unsigned __int8 *)v191 + 24);
          v70 = -[MAGraph noFatalError](self->_graph, "noFatalError");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v195 = v69;
          *(_WORD *)&v195[4] = 1024;
          *(_DWORD *)&v195[6] = !v70;
          v196 = 1.51430681e-269;
          v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph"
                 "/Ingest/PGGraphBuilder.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }
        goto LABEL_70;
      }

      v37 = 0.2;
    }
    else
    {
      v37 = 0.1;
    }
    if (!objc_msgSend(v8, "hasMomentsToDelete"))
    {
LABEL_44:
      if (objc_msgSend(v8, "hasPersonsToDelete"))
      {
        v47 = v15;
        v48 = os_signpost_id_generate(v47);
        v49 = v47;
        v50 = v49;
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "DeletePersons", ", buf, 2u);
        }

        v178 = 0;
        mach_timebase_info(&v178);
        v51 = mach_absolute_time();
        v37 = v37 + 0.1;
        v172[0] = MEMORY[0x1E0C809B0];
        v172[1] = 3221225472;
        v172[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_214;
        v172[3] = &unk_1E84311C8;
        v176 = v37;
        v173 = v10;
        v174 = &v186;
        v177 = xmmword_1CA8ED980;
        v175 = &v190;
        -[PGGraphBuilder deletePersonsWithGraphUpdate:progressBlock:](self, "deletePersonsWithGraphUpdate:progressBlock:", v8, v172);
        v52 = mach_absolute_time();
        v53 = v178;
        v54 = v50;
        v55 = v54;
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v55, OS_SIGNPOST_INTERVAL_END, v48, "DeletePersons", ", buf, 2u);
        }

        v56 = v55;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v195 = "DeletePersons";
          *(_WORD *)&v195[8] = 2048;
          v196 = (float)((float)((float)((float)(v52 - v51) * (float)v53.numer) / (float)v53.denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
        {
          v75 = MEMORY[0x1E0C81028];
          v76 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            v77 = *((unsigned __int8 *)v191 + 24);
            v78 = -[MAGraph noFatalError](self->_graph, "noFatalError");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v195 = v77;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v78;
            v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }

      }
      if (objc_msgSend(v8, "hasMomentsToInsert"))
      {
        v57 = v15;
        v58 = os_signpost_id_generate(v57);
        v59 = v57;
        v60 = v59;
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "InsertMoments", ", buf, 2u);
        }

        v178 = 0;
        mach_timebase_info(&v178);
        v61 = mach_absolute_time();
        v37 = v37 + 0.1;
        v166[0] = MEMORY[0x1E0C809B0];
        v166[1] = 3221225472;
        v166[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_216;
        v166[3] = &unk_1E84311C8;
        v170 = v37;
        v167 = v10;
        v168 = &v186;
        v171 = xmmword_1CA8ED980;
        v169 = &v190;
        -[PGGraphBuilder insertMomentsWithGraphUpdate:progressBlock:](self, "insertMomentsWithGraphUpdate:progressBlock:", v8, v166);
        v62 = mach_absolute_time();
        v63 = v178;
        v64 = v60;
        v65 = v64;
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v65, OS_SIGNPOST_INTERVAL_END, v58, "InsertMoments", ", buf, 2u);
        }

        v66 = v65;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v195 = "InsertMoments";
          *(_WORD *)&v195[8] = 2048;
          v196 = (float)((float)((float)((float)(v62 - v61) * (float)v63.numer) / (float)v63.denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v66, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
        {
          v110 = MEMORY[0x1E0C81028];
          v111 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
          {
            v112 = *((unsigned __int8 *)v191 + 24);
            v113 = -[MAGraph noFatalError](self->_graph, "noFatalError");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v195 = v112;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v113;
            v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v66 = objc_claimAutoreleasedReturnValue();
        -[PGGraphBuilder _registerInsertedMomentNodes:inGraphUpdate:](self, "_registerInsertedMomentNodes:inGraphUpdate:", v66, v8);
      }

      if (objc_msgSend(v8, "hasHighlightsToInsert"))
      {
        v79 = v15;
        v80 = os_signpost_id_generate(v79);
        v81 = v79;
        v82 = v81;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v82, OS_SIGNPOST_INTERVAL_BEGIN, v80, "InsertHighlights", ", buf, 2u);
        }

        v178 = 0;
        mach_timebase_info(&v178);
        v83 = mach_absolute_time();
        v37 = v37 + 0.1;
        v160[0] = MEMORY[0x1E0C809B0];
        v160[1] = 3221225472;
        v160[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_218;
        v160[3] = &unk_1E84311C8;
        v164 = v37;
        v161 = v10;
        v162 = &v186;
        v165 = xmmword_1CA8ED980;
        v163 = &v190;
        -[PGGraphBuilder insertHighlightsWithGraphUpdate:progressBlock:](self, "insertHighlightsWithGraphUpdate:progressBlock:", v8, v160);
        v84 = mach_absolute_time();
        v85 = v178;
        v86 = v82;
        v87 = v86;
        if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v87, OS_SIGNPOST_INTERVAL_END, v80, "InsertHighlights", ", buf, 2u);
        }

        v88 = v87;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v195 = "InsertHighlights";
          *(_WORD *)&v195[8] = 2048;
          v196 = (float)((float)((float)((float)(v84 - v83) * (float)v85.numer) / (float)v85.denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v88, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
        {
          v114 = MEMORY[0x1E0C81028];
          v115 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
          {
            v116 = *((unsigned __int8 *)v191 + 24);
            v117 = -[MAGraph noFatalError](self->_graph, "noFatalError");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v195 = v116;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v117;
            v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }

      }
      if (objc_msgSend(v8, "hasSocialGroupsToDelete"))
      {
        v89 = v15;
        v90 = os_signpost_id_generate(v89);
        v91 = v89;
        v92 = v91;
        if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v92, OS_SIGNPOST_INTERVAL_BEGIN, v90, "DeleteSocialGroups", ", buf, 2u);
        }

        v178 = 0;
        mach_timebase_info(&v178);
        v93 = mach_absolute_time();
        -[PGGraphBuilder _deleteSocialGroupsWithGraphUpdate:](self, "_deleteSocialGroupsWithGraphUpdate:", v8);
        v94 = mach_absolute_time();
        v95 = v178;
        v96 = v92;
        v97 = v96;
        if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v97, OS_SIGNPOST_INTERVAL_END, v90, "DeleteSocialGroups", ", buf, 2u);
        }

        v98 = v97;
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v195 = "DeleteSocialGroups";
          *(_WORD *)&v195[8] = 2048;
          v196 = (float)((float)((float)((float)(v94 - v93) * (float)v95.numer) / (float)v95.denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v98, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
        {
          v122 = MEMORY[0x1E0C81028];
          v123 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
          {
            v124 = *((unsigned __int8 *)v191 + 24);
            v125 = -[MAGraph noFatalError](self->_graph, "noFatalError");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v195 = v124;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v125;
            v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }

        v37 = v37 + 0.1;
      }
      if ((objc_msgSend(v8, "hasMomentsToUpdate") & 1) != 0
        || (objc_msgSend(v8, "hasPersonsToUpdate") & 1) != 0
        || objc_msgSend(v8, "hasHighlightsToUpdate"))
      {
        v99 = v15;
        v100 = os_signpost_id_generate(v99);
        v101 = v99;
        v102 = v101;
        if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v102, OS_SIGNPOST_INTERVAL_BEGIN, v100, "PerformChanges", ", buf, 2u);
        }

        v178 = 0;
        mach_timebase_info(&v178);
        v103 = mach_absolute_time();
        v37 = v37 + 0.1;
        v154[0] = MEMORY[0x1E0C809B0];
        v154[1] = 3221225472;
        v154[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_221;
        v154[3] = &unk_1E84311C8;
        v158 = v37;
        v155 = v10;
        v156 = &v186;
        v159 = xmmword_1CA8ED980;
        v157 = &v190;
        -[PGGraphBuilder performChangeForGraphUpdate:progressBlock:](self, "performChangeForGraphUpdate:progressBlock:", v8, v154);
        v104 = mach_absolute_time();
        v105 = v178;
        v106 = v102;
        v107 = v106;
        if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v107, OS_SIGNPOST_INTERVAL_END, v100, "PerformChanges", ", buf, 2u);
        }

        v108 = v107;
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v195 = "PerformChanges";
          *(_WORD *)&v195[8] = 2048;
          v196 = (float)((float)((float)((float)(v104 - v103) * (float)v105.numer) / (float)v105.denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v108, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
        {
          v118 = MEMORY[0x1E0C81028];
          v119 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
          {
            v120 = *((unsigned __int8 *)v191 + 24);
            v121 = -[MAGraph noFatalError](self->_graph, "noFatalError");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v195 = v120;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v121;
            v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          goto LABEL_130;
        }

      }
      objc_msgSend(v8, "prepareForPostProcessingWithGraph:", self->_graph);
      if ((objc_msgSend(v8, "hasSocialGroupsToInsert") & 1) != 0)
        v109 = 1;
      else
        v109 = objc_msgSend(v8, "hasSocialGroupsToUpdate");
      if ((objc_msgSend(v8, "didProcessNodes") | v109) == 1)
      {
        v126 = (void *)MEMORY[0x1CAA4EB2C]();
        v148[0] = MEMORY[0x1E0C809B0];
        v148[1] = 3221225472;
        v148[2] = __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_223;
        v148[3] = &unk_1E8434F58;
        v152 = v37 + 0.1;
        v149 = v10;
        v150 = &v186;
        v153 = 0x3F847AE147AE147BLL;
        v151 = &v190;
        -[PGGraphBuilder performPostprocessingWithGraphUpdate:withRecipe:progressBlock:](self, "performPostprocessingWithGraphUpdate:withRecipe:progressBlock:", v8, v147, v148);
        if (*((_BYTE *)v191 + 24) || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
        {
          v128 = MEMORY[0x1E0C81028];
          v129 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
          {
            v130 = *((unsigned __int8 *)v191 + 24);
            v131 = -[MAGraph noFatalError](self->_graph, "noFatalError");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v195 = v130;
            *(_WORD *)&v195[4] = 1024;
            *(_DWORD *)&v195[6] = !v131;
            v196 = 1.51430681e-269;
            v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/PGGraphBuilder.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
          }

          v127 = 0;
        }
        else
        {
          v127 = 1;
        }

        objc_autoreleasePoolPop(v126);
        if (!v127)
          goto LABEL_130;
        -[PGGraphBuilder _onGraphDidUpdate](self, "_onGraphDidUpdate");
      }
      -[PGGraph invalidateMemoryCaches](self->_graph, "invalidateMemoryCaches");
      -[MAGraph savePersistentStore](self->_graph, "savePersistentStore");
      -[PGGraphBuilder _cleanGraphBuildCachesAfterUpdate](self, "_cleanGraphBuildCachesAfterUpdate");
      v132 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v135 = v15;
      v136 = v135;
      if (v145 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v136, OS_SIGNPOST_INTERVAL_END, spid, "PerformBatchUpdate", ", buf, 2u);
      }

      v137 = v136;
      if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v195 = "PerformBatchUpdate";
        *(_WORD *)&v195[8] = 2048;
        v196 = (float)((float)((float)((float)(v132 - v144) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v137, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      if (v10)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v187[3] >= 0.01)
        {
          v187[3] = Current;
          LOBYTE(v178.numer) = 0;
          (*((void (**)(void *, mach_timebase_info *, double))v10 + 2))(v10, &v178, 1.0);
          v139 = *((_BYTE *)v191 + 24) | LOBYTE(v178.numer);
          *((_BYTE *)v191 + 24) = v139;
          if (v139 || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
          {
            v140 = MEMORY[0x1E0C81028];
            v141 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
            {
              v142 = *((unsigned __int8 *)v191 + 24);
              v143 = -[MAGraph noFatalError](self->_graph, "noFatalError");
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v195 = v142;
              *(_WORD *)&v195[4] = 1024;
              *(_DWORD *)&v195[6] = !v143;
              v196 = 1.51430681e-269;
              v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/G"
                     "raph/Ingest/PGGraphBuilder.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
            }

          }
        }
      }
LABEL_130:

      goto LABEL_131;
    }
    v38 = v15;
    v39 = os_signpost_id_generate(v38);
    v40 = v38;
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "DeleteMoments", ", buf, 2u);
    }

    v178 = 0;
    mach_timebase_info(&v178);
    v42 = mach_absolute_time();
    -[PGGraphBuilder _deleteMomentsWithGraphUpdate:](self, "_deleteMomentsWithGraphUpdate:", v8);
    v43 = mach_absolute_time();
    v44 = v178;
    v45 = v41;
    v46 = v45;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v46, OS_SIGNPOST_INTERVAL_END, v39, "DeleteMoments", ", buf, 2u);
    }

    v36 = v46;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v195 = "DeleteMoments";
      *(_WORD *)&v195[8] = 2048;
      v196 = (float)((float)((float)((float)(v43 - v42) * (float)v44.numer) / (float)v44.denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (!*((_BYTE *)v191 + 24) && -[MAGraph noFatalError](self->_graph, "noFatalError"))
    {

      v37 = v37 + 0.1;
      goto LABEL_44;
    }
    v71 = MEMORY[0x1E0C81028];
    v72 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      v73 = *((unsigned __int8 *)v191 + 24);
      v74 = -[MAGraph noFatalError](self->_graph, "noFatalError");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v195 = v73;
      *(_WORD *)&v195[4] = 1024;
      *(_DWORD *)&v195[6] = !v74;
      v196 = 1.51430681e-269;
      v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ing"
             "est/PGGraphBuilder.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
    }
LABEL_70:

    goto LABEL_130;
  }
  v19 = MEMORY[0x1E0C81028];
  v20 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v21 = *((unsigned __int8 *)v191 + 24);
    v22 = -[MAGraph noFatalError](self->_graph, "noFatalError");
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v195 = v21;
    *(_WORD *)&v195[4] = 1024;
    *(_DWORD *)&v195[6] = !v22;
    v196 = 1.51430681e-269;
    v197 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inges"
           "t/PGGraphBuilder.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
  }

LABEL_131:
  _Block_object_dispose(&v186, 8);
  _Block_object_dispose(&v190, 8);

}

- (void)_deleteMomentsWithGraphUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *loggingConnection;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidsOfMomentsToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = v6;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "Batch Updates - About to delete %lu Moments", (uint8_t *)&v16, 0xCu);
  }
  -[PGCurationManager invalidateCurationCacheForMomentUUIDs:](self->_curationManager, "invalidateCurationCacheForMomentUUIDs:", v5);
  +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v5, self->_graph);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 != v6)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v5);
    objc_msgSend(v8, "uuids");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minusSet:", v11);

    v12 = self->_loggingConnection;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = (uint64_t)v10;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Failed to lookup Moment nodes for deletion with UUIDs: \"%@\", (uint8_t *)&v16, 0xCu);
    }

  }
  if (v9)
  {
    objc_msgSend(v4, "relatedDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accumulateDetailsForDeletedMomentNodes:", v8);

    v14 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v14, "removeNodes:", v8);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v14);
    objc_msgSend(v4, "setHasDeletedMomentNodes:", 1);

  }
  v15 = self->_loggingConnection;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = 134218240;
    v17 = v9;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Batch Updates - Deleted %lu Moments (%lu requested)", (uint8_t *)&v16, 0x16u);
  }

}

- (void)deletePersonsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(id, int *, double);
  void *v8;
  uint64_t v9;
  CLSServiceManager *serviceManager;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *loggingConnection;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, int *, double))a4;
  objc_msgSend(v6, "localIdentifiersOfPersonsToDelete");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  serviceManager = self->_serviceManager;
  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSServiceManager invalidatePersonsCacheForPersonsWithNames:](serviceManager, "invalidatePersonsCacheForPersonsWithNames:", v11);

  +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v8, self->_graph);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    objc_msgSend(v6, "relatedDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accumulateDetailsForDeletedPersonNodes:", v12);

    v15 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v15, "removeNodes:", v12);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v15);
    objc_msgSend(v6, "setHasDeletedPersonNodes:", 1);

  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v17 = 134218240;
    v18 = v13;
    v19 = 2048;
    v20 = v9;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "Batch Updates - Deleted %lu persons (%lu persons requested)", (uint8_t *)&v17, 0x16u);
  }
  LOBYTE(v17) = 0;
  v7[2](v7, &v17, 1.0);

}

- (void)_deleteSocialGroupsWithGraphUpdate:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "uuidsOfSocialGroupsToDelete");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphSocialGroupNodeCollection socialGroupNodesForPersistedUUIDs:inGraph:](PGGraphSocialGroupNodeCollection, "socialGroupNodesForPersistedUUIDs:inGraph:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v5, "removeNodes:", v4);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v5);

  }
}

- (void)performChangeForGraphUpdate:(id)a3 progressBlock:(id)a4
{
  double v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  double Current;
  char v35;
  id v36;
  OS_os_log *v37;
  OS_os_log *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  char v48;
  _QWORD v49[4];
  id v50;
  id v51;
  PGGraphBuilder *v52;
  OS_os_log *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t *p_buf;
  uint64_t *v63;
  uint64_t *v64;
  double v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  int v83;
  int v84;
  __int16 v85;
  const char *v86;
  uint64_t buf;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v42 = a4;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = (double *)&v75;
  v77 = 0x2020000000;
  v78 = 0;
  v46 = _Block_copy(v42);
  if (!v46
    || (v6 = CFAbsoluteTimeGetCurrent(), v6 - v76[3] < 0.01)
    || (v76[3] = v6,
        LOBYTE(v83) = 0,
        (*((void (**)(void *, int *, double))v46 + 2))(v46, &v83, 0.0),
        v7 = *((_BYTE *)v80 + 24) | v83,
        (*((_BYTE *)v80 + 24) = v7) == 0))
  {
    v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v37 = self->_loggingConnection;
    objc_msgSend(v47, "uuidsOfMomentsToUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v8, self->_graph);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v45, "count"));
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke;
    v73[3] = &unk_1E8436408;
    v10 = v9;
    v74 = v10;
    objc_msgSend(v45, "enumerateNodesUsingBlock:", v73);
    objc_msgSend(v47, "uuidsOfHighlightsToUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:inGraph:](PGGraphHighlightNodeCollection, "highlightNodesForUUIDs:inGraph:", v11, self->_graph);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v44, "count"));
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_2;
    v71[3] = &unk_1E842F948;
    v13 = v12;
    v72 = v13;
    objc_msgSend(v44, "enumerateNodesUsingBlock:", v71);
    objc_msgSend(v47, "localIdentifiersOfPersonsToUpdate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v14, self->_graph);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v43, "count"));
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_3;
    v69[3] = &unk_1E8434020;
    v16 = v15;
    v70 = v16;
    objc_msgSend(v43, "enumerateNodesUsingBlock:", v69);
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v47, "contactIdentifiersOfPersonsToUpdate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") == 0;

    if (!v19)
    {
      objc_msgSend(v47, "contactIdentifiersOfPersonsToUpdate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphPersonNodeCollection personNodesForContactIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForContactIdentifiers:inGraph:", v20, self->_graph);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_4;
      v67[3] = &unk_1E8434020;
      v68 = v17;
      objc_msgSend(v21, "enumerateNodesUsingBlock:", v67);

    }
    v22 = objc_alloc_init(MEMORY[0x1E0D4B1A0]);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B1B0]), "initWithServiceManager:locationCache:aoiCache:poiCache:roiCache:natureCache:", self->_serviceManager, self->_locationCache, self->_aoiCache, self->_poiCache, self->_roiCache, self->_natureCache);
    -[MAGraph enterBatch](self->_graph, "enterBatch");
    buf = 0;
    *(_QWORD *)&v88 = &buf;
    *((_QWORD *)&v88 + 1) = 0x2020000000;
    v89 = 0;
    v24 = 1.0 / (double)(unint64_t)objc_msgSend(v47, "numberOfConsolidatedChanges");
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_5;
    v49[3] = &unk_1E842A340;
    v36 = v10;
    v50 = v36;
    v25 = v47;
    v51 = v25;
    v52 = self;
    v38 = v37;
    v53 = v38;
    v26 = v23;
    v54 = v26;
    v27 = v22;
    v55 = v27;
    p_buf = &buf;
    v65 = v24;
    v28 = v46;
    v61 = v28;
    v66 = 0x3F847AE147AE147BLL;
    v63 = &v75;
    v64 = &v79;
    v41 = v40;
    v56 = v41;
    v29 = v16;
    v57 = v29;
    v30 = v17;
    v58 = v30;
    v31 = v39;
    v59 = v31;
    v32 = v13;
    v60 = v32;
    objc_msgSend(v25, "enumerateConsolidatedChanges:", v49);
    -[MAGraph leaveBatch](self->_graph, "leaveBatch");
    if (*((_BYTE *)v80 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        _Block_object_dispose(&buf, 8);
        goto LABEL_18;
      }
      v83 = 67109378;
      v84 = 1004;
      v85 = 2080;
      v86 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/PGGraphBuilder.m";
      v33 = MEMORY[0x1E0C81028];
    }
    else
    {
      objc_msgSend(v25, "registerInsertedAndUpdatedPersonNodes:", v41, v36, v38);
      objc_msgSend(v25, "registerUpdatedPersonNodesUnrelatedToMomentChange:", v31);
      -[PGGraphBuilder persistPendingScores](self, "persistPendingScores");
      if (!v46)
        goto LABEL_17;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v76[3] < 0.01)
        goto LABEL_17;
      v76[3] = Current;
      v48 = 0;
      (*((void (**)(id, char *, double))v28 + 2))(v28, &v48, 1.0);
      v35 = *((_BYTE *)v80 + 24) | v48;
      *((_BYTE *)v80 + 24) = v35;
      if (!v35 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_17;
      v83 = 67109378;
      v84 = 1011;
      v85 = 2080;
      v86 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/PGGraphBuilder.m";
      v33 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v83, 0x12u);
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x2CD04000202;
    LOWORD(v88) = 2080;
    *(_QWORD *)((char *)&v88 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/PGGraphBuilder.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_18:
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

}

- (void)insertMomentsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  OS_os_log *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PGUnfairLock *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  OS_os_log *v20;
  uint64_t v21;
  void *v22;
  NSObject *loggingConnection;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  PGMutableGraph *v31;
  void *v32;
  size_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  double v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double v47;
  char v48;
  id v49;
  PGUnfairLock *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  PGUnfairLock *v55;
  PGUnfairLock *v56;
  void *v57;
  PGUnfairLock *v58;
  id v59;
  void *v60;
  PGMutableGraph *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  char v69;
  _QWORD aBlock[4];
  PGUnfairLock *v71;
  id v72;
  id v73;
  PGGraphBuilder *v74;
  id v75;
  id v76;
  id v77;
  PGUnfairLock *v78;
  id v79;
  PGMutableGraph *v80;
  id v81;
  id v82;
  uint64_t *v83;
  uint64_t *v84;
  __int128 *p_buf;
  _QWORD *v86;
  __int128 *v87;
  _QWORD *v88;
  _QWORD *v89;
  uint64_t v90;
  _QWORD v91[3];
  CFAbsoluteTime Current;
  _QWORD v93[4];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[3];
  double v99;
  uint64_t v100;
  double *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  char v107;
  int v108;
  int v109;
  __int16 v110;
  const char *v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD v115[2];
  _BYTE v116[128];
  __int128 buf;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v54 = a4;
  v62 = _Block_copy(v54);
  v104 = 0;
  v105 = &v104;
  v106 = 0x2020000000;
  v107 = 0;
  v100 = 0;
  v101 = (double *)&v100;
  v102 = 0x2020000000;
  v103 = 0;
  v6 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v67, "momentsToIngest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1CA237000, (os_log_t)v6, OS_LOG_TYPE_INFO, "Batch Updates - About to insert %lu new moments", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(v67, "momentsToIngest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder _cleanUpMoments:](self, "_cleanUpMoments:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v13 = objc_alloc_init(PGUnfairLock);
  v60 = (void *)v12;
  v58 = objc_alloc_init(PGUnfairLock);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v118 = 0x2020000000;
  v119 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  v99 = 0.0;
  v55 = v13;
  v57 = (void *)v11;
  v99 = 0.95 / (double)(unint64_t)objc_msgSend(v10, "count");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v95 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
    }
    while (v16);
  }

  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v14, self->_graph);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "uuids");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
  {
    v21 = objc_msgSend(v64, "count");
    LODWORD(v112) = 134217984;
    *(_QWORD *)((char *)&v112 + 4) = v21;
    _os_log_impl(&dword_1CA237000, (os_log_t)v20, OS_LOG_TYPE_INFO, "Batch Updates - %lu moments are already ingested", (uint8_t *)&v112, 0xCu);
  }

  -[MAGraph enterBatch](self->_graph, "enterBatch");
  if (objc_msgSend(v67, "isResumingFullAnalysis") && !objc_msgSend(v65, "count"))
  {
    -[PGGraphBuilder computeAndPersistTopTierAestheticScores](self, "computeAndPersistTopTierAestheticScores");
    -[PGGraphBuilder computeAndPersistAssetStatistics](self, "computeAndPersistAssetStatistics");
  }
  -[PGGraphBuilder insertOrUpdateMePersonNodeIfNeeded](self, "insertOrUpdateMePersonNodeIfNeeded");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    LODWORD(v112) = 138412290;
    *(_QWORD *)((char *)&v112 + 4) = v22;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PGGraphBuilder][insertMomentsWithGraphUpdate:progressBlock:] Me node=%@", (uint8_t *)&v112, 0xCu);
  }
  if (-[PGGraphBuilder isSharedLibraryEnabled](self, "isSharedLibraryEnabled"))
  {
    -[PGGraphBuilder sharedLibraryParticipants](self, "sharedLibraryParticipants");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder insertPersonNodesForShareParticipants:](self, "insertPersonNodesForShareParticipants:", v24);

  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v25;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingDescriptors:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B1B0]), "initWithServiceManager:locationCache:aoiCache:poiCache:roiCache:natureCache:", self->_serviceManager, self->_locationCache, self->_aoiCache, self->_poiCache, self->_roiCache, self->_natureCache);
  v30 = objc_alloc_init(MEMORY[0x1E0D4B1A0]);
  v31 = self->_graph;
  *(_QWORD *)&v112 = 0;
  *((_QWORD *)&v112 + 1) = &v112;
  v113 = 0x2020000000;
  v114 = 0;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v93[3] = 0;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  Current = 0.0;
  Current = CFAbsoluteTimeGetCurrent();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke;
  aBlock[3] = &unk_1E842A3B8;
  v50 = v58;
  v71 = v50;
  v83 = &v104;
  v52 = v28;
  v72 = v52;
  v51 = v65;
  v73 = v51;
  v90 = 0x3F847AE147AE147BLL;
  v84 = &v100;
  p_buf = &buf;
  v86 = v98;
  v66 = v62;
  v82 = v66;
  v74 = self;
  v49 = v60;
  v75 = v49;
  v53 = v29;
  v76 = v53;
  v59 = v30;
  v77 = v59;
  v56 = v55;
  v78 = v56;
  v68 = v67;
  v79 = v68;
  v61 = v31;
  v80 = v61;
  v63 = v57;
  v81 = v63;
  v87 = &v112;
  v88 = v93;
  v89 = v91;
  v32 = _Block_copy(aBlock);
  v33 = objc_msgSend(v15, "count");
  v34 = (void *)objc_msgSend(v32, "copy");
  dispatch_apply(v33, 0, v34);

  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", self->_graph);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "anyNode");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "localIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = objc_msgSend(v37, "length") == 0;

  if ((_DWORD)v34)
  {
    v38 = self->_loggingConnection;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      LOWORD(v108) = 0;
      _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "[PGGraphBuilder][insertMomentsWithGraphUpdate:progressBlock:] Me node gets inferred", (uint8_t *)&v108, 2u);
    }
    -[PGGraphBuilder inferPersonNodeForMeNode:](self, "inferPersonNodeForMeNode:", v36);
  }
  -[MAGraph leaveBatch](self->_graph, "leaveBatch");
  if (*((_BYTE *)v105 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v108 = 67109378;
      v109 = 1272;
      v110 = 2080;
      v111 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ing"
             "est/PGGraphBuilder.m";
      v39 = MEMORY[0x1E0C81028];
LABEL_26:
      _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v108, 0x12u);
    }
  }
  else
  {
    -[PGGraphBuilder clearPersonActivityMeaningCriteriaDictionaryByMeaningLabel](self, "clearPersonActivityMeaningCriteriaDictionaryByMeaningLabel");
    if (v66)
    {
      v40 = CFAbsoluteTimeGetCurrent();
      if (v40 - v101[3] >= 0.01)
      {
        v101[3] = v40;
        v69 = 0;
        (*((void (**)(id, char *, double))v66 + 2))(v66, &v69, 0.9);
        v41 = *((_BYTE *)v105 + 24) | v69;
        *((_BYTE *)v105 + 24) = v41;
        if (v41)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_41;
          v108 = 67109378;
          v109 = 1276;
          v110 = 2080;
          v111 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph"
                 "/Ingest/PGGraphBuilder.m";
          v39 = MEMORY[0x1E0C81028];
          goto LABEL_26;
        }
      }
    }
    -[PGGraphBuilder persistPendingScores](self, "persistPendingScores");
    -[MAGraph enterBatch](self->_graph, "enterBatch");
    +[PGGraphInfoNode assetPropertiesWithNumberOfUtilityAssets:numberOfDefaultAssets:numberOfImprovedAssets:numberOfBetterAssets:](PGGraphInfoNode, "assetPropertiesWithNumberOfUtilityAssets:numberOfDefaultAssets:numberOfImprovedAssets:numberOfBetterAssets:", self->_numberOfUtilityAssets, self->_numberOfDefaultAssets, self->_numberOfImprovedAssets, self->_numberOfBetterAssets);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (objc_msgSend(v68, "isResumingFullAnalysis"))
    {
      v43 = (void *)objc_msgSend(v42, "mutableCopy");
      +[PGGraphInfoNode routineInfoPropertiesWithServiceManager:](PGGraphInfoNode, "routineInfoPropertiesWithServiceManager:", self->_serviceManager);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addEntriesFromDictionary:", v44);

    }
    -[PGGraph infoNode](self->_graph, "infoNode");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "identifier");

    -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v43, v46, 0);
    -[MAGraph leaveBatch](self->_graph, "leaveBatch");
    -[PGGraph invalidateMemoryCaches](self->_graph, "invalidateMemoryCaches");
    if (v66
      && (v47 = CFAbsoluteTimeGetCurrent(), v47 - v101[3] >= 0.01)
      && (v101[3] = v47,
          v69 = 0,
          (*((void (**)(id, char *, double))v66 + 2))(v66, &v69, 1.0),
          v48 = *((_BYTE *)v105 + 24) | v69,
          (*((_BYTE *)v105 + 24) = v48) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v108 = 67109378;
        v109 = 1298;
        v110 = 2080;
        v111 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/I"
               "ngest/PGGraphBuilder.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v108, 0x12u);
      }
    }
    else
    {
      -[PGGraphBuilder _registerInsertedMomentNodes:inGraphUpdate:](self, "_registerInsertedMomentNodes:inGraphUpdate:", v63, v68);
    }

  }
LABEL_41:

  _Block_object_dispose(v91, 8);
  _Block_object_dispose(v93, 8);
  _Block_object_dispose(&v112, 8);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);

}

- (void)_registerInsertedMomentNodes:(id)a3 inGraphUpdate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isResumingFullAnalysis") & 1) != 0)
  {
    -[PGGraph momentNodes](self->_graph, "momentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInsertedMomentNodes:", v8);

  }
  else
  {
    objc_msgSend(v6, "setInsertedMomentNodes:", v9);
  }

}

- (id)momentForMomentNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFetchLimit:", 1);
    v6 = (void *)MEMORY[0x1E0CD13B8];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)feederForInsertingAssetCollection:(id)a3
{
  PHPhotoLibrary *photoLibrary;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  photoLibrary = self->_photoLibrary;
  v5 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraph assetPropertySetsForIngest](PGGraph, "assetPropertySetsForIngest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFetchPropertySets:", v7);

  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D4B1B8];
  -[PGGraphBuilder curationContext](self, "curationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "feederForAssetCollection:options:feederPrefetchOptions:curationContext:sharedLibraryEnabled:", v5, v6, v8, v10, -[PGGraphBuilder isSharedLibraryEnabled](self, "isSharedLibraryEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSFocusPeopleCache personLocalIdentifiers](self->_focusPeopleIngestCache, "personLocalIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFocusPersonLocalIdentifiers:", v12);

  return v11;
}

- (id)_momentNodesFromPersonNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "collection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "momentNodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __46__PGGraphBuilder__momentNodesFromPersonNodes___block_invoke;
        v14[3] = &unk_1E8436408;
        v15 = v4;
        objc_msgSend(v12, "enumerateNodesUsingBlock:", v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)insertMomentNodeForClueCollection:(id)a3 feeder:(id)a4 progressBlock:(id)a5
{
  return -[PGGraphBuilder _insertMomentNodeForClueCollection:feeder:insertedAndUpdatedPersonNodes:graphUpdate:progressBlock:](self, "_insertMomentNodeForClueCollection:feeder:insertedAndUpdatedPersonNodes:graphUpdate:progressBlock:", a3, a4, 0, 0, a5);
}

- (void)setLocaleIdentifier:(id)a3
{
  PGMutableGraph *graph;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  graph = self->_graph;
  v5 = a3;
  -[PGGraph infoNode](graph, "infoNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "geoServiceProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v6, v5, v7, v8, objc_msgSend(v10, "curationAlgorithmsVersion"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, objc_msgSend(v10, "identifier"), 0);
}

- (void)setLanguageIdentifiers:(id)a3
{
  PGMutableGraph *graph;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  graph = self->_graph;
  v5 = a3;
  -[PGGraph infoNode](graph, "infoNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "geoServiceProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v6, v7, v5, v8, objc_msgSend(v10, "curationAlgorithmsVersion"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, objc_msgSend(v10, "identifier"), 0);
}

- (void)setGeoServiceProviderID:(id)a3
{
  PGMutableGraph *graph;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  graph = self->_graph;
  v5 = a3;
  -[PGGraph infoNode](graph, "infoNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v6, v7, v8, v5, objc_msgSend(v10, "curationAlgorithmsVersion"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, objc_msgSend(v10, "identifier"), 0);
}

- (void)setCurationAlgorithmsVersion:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PGGraph infoNode](self->_graph, "infoNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "geoServiceProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v5, v6, v7, v8, a3, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, objc_msgSend(v10, "identifier"), 0);
}

- (void)setContactsAccessStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PGGraph infoNode](self->_graph, "infoNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "geoServiceProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v5, v6, v7, v8, objc_msgSend(v10, "curationAlgorithmsVersion"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, objc_msgSend(v10, "identifier"), 0);
}

- (NSDictionary)personActivityMeaningCriteriaDictionaryByMeaningLabel
{
  PGGraphBuilder *v2;
  NSDictionary *personActivityMeaningCriteriaDictionaryByMeaningLabel;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  id v20;
  unint64_t v21;
  PGGraphBuilder *v22;
  void *v23;
  NSObject *v24;
  NSDictionary *v25;
  uint64_t v27;
  id obj;
  NSDictionary *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  personActivityMeaningCriteriaDictionaryByMeaningLabel = self->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
  if (!personActivityMeaningCriteriaDictionaryByMeaningLabel)
  {
    v29 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = +[PGTrialSession newTrialSession](PGTrialSession, "newTrialSession");
    objc_msgSend(v4, "arrayForFactorName:withNamespaceType:", CFSTR("personActivityMeaning"), 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loggingConnection");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "[PERSON ACTIVITY MEANING CRITERIA] nil personActivityMeaningLabels found", buf, 2u);
      }

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      v11 = 0x1E0CB3000uLL;
      v12 = CFSTR("%@.plist");
      do
      {
        v13 = 0;
        v27 = v9;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v13);
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "dictionaryForFactorName:withNamespaceType:", v15, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            +[PGMeaningCriteriaEvaluator meaningCriteriaEvaluatorsForMeaningLabel:withDictionary:serviceManager:](PGMeaningCriteriaEvaluator, "meaningCriteriaEvaluatorsForMeaningLabel:withDictionary:serviceManager:", v14, v16, v2->_serviceManager);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v17, v14);

          }
          else
          {
            v18 = v10;
            v19 = v12;
            v20 = v4;
            v21 = v11;
            v22 = v2;
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "loggingConnection");
            v24 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v14;
              _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[PERSON ACTIVITY MEANING CRITERIA] nil personActivityMeaning criteria dictionary found for meaning %@", buf, 0xCu);
            }

            -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v14);
            v2 = v22;
            v11 = v21;
            v4 = v20;
            v12 = v19;
            v10 = v18;
            v9 = v27;
          }

          ++v13;
        }
        while (v9 != v13);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    v25 = v2->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
    v2->_personActivityMeaningCriteriaDictionaryByMeaningLabel = v29;

    personActivityMeaningCriteriaDictionaryByMeaningLabel = v2->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
  }
  return personActivityMeaningCriteriaDictionaryByMeaningLabel;
}

- (void)clearPersonActivityMeaningCriteriaDictionaryByMeaningLabel
{
  NSDictionary *personActivityMeaningCriteriaDictionaryByMeaningLabel;

  personActivityMeaningCriteriaDictionaryByMeaningLabel = self->_personActivityMeaningCriteriaDictionaryByMeaningLabel;
  self->_personActivityMeaningCriteriaDictionaryByMeaningLabel = 0;

}

- (void)_cleanGraphBuildCachesAfterUpdate
{
  PGEventLabelingFeaturesFileCache *eventLabelingFeaturesCache;
  BOOL v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  eventLabelingFeaturesCache = self->_eventLabelingFeaturesCache;
  if (eventLabelingFeaturesCache)
  {
    v7 = 0;
    v3 = -[PGEventLabelingFeaturesFileCache clearCacheWithError:](eventLabelingFeaturesCache, "clearCacheWithError:", &v7);
    v4 = v7;
    if (!v3)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loggingConnection");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "[PGGraphBuilder] Error clearing features cache: %@", buf, 0xCu);
      }

    }
  }
}

- (void)_onGraphDidUpdate
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_INFO, "[GraphBuilder] - signaling availability state did change", buf, 2u);
  }

  -[PHPhotoLibrary photoLibrary](self->_photoLibrary, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsdClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryInternalClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "signalAvailabilityStateDidChangeWithError:", &v12);
  v9 = v12;

  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[GraphBuilder] - successfully updated availability state", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[GraphBuilder] - failed to update availability state, error: %@", buf, 0xCu);
  }

}

- (PGMutableGraph)graph
{
  return (PGMutableGraph *)objc_getProperty(self, a2, 8, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 160, 1);
}

- (PGCurationManager)curationManager
{
  return (PGCurationManager *)objc_getProperty(self, a2, 168, 1);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 176, 1);
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 184, 1);
}

- (CLSFocusPeopleCache)focusPeopleIngestCache
{
  return self->_focusPeopleIngestCache;
}

- (void)setFocusPeopleIngestCache:(id)a3
{
  objc_storeStrong((id *)&self->_focusPeopleIngestCache, a3);
}

- (BOOL)keepsExistingAssetCurationScores
{
  return self->_keepsExistingAssetCurationScores;
}

- (void)setKeepsExistingAssetCurationScores:(BOOL)a3
{
  self->_keepsExistingAssetCurationScores = a3;
}

- (CLSSceneTaxonomyHierarchy)sceneTaxonomy
{
  return (CLSSceneTaxonomyHierarchy *)objc_getProperty(self, a2, 216, 1);
}

- (CLSSceneTaxonomyHierarchy)entityNetSceneTaxonomy
{
  return (CLSSceneTaxonomyHierarchy *)objc_getProperty(self, a2, 224, 1);
}

- (BOOL)isSharedLibraryEnabled
{
  return self->_isSharedLibraryEnabled;
}

- (NSSet)sharedLibraryParticipants
{
  return (NSSet *)objc_getProperty(self, a2, 232, 1);
}

- (PGEventLabelingFeaturesFileCache)eventLabelingFeaturesCache
{
  return (PGEventLabelingFeaturesFileCache *)objc_getProperty(self, a2, 240, 1);
}

- (CLSLocationCache)locationCache
{
  return (CLSLocationCache *)objc_getProperty(self, a2, 248, 1);
}

- (CLSAOICache)aoiCache
{
  return (CLSAOICache *)objc_getProperty(self, a2, 256, 1);
}

- (CLSPOICache)poiCache
{
  return (CLSPOICache *)objc_getProperty(self, a2, 264, 1);
}

- (CLSROICache)roiCache
{
  return (CLSROICache *)objc_getProperty(self, a2, 272, 1);
}

- (CLSNatureCache)natureCache
{
  return (CLSNatureCache *)objc_getProperty(self, a2, 280, 1);
}

- (CLSPublicEventManager)publicEventManager
{
  return (CLSPublicEventManager *)objc_getProperty(self, a2, 288, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventManager, 0);
  objc_storeStrong((id *)&self->_natureCache, 0);
  objc_storeStrong((id *)&self->_roiCache, 0);
  objc_storeStrong((id *)&self->_poiCache, 0);
  objc_storeStrong((id *)&self->_aoiCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_eventLabelingFeaturesCache, 0);
  objc_storeStrong((id *)&self->_sharedLibraryParticipants, 0);
  objc_storeStrong((id *)&self->_entityNetSceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_personActivityMeaningCriteriaDictionaryByMeaningLabel, 0);
  objc_storeStrong((id *)&self->_focusPeopleIngestCache, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
  objc_storeStrong((id *)&self->_safeAssetAnalyzer, 0);
  objc_storeStrong((id *)&self->_entityNetSceneTaxonomyNodesNotIndexedInSearch, 0);
  objc_storeStrong((id *)&self->_entityNetSceneNodeBySceneName, 0);
  objc_storeStrong((id *)&self->_visualLookupSceneNodeBySceneName, 0);
  objc_storeStrong((id *)&self->_sceneNodeBySceneName, 0);
  objc_storeStrong((id *)&self->_peopleDomainBuildingHelper, 0);
  objc_storeStrong((id *)&self->_timeDomainBuildingHelper, 0);
  objc_storeStrong((id *)&self->_momentNodesWhereMeIsPresent, 0);
  objc_storeStrong((id *)&self->_generativeMemoryCreationEligibilityStateByAsset, 0);
  objc_storeStrong((id *)&self->_interactionScoreByAsset, 0);
  objc_storeStrong((id *)&self->_curationScoreByAsset, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

uint64_t __46__PGGraphBuilder__momentNodesFromPersonNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  double Current;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  double v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, char *);
  void *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  double v57;
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (*(_QWORD *)(a1 + 120))
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(*(id *)(a1 + 32), "lock");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      if (Current - *(double *)(v10 + 24) >= *(double *)(a1 + 184))
      {
        *(double *)(v10 + 24) = Current;
        buf[0] = 0;
        (*(void (**)(double))(*(_QWORD *)(a1 + 120) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144)
                                                                                              + 8)
                                                                                  + 24));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8)
                                                                               + 24);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "unlock");
    }
    if (!v8)
    {
      v11 = objc_msgSend(v5, "estimatedAssetCount");
      if (v11 <= *MEMORY[0x1E0D4B0B0])
      {
        v12 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(*(id *)(a1 + 56), "feederForInsertingAssetCollection:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setLocationClusteringAlgorithm:", 0);
        v14 = objc_alloc(MEMORY[0x1E0D4B1A8]);
        v58[0] = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithFeeder:profiles:helper:", v13, v15, *(_QWORD *)(a1 + 72));

        objc_msgSend(v16, "setPrecision:", 1);
        v17 = MEMORY[0x1E0C809B0];
        v18 = *(void **)(a1 + 80);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_2;
        v44[3] = &unk_1E842A368;
        v46 = *(id *)(a1 + 120);
        v45 = *(id *)(a1 + 32);
        v49 = *(_QWORD *)(a1 + 184);
        v47 = *(_OWORD *)(a1 + 136);
        v48 = *(_QWORD *)(a1 + 128);
        objc_msgSend(v18, "performInvestigation:progressBlock:", v16, v44);
        objc_msgSend(*(id *)(a1 + 32), "lock");
        LODWORD(v18) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
        objc_msgSend(*(id *)(a1 + 32), "unlock");
        if (!(_DWORD)v18)
        {
          objc_msgSend(*(id *)(a1 + 88), "lock");
          v19 = *(void **)(a1 + 56);
          objc_msgSend(v16, "clueCollection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v21 = *(_QWORD *)(a1 + 96);
          v33 = v17;
          v34 = 3221225472;
          v35 = __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_3;
          v36 = &unk_1E842A390;
          v39 = *(id *)(a1 + 120);
          v37 = *(id *)(a1 + 32);
          v42 = *(_QWORD *)(a1 + 184);
          v40 = *(_OWORD *)(a1 + 136);
          v41 = *(_QWORD *)(a1 + 128);
          v38 = *(id *)(a1 + 104);
          objc_msgSend(v19, "_insertMomentNodeForClueCollection:feeder:insertedAndUpdatedPersonNodes:graphUpdate:progressBlock:", v20, v13, &v43, v21, &v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v43;

          objc_msgSend(*(id *)(a1 + 32), "lock", v33, v34, v35, v36);
          LODWORD(v20) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
          objc_msgSend(*(id *)(a1 + 32), "unlock");
          if ((_DWORD)v20)
          {
            objc_msgSend(*(id *)(a1 + 88), "unlock");

          }
          else
          {
            if (v22)
            {
              objc_msgSend(*(id *)(a1 + 112), "addObject:", v22);
              if (v23)
                objc_msgSend(*(id *)(a1 + 96), "registerInsertedAndUpdatedPersonNodes:", v23);
            }
            else
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "loggingConnection");
              v25 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v51 = (uint64_t)v5;
                _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "Failed to insert moment collection: \"%@\", buf, 0xCu);
              }

            }
            objc_msgSend(*(id *)(a1 + 32), "lock");
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 152)
                                                                                                 + 8)
                                                                                     + 24)
                                                                         + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144)
                                                                                                 + 8)
                                                                                     + 24);
            objc_msgSend(*(id *)(a1 + 32), "unlock");

            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) += objc_msgSend(v13, "numberOfItems");
            if (0x8F5C28F5C28F5C29 * objc_msgSend(*(id *)(a1 + 112), "count") <= 0xA3D70A3D70A3D70)
            {
              objc_msgSend(*(id *)(a1 + 56), "persistPendingScores");
              objc_msgSend(*(id *)(a1 + 104), "leaveBatch");
              objc_msgSend(*(id *)(a1 + 104), "invalidateMemoryCaches");
              objc_msgSend(*(id *)(a1 + 104), "enterBatch");
              v26 = CFAbsoluteTimeGetCurrent();
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "loggingConnection");
              v28 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v29 = objc_msgSend(*(id *)(a1 + 112), "count");
                v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
                v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24);
                v32 = v26 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
                *(_DWORD *)buf = 134218752;
                v51 = v29;
                v52 = 2048;
                v53 = v30;
                v54 = 2048;
                v55 = v31;
                v56 = 2048;
                v57 = v32;
                _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "Saved graph for %lu moments, batch is %lu moments, %lu assets, took %.3f seconds", buf, 0x2Au);
              }

              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24) = 0;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) = 0;
              *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24) = v26;
            }
            objc_msgSend(*(id *)(a1 + 88), "unlock");
          }
        }

        objc_autoreleasePoolPop(v12);
        goto LABEL_25;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "lock");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8)
                                                                             + 24)
                                                                 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8)
                                                                             + 24);
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "unlock");
LABEL_25:

  }
}

uint64_t __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_2(uint64_t result, _BYTE *a2)
{
  uint64_t v3;
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(result + 40))
  {
    v3 = result;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(v3 + 32), "lock");
    v5 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(v3 + 72))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(v3 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8) + 24))
        *a2 = 1;
    }
    return objc_msgSend(*(id *)(v3 + 32), "unlock");
  }
  return result;
}

uint64_t __61__PGGraphBuilder_insertMomentsWithGraphUpdate_progressBlock___block_invoke_3(uint64_t result, char *a2)
{
  uint64_t v3;
  double Current;
  uint64_t v5;
  char v6;

  if (*(_QWORD *)(result + 48))
  {
    v3 = result;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*(id *)(v3 + 32), "lock");
    v5 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(v3 + 80))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(v3 + 48) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 64) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 24))
      {
        v6 = 1;
LABEL_7:
        *a2 = v6;
        return objc_msgSend(*(id *)(v3 + 32), "unlock");
      }
      if ((objc_msgSend(*(id *)(v3 + 40), "noFatalError") & 1) == 0)
      {
        v6 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 72) + 8) + 24);
        goto LABEL_7;
      }
    }
    return objc_msgSend(*(id *)(v3 + 32), "unlock");
  }
  return result;
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "contactIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_5(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  char *v30;
  uint64_t v31;
  uint32_t denom;
  uint32_t numer;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  char *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  char *v60;
  void *v61;
  id v62;
  __int128 v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  char *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  char *v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  char *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  char *v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  void *v124;
  NSObject *v125;
  NSObject *v126;
  char *v127;
  NSObject *v128;
  double Current;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  __int128 v135;
  id v136;
  void *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  __int128 v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  _BYTE *v150;
  _BYTE *v151;
  _QWORD v152[4];
  __int128 v153;
  __int128 v154;
  uint64_t v155;
  uint64_t v156;
  unsigned __int8 v157;
  _QWORD v158[4];
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  uint64_t v162;
  mach_timebase_info info;
  void *v164;
  void *v165;
  uint8_t buf[4];
  const char *v167;
  __int16 v168;
  double v169;
  _QWORD v170[4];

  v170[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  if (objc_msgSend(v5, "type") == 3)
  {
    v7 = v5;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "momentUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v28 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = v28;
        objc_msgSend(v7, "momentUUID");
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v167 = v30;
        _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "No momentNode found for UUID %@", buf, 0xCu);

      }
      goto LABEL_51;
    }
    objc_msgSend(*(id *)(a1 + 40), "cachedDataModelObjectForGraphChange:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v11)
    {
LABEL_50:

LABEL_51:
      goto LABEL_52;
    }
    v140 = v7;
    v141 = v10;
    v148 = v6;
    v150 = a3;
    v143 = (void *)v11;
    v144 = v5;
    objc_msgSend(*(id *)(a1 + 48), "feederForInsertingAssetCollection:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocationClusteringAlgorithm:", 0);
    v14 = *(id *)(a1 + 56);
    v15 = os_signpost_id_generate(v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Investigation", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v18 = mach_absolute_time();
    v19 = objc_alloc(MEMORY[0x1E0D4B1A8]);
    v20 = (void *)objc_opt_new();
    v170[0] = v20;
    v21 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "initWithFeeder:profiles:helper:", v13, v22, *(_QWORD *)(a1 + 64));

    v24 = *(void **)(a1 + 72);
    v158[0] = MEMORY[0x1E0C809B0];
    v158[1] = 3221225472;
    v158[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_237;
    v158[3] = &unk_1E8434EB8;
    v161 = *(_QWORD *)(a1 + 152);
    v145 = *(_OWORD *)(a1 + 120);
    v25 = (id)v145;
    v159 = v145;
    v162 = *(_QWORD *)(a1 + 160);
    v160 = *(_OWORD *)(a1 + 136);
    v146 = (void *)v23;
    objc_msgSend(v24, "performInvestigation:progressBlock:", v23, v158);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24))
    {
      v6 = v148;
      a3 = v150;
      *v150 = 1;
      v5 = v144;
      v26 = v13;
      v27 = v17;
      v7 = v140;
      v10 = v141;
LABEL_47:

      if (v21)
      {

        goto LABEL_109;
      }
      v12 = v143;
      goto LABEL_50;
    }
    v31 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v34 = v17;
    v35 = v34;
    v36 = v17;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v35, OS_SIGNPOST_INTERVAL_END, v15, "Investigation", ", buf, 2u);
    }

    v37 = v13;
    v7 = v140;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v167 = "Investigation";
      v168 = 2048;
      v169 = (float)((float)((float)((float)(v31 - v18) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v138 = v36;
    objc_msgSend(v146, "clueCollection");
    v38 = objc_claimAutoreleasedReturnValue();
    v157 = 0;
    v10 = v141;
    objc_msgSend(v141, "collection");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    if ((objc_msgSend(v140, "updateTypes") & 2) != 0)
    {
      +[PGGraphDateEdge filter](PGGraphDateEdge, "filter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "removeEdges:", v41);
      v42 = (id)objc_msgSend(*(id *)(a1 + 48), "insertDateNodesWithClueCollection:fromMomentNode:", v38, v141);
      objc_msgSend(*(id *)(a1 + 40), "updatedMomentNode:forUpdateChangeType:", v141, 2);

    }
    v5 = v144;
    if ((objc_msgSend(v140, "updateTypes") & 4) != 0)
    {
      +[PGGraphAddressEdge filter](PGGraphAddressEdge, "filter");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "removeEdges:", v44);
      v45 = (id)objc_msgSend(*(id *)(a1 + 48), "insertLocationHierarchyWithClueCollection:fromMomentNode:", v38, v141);
      objc_msgSend(*(id *)(a1 + 40), "updatedMomentNode:forUpdateChangeType:", v141, 4);

      if ((objc_msgSend(v140, "updateTypes") & 8) == 0)
      {
LABEL_25:
        +[PGGraphPOIEdge filter](PGGraphPOIEdge, "filter");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v53);
        v134 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "removeEdges:", v134);
        +[PGGraphROIEdge filter](PGGraphROIEdge, "filter");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "removeEdges:", v55);
        v56 = (id)objc_msgSend(*(id *)(a1 + 48), "insertPOIWithFeeder:fromMomentNode:isNearHomeOrWork:", v37, v141, v157);
        v57 = (id)objc_msgSend(*(id *)(a1 + 48), "insertROIWithClueCollection:fromMomentNode:", v38, v141);
        objc_msgSend(*(id *)(a1 + 40), "updatedMomentNode:forUpdateChangeType:", v141, 4);

        goto LABEL_26;
      }
    }
    else if ((objc_msgSend(v140, "updateTypes") & 8) == 0)
    {
LABEL_26:
      a3 = v150;
      v137 = v37;
      if ((objc_msgSend(v140, "updateTypes") & 0x19) != 0)
      {
        v58 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = v58;
          objc_msgSend(v140, "momentUUID");
          v60 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v167 = v60;
          _os_log_impl(&dword_1CA237000, v59, OS_LOG_TYPE_INFO, "MomentNode UUID %@ for moment update related to curation content", buf, 0xCu);

        }
        v61 = *(void **)(a1 + 48);
        v152[0] = MEMORY[0x1E0C809B0];
        v152[1] = 3221225472;
        v152[2] = __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_246;
        v152[3] = &unk_1E8434EB8;
        v155 = *(_QWORD *)(a1 + 152);
        v135 = *(_OWORD *)(a1 + 120);
        v62 = (id)v135;
        v156 = *(_QWORD *)(a1 + 160);
        v63 = *(_OWORD *)(a1 + 136);
        v153 = v135;
        v154 = v63;
        objc_msgSend(v61, "insertAssetCurationScoreInLibraryForFeeder:progressBlock:", v37, v152);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24))
        {
          v64 = (void *)v38;
          v21 = 1;
          *v150 = 1;

          v65 = v148;
          v27 = v138;
LABEL_46:

          v6 = v65;
          v26 = v137;
          goto LABEL_47;
        }
        v136 = -[PGGraphIngestMomentContainer initMomentContainerWithFeeder:clueCollection:curationManager:topTierAestheticScore:curationContext:]([PGGraphIngestMomentContainer alloc], "initMomentContainerWithFeeder:clueCollection:curationManager:topTierAestheticScore:curationContext:", v37, v38, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 168), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 208), *(double *)(*(_QWORD *)(a1 + 48) + 40));
        +[PGGraphMomentNode contentBasedPropertiesWithMoment:](PGGraphMomentNode, "contentBasedPropertiesWithMoment:");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "changingPropertiesWithProperties:");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = v66;
        if (objc_msgSend(v66, "count"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v66, objc_msgSend(v141, "identifier", v66), 0);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "nodeForIdentifier:", objc_msgSend(v141, "identifier"));
          v67 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v67;
        }
        v68 = *(void **)(*(_QWORD *)(a1 + 48) + 168);
        v69 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v140, "momentUUID", v131);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setWithObject:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "invalidateCurationCacheForMomentUUIDs:", v71);

        +[PGGraphSceneEdge filter](PGGraphSceneEdge, "filter");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v72);
        v73 = objc_claimAutoreleasedReturnValue();

        v142 = (void *)v73;
        objc_msgSend(v39, "removeEdges:", v73);
        if (_os_feature_enabled_impl())
        {
          +[PGGraphVisualLookupSceneEdge filter](PGGraphVisualLookupSceneEdge, "filter");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "removeEdges:", v75);
        }
        if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
        {
          +[PGGraphSceneEdge filter](PGGraphEntityNetSceneEdge, "filter");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "removeEdges:", v77);
        }
        v78 = (id)objc_msgSend(*(id *)(a1 + 48), "insertScenesWithClueCollection:fromMomentNode:", v38, v10);
        if (_os_feature_enabled_impl())
          objc_msgSend(*(id *)(a1 + 48), "insertVisualLookupScenesWithClueCollection:fromMomentNode:", v38, v10);
        v65 = v148;
        a3 = v150;
        v27 = v138;
        if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
          objc_msgSend(*(id *)(a1 + 48), "insertEntityNetScenesWithClueCollection:fromMomentNode:", v38, v10);
        v64 = (void *)v38;
        objc_msgSend(*(id *)(a1 + 40), "updatedMomentNode:forUpdateChangeType:", v10, 25);

      }
      else
      {
        v64 = (void *)v38;
        v65 = v148;
        v27 = v138;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "executeGraphChangeRequest:", v39);
      v21 = 0;
      goto LABEL_46;
    }
    v46 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = v46;
      objc_msgSend(v140, "momentUUID");
      v48 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v167 = v48;
      _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_INFO, "MomentNode UUID %@ for moment update related to person changes", buf, 0xCu);

    }
    +[PGGraphBasePresentEdge filter](PGGraphBasePresentEdge, "filter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphBasePresentEdgeCollection, "edgesFromNodes:matchingFilter:", v139, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "removeEdges:", v50);
    objc_msgSend(v141, "addressNodes");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "insertPeopleWithClueCollection:fromMomentNode:addressNodes:isNearPeopleAddress:", v38, v141, v51, &v157);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "unionSet:", v52);
    objc_msgSend(*(id *)(a1 + 40), "updatedMomentNode:forUpdateChangeType:", v141, 8);

    goto LABEL_25;
  }
LABEL_52:
  if (objc_msgSend(v5, "type") == 6)
  {
    v151 = a3;
    v79 = v5;
    objc_msgSend(v79, "personLocalIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "contactIdentifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v80, "length"))
    {
      v82 = *(void **)(a1 + 88);
      objc_msgSend(v79, "personLocalIdentifier");
      v83 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v81, "length"))
        goto LABEL_60;
      v82 = *(void **)(a1 + 96);
      objc_msgSend(v79, "contactIdentifier");
      v83 = objc_claimAutoreleasedReturnValue();
    }
    v84 = (void *)v83;
    objc_msgSend(v82, "objectForKeyedSubscript:", v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      if (objc_msgSend(v80, "length"))
      {
        v86 = *(void **)(*(_QWORD *)(a1 + 48) + 176);
        v165 = v80;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v165, 1);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "invalidatePersonsCacheForPersonsWithNames:", v87);

        objc_msgSend(MEMORY[0x1E0D4B190], "clueWithPersonLocalIdentifier:inPhotoLibrary:serviceManager:", v80, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 176));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v88 = 0;
      }
      if (!objc_msgSend(v81, "length"))
      {
        v92 = v80;
        v93 = v6;
        objc_msgSend(v85, "contactIdentifier");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "length");

        if (v95)
        {
          objc_msgSend(v85, "contactIdentifier");
          v96 = objc_claimAutoreleasedReturnValue();

          v81 = (void *)v96;
        }
        v6 = v93;
        v80 = v92;
      }
      v149 = v6;
      if (objc_msgSend(v81, "length"))
      {
        v97 = *(void **)(*(_QWORD *)(a1 + 48) + 176);
        v164 = v81;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v164, 1);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "invalidatePersonsCacheForPersonsWithContactIdentifiers:", v98);

        if (v88)
          goto LABEL_71;
        objc_msgSend(MEMORY[0x1E0D4B190], "clueWithPersonContactIdentifier:inPhotoLibrary:serviceManager:", v81, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 176));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v88)
      {
LABEL_74:
        objc_msgSend(*(id *)(a1 + 40), "relatedDetails");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "accumulateDetailsForUpdatedPersonNode:personChange:", v85, v79);

        objc_msgSend(*(id *)(a1 + 80), "addObject:", v85);
        objc_msgSend(*(id *)(a1 + 104), "addObject:", v85);

        v6 = v149;
LABEL_75:
        a3 = v151;

        goto LABEL_76;
      }
LABEL_71:
      objc_msgSend(v88, "person");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (v99)
      {
        v147 = *(void **)(a1 + 48);
        v100 = v88;
        v101 = v81;
        v102 = v80;
        v103 = v5;
        v104 = objc_msgSend(v85, "identifier");
        objc_msgSend(v79, "propertyNames");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v104;
        v5 = v103;
        v80 = v102;
        v81 = v101;
        v88 = v100;
        objc_msgSend(v147, "updatePersonNodeForIdentifier:withPerson:forPropertyNames:", v106, v99, v105);

      }
      goto LABEL_74;
    }
LABEL_60:
    v89 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      v90 = v89;
      objc_msgSend(v79, "personLocalIdentifier");
      v91 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v167 = v91;
      _os_log_impl(&dword_1CA237000, v90, OS_LOG_TYPE_INFO, "No personNode found for localIdentifier %@", buf, 0xCu);

    }
    goto LABEL_75;
  }
LABEL_76:
  if (objc_msgSend(v5, "type") == 9)
  {
    v108 = v5;
    if ((objc_msgSend(v108, "updateTypes") & 4) != 0 || (objc_msgSend(v108, "updateTypes") & 2) != 0)
    {
      v109 = *(void **)(a1 + 112);
      objc_msgSend(v108, "highlightUUID");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "objectForKeyedSubscript:", v110);
      v111 = (char *)objc_claimAutoreleasedReturnValue();

      if (v111)
      {
        objc_msgSend(*(id *)(a1 + 40), "cachedDataModelObjectForGraphChange:", v108);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        if (v112)
        {
          objc_msgSend(*(id *)(a1 + 48), "updateHighlightNode:withHighlight:", v111, v112);
          if ((objc_msgSend(v108, "updateTypes") & 4) != 0)
            objc_msgSend(*(id *)(a1 + 40), "updatedHighlightNode:forUpdateChangeType:", v111, 4);
          if ((objc_msgSend(v108, "updateTypes") & 2) != 0)
            objc_msgSend(*(id *)(a1 + 40), "updatedHighlightNode:forUpdateChangeType:", v111, 2);
        }
        else
        {
          v116 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v167 = v111;
            _os_log_error_impl(&dword_1CA237000, v116, OS_LOG_TYPE_ERROR, "GraphUpdate instance does not have cached PhotosHighlight data model but graph has Highlight node: %@", buf, 0xCu);
          }
        }

      }
      else
      {
        v113 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          v114 = v113;
          objc_msgSend(v108, "highlightUUID");
          v115 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v167 = v115;
          _os_log_impl(&dword_1CA237000, v114, OS_LOG_TYPE_INFO, "No highlightNode found for uuid %@", buf, 0xCu);

        }
      }

    }
    if ((objc_msgSend(v108, "updateTypes") & 8) != 0)
    {
      v117 = *(void **)(a1 + 112);
      objc_msgSend(v108, "highlightUUID");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "objectForKeyedSubscript:", v118);
      v119 = (char *)objc_claimAutoreleasedReturnValue();

      if (v119)
      {
        objc_msgSend(*(id *)(a1 + 40), "cachedDataModelObjectForGraphChange:", v108);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = v120;
        if (v120)
        {
          v122 = objc_msgSend(v120, "kind");
          v123 = *(void **)(a1 + 48);
          if (v122 == 3)
          {
            objc_msgSend(v123, "nodesForHighlightsInHighlightDayGroup:", v121);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "updateHighlightsForHighlightDayGroupNode:nodesForHighlightsInHighlightDayGroup:", v119, v124);
          }
          else
          {
            objc_msgSend(v123, "nodesForMomentsInHighlight:", v121);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "updateMomentsForHighlightNode:nodesForMomentsInHighlight:", v119, v124);
          }

          objc_msgSend(*(id *)(a1 + 40), "updatedHighlightNode:forUpdateChangeType:", v119, 8);
        }
        else
        {
          v128 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v167 = v119;
            _os_log_error_impl(&dword_1CA237000, v128, OS_LOG_TYPE_ERROR, "GraphUpdate instance does not have cached PhotosHighlight data model but graph has Highlight node: %@", buf, 0xCu);
          }
        }

      }
      else
      {
        v125 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
        {
          v126 = v125;
          objc_msgSend(v108, "highlightUUID");
          v127 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v167 = v127;
          _os_log_impl(&dword_1CA237000, v126, OS_LOG_TYPE_INFO, "No highlightNode found for uuid %@", buf, 0xCu);

        }
      }

    }
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = *(double *)(a1 + 152)
                                                               + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8)
                                                                           + 24);
  if (*(_QWORD *)(a1 + 120))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v130 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    if (Current - *(double *)(v130 + 24) >= *(double *)(a1 + 160))
    {
      *(double *)(v130 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 120) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8)
                                                                                + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) |= buf[0];
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24))
        *a3 = 1;
    }
  }
LABEL_109:
  objc_autoreleasePoolPop(v6);

}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_237(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * (a3 * 0.5));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __60__PGGraphBuilder_performChangeForGraphUpdate_progressBlock___block_invoke_246(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * (a3 * 0.5 + 0.5));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_214(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_216(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_218(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_221(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGGraphBuilder_performBatchUpdatesWithGraphUpdate_withRecipe_progressBlock___block_invoke_223(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double Current;
  uint64_t v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    Current = CFAbsoluteTimeGetCurrent();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v8 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + a3 * 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __38__PGGraphBuilder__buildSceneNodeCache__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v3 = a2;
  objc_msgSend(v3, "sceneName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __38__PGGraphBuilder__buildSceneNodeCache__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __38__PGGraphBuilder__buildSceneNodeCache__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "sceneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", v4, v3);

}

void __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_203(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.97);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __116__PGGraphBuilder__insertMomentNodeForClueCollection_feeder_insertedAndUpdatedPersonNodes_graphUpdate_progressBlock___block_invoke_204(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.01 + 0.99);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __51__PGGraphBuilder_featureProviderWithProgressBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24);
  objc_msgSend(*(id *)(a1 + 32), "childProgressReporterToCheckpoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v9 = (id)v6;
  objc_msgSend(*(id *)(a1 + 48), "specificationsForFeatureType:progressReporter:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  if (objc_msgSend(*(id *)(a1 + 56), "isCancelled"))
    *a3 = 1;

}

+ (void)prepareGraphForRebuild:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  PGGraphInfoNode *v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "enterBatch");
  objc_msgSend(v12, "setVersion:", 615);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(MEMORY[0x1E0D4B258], "canAccessContactsStore");
  objc_msgSend(v12, "infoNode");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (PGGraphInfoNode *)v9;
    +[PGGraphInfoNode genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:](PGGraphInfoNode, "genericPropertiesWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v3, v5, v6, v7, 11, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v11, -[MANode identifier](v10, "identifier"), 1);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v10 = -[PGGraphInfoNode initWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:]([PGGraphInfoNode alloc], "initWithCreationDate:localeIdentifier:languageIdentifiers:geoServiceProviderID:curationAlgorithmsVersion:contactsStoreAccess:", v3, v5, v6, v7, 11, v8);
    objc_msgSend(v11, "addNode:", v10);
    objc_msgSend(v12, "executeGraphChangeRequest:", v11);
  }

  objc_msgSend(v12, "leaveBatch");
}

+ (void)setLastIncrementalUpdateInvocationDate:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "infoNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[PGGraphInfoNode propertiesWithLastIncrementalUpdateInvocationOnDate:](PGGraphInfoNode, "propertiesWithLastIncrementalUpdateInvocationOnDate:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v8, objc_msgSend(v7, "identifier"), 0);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGGraphBuilder] PGGraphInfoNode should not be nil when updating the dateOfLastIncrementalUpdateInvocation", v9, 2u);
  }

}

- (id)insertPet:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  PGGraphPetNode *v8;
  void *v9;
  PGGraphPetNode *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8436F28;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = [PGGraphPetNode alloc];
  objc_msgSend(v3, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  v10 = -[PGGraphPetNode initWithLocalIdentifier:petSpecies:name:isFavorite:](v8, "initWithLocalIdentifier:petSpecies:name:isFavorite:", v9, objc_msgSend(v3, "species"), v7, objc_msgSend(v3, "isFavorite"));

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v3, "momentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "temporarySet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v54;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v54 != v17)
          objc_enumerationMutation(v14);
        v19 = -[PGGraphPetPresentEdge initFromPetNode:toMomentNode:]([PGGraphPetPresentEdge alloc], "initFromPetNode:toMomentNode:", v10, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v18));
        objc_msgSend(v11, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v16);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v3, "ownerNodes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "temporarySet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v50;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(v21);
        v26 = -[PGGraphIsOwnerOfPetEdge initFromPersonNode:toPetNode:]([PGGraphIsOwnerOfPetEdge alloc], "initFromPersonNode:toPetNode:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v25), v10);
        objc_msgSend(v12, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v23);
  }

  v27 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v27, "addNode:", v10);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v28 = v11;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v46;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(v27, "addEdge:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v32++));
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v30);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = v12;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v42;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(v27, "addEdge:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v37++));
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v35);
  }

  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v27);
  return v10;
}

- (void)insertOwner:(id)a3 forPets:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PGGraphIsOwnerOfPetEdge *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = [PGGraphIsOwnerOfPetEdge alloc];
        v16 = -[PGGraphIsOwnerOfPetEdge initFromPersonNode:toPetNode:](v15, "initFromPersonNode:toPetNode:", v6, v14, (_QWORD)v17);
        objc_msgSend(v8, "addEdge:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v8);
}

- (void)insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 photoLibrary:(id)a5 featureProvider:(id)a6 atMomentIngest:(BOOL)a7 curationContext:(id)a8
{
  -[PGGraphBuilder _insertMomentFeaturesForMomentNode:momentEnvelope:assets:photoLibrary:featureProvider:atMomentIngest:curationContext:](self, "_insertMomentFeaturesForMomentNode:momentEnvelope:assets:photoLibrary:featureProvider:atMomentIngest:curationContext:", a3, a4, 0, a5, a6, a7, a8);
}

- (void)insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 assets:(id)a5 featureProvider:(id)a6 atMomentIngest:(BOOL)a7 curationContext:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v9 = a7;
  v24 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v16, "count"))
  {
    -[PGGraphBuilder _insertMomentFeaturesForMomentNode:momentEnvelope:assets:photoLibrary:featureProvider:atMomentIngest:curationContext:](self, "_insertMomentFeaturesForMomentNode:momentEnvelope:assets:photoLibrary:featureProvider:atMomentIngest:curationContext:", v14, v15, v16, 0, v17, v9, v18);
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loggingConnection");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v21;
      _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "No assets passed in to insertMomentFeaturesForMomentNode for moment node with local identifier %@", buf, 0xCu);

    }
  }

}

- (void)_insertMomentFeaturesForMomentNode:(id)a3 momentEnvelope:(id)a4 assets:(id)a5 photoLibrary:(id)a6 featureProvider:(id)a7 atMomentIngest:(BOOL)a8 curationContext:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  id v51;
  PGGraphBuilder *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
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
  PGMutableGraph *graph;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id obj;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  id v92;
  PGGraphBuilder *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[5];
  uint8_t v116[128];
  uint8_t buf[4];
  void *v118;
  void *v119;
  _BYTE v120[128];
  uint64_t v121;

  v9 = a8;
  v121 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v89 = a9;
  v92 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  v82 = v19;
  objc_msgSend(v19, "featureInstancesWithMomentNode:atMomentIngest:", v15, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PGGraphBuilder personActivityMeaningCriteriaDictionaryByMeaningLabel](self, "personActivityMeaningCriteriaDictionaryByMeaningLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneEdges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder criteriaEvaluatorsByValidPersonActivityMeaningLabelFromMomentNode:sceneEdges:withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:](self, "criteriaEvaluatorsByValidPersonActivityMeaningLabelFromMomentNode:sceneEdges:withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:", v15, v22, v21);
    v23 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  v24 = (objc_msgSend(v20, "count") | v23) != 0;
  v93 = self;
  v81 = v16;
  v83 = v20;
  v84 = (void *)v23;
  if (v17 || !v24)
    goto LABEL_17;
  v25 = objc_alloc_init(MEMORY[0x1E0D4B160]);
  v26 = v25;
  if (v23)
  {
    objc_msgSend(v25, "setScenesPrefetchMode:", 2);
    objc_msgSend(v26, "setPersonsPrefetchMode:", 2);
    objc_msgSend(v26, "setFaceInformationPrefetchMode:", 2);
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v27 = v20;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v111 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "specification");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "assetFeederPrefetchOptions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "mergeWithFeederPrefetchOptions:", v33);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
    }
    while (v29);
  }

  objc_msgSend(v18, "librarySpecificFetchOptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFetchLimit:", 1);
  v35 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v15, "localIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fetchAssetCollectionsWithLocalIdentifiers:options:", v37, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)MEMORY[0x1E0D4B1B8];
    -[PGGraphBuilder curationContext](v93, "curationContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v39, 0, v26, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "allItems");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v20 = v83;
LABEL_17:
    v90 = v17;
    v91 = v15;
    v80 = v18;
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v43 = v20;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v107;
      v47 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v107 != v46)
            objc_enumerationMutation(v43);
          v49 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
          objc_msgSend(v49, "specification");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (id)objc_msgSend(v50, "addFeatureNodeIfNeededWithGraphBuilder:", v93);
          v103[0] = v47;
          v103[1] = 3221225472;
          v103[2] = __151__PGGraphBuilder_MomentFeatures___insertMomentFeaturesForMomentNode_momentEnvelope_assets_photoLibrary_featureProvider_atMomentIngest_curationContext___block_invoke;
          v103[3] = &unk_1E842E6E0;
          v104 = v15;
          v105 = v92;
          objc_msgSend(v50, "enumerateFeatureNodesWithInstance:assets:curationContext:usingBlock:", v49, v90, v89, v103);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
      }
      while (v45);
    }

    v26 = v90;
    v52 = v93;
    if (v9)
    {
      -[PGGraphBuilder criteriaEvaluatorsByValidPersonActivityMeaningLabelFromAssets:withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:](v93, "criteriaEvaluatorsByValidPersonActivityMeaningLabelFromAssets:withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:", v90, v84);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v54 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      obj = v53;
      v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
      if (v86)
      {
        v85 = *(_QWORD *)v100;
        do
        {
          v56 = 0;
          do
          {
            if (*(_QWORD *)v100 != v85)
              objc_enumerationMutation(obj);
            v88 = v56;
            v57 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v56);
            objc_msgSend(obj, "objectForKeyedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v98 = 0u;
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
            if (v59)
            {
              v60 = v59;
              v61 = *(_QWORD *)v96;
              do
              {
                for (k = 0; k != v60; ++k)
                {
                  if (*(_QWORD *)v96 != v61)
                    objc_enumerationMutation(v58);
                  v63 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * k);
                  objc_msgSend(v63, "meaningSceneCriteria");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v64)
                  {
                    objc_msgSend(v63, "meaningSceneCriteria");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "positiveScenes");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v66);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "setObject:forKeyedSubscript:", v67, v57);

                  }
                  objc_msgSend(v63, "meaningActionCriteria");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v68)
                  {
                    objc_msgSend(v63, "meaningActionCriteria");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "setObject:forKeyedSubscript:", v69, v57);

                    v70 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v63, "meaningActionCriteria");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v71, "actionValue"));
                    v72 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v54, "setObject:forKeyedSubscript:", v57, v72);
                  }
                }
                v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
              }
              while (v60);
            }

            v56 = v88 + 1;
          }
          while (v88 + 1 != v86);
          v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
        }
        while (v86);
      }

      v52 = v93;
      v26 = v90;
      -[PGGraphBuilder _updatePersonActivitiesOfMomentNode:assets:graph:withPositiveSceneCriteriaByValidPersonActivityMeaningLabel:andActionCriteriaByValidPersonActivityMeaningLabel:validPersonActivityMeaningLabelByActionValue:changeRequest:](v93, "_updatePersonActivitiesOfMomentNode:assets:graph:withPositiveSceneCriteriaByValidPersonActivityMeaningLabel:andActionCriteriaByValidPersonActivityMeaningLabel:validPersonActivityMeaningLabelByActionValue:changeRequest:", v91, v90, v93->_graph, v94, v55, v54, v92);

    }
    graph = v52->_graph;
    v74 = v92;
    -[MAGraph executeGraphChangeRequest:](graph, "executeGraphChangeRequest:", v92);
    v15 = v91;
    v18 = v80;
    v75 = v81;
    v76 = v83;
    v77 = v84;
    goto LABEL_45;
  }
  -[PGGraphBuilder loggingConnection](v93, "loggingConnection");
  v78 = objc_claimAutoreleasedReturnValue();
  v77 = v84;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "name");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v118 = v79;
    _os_log_impl(&dword_1CA237000, v78, OS_LOG_TYPE_INFO, "[PGGraphBuilder+MomentFeatures] No moment found for moment node %@, database out of date", buf, 0xCu);

  }
  v74 = v92;
  v76 = v83;
  v75 = v81;
LABEL_45:

}

- (id)criteriaEvaluatorsByValidPersonActivityMeaningLabelFromMomentNode:(id)a3 sceneEdges:(id)a4 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:(id)a5
{
  id v7;
  id v8;
  id v9;
  PGMeaningCriteriaMomentNodeCache *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = -[PGMeaningCriteriaMomentNodeCache initWithMomentNode:]([PGMeaningCriteriaMomentNodeCache alloc], "initWithMomentNode:", v7);
    v23 = v8;
    -[PGMeaningCriteriaMomentNodeCache setSceneEdges:](v10, "setSceneEdges:", v8);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v9;
    obj = v9;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v12, v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v15 = v13;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v29 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                if (objc_msgSend(v20, "allCriteriaPassForMomentNode:momentNodeCache:", v7, v10))
                  objc_msgSend(v14, "addObject:", v20);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v17);
          }

          if (objc_msgSend(v14, "count"))
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, v12);

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v26);
    }

    v9 = v22;
    v8 = v23;
  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA70];
  }

  return v24;
}

- (id)criteriaEvaluatorsByValidPersonActivityMeaningLabelFromAssets:(id)a3 withPersonActivityMeaningCriteriaDictionaryByMeaningLabel:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v19 = v6;
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v6;
    v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v7);
          v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v9, v19);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                if (objc_msgSend(v17, "allCriteriaPassForAssets:", v5))
                  objc_msgSend(v11, "addObject:", v17);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v14);
          }

          if (objc_msgSend(v11, "count"))
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, v9);

        }
        v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v22);
    }

    v6 = v19;
  }
  else
  {
    v20 = (id)MEMORY[0x1E0C9AA70];
  }

  return v20;
}

- (void)_updatePersonActivitiesOfMomentNode:(id)a3 assets:(id)a4 graph:(id)a5 withPositiveSceneCriteriaByValidPersonActivityMeaningLabel:(id)a6 andActionCriteriaByValidPersonActivityMeaningLabel:(id)a7 validPersonActivityMeaningLabelByActionValue:(id)a8 changeRequest:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  id obj;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  _QWORD v95[6];
  id v96;
  id v97;
  id v98;
  _QWORD v99[5];
  id v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[4];
  id v116;
  void *v117;
  id v118;
  id v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v14 = a4;
  v76 = a5;
  v15 = a6;
  v16 = a7;
  v74 = a8;
  v73 = a9;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v75 = v15;
  objc_msgSend(v15, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v16;
  objc_msgSend(v16, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    v70 = v21;
    v86 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v69 = v14;
    obj = v14;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v122 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
          objc_msgSend(v26, "curationModel", v69);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sceneModel");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "clsSceneClassifications");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sceneNamesFromSceneClassifications:passingThresholdOfType:", v29, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v30, "count"))
          {
            objc_msgSend(v26, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setObject:forKeyedSubscript:", v30, v31);

          }
          objc_msgSend(v26, "mediaAnalysisProperties");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "mediaAnalysisVersion");

          objc_msgSend(v26, "clsFaceInformationSummary");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "faceInformationByConsolidatedPersonLocalIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v115[0] = MEMORY[0x1E0C809B0];
          v115[1] = 3221225472;
          v115[2] = __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke;
          v115[3] = &unk_1E842E708;
          v116 = v87;
          v117 = v26;
          v118 = v74;
          v120 = v33;
          v119 = v83;
          objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v115);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
      }
      while (v23);
    }

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v71 = v70;
    v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
    if (v78)
    {
      v72 = *(_QWORD *)v112;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v112 != v72)
            objc_enumerationMutation(v71);
          v82 = v36;
          v37 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * v36);
          objc_msgSend(v75, "objectForKeyedSubscript:", v37, v69);
          v38 = objc_claimAutoreleasedReturnValue();
          v81 = v37;
          +[PGMeaningActionCriteria actionValueStringUsingActionCriteriaByValidPersonActivityMeaningLabel:withPersonActivityMeaningLabel:](PGMeaningActionCriteria, "actionValueStringUsingActionCriteriaByValidPersonActivityMeaningLabel:withPersonActivityMeaningLabel:", v83, v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v107 = 0u;
          v108 = 0u;
          v109 = 0u;
          v110 = 0u;
          v84 = obj;
          v88 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
          if (v88)
          {
            v85 = *(_QWORD *)v108;
            do
            {
              v40 = 0;
              do
              {
                if (*(_QWORD *)v108 != v85)
                  objc_enumerationMutation(v84);
                v90 = v40;
                v41 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v40);
                objc_msgSend(v41, "clsConsolidatedPersonLocalIdentifiers");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "uuid");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "objectForKeyedSubscript:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "objectForKeyedSubscript:", v39);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                v91 = v41;
                objc_msgSend(v41, "uuid");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "objectForKeyedSubscript:", v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                v89 = v47;
                v48 = objc_msgSend(v47, "intersectsSet:", v38);
                v103 = 0u;
                v104 = 0u;
                v105 = 0u;
                v106 = 0u;
                v49 = v42;
                v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
                if (v50)
                {
                  v51 = v50;
                  v52 = *(_QWORD *)v104;
                  do
                  {
                    for (j = 0; j != v51; ++j)
                    {
                      if (*(_QWORD *)v104 != v52)
                        objc_enumerationMutation(v49);
                      v54 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j);
                      if (-[PGGraphBuilder shouldUpdatePersonRepresentativeAssetUUIDsWithPositiveSceneCriteria:actionValueString:assetIsPassingSceneCriteria:personLocalIdentifierIsDoingActionInAsset:](self, "shouldUpdatePersonRepresentativeAssetUUIDsWithPositiveSceneCriteria:actionValueString:assetIsPassingSceneCriteria:personLocalIdentifierIsDoingActionInAsset:", v38, v39, v48, objc_msgSend(v45, "containsObject:", v54)))
                      {
                        v55 = v39;
                        v56 = v38;
                        objc_msgSend(v93, "objectForKeyedSubscript:", v54);
                        v57 = (id)objc_claimAutoreleasedReturnValue();
                        if (!v57)
                        {
                          v57 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                          objc_msgSend(v93, "setObject:forKeyedSubscript:", v57, v54);
                        }
                        objc_msgSend(v91, "uuid");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v57, "addObject:", v58);

                        v38 = v56;
                        v39 = v55;
                      }
                    }
                    v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
                  }
                  while (v51);
                }

                v40 = v90 + 1;
              }
              while (v90 + 1 != v88);
              v88 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
            }
            while (v88);
          }
          v80 = (void *)v38;

          v59 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v93, "allKeys");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setWithArray:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabel:personLocalIdentifiers:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "personActivityMeaningNodesForActivityLabel:personLocalIdentifiers:inGraph:", v81, v61, v76);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_2;
          v99[3] = &unk_1E842E730;
          v99[4] = self;
          v63 = v77;
          v100 = v63;
          v64 = v73;
          v101 = v64;
          v65 = v93;
          v102 = v65;
          v92 = v62;
          objc_msgSend(v62, "enumerateNodesUsingBlock:", v99);
          objc_msgSend(v62, "personLocalIdentifiers");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "minusSet:", v66);
          +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v61, v76);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_3;
          v95[3] = &unk_1E842E758;
          v95[4] = self;
          v95[5] = v81;
          v96 = v64;
          v97 = v63;
          v98 = v65;
          v68 = v65;
          objc_msgSend(v67, "enumerateNodesUsingBlock:", v95);

          v36 = v82 + 1;
        }
        while (v82 + 1 != v78);
        v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
      }
      while (v78);
    }

    v14 = v69;
    v21 = v70;
  }

}

- (void)_connectPersonActivityMeaningNode:(id)a3 toMomentNode:(id)a4 withChangeRequest:(id)a5 representativeAssetUUIDsByPersonLocalIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v19 = -[PGGraphPersonActivityMeaningEdge initFromMomentNode:toPersonActivityMeaningNode:]([PGGraphPersonActivityMeaningEdge alloc], "initFromMomentNode:toPersonActivityMeaningNode:", v11, v12);
  objc_msgSend(v10, "addEdge:", v19);
  objc_msgSend(v12, "personLocalIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[PGGraphMomentFeaturesEdge initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:]([PGGraphMomentFeaturesEdge alloc], "initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:", v11, v12, objc_msgSend(v14, "count"), v17);
  objc_msgSend(v10, "addEdge:", v18);

}

- (BOOL)shouldUpdatePersonRepresentativeAssetUUIDsWithPositiveSceneCriteria:(id)a3 actionValueString:(id)a4 assetIsPassingSceneCriteria:(BOOL)a5 personLocalIdentifierIsDoingActionInAsset:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  BOOL v11;

  v6 = a6;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v10, "intValue") >= 1 && objc_msgSend(v9, "length"))
  {
    v11 = a5 && v6;
  }
  else if ((int)objc_msgSend(v10, "intValue") >= 1 && a5 || (v11 = 0, objc_msgSend(v9, "length")) && v6)
  {
    v11 = 1;
  }

  return v11;
}

void __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  objc_msgSend(a3, "traits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 1)
        {
          v11 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v14 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), (int)objc_msgSend(v10, "value"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGMeaningActionCriteria actionHighRecallThresholdForAssetMediaAnalysisVersion:usingActionCriteriaByValidPersonActivityMeaningLabel:andValidPersonActivity:](PGMeaningActionCriteria, "actionHighRecallThresholdForAssetMediaAnalysisVersion:usingActionCriteriaByValidPersonActivityMeaningLabel:andValidPersonActivity:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v17);
          v19 = v18;
          objc_msgSend(v10, "score");
          if (v20 >= v19)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v16);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v16);
            }
            objc_msgSend(v21, "addObject:", v22);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

}

uint64_t __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectPersonActivityMeaningNode:toMomentNode:withChangeRequest:representativeAssetUUIDsByPersonLocalIdentifier:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __252__PGGraphBuilder_MomentFeatures___updatePersonActivitiesOfMomentNode_assets_graph_withPositiveSceneCriteriaByValidPersonActivityMeaningLabel_andActionCriteriaByValidPersonActivityMeaningLabel_validPersonActivityMeaningLabelByActionValue_changeRequest___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PGGraphPersonActivityMeaningNode *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[PGGraphPersonActivityMeaningNode initWithPersonLocalIdentifier:activity:]([PGGraphPersonActivityMeaningNode alloc], "initWithPersonLocalIdentifier:activity:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "addNode:", v5);
    v6 = -[PGGraphPracticesActivityEdge initFromPersonNode:toActivityNode:]([PGGraphPracticesActivityEdge alloc], "initFromPersonNode:toActivityNode:", v3, v5);
    objc_msgSend(*(id *)(a1 + 48), "addEdge:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_connectPersonActivityMeaningNode:toMomentNode:withChangeRequest:representativeAssetUUIDsByPersonLocalIdentifier:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGGraphBuilder+MomentFeatures] No person Local identifier for person node with name %@", (uint8_t *)&v9, 0xCu);

    }
  }

}

void __151__PGGraphBuilder_MomentFeatures___insertMomentFeaturesForMomentNode_momentEnvelope_assets_photoLibrary_featureProvider_atMomentIngest_curationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PGGraphMomentFeaturesEdge *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [PGGraphMomentFeaturesEdge alloc];
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v5, "count");

  v10 = -[PGGraphMomentFeaturesEdge initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:](v7, "initFromMomentNode:toFeatureNode:numberOfRelevantAssets:allAssetUUIDs:", v8, v6, v9, v11);
  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v10);

}

- (void)upsertPeopleEventEdgesOfMomentNode:(id)a3 matchingResults:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PGGraphEdgeCollection *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D42A30];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  -[PGGraphBuilder _upsertPeopleEventEdgesFromMomentNode:matchingResults:changeRequest:](self, "_upsertPeopleEventEdgesFromMomentNode:matchingResults:changeRequest:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder _removeInvalidPeopleEventEdgesFromMomentNode:edgesToUpsert:](self, "_removeInvalidPeopleEventEdgesFromMomentNode:edgesToUpsert:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v12 = -[MAElementCollection initWithArray:graph:]([PGGraphEdgeCollection alloc], "initWithArray:graph:", v11, self->_graph);
    objc_msgSend(v9, "removeEdges:", v12);

  }
  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v9);
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 134217984;
      v17 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "[PGGraphBuilder+PeopleEvents] Successfully remove %lu PeopleEvent domain edges", (uint8_t *)&v16, 0xCu);
    }

    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(v10, "count");
      v16 = 134217984;
      v17 = v15;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGGraphBuilder+PeopleEvents] Successfully upsert %lu PeopleEvent domain edges", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (id)_upsertPeopleEventEdgesFromMomentNode:(id)a3 matchingResults:(id)a4 changeRequest:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v8 = a4;
  v29 = a5;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", self->_graph);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "anyNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v15, "isMatching"))
        {
          objc_msgSend(v15, "requiredCriteria");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "meaningNodeLabel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "score");
          v19 = v18;
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("Birthday")))
          {
            objc_msgSend(v15, "requiredCriteria");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "additionalInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("personLocalIdentifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            +[PGGraphPersonNodeCollection personNodesForLocalIdentifier:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifier:inGraph:", v22, self->_graph);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "anyNode");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              -[PGGraphBuilder _birthdayEventEdgeFromMomentNode:toPersonNode:confidence:insertIfNeededToChangeRequest:](self, "_birthdayEventEdgeFromMomentNode:toPersonNode:confidence:insertIfNeededToChangeRequest:", v30, v24, v29, v19);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = 0;
            }

            if (v25)
            {
LABEL_16:
              objc_msgSend(v28, "addObject:", v25);

            }
          }
          else if (v9)
          {
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("Anniversary")))
            {
              -[PGGraphBuilder _anniversaryEventEdgeFromMomentNode:toPersonNode:confidence:insertIfNeededToChangeRequest:](self, "_anniversaryEventEdgeFromMomentNode:toPersonNode:confidence:insertIfNeededToChangeRequest:", v30, v9, v29, v19);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                goto LABEL_16;
            }
          }

          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  return v28;
}

- (id)_birthdayEventEdgeFromMomentNode:(id)a3 toPersonNode:(id)a4 confidence:(double)a5 insertIfNeededToChangeRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "collection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphBirthdayEventEdgeCollection, "edgesFromNodes:toNodes:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyEdge");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "propertyDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphBirthdayEventEdge propertyDictionaryWithConfidence:](PGGraphBirthdayEventEdge, "propertyDictionaryWithConfidence:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToDictionary:", v18) & 1) == 0)
    {
      -[MAGraph persistModelProperties:forEdgeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forEdgeWithIdentifier:clobberExisting:", v18, objc_msgSend(v16, "identifier"), 1);
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphBirthdayEventEdgeCollection, "edgesFromNodes:toNodes:", v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "anyEdge");
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v20;
    }

  }
  else
  {
    v16 = -[PGGraphBirthdayEventEdge initFromMomentNode:toPersonNode:confidence:]([PGGraphBirthdayEventEdge alloc], "initFromMomentNode:toPersonNode:confidence:", v10, v11, a5);
    objc_msgSend(v12, "addEdge:", v16);
  }

  return v16;
}

- (id)_anniversaryEventEdgeFromMomentNode:(id)a3 toPersonNode:(id)a4 confidence:(double)a5 insertIfNeededToChangeRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "collection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAnniversaryEventEdgeCollection, "edgesFromNodes:toNodes:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyEdge");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "propertyDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphAnniversaryEventEdge propertyDictionaryWithConfidence:](PGGraphAnniversaryEventEdge, "propertyDictionaryWithConfidence:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToDictionary:", v18) & 1) == 0)
    {
      -[MAGraph persistModelProperties:forEdgeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forEdgeWithIdentifier:clobberExisting:", v18, objc_msgSend(v16, "identifier"), 1);
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAnniversaryEventEdgeCollection, "edgesFromNodes:toNodes:", v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "anyEdge");
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v20;
    }

  }
  else
  {
    v16 = -[PGGraphAnniversaryEventEdge initFromMomentNode:toPersonNode:confidence:]([PGGraphAnniversaryEventEdge alloc], "initFromMomentNode:toPersonNode:confidence:", v10, v11, a5);
    objc_msgSend(v12, "addEdge:", v16);
  }

  return v16;
}

- (id)_removeInvalidPeopleEventEdgesFromMomentNode:(id)a3 edgesToUpsert:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a4;
  v6 = a3;
  +[PGGraphAnniversaryEventEdge filter](PGGraphAnniversaryEventEdge, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBirthdayEventEdge filter](PGGraphBirthdayEventEdge, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D42A00]);
  v13 = (void *)objc_msgSend(v12, "initWithLabels:domain:properties:", v11, 301, MEMORY[0x1E0C9AA70]);
  objc_msgSend(v6, "collection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__PGGraphBuilder_PeopleEvents___removeInvalidPeopleEventEdgesFromMomentNode_edgesToUpsert___block_invoke;
  v22[3] = &unk_1E8436610;
  v23 = v5;
  v17 = v16;
  v24 = v17;
  v18 = v5;
  objc_msgSend(v15, "enumerateEdgesUsingBlock:", v22);
  v19 = v24;
  v20 = v17;

  return v20;
}

void __91__PGGraphBuilder_PeopleEvents___removeInvalidPeopleEventEdgesFromMomentNode_edgesToUpsert___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "isSameEdgeAsEdge:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), (_QWORD)v9) & 1) != 0)
        {

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
LABEL_11:

}

- (id)insertMusicSessionNodeWithLocalStartDate:(id)a3 localEndDate:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("tzs");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("tze");
  v17[0] = v8;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "timeIntervalSince1970");
  v11 = v10;

  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("MusicSession"), 1000, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)insertMusicGenreNodeWithGenreName:(id)a3
{
  return -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", a3, 1001, 0, 0);
}

- (id)insertMusicAlbumNodeWithAlbumTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("name");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("MusicAlbum"), 1000, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)insertMusicTrackWithTrackTitle:(id)a3 durationInSeconds:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("durt");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("name");
  v13[0] = v8;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("MusicTrack"), 1000, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)performPreprocessingWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  mach_timebase_info v18;
  NSObject *v19;
  NSObject *v20;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PreProcessing", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v15 = mach_absolute_time();
  objc_msgSend(v9, "preprocessorsWithGraphBuilder:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder performProcessingSteps:withGraphUpdate:progressBlock:](self, "performProcessingSteps:withGraphUpdate:progressBlock:", v16, v10, v8);
  v17 = mach_absolute_time();
  v18 = info;
  v19 = v14;
  v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_END, v12, "PreProcessing", ", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "PreProcessing";
    v24 = 2048;
    v25 = (float)((float)((float)((float)(v17 - v15) * (float)v18.numer) / (float)v18.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)performPostprocessingWithGraphUpdate:(id)a3 withRecipe:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  mach_timebase_info v18;
  NSObject *v19;
  NSObject *v20;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PostProcessing", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v15 = mach_absolute_time();
  -[PGGraph invalidateProcessingCaches](self->_graph, "invalidateProcessingCaches");
  objc_msgSend(v9, "postprocessorsWithGraphBuilder:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder performProcessingSteps:withGraphUpdate:progressBlock:](self, "performProcessingSteps:withGraphUpdate:progressBlock:", v16, v10, v8);
  v17 = mach_absolute_time();
  v18 = info;
  v19 = v14;
  v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_END, v12, "PostProcessing", ", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "PostProcessing";
    v24 = 2048;
    v25 = (float)((float)((float)((float)(v17 - v15) * (float)v18.numer) / (float)v18.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)performProcessingSteps:(id)a3 withGraphUpdate:(id)a4 progressBlock:(id)a5
{
  id v8;
  void (**v9)(void *, _BYTE *, double);
  double Current;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  double v27;
  char v28;
  int v29;
  BOOL v30;
  double v31;
  char v32;
  char v33;
  NSObject *v34;
  id v35;
  int v36;
  _BOOL4 v37;
  id v38;
  id v39;
  PGGraphBuilder *v40;
  id obj;
  _QWORD v42[4];
  void (**v43)(void *, _BYTE *, double);
  uint64_t *v44;
  uint64_t *v45;
  double v46;
  double v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint8_t v62[128];
  uint8_t buf[4];
  __int128 v64;
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v8 = a4;
  v38 = a5;
  v9 = (void (**)(void *, _BYTE *, double))_Block_copy(v38);
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = (double *)&v54;
  v56 = 0x2020000000;
  v57 = 0;
  if (v9)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v55[3] >= 0.01)
    {
      v55[3] = Current;
      v53 = 0;
      v9[2](v9, &v53, 0.0);
      v33 = *((_BYTE *)v59 + 24) | v53;
      *((_BYTE *)v59 + 24) = v33;
      if (v33 || !-[MAGraph noFatalError](self->_graph, "noFatalError"))
      {
        v34 = MEMORY[0x1E0C81028];
        v35 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v36 = *((unsigned __int8 *)v59 + 24);
          v37 = -[MAGraph noFatalError](self->_graph, "noFatalError");
          *(_DWORD *)buf = 67109890;
          LODWORD(v64) = v36;
          WORD2(v64) = 1024;
          *(_DWORD *)((char *)&v64 + 6) = !v37;
          WORD5(v64) = 1024;
          HIDWORD(v64) = 54;
          v65 = 2080;
          v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphBuilder+Processing.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }

        goto LABEL_36;
      }
    }
  }
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph enterBatch](self->_graph, "enterBatch");
  v40 = self;
  v12 = objc_msgSend(v39, "count");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v39;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v13)
  {
    v14 = 1.0 / (double)v12;
    v15 = *(_QWORD *)v50;
    v16 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1CAA4EB2C]();
        v20 = objc_msgSend(v18, "shouldRunWithGraphUpdate:", v8);
        v21 = v11;
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (v20)
        {
          if (v22)
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&v64 = v24;
            _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "GraphBuilder - Starting %@", buf, 0xCu);

          }
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __83__PGGraphBuilder_Processing__performProcessingSteps_withGraphUpdate_progressBlock___block_invoke;
          v42[3] = &unk_1E84311C8;
          v46 = v16;
          v47 = v14;
          v43 = v9;
          v44 = &v54;
          v48 = 0x3F847AE147AE147BLL;
          v45 = &v58;
          objc_msgSend(v18, "runWithGraphUpdate:progressBlock:", v8, v42);
          if (*((_BYTE *)v59 + 24))
          {

            goto LABEL_21;
          }
          v30 = -[MAGraph noFatalError](v40->_graph, "noFatalError");

          if (!v30)
            goto LABEL_21;
        }
        else
        {
          if (v22)
          {
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&v64 = v26;
            _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "GraphBuilder - Skipping %@", buf, 0xCu);

          }
        }
        v16 = v14 + v16;
        if (!v9
          || (v27 = CFAbsoluteTimeGetCurrent(), v27 - v55[3] < 0.01)
          || (v55[3] = v27,
              buf[0] = 0,
              v9[2](v9, buf, v16),
              v28 = *((_BYTE *)v59 + 24) | buf[0],
              (*((_BYTE *)v59 + 24) = v28) == 0))
        {
          v29 = 1;
          goto LABEL_22;
        }
LABEL_21:
        v29 = 0;
LABEL_22:
        objc_autoreleasePoolPop(v19);
        if (!v29)
          goto LABEL_25;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v13);
  }
LABEL_25:

  -[MAGraph leaveBatch](v40->_graph, "leaveBatch");
  if (v9)
  {
    v31 = CFAbsoluteTimeGetCurrent();
    if (v31 - v55[3] >= 0.01)
    {
      v55[3] = v31;
      v53 = 0;
      v9[2](v9, &v53, 1.0);
      v32 = *((_BYTE *)v59 + 24) | v53;
      *((_BYTE *)v59 + 24) = v32;
      if (v32)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v64) = 80;
          WORD2(v64) = 2080;
          *(_QWORD *)((char *)&v64 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphBuilder+Processing.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_36:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

}

void __83__PGGraphBuilder_Processing__performProcessingSteps_withGraphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

- (id)insertMomentNodeForMoment:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = -[PGGraphMomentNode initFromMoment:]([PGGraphMomentNode alloc], "initFromMoment:", v4);

  v6 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v6, "addNode:", v5);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v6);

  return v5;
}

- (void)deleteHighlightsWithGraphUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidsOfHighlightsToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 134217984;
    v14 = v6;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Batch Updates - About to delete %lu Highlights", (uint8_t *)&v13, 0xCu);
  }
  +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:inGraph:](PGGraphHighlightNodeCollection, "highlightNodesForUUIDs:inGraph:", v5, self->_graph);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 != v6)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v5);
    objc_msgSend(v8, "uuids");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minusSet:", v11);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = (uint64_t)v10;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Failed to lookup Highlight nodes for deletion with UUIDs: \"%@\", (uint8_t *)&v13, 0xCu);
    }

  }
  if (v9)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v12, "removeNodes:", v8);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v12);
    objc_msgSend(v4, "setHasDeletedHighlightNodes:", 1);

  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 134218240;
    v14 = v9;
    v15 = 2048;
    v16 = v6;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Batch Updates - Deleted %lu Highlights (%lu requested)", (uint8_t *)&v13, 0x16u);
  }

}

- (void)insertHighlightsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double Current;
  char v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (v8
    && (Current = CFAbsoluteTimeGetCurrent(), Current - v25[3] >= 0.01)
    && (v25[3] = Current,
        v23 = 0,
        (*((void (**)(void *, char *, double))v8 + 2))(v8, &v23, 0.0),
        v10 = *((_BYTE *)v29 + 24) | v23,
        (*((_BYTE *)v29 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v33 = 55;
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/PGGraphBuilder+Highlight.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    -[MAGraph enterBatch](self->_graph, "enterBatch");
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke;
    v18[3] = &unk_1E8434F30;
    v12 = v8;
    v19 = v12;
    v20 = &v24;
    v21 = &v28;
    v22 = 0x3F847AE147AE147BLL;
    -[PGGraphBuilder insertHighlightDaysWithGraphUpdate:progressBlock:](self, "insertHighlightDaysWithGraphUpdate:progressBlock:", v6, v18);
    -[MAGraph leaveBatch](self->_graph, "leaveBatch");
    if (*((_BYTE *)v29 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v33 = 62;
        v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/PGGraphBuilder+Highlight.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      -[MAGraph enterBatch](self->_graph, "enterBatch");
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke_173;
      v13[3] = &unk_1E8434F30;
      v14 = v12;
      v15 = &v24;
      v16 = &v28;
      v17 = 0x3F847AE147AE147BLL;
      -[PGGraphBuilder insertHighlightDayGroupsWithGraphUpdate:progressBlock:](self, "insertHighlightDayGroupsWithGraphUpdate:progressBlock:", v6, v13);
      -[MAGraph leaveBatch](self->_graph, "leaveBatch");
      if (*((_BYTE *)v29 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v33 = 69;
        v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/PGGraphBuilder+Highlight.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

    }
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

- (void)insertHighlightDaysWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  double v8;
  int *v9;
  double Current;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  double v28;
  int v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void (**v34)(void *, _BYTE *, double);
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned __int8 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  _BYTE v42[14];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0.0;
  v9 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
  v34 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  if (v34)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v39 = 0;
      v34[2](v34, &v39, 0.0);
      if (v39)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v42 = 75;
          *(_WORD *)&v42[4] = 2080;
          *(_QWORD *)&v42[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Highlight.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_33;
      }
      v8 = Current;
    }
  }
  objc_msgSend(v6, "highlightDaysToIngest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v42 = v13;
    _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Batch Updates - About to insert %lu new highlights", buf, 0xCu);
  }

  -[MAGraph enterBatch](self->_graph, "enterBatch");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v16)
  {
    v17 = v16;
    v32 = 0;
    v33 = v14;
    v30 = v7;
    v31 = v6;
    v18 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v20, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightNodeCollection, "highlightNodeForUUID:inGraph:", v22, self->_graph);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "anyNode");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          -[PGGraphBuilder insertHighlightNodeWithHighlight:](self, "insertHighlightNodeWithHighlight:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v24);
        }
        -[PGGraphBuilder nodesForMomentsInHighlight:](self, "nodesForMomentsInHighlight:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGGraphBuilder updateMomentsForHighlightNode:nodesForMomentsInHighlight:](self, "updateMomentsForHighlightNode:nodesForMomentsInHighlight:", v24, v25);
        v26 = objc_msgSend(v15, "count");
        if (v34)
        {
          v27 = v26;
          v28 = CFAbsoluteTimeGetCurrent();
          if (v28 - v8 >= 0.01)
          {
            buf[0] = 0;
            v34[2](v34, buf, (double)(unint64_t)(v32 + i) / (double)v27 * 0.5 + 0.2);
            if (buf[0])
            {

              objc_autoreleasePoolPop(v21);
              v29 = 1;
              v8 = v28;
              goto LABEL_24;
            }
            v8 = v28;
          }
        }

        objc_autoreleasePoolPop(v21);
      }
      v32 += i;
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v17)
        continue;
      break;
    }
    v29 = 0;
LABEL_24:
    v7 = v30;
    v6 = v31;
    v9 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
    v14 = v33;
  }
  else
  {
    v29 = 0;
  }

  -[MAGraph leaveBatch](self->_graph, "leaveBatch");
  if (v34 && CFAbsoluteTimeGetCurrent() - v8 >= *((double *)v9 + 72) && (v39 = 0, v34[2](v34, &v39, 1.0), v39 | v29))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v42 = 106;
      *(_WORD *)&v42[4] = 2080;
      *(_QWORD *)&v42[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/PGGraphBuilder+Highlight.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    objc_msgSend(v6, "setInsertedHighlightNodes:", v14);
  }

LABEL_33:
}

- (void)updateMomentsForHighlightNode:(id)a3 nodesForMomentsInHighlight:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  PGGraphMomentNodeCollection *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  PGGraphHighlightNodeCollection *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D42A30];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v22 = -[MANodeCollection initWithNode:]([PGGraphHighlightNodeCollection alloc], "initWithNode:", v6);
  v10 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v8, self->_graph);

  -[PGGraphMomentNodeCollection highlightNodes](v10, "highlightNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionBySubtracting:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphContainsEdge filter](PGGraphContainsEdge, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesFromNodes:toNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:toNodes:matchingFilter:", v12, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeEdges:", v14);

  -[PGGraphHighlightNodeCollection momentNodes](v22, "momentNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionBySubtracting:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphContainsEdge filter](PGGraphContainsEdge, "filter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesFromNodes:toNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:toNodes:matchingFilter:", v22, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeEdges:", v18);

  -[MAElementCollection collectionBySubtracting:](v10, "collectionBySubtracting:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__PGGraphBuilder_Highlight__updateMomentsForHighlightNode_nodesForMomentsInHighlight___block_invoke;
  v23[3] = &unk_1E84352A0;
  v24 = v6;
  v25 = v9;
  v20 = v9;
  v21 = v6;
  objc_msgSend(v19, "enumerateNodesUsingBlock:", v23);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v20);

}

- (id)insertHighlightNodeWithHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightNodeCollection, "highlightNodeForUUID:inGraph:", v5, self->_graph);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "anyNode");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[PGGraphHighlightNode initFromHighlight:]([PGGraphHighlightNode alloc], "initFromHighlight:", v4);
    v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v8, "addNode:", v7);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v8);

  }
  return v7;
}

- (void)updateHighlightNode:(id)a3 withHighlight:(id)a4
{
  id v6;
  PGMutableGraph *graph;
  uint64_t v8;
  id v9;

  v6 = a3;
  -[PGGraphBuilder _propertiesFromIngestHighlight:](self, "_propertiesFromIngestHighlight:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  graph = self->_graph;
  v8 = objc_msgSend(v6, "identifier");

  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v9, v8, 0);
}

- (id)_propertiesFromIngestHighlight:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
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
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "uuid");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8436F28;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v23[0] = v7;
  v22[0] = CFSTR("id");
  v22[1] = CFSTR("tzs");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "localStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  v22[2] = CFSTR("utcs");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  v22[3] = CFSTR("tze");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "localEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = CFSTR("utce");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "timeIntervalSince1970");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)insertHighlightDayGroupsWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  double v8;
  double Current;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  void *v49;
  void (**v50)(void *, _BYTE *, double);
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  _BYTE v63[14];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0.0;
  v50 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  if (v50)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v59 = 0;
      v50[2](v50, &v59, 0.0);
      if (v59)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v63 = 176;
          *(_WORD *)&v63[4] = 2080;
          *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/PGGraphBuilder+Highlight.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_48;
      }
      v8 = Current;
    }
  }
  v44 = v7;
  v45 = v6;
  objc_msgSend(v6, "highlightDayGroupsToIngest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v63 = v12;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "Batch Updates - About to insert %lu new highlight groups", buf, 0xCu);
  }

  -[PGGraphBuilder photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v14;
  objc_msgSend(v14, "setShouldPrefetchCount:", 1);
  v15 = objc_msgSend(v10, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v15);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v56 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v19);
  }

  +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:inGraph:](PGGraphHighlightGroupNodeCollection, "highlightNodesForArrayOfUUIDs:inGraph:", v16, self->_graph);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "highlightNodeByHighlightUUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v23 = v17;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v24)
  {
    v26 = v24;
    v27 = 0;
    v28 = *(_QWORD *)v52;
    v29 = (double)v15;
    *(_QWORD *)&v25 = 138412290;
    v42 = v25;
    obj = v23;
LABEL_18:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v28)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v30);
      v32 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(v31, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CD1708], "fetchChildDayGroupHighlightsForHighlight:options:", v31, v47);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "count"))
        break;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      objc_msgSend(v31, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v42;
      *(_QWORD *)v63 = v35;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not inserting highlightDayGroupNode (%@) because it has no children", buf, 0xCu);
LABEL_27:

LABEL_28:
      objc_autoreleasePoolPop(v32);
      if (v26 == ++v30)
      {
        v23 = obj;
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        v26 = v39;
        if (v39)
          goto LABEL_18;
        goto LABEL_38;
      }
    }
    -[PGGraphBuilder insertHighlightGroupNodeWithHighlight:](self, "insertHighlightGroupNodeWithHighlight:", v31);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[PGGraphBuilder+Highlight] calling this function insertHighlightGroupNodeWithHighlight: should not return nil", buf, 2u);
      }
      goto LABEL_28;
    }
    v38 = (void *)v37;
    objc_msgSend(v46, "addObject:", v37);

    v34 = v38;
LABEL_22:
    -[PGGraphBuilder nodesForHighlightsInHighlightDayGroup:](self, "nodesForHighlightsInHighlightDayGroup:", v31, v42);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder updateHighlightsForHighlightDayGroupNode:nodesForHighlightsInHighlightDayGroup:](self, "updateHighlightsForHighlightDayGroupNode:nodesForHighlightsInHighlightDayGroup:", v34, v35);
    if (v50)
    {
      v36 = CFAbsoluteTimeGetCurrent();
      if (v36 - v8 >= 0.01)
      {
        v59 = 0;
        v50[2](v50, &v59, (double)v27 / v29 * 0.5 + 0.2);
        if (v59)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v63 = 224;
            *(_WORD *)&v63[4] = 2080;
            *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/PGGraphBuilder+Highlight.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          objc_autoreleasePoolPop(v32);
          v23 = obj;

          v7 = v44;
          v6 = v45;
          v40 = v46;
          v41 = v43;
          goto LABEL_47;
        }
        v8 = v36;
      }
    }
    ++v27;
    goto LABEL_27;
  }
LABEL_38:

  v7 = v44;
  v6 = v45;
  v40 = v46;
  v41 = v43;
  if (v50 && CFAbsoluteTimeGetCurrent() - v8 >= 0.01 && (v59 = 0, v50[2](v50, &v59, 1.0), v59))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v63 = 229;
      *(_WORD *)&v63[4] = 2080;
      *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/PGGraphBuilder+Highlight.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    objc_msgSend(v45, "setInsertedHighlightDayGroupNodes:", v46, v42);
  }
LABEL_47:

LABEL_48:
}

- (void)updateHighlightsForHighlightDayGroupNode:(id)a3 nodesForHighlightsInHighlightDayGroup:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  PGGraphHighlightNodeCollection *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D42A30];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v6, "collection");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[MAElementCollection initWithSet:graph:]([PGGraphHighlightNodeCollection alloc], "initWithSet:graph:", v8, self->_graph);

  -[PGGraphHighlightNodeCollection highlightGroupNodes](v10, "highlightGroupNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionBySubtracting:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphGroupContainsEdge filter](PGGraphGroupContainsEdge, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesFromNodes:toNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:toNodes:matchingFilter:", v12, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeEdges:", v14);
  objc_msgSend(v22, "highlightNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionBySubtracting:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphGroupContainsEdge filter](PGGraphGroupContainsEdge, "filter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesFromNodes:toNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:toNodes:matchingFilter:", v22, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeEdges:", v18);
  -[MAElementCollection collectionBySubtracting:](v10, "collectionBySubtracting:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __108__PGGraphBuilder_Highlight__updateHighlightsForHighlightDayGroupNode_nodesForHighlightsInHighlightDayGroup___block_invoke;
  v23[3] = &unk_1E8432568;
  v24 = v6;
  v25 = v9;
  v20 = v9;
  v21 = v6;
  objc_msgSend(v19, "enumerateNodesUsingBlock:", v23);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v20);

}

- (id)insertHighlightGroupNodeWithHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PGMutableGraph *graph;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  char v22;

  v4 = a3;
  +[PGGraphHighlightNode propertiesWithHighlight:](PGGraphHighlightNode, "propertiesWithHighlight:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("HighlightGroup"), 102, v5, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  graph = self->_graph;
  v8 = objc_msgSend(v4, "type");

  -[PGGraph nodeLabelForHighlightType:](graph, "nodeLabelForHighlightType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v6, "collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v9);

    if ((v14 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v6, "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHasTypeEdge filter](PGGraphHasTypeEdge, "filter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v18, "removeEdges:", v17);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v18);

  }
  if (objc_msgSend(v9, "length"))
  {
    -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", v9, 103, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("HAS_TYPE"), v6, v19, 103, 0);

  }
LABEL_6:

  return v6;
}

- (id)nodesForHighlightsInHighlightDayGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1708], "fetchChildDayGroupHighlightsForHighlight:options:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "uuid", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:inGraph:](PGGraphHighlightNodeCollection, "highlightNodesForArrayOfUUIDs:inGraph:", v8, self->_graph);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)nodesForMomentsInHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1708], "fetchMomentsInHighlight:options:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "uuid", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v8, self->_graph);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __108__PGGraphBuilder_Highlight__updateHighlightsForHighlightDayGroupNode_nodesForHighlightsInHighlightDayGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphGroupContainsEdge initFromHighlightGroupNode:toHighlightNode:]([PGGraphGroupContainsEdge alloc], "initFromHighlightGroupNode:toHighlightNode:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

void __86__PGGraphBuilder_Highlight__updateMomentsForHighlightNode_nodesForMomentsInHighlight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphContainsEdge initFromHighlightNode:toMomentNode:]([PGGraphContainsEdge alloc], "initFromHighlightNode:toMomentNode:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

void __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __75__PGGraphBuilder_Highlight__insertHighlightsWithGraphUpdate_progressBlock___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

- (id)insertPublicEvent:(id)a3 fromEventNode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  const __CFString **v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id obj;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  char v79;
  const __CFString *v80;
  void *v81;
  _BYTE v82[128];
  const __CFString *v83;
  void *v84;
  _BYTE v85[128];
  const __CFString *v86;
  void *v87;
  _QWORD v88[2];
  _QWORD v89[2];
  uint8_t buf[4];
  void *v91;
  _BYTE v92[128];
  _QWORD v93[2];
  _QWORD v94[5];

  v94[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = a4;
  v93[0] = CFSTR("id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "muid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = CFSTR("name");
  v94[0] = v7;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v9, "mutableCopy");

  v10 = objc_msgSend(v6, "expectedAttendance");
  v55 = v6;
  if (objc_msgSend(v6, "hasExpectedAttendance") && v10 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v11, CFSTR("attdc"));

  }
  v79 = 0;
  -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("PublicEvent"), 900, v56, &v79);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PUBLIC_EVENT"), v54, v12, 900, 0);
  if (v79)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v55, "performers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v76 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_msgSend(v19, "localizedName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "length"))
          {
            objc_msgSend(v19, "iTunesIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "length"))
            {
              v88[0] = CFSTR("name");
              v88[1] = CFSTR("id");
              v89[0] = v20;
              v89[1] = v21;
              v22 = (void *)MEMORY[0x1E0C99D80];
              v23 = (void **)v89;
              v24 = (const __CFString **)v88;
              v25 = 2;
            }
            else
            {
              v86 = CFSTR("name");
              v87 = v20;
              v22 = (void *)MEMORY[0x1E0C99D80];
              v23 = &v87;
              v24 = &v86;
              v25 = 1;
            }
            objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
            v27 = objc_claimAutoreleasedReturnValue();
            -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("Performer"), 900, v27, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PERFORMER"), v12, v28, 900, 0);

          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "loggingConnection");
            v27 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v91 = v19;
              _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Not ingesting performer with empty name %@", buf, 0xCu);
            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
      }
      while (v16);
    }

    objc_msgSend((id)objc_opt_class(), "supportedCategories");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v57, "count");
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v55, "categories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v72;
      v58 = *(_QWORD *)v72;
      do
      {
        v33 = 0;
        v59 = v31;
        do
        {
          if (*(_QWORD *)v72 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v33);
          objc_msgSend(v34, "category");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v66, "length"))
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "loggingConnection");
            v39 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v91 = v34;
              _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "Not ingesting empty categoryName string for category %@", buf, 0xCu);
            }
            goto LABEL_47;
          }
          if (!v61 || objc_msgSend(v57, "containsObject:", v66))
          {
            objc_msgSend(v34, "localizedName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v33;
            v63 = v35;
            if (v35 && (v36 = v35, objc_msgSend(v35, "length")))
            {
              v83 = CFSTR("lcln");
              v84 = v36;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
              v37 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v37 = MEMORY[0x1E0C9AA70];
            }
            v64 = v37;
            -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", v66, 901);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("CATEGORY"), v12);
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            objc_msgSend(v34, "localizedSubcategories");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v68;
              do
              {
                for (j = 0; j != v43; ++j)
                {
                  if (*(_QWORD *)v68 != v44)
                    objc_enumerationMutation(v41);
                  v46 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
                  if (objc_msgSend(v46, "length"))
                  {
                    v47 = objc_msgSend(v34, "levelForLocalizedSubcategory:", v46);
                    v48 = MEMORY[0x1E0C9AA70];
                    if (v47 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v80 = CFSTR("lvl");
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v47);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v81 = v49;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
                      v48 = objc_claimAutoreleasedReturnValue();

                    }
                    buf[0] = 0;
                    -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", v46, 902, v48, buf);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("LOCALIZED_SUBCATEGORY"), v12, v50, 902, 0);

                  }
                  else
                  {
                    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "loggingConnection");
                    v48 = objc_claimAutoreleasedReturnValue();

                    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v91 = v66;
                      _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "Not ingesting empty localizedSubcategory string for category %@", buf, 0xCu);
                    }
                  }

                }
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
              }
              while (v43);
            }

            v32 = v58;
            v31 = v59;
            v39 = v64;
            v33 = v65;
LABEL_47:

          }
          ++v33;
        }
        while (v33 != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
      }
      while (v31);
    }

  }
  return v12;
}

- (id)insertMemoryNodeFromMemory:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D42A30];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[PGGraphBuilder insertMemoryNodeFromMemory:changeRequest:](self, "insertMemoryNodeFromMemory:changeRequest:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v6);

  return v7;
}

- (id)insertMemoryNodeFromMemory:(id)a3 changeRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  PGGraphMemoryNode *v16;
  uint64_t v17;
  PGGraphMemoryNode *v18;
  id v19;
  PGGraphMemoryNode *v20;
  void *v21;
  PGGraphMemoryNode *v22;
  void *v23;
  _QWORD v25[4];
  PGGraphMemoryNode *v26;
  id v27;
  _QWORD v28[4];
  PGGraphMemoryNode *v29;
  id v30;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "memoryCategory"))
  {
    objc_msgSend((id)objc_opt_class(), "memoryLabelForCategory:", objc_msgSend(v6, "memoryCategory"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "memoryFeatureNodesInGraph:", self->_graph);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "memoryMomentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[IngestMemory] Attempting to insert memory with no feature nodes", buf, 2u);
      }

    }
    if (!objc_msgSend(v10, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[IngestMemory] Attempting to insert memory with no moment nodes", buf, 2u);
      }

    }
    +[PGGraphMemoryNode uniqueMemoryIdentifierWithMemoryLabel:featureNodes:](PGGraphMemoryNode, "uniqueMemoryIdentifierWithMemoryLabel:featureNodes:", v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PGGraphMemoryNode initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:]([PGGraphMemoryNode alloc], "initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:", v8, objc_msgSend(v6, "memoryCategorySubcategory"), v15, objc_msgSend(v6, "generatedWithFallbackRequirements"));
    objc_msgSend(v7, "addNode:", v16);
    v17 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke;
    v28[3] = &unk_1E84339A8;
    v18 = v16;
    v29 = v18;
    v19 = v7;
    v30 = v19;
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v28);
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke_2;
    v25[3] = &unk_1E84352A0;
    v20 = v18;
    v26 = v20;
    v27 = v19;
    objc_msgSend(v10, "enumerateNodesUsingBlock:", v25);
    v21 = v27;
    v22 = v20;

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "[IngestMemory] Attempting to insert memory with unknown memory category", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

- (void)deleteAllMemoryNodesAndEdges
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMemoryNodeCollection, "nodesInGraph:", self->_graph);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNodes:", v3);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v4);

}

- (void)deleteAllMemoryNodesAndEdgesForMemoryCategories:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D42A30];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  +[PGGraphMemoryNodeCollection memoryNodesOfCategories:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategories:inGraph:", v5, self->_graph);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeNodes:", v6);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v7);

}

- (void)deleteAllMemoryNodesAndEdgesForMemoryCategory:(unint64_t)a3
{
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", a3, self->_graph);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeNodes:", v5);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v6);

}

void __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphMemoryFeaturesEdge initFromMemoryNode:toFeatureNode:]([PGGraphMemoryFeaturesEdge alloc], "initFromMemoryNode:toFeatureNode:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

void __67__PGGraphBuilder_Memory__insertMemoryNodeFromMemory_changeRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphMemoryContainsAssetsFromEdge initFromMemoryNode:toMomentSourceNode:]([PGGraphMemoryContainsAssetsFromEdge alloc], "initFromMemoryNode:toMomentSourceNode:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

+ (id)memoryLabelForCategory:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("Unknown");
  v5 = CFSTR("Unknown");
  if ((uint64_t)a3 <= 200)
  {
    switch(a3)
    {
      case 1uLL:
        v4 = CFSTR("SingleMoment");
        goto LABEL_43;
      case 2uLL:
        v4 = CFSTR("PersonOverTime");
        goto LABEL_43;
      case 3uLL:
        v4 = CFSTR("Person");
        goto LABEL_43;
      case 4uLL:
        v4 = CFSTR("EarlyMomentsWithPerson");
        goto LABEL_43;
      case 5uLL:
        v4 = CFSTR("SocialGroupOverTime");
        goto LABEL_43;
      case 6uLL:
        v4 = CFSTR("SocialGroup");
        goto LABEL_43;
      case 7uLL:
        v4 = CFSTR("LastMonthAtHome");
        goto LABEL_43;
      case 8uLL:
        v4 = CFSTR("YearInReview");
        goto LABEL_43;
      case 9uLL:
        v4 = CFSTR("Foodie");
        goto LABEL_43;
      case 0xAuLL:
        v4 = CFSTR("Pet");
        goto LABEL_43;
      case 0xBuLL:
        v4 = CFSTR("Baby");
        goto LABEL_43;
      case 0xCuLL:
        v4 = CFSTR("CityLocation");
        goto LABEL_43;
      case 0xDuLL:
        v4 = CFSTR("RegionLocation");
        goto LABEL_43;
      case 0xEuLL:
        v4 = CFSTR("AreaLocation");
        goto LABEL_43;
      case 0xFuLL:
        v4 = CFSTR("BusinessLocation");
        goto LABEL_43;
      case 0x10uLL:
        v4 = CFSTR("MeaningfulEvent");
        goto LABEL_43;
      case 0x11uLL:
        v4 = CFSTR("MeaningfulEventAggregation");
        goto LABEL_43;
      case 0x12uLL:
        v4 = CFSTR("RecurrentTrip");
        goto LABEL_43;
      case 0x13uLL:
        v4 = CFSTR("Trip");
        goto LABEL_43;
      case 0x14uLL:
        v4 = CFSTR("PastSuperset");
        goto LABEL_43;
      case 0x15uLL:
        v4 = CFSTR("Season");
        goto LABEL_43;
      case 0x16uLL:
        return v4;
      case 0x17uLL:
        v4 = CFSTR("DayInHistoryAggregation");
        goto LABEL_43;
      case 0x18uLL:
        v4 = CFSTR("RecentHighlights");
        goto LABEL_43;
      case 0x19uLL:
        v4 = CFSTR("ChildActivity");
        goto LABEL_43;
      case 0x1AuLL:
        v4 = CFSTR("ExcitingMoments");
        goto LABEL_43;
      case 0x1BuLL:
        v4 = CFSTR("Trends");
        goto LABEL_43;
      case 0x1CuLL:
        v4 = CFSTR("PetOutdoor");
        goto LABEL_43;
      case 0x1DuLL:
        v4 = CFSTR("ChildAndPerson");
        goto LABEL_43;
      case 0x1EuLL:
        v4 = CFSTR("ChildOutdoor");
        goto LABEL_43;
      case 0x1FuLL:
        v4 = CFSTR("OngoingTrip");
        goto LABEL_43;
      default:
        if (a3 - 101 < 2)
          goto LABEL_5;
        if (a3 != 100)
          return v4;
        v4 = CFSTR("ContentCreationTool");
LABEL_43:
        v7 = v4;

        break;
    }
    return v4;
  }
  if (a3 - 201 >= 0x15 && a3 - 301 >= 2 && a3 != 401)
    return v4;
LABEL_5:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "+[PGGraphBuilder memoryLabelForCategory:] is not compatible with legacy category: %lu", (uint8_t *)&v8, 0xCu);
  }

  return CFSTR("Legacy");
}

+ (unint64_t)memoryCategoryForLabel:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YearInReview")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PersonOverTime")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LastMonthAtHome")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Foodie")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pet")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Baby")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Person")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EarlyMomentsWithPerson")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CityLocation")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegionLocation")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MeaningfulEvent")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MeaningfulEventAggregation")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SocialGroupOverTime")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SocialGroup")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RecurrentTrip")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Trip")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OngoingTrip")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PastSuperset")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SingleMoment")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Season")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AreaLocation")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DayInHistoryAggregation")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BusinessLocation")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RecentHighlights")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChildActivity")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExcitingMoments")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Trends")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PetOutdoor")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChildAndPerson")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChildOutdoor")) & 1) != 0)
  {
    v4 = 30;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ContentCreationTool")))
  {
    v4 = 100;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)insertPersonNodeForPerson:(id)a3 fromEventNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 edgeWeight:(float)a6
{
  return -[PGGraphBuilder insertPersonNodeForPerson:fromMomentNode:numberOfAssetsWithPerson:importanceInMoment:includeMergeCandidates:](self, "insertPersonNodeForPerson:fromMomentNode:numberOfAssetsWithPerson:importanceInMoment:includeMergeCandidates:", a3, a4, a5, 0, a6);
}

- (id)insertPresentEdgeFromPersonNode:(id)a3 toEventNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 edgeWeight:(float)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "collection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "anyEdge");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v15 = -[PGGraphBasePresentEdge initFromPersonNode:toMomentNode:importance:numberOfAssets:]([PGGraphPersonPresentEdge alloc], "initFromPersonNode:toMomentNode:importance:numberOfAssets:", v10, v11, a5, a6);
    objc_msgSend(v16, "addEdge:", v15);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v16);

  }
  return v15;
}

- (id)insertPersonNodeForPerson:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isMe");
  -[PGGraph meNode](self->_graph, "meNode");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v5 && v6)
  {
    -[PGGraphBuilder updateMeNode:withPropertiesFromPerson:](self, "updateMeNode:withPropertiesFromPerson:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v8;
    v9 = v7;
    goto LABEL_37;
  }
  v10 = CFSTR("People");
  if (v5)
    v10 = CFSTR("Me");
  v11 = v10;
  +[PGGraphPersonNode propertiesWithPerson:](PGGraphPersonNode, "propertiesWithPerson:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPeopleDomainBuildingHelper insertedIdentifiedPersonForPersonLocalIdentifier:](self->_peopleDomainBuildingHelper, "insertedIdentifiedPersonForPersonLocalIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "personNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "birthdayDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "anniversaryDate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v15, "relationship");
    objc_msgSend(v9, "changingPropertiesWithProperties:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v16;
    if (v9 && !objc_msgSend(v16, "count"))
      goto LABEL_13;
  }
  else
  {
    v9 = 0;
    v50 = 0;
    v51 = 0;
    v46 = 0;
    v47 = 0;
  }
  v17 = v9;
  -[PGMutableGraph addUniquelyIdentifiedNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniquelyIdentifiedNodeWithLabel:domain:properties:didCreate:", v11, 300, v12, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    -[PGGraphPeopleDomainBuildingHelper insertIdentifiedPersonWithPersonNode:forPersonLocalIdentifier:](self->_peopleDomainBuildingHelper, "insertIdentifiedPersonWithPersonNode:forPersonLocalIdentifier:", v9, v13);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
LABEL_13:
  objc_msgSend(v4, "birthdayDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v13;
  v49 = v19;
  if (v19)
  {
    if (v51)
    {
      if ((objc_msgSend(v19, "isEqualToDate:") & 1) == 0)
      {
        -[PGGraphBuilder loggingConnection](self, "loggingConnection");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "localIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478339;
          v53 = v38;
          v54 = 2113;
          v55 = v49;
          v56 = 2113;
          v57 = v51;
          _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "Two different birthday dates for person %{private}@, %{private}@ and %{private}@", buf, 0x20u);

        }
      }
    }
    else
    {
      v42 = v11;
      v44 = v12;
      objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 24, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "month");
      v23 = objc_msgSend(v21, "day");
      v40 = v22;
      +[PGGraphMonthDayNodeCollection monthDayNodesForMonth:day:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForMonth:day:inGraph:", v22, v23, self->_graph);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "anyNode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        -[PGGraphBuilder insertMonthDayNodeForMonth:day:](self, "insertMonthDayNodeForMonth:day:", v40, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v26 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("BDAY_MONTH_DAY"), v9, v25, 400, 0);
      objc_msgSend(v15, "setBirthdayDate:", v49);

      v11 = v42;
      v12 = v44;
    }
  }
  objc_msgSend(v4, "anniversaryDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
    goto LABEL_32;
  if (!v50)
  {
    v43 = v11;
    v45 = v12;
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 24, v27);
    v29 = objc_claimAutoreleasedReturnValue();
    v31 = -[NSObject month](v29, "month");
    v39 = -[NSObject day](v29, "day");
    v41 = v31;
    +[PGGraphMonthDayNodeCollection monthDayNodesForMonth:day:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForMonth:day:inGraph:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "anyNode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      -[PGGraphBuilder insertMonthDayNodeForMonth:day:](self, "insertMonthDayNodeForMonth:day:", v41, v39);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("ANNIVERSARY_MONTH_DAY"), v9, v33, 400, 0);
    objc_msgSend(v15, "setAnniversaryDate:", v28);

    v11 = v43;
    goto LABEL_30;
  }
  if ((objc_msgSend(v27, "isEqualToDate:") & 1) != 0)
    goto LABEL_32;
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "localIdentifier");
    v45 = v12;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v53 = v30;
    v54 = 2113;
    v55 = v28;
    v56 = 2113;
    v57 = v50;
    _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "Two different anniversary dates for person %{private}@, %{private}@ and %{private}@", buf, 0x20u);

LABEL_30:
    v12 = v45;
  }

LABEL_32:
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      v35 = objc_msgSend(v4, "relationship");
      if (v35 != v46)
      {
        v36 = v35;
        -[PGGraphBuilder addRelationshipEdgesBetweenPersonNode:andPersonNode:forRelationship:confidence:properties:](self, "addRelationshipEdgesBetweenPersonNode:andPersonNode:forRelationship:confidence:properties:", v7, v9, v35, 0, 1.0);
        objc_msgSend(v15, "setRelationship:", v36);
      }
    }
  }

LABEL_37:
  return v9;
}

- (void)addRelationshipEdgesBetweenPersonNode:(id)a3 andPersonNode:(id)a4 forRelationship:(unint64_t)a5 confidence:(double)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
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
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  char v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  PGGraphRelationshipEdge *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  PGGraphBuilder *v73;
  char v74;
  uint64_t v75;
  char v76;
  char v77;
  uint64_t v78;
  unsigned int v79;
  unsigned int v80;
  char v81;
  uint64_t v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (a7)
    v14 = a7;
  else
    v14 = (id)MEMORY[0x1E0C9AA70];
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  v16 = 2;
  if (a6 > 0.0)
    v16 = 1;
  if (a6 == 1.0)
    v17 = 0;
  else
    v17 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("relstatus"));

  v19 = (void *)MEMORY[0x1E0C99E20];
  +[PGGraphBuilder expandedRelationshipLabelsForRelationship:](PGGraphBuilder, "expandedRelationshipLabelsForRelationship:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v12;
  objc_msgSend(v12, "collection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v13;
  objc_msgSend(v13, "collection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphRelationshipEdgeCollection, "edgesFromNodes:toNodes:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "labels");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "minusSet:", v25);
  if (objc_msgSend(v21, "count"))
  {
    v73 = self;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("relstatus"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("relsource"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v27, "unsignedIntegerValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rfamhol"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rparnam"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rfamnam"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v32, "BOOLValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("gwnummmtshome"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v33, "unsignedIntegerValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rhasanniv"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rtop2sg"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v35, "BOOLValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rlovexch"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v36, "unsignedIntegerValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rtop"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v37, "BOOLValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rfrndnghtout"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v40 = v39;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rprtnrtrip"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rfrfamtrip"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v46 = v45;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rwkend"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    v49 = v48;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rwork"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    v52 = v51;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rcal"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    v55 = v54;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ragediff"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "BOOLValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rold"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "BOOLValue");

    v72 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rchild"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "BOOLValue");

    v62 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v71 = v21;
    v63 = v21;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v65; ++i)
        {
          if (*(_QWORD *)v86 != v66)
            objc_enumerationMutation(v63);
          BYTE4(v70) = v81;
          BYTE3(v70) = v61;
          BYTE2(v70) = v59;
          BYTE1(v70) = v57;
          LOBYTE(v70) = v74;
          BYTE1(v69) = v76;
          LOBYTE(v69) = v77;
          v68 = -[PGGraphRelationshipEdge initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:]([PGGraphRelationshipEdge alloc], "initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i), v84, v83, v82, v80, v79, a6, v30, v40, v43, v46, v49,
                  v52,
                  v55,
                  v78,
                  v69,
                  v75,
                  v70);
          objc_msgSend(v62, "addEdge:", v68);

        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
      }
      while (v65);
    }

    -[MAGraph executeGraphChangeRequest:](v73->_graph, "executeGraphChangeRequest:", v62);
    v21 = v71;
    v15 = v72;
  }

}

- (void)insertStorytellingRelationshipsWithRelationshipsForPersonNodes:(id)a3 meNode:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D42A30];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke;
  v12[3] = &unk_1E8435398;
  v11 = v6;
  v13 = v11;
  v10 = v9;
  v14 = v10;
  objc_msgSend(v8, "enumerateNodesUsingBlock:", v12);

  if (objc_msgSend(v10, "numberOfChanges"))
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v10);

}

- (void)addStorytellingRelationshipsToMeNode:(id)a3 relationshipByPerson:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  PGGraphBuilder *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D42A30];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __84__PGGraphBuilder_People__addStorytellingRelationshipsToMeNode_relationshipByPerson___block_invoke;
  v15 = &unk_1E8434C70;
  v16 = self;
  v11 = v6;
  v17 = v11;
  v10 = v9;
  v18 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v12);

  if (objc_msgSend(v10, "numberOfChanges"))
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v10, v11, v12, v13, v14, v15, v16, v17);

}

- (id)insertHomeWorkNodeForPerson:(id)a3 personNode:(id)a4 fromAddressNodes:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id obj;
  _QWORD v23[5];
  id v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__63828;
  v37 = __Block_byref_object_dispose__63829;
  v38 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v13, "coordinate");
        v16 = v15;
        v18 = v17;
        objc_msgSend(v8, "locationsByAddressTypes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __82__PGGraphBuilder_People__insertHomeWorkNodeForPerson_personNode_fromAddressNodes___block_invoke;
        v23[3] = &unk_1E8434CB8;
        v27 = v16;
        v28 = v18;
        v26 = &v33;
        v23[4] = self;
        v24 = v9;
        v25 = v13;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v23);

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v10);
  }

  v20 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (id)updateMeNode:(id)a3 withPropertiesFromPerson:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PGGraphPersonNode propertiesWithPerson:](PGGraphPersonNode, "propertiesWithPerson:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changingPropertiesWithProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (objc_msgSend(v8, "count"))
  {
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 138412547;
      v14 = v6;
      v15 = 2113;
      v16 = v8;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Updating Me node %@ with properties %{private}@", (uint8_t *)&v13, 0x16u);
    }

    v11 = objc_msgSend(v6, "identifier");
    -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v8, v11, 0);
    -[MAGraph nodeForIdentifier:](self->_graph, "nodeForIdentifier:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)insertPeopleWithClueCollection:(id)a3 fromMomentNode:(id)a4 addressNodes:(id)a5 isNearPeopleAddress:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  char v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__63828;
  v42 = __Block_byref_object_dispose__63829;
  -[PGGraph meNode](self->_graph, "meNode");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mePerson");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v39[5];
  if (v15)
  {
    objc_msgSend(v15, "localIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
LABEL_6:

      goto LABEL_7;
    }

  }
  if (v14)
  {
    -[PGGraphBuilder insertMePersonNodeForPerson:](self, "insertMePersonNodeForPerson:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v39[5];
    v39[5] = v17;
    goto LABEL_6;
  }
LABEL_7:
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__63828;
  v36[4] = __Block_byref_object_dispose__63829;
  objc_msgSend((id)v39[5], "localIdentifier");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 && objc_msgSend(v12, "count"))
  {
    -[PGGraphBuilder insertHomeWorkNodeForPerson:personNode:fromAddressNodes:](self, "insertHomeWorkNodeForPerson:personNode:fromAddressNodes:", v14, v39[5], v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v45 + 24))
      v19 = 0;
    else
      v19 = v18 == 0;
    v20 = !v19;
    *((_BYTE *)v45 + 24) = v20;

  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __105__PGGraphBuilder_People__insertPeopleWithClueCollection_fromMomentNode_addressNodes_isNearPeopleAddress___block_invoke;
  v28[3] = &unk_1E8434CE0;
  v28[4] = self;
  v21 = v14;
  v29 = v21;
  v33 = v36;
  v34 = &v38;
  v22 = v11;
  v30 = v22;
  v23 = v12;
  v31 = v23;
  v35 = &v44;
  v24 = v13;
  v32 = v24;
  objc_msgSend(v10, "enumeratePeopleClues:", v28);
  *a6 = *((_BYTE *)v45 + 24);
  v25 = v32;
  v26 = v24;

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v26;
}

- (id)insertPresentEdgeFromPersonNode:(id)a3 toMomentNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 importance:(double)a6 includeMergeCandidates:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __objc2_class *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a3;
  v13 = a4;
  v14 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  if (a7)
  {
    objc_msgSend(v12, "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphConsolidatedPersonPresentEdgeCollection, "edgesFromNodes:toNodes:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v17, "count"))
    {
      v18 = PGGraphConsolidatedPersonPresentEdge;
LABEL_7:
      v21 = (void *)objc_msgSend([v18 alloc], "initFromPersonNode:toMomentNode:importance:numberOfAssets:", v12, v13, a5, a6);
      objc_msgSend(v14, "addEdge:", v21);
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v12, "collection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:", v19, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v17, "count"))
    {
      v18 = PGGraphPersonPresentEdge;
      goto LABEL_7;
    }
  }
  objc_msgSend(v17, "anyEdge");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v14);
  return v21;
}

- (id)insertPersonNodeForPerson:(id)a3 fromMomentNode:(id)a4 numberOfAssetsWithPerson:(unint64_t)a5 importanceInMoment:(double)a6 includeMergeCandidates:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  void *v13;
  void *v14;

  v7 = a7;
  v12 = a4;
  -[PGGraphBuilder insertPersonNodeForPerson:](self, "insertPersonNodeForPerson:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder insertPresentEdgeFromPersonNode:toMomentNode:numberOfAssetsWithPerson:importance:includeMergeCandidates:](self, "insertPresentEdgeFromPersonNode:toMomentNode:numberOfAssetsWithPerson:importance:includeMergeCandidates:", v13, v12, a5, v7, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)insertProximityEdgeFromPersonNode:(id)a3 toMomentNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonProximityEdgeCollection, "edgesFromNodes:toNodes:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "anyEdge");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v11 = -[PGGraphPersonProximityEdge initFromPersonNode:toMomentNode:]([PGGraphPersonProximityEdge alloc], "initFromPersonNode:toMomentNode:", v6, v7);
    objc_msgSend(v12, "addEdge:", v11);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v12);

  }
  return v11;
}

- (void)updatePersonNodeForIdentifier:(unint64_t)a3 withPerson:(id)a4 forPropertyNames:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v22 = v8;
  +[PGGraphPersonNode propertiesWithPerson:](PGGraphPersonNode, "propertiesWithPerson:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);
        }
        else
        {
          -[PGGraphBuilder graph](self, "graph");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeModelPropertyForKey:forNodeWithIdentifier:", v17, a3);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v11;
    v29 = 2112;
    v30 = v22;
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[PGGraphBuilder+People] relevantProperties to update = %@ with ingestPerson = %@", buf, 0x16u);
  }

  -[PGGraphBuilder graph](self, "graph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v11, a3, 0);

}

- (id)insertContactSuggestion:(id)a3 forPersonNode:(id)a4 confidence:(double)a5 edgeProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  PGGraphContactNode *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  double v71;
  id v72;
  void *v73;
  NSObject *v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  char v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  void *v95;
  PGGraphBuilder *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "fullName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v10, "CNIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;
  v19 = v18;
  v100 = 0;
  if (v15 && v18)
  {
    v98 = v15;
    v20 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v96 = self;
    +[PGGraphContactNodeCollection contactNodeForContactIdentifier:inGraph:](PGGraphContactNodeCollection, "contactNodeForContactIdentifier:inGraph:", v19, self->_graph);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v20;
    v97 = v21;
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v21, "anyNode");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v11;
      objc_msgSend(v11, "collection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphContactSuggestionEdgeCollection, "edgesFromNodes:toNodes:", v23, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = v11;
      v25 = [PGGraphContactNode alloc];
      objc_msgSend(v10, "birthdayDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "potentialBirthdayDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PGGraphContactNode initWithName:contactIdentifier:birthdayDate:potentialBirthdayDate:](v25, "initWithName:contactIdentifier:birthdayDate:potentialBirthdayDate:", v98, v19, v26, v27);

      v100 = (void *)v28;
      objc_msgSend(v20, "addNode:", v28);
      v24 = 0;
    }
    v95 = v24;
    v11 = v22;
    v29 = v20;
    if (!objc_msgSend(v24, "count"))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwscore"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v94 = v31;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwnummmtshome"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v32, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwnummentndaddrs"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v33, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwnumbdaymmt"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v34, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwnummbdaymmt"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v35, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwnummmtsclndrevents"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v36, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwnumassts"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v37, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwnumcmm"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v38, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwftfprntconf"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      v86 = v40;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwfprntsmatch"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v41, "BOOLValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwreldebug"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwsocialgrpsconf"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      v84 = v43;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwsocialgrps"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwmsggrps"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bdayscore"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "doubleValue");
      v82 = v47;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pbdayscore"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "doubleValue");
      v81 = v49;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("addscore"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "doubleValue");
      v80 = v51;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("maddscore"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      v54 = v53;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("calscore"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "doubleValue");
      v57 = v56;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("asstscore"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "doubleValue");
      v60 = v59;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("cmmscore"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "doubleValue");
      v63 = v62;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("relscore"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "doubleValue");
      v66 = v65;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("scoremfp"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "doubleValue");
      v69 = v68;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("gwgenmatch"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (double)(unint64_t)objc_msgSend(v70, "unsignedIntegerValue");

      LOBYTE(v79) = v85;
      v72 = -[PGGraphContactSuggestionEdge initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:]([PGGraphContactSuggestionEdge alloc], "initFromPersonNode:toContactNode:confidence:contactScore:numberOfMomentsAtHome:numberOfMomentsAtMentionedAddress:numberOfWeakBirthdayMomentsAroundBirthdayDate:numberOfWeakBirthdayMomentsAroundPotentialBirthdayDate:numberOfMomentsOverlappingWithCalendarEvents:numberOfAppearancesInSharedAssets:numberOfCMMMoments:facetimeFaceprintConfidence:contactFaceprintMatch:relationshipsDebug:socialGroupsConfidence:socialGroupsDebug:messageGroupsDebug:birthdayScore:potentialBirthdayScore:addressScore:mentionedAddressScore:calendarScore:sharedAssetScore:sharedCMMScore:relationshipScore:scoreAfterMessagePenalty:sexMatch:", v11, v100, v87, v93, v92, v91, a5, v94, v86, v84, v82, v81,
              v80,
              v54,
              v90,
              v89,
              v88,
              v79,
              v83,
              v44,
              v45,
              v57,
              v60,
              v63,
              v66,
              v69,
              (unint64_t)v71);
      objc_msgSend(v99, "addEdge:", v72);

    }
    -[MAGraph executeGraphChangeRequest:](v96->_graph, "executeGraphChangeRequest:", v99);
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "loggingConnection");
    v74 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "stringDescription");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "name");
      v76 = v11;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v102 = v75;
      v103 = 2113;
      v104 = v77;
      _os_log_impl(&dword_1CA237000, v74, OS_LOG_TYPE_INFO, "IngestPeople: Photos Person %{private}@ with Contact %{private}@", buf, 0x16u);

      v11 = v76;
      v29 = v99;

    }
    v15 = v98;
  }

  return v100;
}

- (void)setBiologicalSex:(unint64_t)a3 onPersonNodeForIdentifier:(unint64_t)a4
{
  id v6;

  +[PGGraphPersonNode propertiesWithBiologicalSex:](PGGraphPersonNode, "propertiesWithBiologicalSex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v6, a4, 0);

}

- (void)setAgeCategory:(unint64_t)a3 onPersonNodeForIdentifier:(unint64_t)a4
{
  id v6;

  +[PGGraphPersonNode propertiesWithAgeCategory:](PGGraphPersonNode, "propertiesWithAgeCategory:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MAGraph persistModelProperties:forNodeWithIdentifier:clobberExisting:](self->_graph, "persistModelProperties:forNodeWithIdentifier:clobberExisting:", v6, a4, 0);

}

- (id)insertOrUpdateMePersonNodeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PGGraph meNode](self->_graph, "meNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PGGraphBuilder serviceManager](self, "serviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mePersonForGraphIngest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "No me node, using person identity: %@", (uint8_t *)&v9, 0xCu);
    }

    -[PGGraphBuilder insertMePersonNodeForPerson:](self, "insertMePersonNodeForPerson:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Using Me node: %@", (uint8_t *)&v9, 0xCu);
  }

  return v3;
}

- (void)inferPersonNodeForMeNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  PGGraphPeopleDomainBuildingHelper *peopleDomainBuildingHelper;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraphBuilder serviceManager](self, "serviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inferredDeviceOwnerForPhotoLibrary:ignoreContactLinking:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Inferred device owner: %@", (uint8_t *)&v17, 0xCu);

  }
  if (v7)
  {
    peopleDomainBuildingHelper = self->_peopleDomainBuildingHelper;
    objc_msgSend(v7, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphPeopleDomainBuildingHelper insertedIdentifiedPersonForPersonLocalIdentifier:](peopleDomainBuildingHelper, "insertedIdentifiedPersonForPersonLocalIdentifier:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NSObject personNode](v12, "personNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4B218], "personWithPHPerson:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphBuilder insertPersonNodeForPerson:](self, "insertPersonNodeForPerson:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "Inferred Me: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  else
  {
    -[PGGraphBuilder graph](self, "graph");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inferMeNodeFromSocialGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Inferred Me (fallback): %@", (uint8_t *)&v17, 0xCu);
    }
  }

  if (v13)
    -[PGGraphBuilder insertInferredEdgeFromMeNode:toInferredPersonNode:](self, "insertInferredEdgeFromMeNode:toInferredPersonNode:", v4, v13);

}

- (void)insertInferredEdgeFromMeNode:(id)a3 toInferredPersonNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphInferredPersonEdge filter](PGGraphInferredPersonEdge, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "count"))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    if (!v15)
      goto LABEL_15;
LABEL_11:
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v19;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "Inferring Me to %@", (uint8_t *)&v21, 0xCu);

    }
    v20 = -[PGGraphInferredPersonEdge initFromPersonNode:toInferredPersonNode:]([PGGraphInferredPersonEdge alloc], "initFromPersonNode:toInferredPersonNode:", v6, v7);
    -[NSObject addEdge:](v15, "addEdge:", v20);
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v15);

    goto LABEL_14;
  }
  if ((unint64_t)objc_msgSend(v10, "count") <= 1)
  {
    objc_msgSend(v10, "anyEdge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "targetNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "identifier");
    v14 = objc_msgSend(v7, "identifier");

    if (v13 == v14)
    {
      -[PGGraphBuilder loggingConnection](self, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Inferred Me is up-to-date (%@)", (uint8_t *)&v21, 0xCu);

      }
LABEL_14:

      goto LABEL_15;
    }
  }
  -[PGGraphBuilder loggingConnection](self, "loggingConnection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 67109120;
    LODWORD(v22) = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_DEFAULT, "Deleting out-of-date Me inferred edge (found %d)", (uint8_t *)&v21, 8u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  -[NSObject removeEdges:](v15, "removeEdges:", v10);
  if (v15)
    goto LABEL_11;
LABEL_15:

}

void __105__PGGraphBuilder_People__insertPeopleWithClueCollection_fromMomentNode_addressNodes_isNearPeopleAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "includeMergeCandidates");
  objc_msgSend(v3, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138478083;
      v28 = v9;
      v29 = 2113;
      v30 = v5;
      v10 = "Skipping ingest of %{private}@ (%{private}@): personLocalIdentifier should not be nil";
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_30;
  }
  if (objc_msgSend(v5, "isHidden"))
  {
    objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138478083;
      v28 = v9;
      v29 = 2113;
      v30 = v5;
      v10 = "Skipping ingest of %{private}@ (%{private}@) because person is hidden";
LABEL_8:
      _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v27, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v11 = objc_msgSend(v3, "numberOfFaces");
  objc_msgSend(v3, "score");
  v13 = v12;
  if ((objc_msgSend(v5, "isMe") & 1) != 0 || objc_msgSend(v5, "isSamePersonAs:", *(_QWORD *)(a1 + 40)))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "length") && objc_msgSend(v7, "length"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v7);
      objc_msgSend(*(id *)(a1 + 32), "updateMeNode:withPropertiesFromPerson:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v5);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
    objc_msgSend(v5, "CNIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "CNIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18) ^ 1;

    v20 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "insertPersonNodeForPerson:", v5);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "insertPresentEdgeFromPersonNode:toMomentNode:numberOfAssetsWithPerson:importance:includeMergeCandidates:", v20, *(_QWORD *)(a1 + 48), v11, v4, v13);

  if (v19)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      objc_msgSend(v5, "locationsByAddressTypes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        objc_msgSend(*(id *)(a1 + 32), "insertHomeWorkNodeForPerson:personNode:fromAddressNodes:", v5, v20, *(_QWORD *)(a1 + 56));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        if (*(_BYTE *)(v24 + 24))
          v25 = 0;
        else
          v25 = v23 == 0;
        v26 = !v25;
        *(_BYTE *)(v24 + 24) = v26;

      }
    }
  }
  if (v20)
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v20);

LABEL_30:
}

void __82__PGGraphBuilder_People__insertHomeWorkNodeForPerson_personNode_fromAddressNodes___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  const __CFString *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "coordinate", (_QWORD)v28);
        if (+[PGLocationUtility coordinate:isCloseToCoordinate:threshold:](PGLocationUtility, "coordinate:isCloseToCoordinate:threshold:", *(double *)(a1 + 64), *(double *)(a1 + 72), v13, v14, 150.0))
        {
          v15 = objc_msgSend(v7, "unsignedIntegerValue");
          v16 = CFSTR("Work");
          if (!v15)
            v16 = CFSTR("Home");
          v17 = *(void **)(a1 + 40);
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          v32 = CFSTR("id");
          v19 = (void *)MEMORY[0x1E0CB37E8];
          v20 = v16;
          objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v17, "identifier"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addUniqueNodeWithLabel:domain:properties:didCreate:", v20, 202, v22, 0);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v25 = *(void **)(v24 + 40);
          *(_QWORD *)(v24 + 40) = v23;

          v26 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("IS_OWNED_BY"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), 202, 0);
          v27 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("IS_HOME_WORK"), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 202, 0);
          *a4 = 1;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

}

void __84__PGGraphBuilder_People__addStorytellingRelationshipsToMeNode_relationshipByPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  PGGraphStorytellingRelationshipEdge *v14;
  PGGraphStorytellingRelationshipEdge *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[PGGraphBuilder expandedRelationshipLabelsForRelationship:](PGGraphBuilder, "expandedRelationshipLabelsForRelationship:", objc_msgSend(v6, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v7;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = [PGGraphStorytellingRelationshipEdge alloc];
          v15 = -[PGGraphStorytellingRelationshipEdge initWithRelationship:fromMeNode:toPersonNode:](v14, "initWithRelationship:fromMeNode:toPersonNode:", v13, *(_QWORD *)(a1 + 40), v5, (_QWORD)v18);
          objc_msgSend(*(id *)(a1 + 48), "addEdge:", v15);

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v6, "unsignedIntegerValue");
      objc_msgSend(v5, "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "No storytelling labels for relationship %lu for person %@", buf, 0x16u);

    }
  }

}

void __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PGGraphStorytellingRelationshipEdge *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "collection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__63828;
  v32 = __Block_byref_object_dispose__63829;
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  objc_msgSend(v15, "relationshipInEdges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_178;
  v23[3] = &unk_1E8434C20;
  v24 = *(id *)(a1 + 32);
  v25 = v27;
  v26 = &v28;
  objc_msgSend(v4, "enumerateEdgesUsingBlock:", v23);

  objc_msgSend(v15, "storytellingRelationshipEdges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "labels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v29[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v29[5]);
  objc_msgSend(v8, "minusSet:", v6);
  if (objc_msgSend(v7, "count"))
  {
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_2;
    v20[3] = &unk_1E8434C48;
    v21 = v7;
    v22 = *(id *)(a1 + 40);
    objc_msgSend(v14, "enumerateEdgesUsingBlock:", v20);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = -[PGGraphStorytellingRelationshipEdge initWithRelationship:fromMeNode:toPersonNode:]([PGGraphStorytellingRelationshipEdge alloc], "initWithRelationship:fromMeNode:toPersonNode:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), *(_QWORD *)(a1 + 32), v3);
        objc_msgSend(*(id *)(a1 + 40), "addEdge:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
    }
    while (v10);
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v28, 8);

}

void __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_178(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "identifier");
  v5 = objc_msgSend(*(id *)(a1 + 32), "identifier");

  if (v4 == v5)
  {
    objc_msgSend(v16, "confidence");
    if (v6 <= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(v16, "confidence");
      if (v13 == *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(v16, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

      }
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v16, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithObject:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend(v16, "confidence");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;
    }
  }

}

void __96__PGGraphBuilder_People__insertStorytellingRelationshipsWithRelationshipsForPersonNodes_meNode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "removeEdge:", v6);

}

+ (id)expandedRelationshipLabelsForRelationship:(unint64_t)a3
{
  id v4;
  void *v5;
  __CFString **v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = v4;
  v6 = kPGGraphEdgePeopleFamily;
  switch(a3)
  {
    case 1uLL:
      v6 = kPGGraphEdgePeopleCoworker;
      goto LABEL_15;
    case 2uLL:
    case 3uLL:
      v6 = kPGGraphEdgePeopleFriend;
      goto LABEL_15;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      v7 = CFSTR("DAUGHTER");
      goto LABEL_6;
    case 7uLL:
      v7 = CFSTR("SON");
LABEL_6:
      objc_msgSend(v4, "addObject:", v7);
LABEL_7:
      v8 = CFSTR("CHILD");
      goto LABEL_14;
    case 8uLL:
      goto LABEL_11;
    case 9uLL:
      v9 = CFSTR("MOTHER");
      goto LABEL_10;
    case 0xAuLL:
      v9 = CFSTR("FATHER");
LABEL_10:
      objc_msgSend(v4, "addObject:", v9);
LABEL_11:
      v8 = CFSTR("PARENT");
      goto LABEL_14;
    case 0xBuLL:
      v8 = CFSTR("BROTHER");
      goto LABEL_14;
    case 0xCuLL:
      v8 = CFSTR("SISTER");
LABEL_14:
      objc_msgSend(v5, "addObject:", v8);
      v6 = kPGGraphEdgePeopleFamily;
      goto LABEL_15;
    case 0xDuLL:
      v6 = kPGGraphEdgePeoplePartner;
      goto LABEL_15;
    case 0x11uLL:
      v6 = kPGGraphEdgePeopleHouseholdMember;
LABEL_15:
      objc_msgSend(v5, "addObject:", *v6);
      break;
    default:
      return v5;
  }
  return v5;
}

+ (id)reducedRelationshipLabelForRelationshipLabels:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    v10[0] = CFSTR("SISTER");
    v10[1] = CFSTR("BROTHER");
    v10[2] = CFSTR("MOTHER");
    v10[3] = CFSTR("FATHER");
    v10[4] = CFSTR("DAUGHTER");
    v10[5] = CFSTR("SON");
    v10[6] = CFSTR("PARTNER");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "intersectSet:", v3);
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "anyObject");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v3, "containsObject:", CFSTR("PARENT")))
      {
        v4 = CFSTR("PARENT");
      }
      else if (objc_msgSend(v3, "containsObject:", CFSTR("CHILD")))
      {
        v4 = CFSTR("CHILD");
      }
      else
      {
        v4 = CFSTR("FAMILY");
      }
      v8 = v4;
    }

  }
  else
  {
    objc_msgSend(v3, "anyObject");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)insertDateNodeHierarchyWithDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PGGraphDateNode *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  PGGraphCalendarUnitEdge *v17;
  PGGraphCalendarUnitEdge *v18;
  PGGraphCalendarUnitEdge *v19;
  PGGraphCalendarUnitEdge *v20;
  PGGraphCalendarUnitEdge *v21;
  PGGraphCalendarUnitEdge *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v4, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:inTimeZone:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraph dateNodeNameWithLocalDate:](self->_graph, "dateNodeNameWithLocalDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v9 = -[PGGraphDateNode initWithName:]([PGGraphDateNode alloc], "initWithName:", v8);
  -[MAGraph addUniqueNode:didInsert:](self->_graph, "addUniqueNode:didInsert:", v9, &v34);
  if (v34)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v11 = objc_msgSend(v4, "day");
    v12 = objc_msgSend(v4, "month");
    v13 = objc_msgSend(v4, "year");
    v14 = +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", v12, v11);
    -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 1, v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 2, v12);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 3, v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 4, v13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 6, objc_msgSend(v4, "weekOfYear"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 5, objc_msgSend(v4, "weekOfMonth"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]([PGGraphCalendarUnitEdge alloc], "initWithCalendarUnit:fromDateNode:toCalendarUnitNode:", 4, v9, v30);
      objc_msgSend(v10, "addEdge:", v17);

      v18 = -[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]([PGGraphCalendarUnitEdge alloc], "initWithCalendarUnit:fromDateNode:toCalendarUnitNode:", 6, v9, v15);
      objc_msgSend(v10, "addEdge:", v18);

      v19 = -[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]([PGGraphCalendarUnitEdge alloc], "initWithCalendarUnit:fromDateNode:toCalendarUnitNode:", 5, v9, v16);
      objc_msgSend(v10, "addEdge:", v19);

      -[PGGraphTimeDomainBuildingHelper calendarUnitNodeForCalendarUnit:value:](self->_timeDomainBuildingHelper, "calendarUnitNodeForCalendarUnit:value:", 4, v13 + 1);
    }
    v20 = -[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]([PGGraphCalendarUnitEdge alloc], "initWithCalendarUnit:fromDateNode:toCalendarUnitNode:", 1, v9, v31);
    objc_msgSend(v10, "addEdge:", v20);

    v21 = -[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]([PGGraphCalendarUnitEdge alloc], "initWithCalendarUnit:fromDateNode:toCalendarUnitNode:", 2, v9, v33);
    objc_msgSend(v10, "addEdge:", v21);

    v22 = -[PGGraphCalendarUnitEdge initWithCalendarUnit:fromDateNode:toCalendarUnitNode:]([PGGraphCalendarUnitEdge alloc], "initWithCalendarUnit:fromDateNode:toCalendarUnitNode:", 3, v9, v32);
    objc_msgSend(v10, "addEdge:", v22);

    objc_msgSend(MEMORY[0x1E0D4B130], "seasonNameForDateComponents:locale:", v4, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[PGGraphTimeDomainBuildingHelper seasonNodeForSeasonName:](self->_timeDomainBuildingHelper, "seasonNodeForSeasonName:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PGGraphSeasonEdge initFromDateNode:toSeasonNode:]([PGGraphSeasonEdge alloc], "initFromDateNode:toSeasonNode:", v9, v24);
      objc_msgSend(v10, "addEdge:", v25);

    }
    v26 = objc_msgSend(MEMORY[0x1E0D4B130], "dayOfWeekFromDate:", v7);
    if (v26 != -1)
    {
      -[PGGraphTimeDomainBuildingHelper dayOfWeekNodeForDayOfWeek:](self->_timeDomainBuildingHelper, "dayOfWeekNodeForDayOfWeek:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PGGraphDayOfWeekEdge initFromDateNode:toDayOfWeekNode:]([PGGraphDayOfWeekEdge alloc], "initFromDateNode:toDayOfWeekNode:", v9, v27);
      objc_msgSend(v10, "addEdge:", v28);

    }
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v10);

  }
  return v9;
}

- (id)insertTimeNodesWithDateComponents:(id)a3 fromEventNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[PGGraphBuilder insertDateNodeHierarchyWithDateComponents:](self, "insertDateNodeHierarchyWithDateComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("DATE"), v6, v8, 400, 0);
  v10 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v7, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:inTimeZone:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D4B148], "isWeekendDate:", v12))
    v13 = CFSTR("Weekend");
  else
    v13 = CFSTR("Weekday");
  -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", v13, 400, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGMutableGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:](self->_graph, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PARTOFWEEK"), v6, v14, 400, 0);

  return v8;
}

- (void)enumerateDateComponentsBetweenLocalStartDate:(id)a3 andLocalEndDate:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _BYTE *);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _BYTE *))a5;
  objc_msgSend(MEMORY[0x1E0D4B130], "componentsFromDate:inTimeZone:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "componentsFromDate:inTimeZone:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", 0);
  objc_msgSend(v11, "setTimeZone:", 0);
  v18 = 0;
  v9[2](v9, v10, &v18);
  v12 = v7;
  if ((NSDateComponentsEqualToDateComponents() & 1) != 0 || v18)
  {
    v13 = v12;
  }
  else
  {
    v13 = v12;
    do
    {
      v14 = v10;
      v15 = v13;
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v13);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D4B130], "componentsFromDate:inTimeZone:", v13, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setTimeZone:", 0);
      v16 = NSDateComponentsEqualToDateComponents();
      if (v16 && objc_msgSend(v11, "hour") < 5)
        break;
      v9[2](v9, v10, &v18);
      v17 = v18 ? 1 : v16;
    }
    while (v17 != 1);
  }

}

- (id)insertMonthDayNodeForMonth:(int64_t)a3 day:(int64_t)a4
{
  PGGraphCalendarUnitNode *v5;

  v5 = -[PGGraphCalendarUnitNode initWithCalendarUnit:value:]([PGGraphCalendarUnitNode alloc], "initWithCalendarUnit:value:", 3, +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", a3, a4));
  -[MAGraph addUniqueNode:didInsert:](self->_graph, "addUniqueNode:didInsert:", v5, 0);
  return v5;
}

- (id)insertOverTheYearsNode
{
  return -[PGMutableGraph addUniqueNodeWithLabel:domain:properties:didCreate:](self->_graph, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("OverTheYears"), 402, 0, 0);
}

- (id)insertDateNodesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "localStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder insertDateNodesFromLocalStartDate:toLocalEndDate:fromEventNode:](self, "insertDateNodesFromLocalStartDate:toLocalEndDate:fromEventNode:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)insertDateNodesFromLocalStartDate:(id)a3 toLocalEndDate:(id)a4 fromEventNode:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__PGGraphBuilder_Time__insertDateNodesFromLocalStartDate_toLocalEndDate_fromEventNode___block_invoke;
  v18[3] = &unk_1E8435110;
  v18[4] = self;
  v19 = v8;
  v13 = v12;
  v20 = v13;
  v14 = v8;
  -[PGGraphBuilder enumerateDateComponentsBetweenLocalStartDate:andLocalEndDate:usingBlock:](self, "enumerateDateComponentsBetweenLocalStartDate:andLocalEndDate:usingBlock:", v11, v10, v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

- (id)insertDateNodesFromEventNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder insertDateNodesFromLocalStartDate:toLocalEndDate:fromEventNode:](self, "insertDateNodesFromLocalStartDate:toLocalEndDate:fromEventNode:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)insertPartOfDayNodesWithClueCollection:(id)a3 fromMomentNode:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PGGraphBuilder_Time__insertPartOfDayNodesWithClueCollection_fromMomentNode___block_invoke;
  v15[3] = &unk_1E8435138;
  v15[4] = self;
  v16 = v6;
  v10 = v9;
  v17 = v10;
  v11 = v6;
  objc_msgSend(v8, "enumerateTimeOfDayClues:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

- (id)insertPartOfDayNodeWithPartOfDayName:(id)a3 fromMomentNode:(id)a4 ratio:(double)a5
{
  id v8;
  unint64_t v9;
  PGGraphPartOfDayNode *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  v9 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:](PGGraphPartOfDayNode, "partOfDayForPartOfDayName:", a3);
  if (v9 == 1)
  {
    v10 = 0;
  }
  else
  {
    v11 = v9;
    v12 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    +[PGGraphPartOfDayNodeCollection partOfDayNodeForPartOfDay:inGraph:](PGGraphPartOfDayNodeCollection, "partOfDayNodeForPartOfDay:inGraph:", v11, self->_graph);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "anyNode");
      v10 = (PGGraphPartOfDayNode *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPartOfDayEdgeCollection, "edgesFromNodes:toNodes:", v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = -[PGGraphPartOfDayNode initWithPartOfDay:]([PGGraphPartOfDayNode alloc], "initWithPartOfDay:", v11);
      objc_msgSend(v12, "addNode:", v10);
      v15 = 0;
    }
    if (!objc_msgSend(v15, "count"))
    {
      v16 = -[PGGraphPartOfDayEdge initFromMomentNode:toPartOfDayNode:ratio:]([PGGraphPartOfDayEdge alloc], "initFromMomentNode:toPartOfDayNode:ratio:", v8, v10, a5);
      objc_msgSend(v12, "addEdge:", v16);

    }
    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v12);

  }
  return v10;
}

void __78__PGGraphBuilder_Time__insertPartOfDayNodesWithClueCollection_fromMomentNode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confidence");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "insertPartOfDayNodeWithPartOfDayName:fromMomentNode:ratio:", v7, *(_QWORD *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void __87__PGGraphBuilder_Time__insertDateNodesFromLocalStartDate_toLocalEndDate_fromEventNode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "insertTimeNodesWithDateComponents:fromEventNode:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

- (void)insertMeAsAuthor:(id)a3 forMomentNode:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0D42A30];
  v7 = a4;
  v8 = a3;
  v10 = objc_alloc_init(v6);
  v9 = -[PGGraphAuthorEdge initFromPersonNode:toMomentNode:]([PGGraphAuthorEdge alloc], "initFromPersonNode:toMomentNode:", v8, v7);

  objc_msgSend(v10, "addEdge:", v9);
  -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v10);

}

- (void)insertShareParticipantsAsAuthors:(id)a3 forMomentNode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[PGGraphPeopleDomainBuildingHelper cachedAuthorNodeForShareParticipant:](self->_peopleDomainBuildingHelper, "cachedAuthorNodeForShareParticipant:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = -[PGGraphAuthorEdge initFromPersonNode:toMomentNode:]([PGGraphAuthorEdge alloc], "initFromPersonNode:toMomentNode:", v15, v7);
            -[NSObject addEdge:](v8, "addEdge:", v16);
          }
          else
          {
            -[PGGraphBuilder loggingConnection](self, "loggingConnection");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "localIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v26 = v17;
              _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "No person node for share participant identifier: %@", buf, 0xCu);

            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    -[MAGraph executeGraphChangeRequest:](self->_graph, "executeGraphChangeRequest:", v8);
    v6 = v19;
  }
  else
  {
    -[PGGraphBuilder loggingConnection](self, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "No share participants for moment with identifier: %@", buf, 0xCu);

    }
  }

}

@end
