@implementation PGExcitingMomentsMemoryGenerator

- (PGExcitingMomentsMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGExcitingMomentsMemoryGenerator *v3;
  PGExcitingMomentsMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  uint64_t v7;
  PGOverTheYearsMemoryConfiguration *overTheYearsConfiguration;
  uint64_t v9;
  PGFeaturedTimePeriodMemoryConfiguration *featuredYearConfiguration;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGExcitingMomentsMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v12, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setFilterUninterestingForMemories:](v4->_momentRequirements, "setFilterUninterestingForMemories:", 1);
    -[PGMemoryMomentRequirements setMinimumNumberOfRelevantAssets:](v4->_momentRequirements, "setMinimumNumberOfRelevantAssets:", 1);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v4->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    +[PGOverTheYearsMemoryConfiguration strictDefaultOverTheYearsMemoryConfiguration](PGOverTheYearsMemoryConfiguration, "strictDefaultOverTheYearsMemoryConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    overTheYearsConfiguration = v4->_overTheYearsConfiguration;
    v4->_overTheYearsConfiguration = (PGOverTheYearsMemoryConfiguration *)v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_overTheYearsConfiguration, "setMinimumNumberOfRelevantAssets:", 15);
    +[PGFeaturedTimePeriodMemoryConfiguration strictDefaultFeaturedYearMemoryConfiguration](PGFeaturedTimePeriodMemoryConfiguration, "strictDefaultFeaturedYearMemoryConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    featuredYearConfiguration = v4->_featuredYearConfiguration;
    v4->_featuredYearConfiguration = (PGFeaturedTimePeriodMemoryConfiguration *)v9;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfRelevantAssets:](v4->_featuredYearConfiguration, "setMinimumNumberOfRelevantAssets:", 15);
    v4->_intersectRelevantAssetsForFeatures = 1;
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 26;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return 2005;
  v3 = a3;
  if (a3 == 3)
    return 2006;
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = v3;
    _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);

  }
  return 0;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5;
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
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabel:inGraph:](PGGraphAudioFeatureNodeCollection, "audioFeatureNodesForLabel:inGraph:", CFSTR("ExcitementAudio"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphMomentNode featureOfMoment](PGGraphMomentNode, "featureOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chain:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v7, v13, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transposed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __90__PGExcitingMomentsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
    v16[3] = &unk_1E8431E30;
    v17 = v6;
    v18 = v5;
    objc_msgSend(v15, "enumerateTargetsBySourceWithBlock:", v16);

  }
}

- (unint64_t)durationForCuration
{
  return 22;
}

- (unint64_t)durationForExtendedCuration
{
  return 10;
}

- (id)curationOptionsWithRequiredAssetUUIDs:(id)a3 eligibleAssetUUIDs:(id)a4 triggeredMemory:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGExcitingMomentsMemoryGenerator;
  -[PGMemoryGenerator curationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:triggeredMemory:](&v7, sel_curationOptionsWithRequiredAssetUUIDs_eligibleAssetUUIDs_triggeredMemory_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfItems:", 15);
  objc_msgSend(v5, "setFailIfMinimumDurationNotReached:", 1);
  return v5;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PGExcitingMomentsMemoryGenerator;
  v5 = a3;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v11, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memoryFeatureNodes", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReferencePersonLocalIdentifiers:", v9);

  objc_msgSend(v6, "setMinimumNumberOfReferencePersons:", 0);
  return v6;
}

