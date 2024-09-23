@implementation PGSeasonMemoryGenerator

- (PGSeasonMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  PGSeasonMemoryGenerator *v3;
  PGSeasonMemoryGenerator *v4;
  PGMemoryMomentRequirements *v5;
  PGMemoryMomentRequirements *momentRequirements;
  PGFeaturedTimePeriodMemoryConfiguration *v7;
  PGFeaturedTimePeriodMemoryConfiguration *featuredSeasonConfiguration;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGSeasonMemoryGenerator;
  v3 = -[PGMemoryGenerator initWithMemoryGenerationContext:](&v10, sel_initWithMemoryGenerationContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requireSceneProcessingMeetsThresholdOverTime = 1;
    v3->_requireFaceProcessingMeetsThresholdOverTime = 0;
    v5 = objc_alloc_init(PGMemoryMomentRequirements);
    momentRequirements = v4->_momentRequirements;
    v4->_momentRequirements = v5;

    -[PGMemoryMomentRequirements setFilterUninterestingForMemories:](v4->_momentRequirements, "setFilterUninterestingForMemories:", 1);
    -[PGMemoryMomentRequirements setMinimumNumberOfPersons:](v4->_momentRequirements, "setMinimumNumberOfPersons:", 1);
    -[PGMemoryMomentRequirements setAboveContentScoreThreshold:](v4->_momentRequirements, "setAboveContentScoreThreshold:", 0.5);
    -[PGMemoryMomentRequirements setFilterMomentsWithNotEnoughScenesProcessed:](v4->_momentRequirements, "setFilterMomentsWithNotEnoughScenesProcessed:", 1);
    v7 = objc_alloc_init(PGFeaturedTimePeriodMemoryConfiguration);
    featuredSeasonConfiguration = v4->_featuredSeasonConfiguration;
    v4->_featuredSeasonConfiguration = v7;

    -[PGOverTimeMemoryConfiguration setMinimumNumberOfMoments:](v4->_featuredSeasonConfiguration, "setMinimumNumberOfMoments:", 6);
    -[PGOverTimeMemoryConfiguration setMinimumNumberOfAssetsInExtendedCuration:](v4->_featuredSeasonConfiguration, "setMinimumNumberOfAssetsInExtendedCuration:", 13);
    -[PGOverTimeMemoryConfiguration setAboveMomentAverageContentScoreThreshold:](v4->_featuredSeasonConfiguration, "setAboveMomentAverageContentScoreThreshold:", 0.5);
  }
  return v4;
}

- (unint64_t)memoryCategory
{
  return 21;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
    return 14001;
  v4 = a3;
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
    v11 = v4;
    _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);

  }
  return 0;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, PGGraphFeatureNodeCollection *, _BYTE *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGGraphFeatureNodeCollection *v16;
  char v17;

  v5 = (void (**)(id, void *, PGGraphFeatureNodeCollection *, _BYTE *))a4;
  v6 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeOrWorkNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addressNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "momentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionBySubtracting:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeaningNodeCollection, "nodesInGraph:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "momentNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionByFormingUnionWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v16 = -[MAElementCollection initWithGraph:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:", v6);

  v5[2](v5, v15, v16, &v17);
}

- (unint64_t)durationForCuration
{
  return 23;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGSeasonMemoryGenerator;
  -[PGMemoryGenerator keyAssetCurationOptionsWithTriggeredMemory:inGraph:](&v6, sel_keyAssetCurationOptionsWithTriggeredMemory_inGraph_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefilterAssetsWithFacesThreshold:", 2.22507386e-308);
  return v4;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGSeasonMemoryTitleGenerator *v16;
  void *v17;
  void *v18;
  PGSeasonMemoryTitleGenerator *v19;
  NSObject *v20;
  _DWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a7;
  objc_msgSend(v10, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphSeasonNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "anyNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = [PGSeasonMemoryTitleGenerator alloc];
    objc_msgSend(v10, "memoryMomentNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PGSeasonMemoryTitleGenerator initWithMomentNodes:seasonName:titleGenerationContext:](v16, "initWithMomentNodes:seasonName:titleGenerationContext:", v18, v15, v11);

  }
  else
  {
    -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 67109120;
      v22[1] = objc_msgSend(v13, "count");
      _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "[PGSeasonMemoryGenerator] One season node expected, found %d", (uint8_t *)v22, 8u);
    }

    v19 = 0;
  }

  return v19;
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

- (id)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentRequirements, 0);
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
}