- (id)relevantFeederForTriggeredMemory:(id)a3 inGraph:(id)a4 allowGuestAsset:(BOOL)a5 progressReporter:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "memoryFeatureNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v8, "memoryMomentNodes");
    v12 = objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "allRelevantAssetLocalIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "mutableCopy");

      +[PGGraphNodeCollection subsetInCollection:](PGGraphAudioFeatureNodeCollection, "subsetInCollection:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count") == 1)
      {
        +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphMomentFeaturesEdgeCollection, "edgesFromNodes:toNodes:", v12, v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject count](v17, "count"))
        {
          v50 = v16;
          -[NSObject allRelevantAssetLocalIdentifiers](v17, "allRelevantAssetLocalIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject intersectSet:](v15, "intersectSet:", v18);

          if (-[NSObject count](v15, "count"))
          {
            v42 = v17;
            v44 = v13;
            v45 = v12;
            v46 = v11;
            v47 = v10;
            v48 = v9;
            v49 = v8;
            -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "curationManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "defaultAssetFetchOptionsForMemories");
            v21 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)MEMORY[0x1E0CD1390];
            v43 = v15;
            -[NSObject allObjects](v15, "allObjects");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (void *)v21;
            objc_msgSend(v22, "fetchAssetsWithLocalIdentifiers:options:", v23, v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v26 = objc_alloc_init(MEMORY[0x1E0D77E18]);
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v27 = v24;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v29; ++i)
                {
                  if (*(_QWORD *)v53 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                  objc_msgSend(v26, "curationModelForAsset:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "isInterestingLivePhotoWithAsset:", v32);

                  if (v34)
                  {
                    objc_msgSend(v32, "objectID");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "addObject:", v35);

                  }
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
              }
              while (v29);
            }

            if (objc_msgSend(v25, "count"))
            {
              v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD1580]), "initWithExistingFetchResult:filteredObjectIDs:", v27, v25);
              -[PGMemoryGenerator memoryCurationSession](self, "memoryCurationSession");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v48;
              +[PGMemoryGenerationHelper feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:](PGMemoryGenerationHelper, "feederForMemoriesWithAssetFetchResult:memoryCurationSession:graph:", v36, v37, v48);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              v8 = v49;
              v11 = v46;
              v10 = v47;
            }
            else
            {
              -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
              v36 = objc_claimAutoreleasedReturnValue();
              v9 = v48;
              v11 = v46;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[PGExcitingMomentsMemoryGenerator] No assets with good enough autoplay suggestion score found in relevant assets for exciting moments memory", buf, 2u);
              }
              v38 = 0;
              v8 = v49;
              v10 = v47;
            }
            v17 = v42;

            v13 = v44;
            v12 = v45;
            v15 = v43;
          }
          else
          {
            -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
            v40 = objc_claimAutoreleasedReturnValue();
            v51 = v40;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA237000, v40, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] No intersecting relevantAssetLocalIdentifiers found for exciting moments memory", buf, 2u);
            }
            v38 = 0;
          }
          v16 = v50;
        }
        else
        {
          -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
          v39 = objc_claimAutoreleasedReturnValue();
          v51 = v39;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v39, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] No excitementAudioMomentFeaturesEdges found", buf, 2u);
          }
          v38 = 0;
        }

      }
      else
      {
        -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v58 = objc_msgSend(v16, "count");
          _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] One excitement audio node expected, found %d", buf, 8u);
        }
        v38 = 0;
      }

    }
    else
    {
      -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] No personMomentFeaturesEdges found", buf, 2u);
      }
      v38 = 0;
    }

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v58 = objc_msgSend(v11, "count");
      _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] One person node expected, found %d", buf, 8u);
    }
    v38 = 0;
  }

  return v38;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  PGExcitingMomentsMemoryTitleGenerator *v14;
  void *v15;
  void *v16;
  PGExcitingMomentsMemoryTitleGenerator *v17;
  void *v18;
  NSObject *v19;
  _DWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  objc_msgSend(v10, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") == 1)
  {
    v14 = [PGExcitingMomentsMemoryTitleGenerator alloc];
    objc_msgSend(v10, "memoryMomentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "temporarySet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PGExcitingMomentsMemoryTitleGenerator initWithMomentNodes:type:titleGenerationContext:](v14, "initWithMomentNodes:type:titleGenerationContext:", v16, 0, v11);

    +[PGGraphNodeCollection subsetInCollection:](PGGraphYearNodeCollection, "subsetInCollection:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count") == 1)
      -[PGTitleGenerator setFeaturedYearNodes:](v17, "setFeaturedYearNodes:", v18);
    -[PGExcitingMomentsMemoryTitleGenerator setPersonNodeAsCollection:](v17, "setPersonNodeAsCollection:", v13);

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109120;
      v21[1] = objc_msgSend(v13, "count");
      _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "[PGExcitingMomentsMemoryGenerator] One person node expected, found %d", (uint8_t *)v21, 8u);
    }

    v17 = 0;
  }

  return v17;
}

- (BOOL)requireSceneProcessingMeetsThresholdOverTime
{
  return self->_requireSceneProcessingMeetsThresholdOverTime;
}

- (void)setRequireSceneProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireSceneProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (id)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (id)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_momentRequirements, 0);
}

void __90__PGExcitingMomentsMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "featureNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureNodeCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "collectionByFormingUnionWith:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