+ (void)enumerateMomentNodesBySeasonInYearFromMomentNodes:(id)a3 loggingConnection:(id)a4 usingBlock:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[8];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0D4B130], "currentLocaleSupportsSeasons") & 1) != 0)
  {
    objc_msgSend(v7, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphMomentNode dateOfMoment](PGGraphMomentNode, "dateOfMoment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    +[PGGraphDateNode seasonOfDate](PGGraphDateNode, "seasonOfDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chain:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v7, v15, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke;
    v27[3] = &unk_1E8434648;
    v19 = v17;
    v28 = v19;
    objc_msgSend(v7, "enumerateUniversalStartDatesUsingBlock:", v27);
    objc_msgSend(v16, "transposed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke_2;
    v23[3] = &unk_1E8431CF0;
    v24 = v19;
    v25 = v10;
    v26 = v9;
    v21 = v10;
    v22 = v19;
    objc_msgSend(v20, "enumerateTargetsBySourceWithBlock:", v23);

  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "[PGSeasonMemoryGenerator] Current locale does not support seasons, not generating season based memories.", buf, 2u);
  }

}

void __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

}

void __106__PGSeasonMemoryGenerator_enumerateMomentNodesBySeasonInYearFromMomentNodes_loggingConnection_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  PGGraphMomentNodeCollection *v34;
  uint64_t v35;
  void *v36;
  PGGraphMomentNodeCollection *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  PGGraphMomentNodeCollection *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id obj;
  _BYTE *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v44 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v43 = v7;
  objc_msgSend(v7, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v60 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "keysSortedByValueUsingSelector:", sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  obj = v19;
  v50 = a4;
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v56;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        v25 = v22;
        if (*(_QWORD *)v56 != v23)
          objc_enumerationMutation(obj);
        if (*a4)
        {
          v19 = obj;
          goto LABEL_23;
        }
        v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        v27 = objc_msgSend(v26, "unsignedIntegerValue");
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v28;
        if (v25 && (objc_msgSend(v28, "timeIntervalSinceDate:", v25), v29 > 10368000.0))
        {
          objc_msgSend(v48, "addObject:", v18);
          v30 = objc_alloc_init(MEMORY[0x1E0D429B0]);

          v31 = v30;
          a4 = v50;
        }
        else
        {
          v31 = v18;
        }
        v18 = v31;
        objc_msgSend(v31, "addIdentifier:", v27);

      }
      v19 = obj;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (v21)
        continue;
      break;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_23:

  if (!*a4)
  {
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v48, "addObject:", v18);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v45 = v48;
    v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v47)
    {
      v46 = *(_QWORD *)v52;
LABEL_28:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(v45);
        if (*a4)
          break;
        v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v32);
        v34 = [PGGraphMomentNodeCollection alloc];
        v35 = *(_QWORD *)(a1 + 40);
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", objc_msgSend(v33, "firstElement"));
        v37 = -[MAElementCollection initWithGraph:elementIdentifiers:](v34, "initWithGraph:elementIdentifiers:", v35, v36);

        -[PGGraphMomentNodeCollection localStartDates](v37, "localStartDates");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "anyObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v39);
        if (objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v39) == 12)
          ++v40;
        v41 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMomentNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(a1 + 40), v33);
        +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", v40, *(_QWORD *)(a1 + 40));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        a4 = v50;
        if (v47 == ++v32)
        {
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          if (v47)
            goto LABEL_28;
          break;
        }
      }
    }

    v19 = obj;
  }

}

@end
