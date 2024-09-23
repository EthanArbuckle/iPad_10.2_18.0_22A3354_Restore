@implementation PGTextFeatureGenerator

- (PGTextFeatureGenerator)initWithMomentNodes:(id)a3 graph:(id)a4
{
  id v7;
  id v8;
  PGTextFeatureGenerator *v9;
  PGTextFeatureGenerator *v10;
  PGGraphLocationHelper *v11;
  PGGraphLocationHelper *locationHelper;
  uint64_t v13;
  uint64_t v14;
  NSMutableSet *momentIdentifiers;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableSet *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PGTextFeatureGenerator;
  v9 = -[PGTextFeatureGenerator init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentNodes, a3);
    v11 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v8);
    locationHelper = v10->_locationHelper;
    v10->_locationHelper = v11;

    v13 = objc_msgSend(v7, "count");
    v10->_numberOfMoments = v13;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    momentIdentifiers = v10->_momentIdentifiers;
    v10->_momentIdentifiers = (NSMutableSet *)v14;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v10->_numberOfAssets += objc_msgSend(v21, "numberOfAssets", (_QWORD)v25);
          v22 = v10->_momentIdentifiers;
          objc_msgSend(v21, "localIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v22, "addObject:", v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v18);
    }

    -[PGTextFeatureGenerator _resetProperties](v10, "_resetProperties");
  }

  return v10;
}

- (void)_resetProperties
{
  NSMapTable *v3;
  NSMapTable *numberOfAssetsBySceneNode;
  NSCountedSet *v5;
  NSCountedSet *sceneNodes;
  NSCountedSet *v7;
  NSCountedSet *personNodes;
  NSCountedSet *v9;
  NSCountedSet *roiNodes;
  NSCountedSet *v11;
  NSCountedSet *poiNodes;
  NSCountedSet *v13;
  NSCountedSet *meaningNodes;
  NSCountedSet *v15;
  NSCountedSet *districtNodes;
  NSCountedSet *v17;
  NSCountedSet *cityNodes;
  NSCountedSet *v19;
  NSCountedSet *stateNodes;
  NSCountedSet *v21;
  NSCountedSet *countryNodes;
  NSCountedSet *v23;
  NSCountedSet *areaNodes;
  NSCountedSet *v25;
  NSCountedSet *businessNodes;
  NSCountedSet *v27;
  NSCountedSet *businessCategoryNodes;
  NSCountedSet *v29;
  NSCountedSet *holidayNodes;
  NSCountedSet *v31;
  NSCountedSet *publicEventNodes;
  NSCountedSet *v33;
  NSCountedSet *publicEventPerformerNodes;
  NSCountedSet *v35;
  NSCountedSet *publicEventCategoryNodes;

  v3 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E0CB3748]);
  numberOfAssetsBySceneNode = self->_numberOfAssetsBySceneNode;
  self->_numberOfAssetsBySceneNode = v3;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  sceneNodes = self->_sceneNodes;
  self->_sceneNodes = v5;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v7 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  personNodes = self->_personNodes;
  self->_personNodes = v7;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v9 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  roiNodes = self->_roiNodes;
  self->_roiNodes = v9;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v11 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  poiNodes = self->_poiNodes;
  self->_poiNodes = v11;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v13 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  meaningNodes = self->_meaningNodes;
  self->_meaningNodes = v13;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v15 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  districtNodes = self->_districtNodes;
  self->_districtNodes = v15;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v17 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  cityNodes = self->_cityNodes;
  self->_cityNodes = v17;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v19 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  stateNodes = self->_stateNodes;
  self->_stateNodes = v19;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v21 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  countryNodes = self->_countryNodes;
  self->_countryNodes = v21;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v23 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  areaNodes = self->_areaNodes;
  self->_areaNodes = v23;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v25 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  businessNodes = self->_businessNodes;
  self->_businessNodes = v25;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v27 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  businessCategoryNodes = self->_businessCategoryNodes;
  self->_businessCategoryNodes = v27;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v29 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  holidayNodes = self->_holidayNodes;
  self->_holidayNodes = v29;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v31 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  publicEventNodes = self->_publicEventNodes;
  self->_publicEventNodes = v31;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v33 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  publicEventPerformerNodes = self->_publicEventPerformerNodes;
  self->_publicEventPerformerNodes = v33;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v35 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  publicEventCategoryNodes = self->_publicEventCategoryNodes;
  self->_publicEventCategoryNodes = v35;

}

- (unint64_t)maximumNumberOfTextFeaturesPerEvent
{
  return +[PGUserDefaults maximumNumberOfTextFeaturesPerEvent](PGUserDefaults, "maximumNumberOfTextFeaturesPerEvent");
}

- (BOOL)boundTextFeaturesPerEvent
{
  return +[PGUserDefaults boundTextFeaturesPerEvent](PGUserDefaults, "boundTextFeaturesPerEvent");
}

- (id)knowledgeFeatures
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSSet *momentNodes;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  NSSet *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_knowledgeOptionsByDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTextFeatureGenerator setOptionsByDomain:](self, "setOptionsByDomain:", v3);

  if (!self->_numberOfMoments)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v4, OS_LOG_TYPE_ERROR, "Cannot generate text features with no moment nodes", buf, 2u);
    }
    goto LABEL_18;
  }
  -[PGTextFeatureGenerator analyzeMomentNodes](self, "analyzeMomentNodes");
  -[PGTextFeatureGenerator generateTextFeatures](self, "generateTextFeatures");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v4, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      momentNodes = self->_momentNodes;
      *(_DWORD *)buf = 138477827;
      v22 = momentNodes;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "No text features were generated from moments %{private}@", buf, 0xCu);
    }

LABEL_18:
    v5 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v4;
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CD17E0], "pg_textFeatureForFeature:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9), (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[PGTextFeatureGenerator _resetProperties](self, "_resetProperties");
LABEL_19:

  return v5;
}

- (id)naturalLanguageFeatures
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSSet *momentNodes;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  NSSet *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_naturalLanguageOptionsByDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTextFeatureGenerator setOptionsByDomain:](self, "setOptionsByDomain:", v3);

  if (!self->_numberOfMoments)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_1CA237000, v4, OS_LOG_TYPE_ERROR, "Cannot generate natural language features with no moment nodes", (uint8_t *)&v17, 2u);
    }
    goto LABEL_11;
  }
  -[PGTextFeatureGenerator analyzeMomentNodes](self, "analyzeMomentNodes");
  -[PGTextFeatureGenerator generateTextFeatures](self, "generateTextFeatures");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject count](v4, "count");
  if (!v5)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      momentNodes = self->_momentNodes;
      v17 = 138477827;
      v18 = (uint64_t)momentNodes;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "No text features were generated from moments %{private}@", (uint8_t *)&v17, 0xCu);
    }

LABEL_11:
    v7 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  v6 = v5;
  -[PGTextFeatureGenerator bestTextFeaturesFromTextFeatures:](self, "bestTextFeaturesFromTextFeatures:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v7, "count");
    v11 = self->_momentNodes;
    v17 = 134218498;
    v18 = v10;
    v19 = 2048;
    v20 = v6;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "%lu out of %lu text teatures are saved for moments %@", (uint8_t *)&v17, 0x20u);
  }

  -[PGTextFeatureGenerator _resetProperties](self, "_resetProperties");
LABEL_12:

  return v7;
}

- (void)analyzeMomentNodes
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSSet *obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_momentNodes;
  v30 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v50;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v50 != v29)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v3);
        v48[0] = MEMORY[0x1E0C809B0];
        v5 = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke;
        v48[3] = &unk_1E8433BB8;
        v48[4] = self;
        objc_msgSend(v4, "enumerateSceneEdgesAndNodesUsingBlock:", v48);
        v47[0] = v5;
        v47[1] = 3221225472;
        v47[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_2;
        v47[3] = &unk_1E8434020;
        v47[4] = self;
        objc_msgSend(v4, "enumeratePersonNodesUsingBlock:", v47);
        v46[0] = v5;
        v46[1] = 3221225472;
        v46[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_3;
        v46[3] = &unk_1E84320C0;
        v46[4] = self;
        objc_msgSend(v4, "enumerateROINodesUsingBlock:", v46);
        v45[0] = v5;
        v6 = v5;
        v45[1] = 3221225472;
        v45[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_4;
        v45[3] = &unk_1E8432098;
        v45[4] = self;
        objc_msgSend(v4, "enumeratePOINodesUsingBlock:", v45);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Entertainment"), CFSTR("Activity"), 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v6;
        v42[1] = 3221225472;
        v42[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_5;
        v42[3] = &unk_1E842D7C0;
        v43 = v8;
        v44 = v7;
        v31 = v7;
        v32 = v8;
        objc_msgSend(v4, "enumerateReliableMeaningNodesUsingBlock:", v42);
        -[PGTextFeatureGenerator meaningNodes](self, "meaningNodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "unionSet:", v31);

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "collection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addressNodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_6;
        v36[3] = &unk_1E842BC98;
        v37 = v10;
        v38 = v11;
        v39 = v12;
        v40 = v13;
        v41 = v14;
        v17 = v14;
        v18 = v13;
        v19 = v12;
        v20 = v11;
        v21 = v10;
        objc_msgSend(v16, "enumerateIdentifiersAsCollectionsWithBlock:", v36);

        -[PGTextFeatureGenerator districtNodes](self, "districtNodes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "unionSet:", v21);

        -[PGTextFeatureGenerator cityNodes](self, "cityNodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "unionSet:", v20);

        -[PGTextFeatureGenerator stateNodes](self, "stateNodes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "unionSet:", v19);

        -[PGTextFeatureGenerator countryNodes](self, "countryNodes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "unionSet:", v18);

        -[PGTextFeatureGenerator areaNodes](self, "areaNodes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "unionSet:", v17);

        v27 = MEMORY[0x1E0C809B0];
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_7;
        v35[3] = &unk_1E84320E8;
        v35[4] = self;
        objc_msgSend(v4, "enumerateBusinessNodesUsingBlock:", v35);
        v34[0] = v27;
        v34[1] = 3221225472;
        v34[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_9;
        v34[3] = &unk_1E8432070;
        v34[4] = self;
        objc_msgSend(v4, "enumerateDateNodesUsingBlock:", v34);
        v33[0] = v27;
        v33[1] = 3221225472;
        v33[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_11;
        v33[3] = &unk_1E8432110;
        v33[4] = self;
        objc_msgSend(v4, "enumeratePublicEventNodesUsingBlock:", v33);

        ++v3;
      }
      while (v30 != v3);
      v30 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v30);
  }

}

- (id)generateTextFeatures
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSCountedSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSCountedSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  unint64_t v27;
  char v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSCountedSet *businessCategoryNodes;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSCountedSet *publicEventPerformerNodes;
  NSObject *v45;
  void *v46;
  NSCountedSet *publicEventCategoryNodes;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
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
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  NSCountedSet *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numberOfAssets)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v4 = self->_numberOfAssetsBySceneNode;
    v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v62 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_numberOfAssetsBySceneNode, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGTextFeatureGenerator _textFeaturesForNode:type:weight:](self, "_textFeaturesForNode:type:weight:", v9, 18, (double)(unint64_t)objc_msgSend(v10, "unsignedIntegerValue") / (double)self->_numberOfAssets);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v11);

        }
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v6);
    }

    -[PGTextFeatureGenerator _textFeaturesForPersonNodes:](self, "_textFeaturesForPersonNodes:", self->_personNodes);
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:");
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v12 = self->_roiNodes;
    v13 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v58 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v17, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Urban"));

          if ((v19 & 1) == 0)
          {
            -[PGTextFeatureGenerator _textFeaturesForNode:type:weight:](self, "_textFeaturesForNode:type:weight:", v17, 9, (float)((float)-[NSCountedSet countForObject:](self->_roiNodes, "countForObject:", v17)/ (float)self->_numberOfMoments));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "unionSet:", v20);

          }
        }
        v14 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v14);
    }

    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_poiNodes, 10);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:");
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v21 = self->_meaningNodes;
    v22 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
          v27 = -[NSCountedSet countForObject:](self->_meaningNodes, "countForObject:", v26);
          v28 = objc_msgSend(v26, "isVeryMeaningful");
          v29 = 1.0;
          if ((v28 & 1) == 0)
            v29 = (float)v27 / (float)self->_numberOfMoments;
          -[PGTextFeatureGenerator _textFeaturesForNode:type:weight:](self, "_textFeaturesForNode:type:weight:", v26, 13, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v30);

        }
        v23 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      }
      while (v23);
    }

    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_districtNodes, 19);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:");
    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_cityNodes, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:");
    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_stateNodes, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v31);
    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_countryNodes, 6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v32);
    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_areaNodes, 20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v33);
    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_businessNodes, 17);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v34);
    if ((unint64_t)-[NSCountedSet count](self->_businessCategoryNodes, "count") > 3)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "loggingConnection");
      v35 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        businessCategoryNodes = self->_businessCategoryNodes;
        *(_DWORD *)buf = 138412290;
        v66 = businessCategoryNodes;
        _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "PHSuggestion text features generation: ignoring business categories (too many) : %@", buf, 0xCu);
      }
    }
    else
    {
      -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_businessCategoryNodes, 24);
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionSet:", v35);
    }

    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_holidayNodes, 15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v40);
    -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_publicEventNodes, 21);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v41);
    if ((unint64_t)-[NSCountedSet count](self->_publicEventPerformerNodes, "count") > 3)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "loggingConnection");
      v42 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        publicEventPerformerNodes = self->_publicEventPerformerNodes;
        *(_DWORD *)buf = 138412290;
        v66 = publicEventPerformerNodes;
        _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "PHSuggestion text features generation: ignoring performers (too many) : %@", buf, 0xCu);
      }
    }
    else
    {
      -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_publicEventPerformerNodes, 26);
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionSet:", v42);
    }

    if ((unint64_t)-[NSCountedSet count](self->_publicEventCategoryNodes, "count") > 3)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "loggingConnection");
      v45 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        publicEventCategoryNodes = self->_publicEventCategoryNodes;
        *(_DWORD *)buf = 138412290;
        v66 = publicEventCategoryNodes;
        _os_log_impl(&dword_1CA237000, v45, OS_LOG_TYPE_INFO, "PHSuggestion text features generation: ignoring public event categories (too many) : %@", buf, 0xCu);
      }
    }
    else
    {
      -[PGTextFeatureGenerator _textFeaturesForNodes:type:](self, "_textFeaturesForNodes:type:", self->_publicEventCategoryNodes, 25);
      v45 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionSet:", v45);
    }

    v37 = v52;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "loggingConnection");
    v37 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v37, OS_LOG_TYPE_ERROR, "Can't generate text features from no assets", buf, 2u);
    }
  }

  return v3;
}

- (id)bestTextFeaturesFromTextFeatures:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  __int128 v38;
  void *v40;
  BOOL v41;
  unint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v14, "addObject:", v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTextFeature mergedTextFeatureFromTextFeatures:](PGTextFeature, "mergedTextFeatureFromTextFeatures:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "minusSet:", v21);
        if (v22)
          objc_msgSend(v15, "addObject:", v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v18);
  }

  v23 = objc_msgSend(v15, "count");
  v24 = -[PGTextFeatureGenerator maximumNumberOfTextFeaturesPerEvent](self, "maximumNumberOfTextFeaturesPerEvent");
  v41 = -[PGTextFeatureGenerator boundTextFeaturesPerEvent](self, "boundTextFeaturesPerEvent");
  v42 = v24;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTextFeatureGenerator _sortedTextFeaturesUsingWeightAndTypeFromTextFeatures:](self, "_sortedTextFeaturesUsingWeightAndTypeFromTextFeatures:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v28 = v23;
    v29 = 0;
    *(_QWORD *)&v27 = 138412290;
    v38 = v27;
    v40 = v25;
    while (1)
    {
      objc_msgSend(v26, "objectAtIndexedSubscript:", v29, v38);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v29 < v42)
        break;
      if (!v41)
      {
        objc_msgSend(v30, "markAsStrippedOut");
        objc_msgSend(MEMORY[0x1E0CD17E0], "pg_textFeatureForFeature:", v31);
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
LABEL_28:
          v35 = (void *)v32;
          objc_msgSend(v25, "addObject:", v32);
LABEL_31:

          goto LABEL_32;
        }
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "loggingConnection");
        v34 = objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
LABEL_30:

          v35 = 0;
          v25 = v40;
          goto LABEL_31;
        }
LABEL_34:
        *(_DWORD *)buf = v38;
        v52 = v31;
        _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "Failure generating PHTextFeature from PGTextFeature %@", buf, 0xCu);
        goto LABEL_30;
      }
LABEL_32:

      if (v28 == ++v29)
        goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0CD17E0], "pg_textFeatureForFeature:", v30);
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
      goto LABEL_28;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "loggingConnection");
    v34 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    goto LABEL_34;
  }
LABEL_35:

  return v25;
}

- (id)_textFeaturesForNodes:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[PGTextFeatureGenerator _textFeaturesForNode:type:weight:](self, "_textFeaturesForNode:type:weight:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a4, (float)((float)(unint64_t)objc_msgSend(v8, "countForObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15)/ (float)self->_numberOfMoments));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unionSet:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_textFeaturesForNode:(id)a3 type:(unint64_t)a4 weight:(double)a5
{
  NSDictionary *optionsByDomain;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  optionsByDomain = self->_optionsByDomain;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](optionsByDomain, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  +[PGTextFeature textFeaturesFromNode:type:weight:options:locationHelper:](PGTextFeature, "textFeaturesFromNode:type:weight:options:locationHelper:", v10, a4, v13, self->_locationHelper, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_textFeaturesForPersonNodes:(id)a3
{
  void *v4;
  NSCountedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_personNodes;
  v6 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (double)-[NSCountedSet countForObject:](self->_personNodes, "countForObject:", v10, (_QWORD)v16)
            / (double)self->_numberOfMoments;
        -[PGTextFeatureGenerator _textFeaturesForNode:type:weight:](self, "_textFeaturesForNode:type:weight:", v10, 3, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v12);
        objc_msgSend(v10, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          +[PGTextFeature textFeaturesFromString:type:weight:options:](PGTextFeature, "textFeaturesFromString:type:weight:options:", v13, 3, 0, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v14);

        }
      }
      v7 = -[NSCountedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_sortedTextFeaturesUsingWeightAndTypeFromTextFeatures:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
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
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  +[PGTextFeature vipTextFeatureTypes](PGTextFeature, "vipTextFeatureTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v13, "origin") != 1
          || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "type")),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v27, "containsObject:", v14),
              v14,
              v16 = v4,
              (v15 & 1) == 0))
        {
          v16 = v5;
        }
        objc_msgSend(v16, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("weight"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("string"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("weight"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("string"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_momentNodes, a3);
}

- (NSMutableSet)momentIdentifiers
{
  return self->_momentIdentifiers;
}

- (void)setMomentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_momentIdentifiers, a3);
}

- (unint64_t)numberOfMoments
{
  return self->_numberOfMoments;
}

- (void)setNumberOfMoments:(unint64_t)a3
{
  self->_numberOfMoments = a3;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (void)setNumberOfAssets:(unint64_t)a3
{
  self->_numberOfAssets = a3;
}

- (NSMapTable)numberOfAssetsBySceneNode
{
  return self->_numberOfAssetsBySceneNode;
}

- (void)setNumberOfAssetsBySceneNode:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfAssetsBySceneNode, a3);
}

- (NSCountedSet)sceneNodes
{
  return self->_sceneNodes;
}

- (void)setSceneNodes:(id)a3
{
  objc_storeStrong((id *)&self->_sceneNodes, a3);
}

- (NSCountedSet)personNodes
{
  return self->_personNodes;
}

- (void)setPersonNodes:(id)a3
{
  objc_storeStrong((id *)&self->_personNodes, a3);
}

- (NSCountedSet)roiNodes
{
  return self->_roiNodes;
}

- (void)setRoiNodes:(id)a3
{
  objc_storeStrong((id *)&self->_roiNodes, a3);
}

- (NSCountedSet)poiNodes
{
  return self->_poiNodes;
}

- (void)setPoiNodes:(id)a3
{
  objc_storeStrong((id *)&self->_poiNodes, a3);
}

- (NSCountedSet)meaningNodes
{
  return self->_meaningNodes;
}

- (void)setMeaningNodes:(id)a3
{
  objc_storeStrong((id *)&self->_meaningNodes, a3);
}

- (NSCountedSet)districtNodes
{
  return self->_districtNodes;
}

- (void)setDistrictNodes:(id)a3
{
  objc_storeStrong((id *)&self->_districtNodes, a3);
}

- (NSCountedSet)cityNodes
{
  return self->_cityNodes;
}

- (void)setCityNodes:(id)a3
{
  objc_storeStrong((id *)&self->_cityNodes, a3);
}

- (NSCountedSet)stateNodes
{
  return self->_stateNodes;
}

- (void)setStateNodes:(id)a3
{
  objc_storeStrong((id *)&self->_stateNodes, a3);
}

- (NSCountedSet)countryNodes
{
  return self->_countryNodes;
}

- (void)setCountryNodes:(id)a3
{
  objc_storeStrong((id *)&self->_countryNodes, a3);
}

- (NSCountedSet)areaNodes
{
  return self->_areaNodes;
}

- (void)setAreaNodes:(id)a3
{
  objc_storeStrong((id *)&self->_areaNodes, a3);
}

- (NSCountedSet)businessNodes
{
  return self->_businessNodes;
}

- (void)setBusinessNodes:(id)a3
{
  objc_storeStrong((id *)&self->_businessNodes, a3);
}

- (NSCountedSet)businessCategoryNodes
{
  return self->_businessCategoryNodes;
}

- (void)setBusinessCategoryNodes:(id)a3
{
  objc_storeStrong((id *)&self->_businessCategoryNodes, a3);
}

- (NSCountedSet)holidayNodes
{
  return self->_holidayNodes;
}

- (void)setHolidayNodes:(id)a3
{
  objc_storeStrong((id *)&self->_holidayNodes, a3);
}

- (NSCountedSet)publicEventNodes
{
  return self->_publicEventNodes;
}

- (void)setPublicEventNodes:(id)a3
{
  objc_storeStrong((id *)&self->_publicEventNodes, a3);
}

- (NSCountedSet)publicEventPerformerNodes
{
  return self->_publicEventPerformerNodes;
}

- (void)setPublicEventPerformerNodes:(id)a3
{
  objc_storeStrong((id *)&self->_publicEventPerformerNodes, a3);
}

- (NSCountedSet)publicEventCategoryNodes
{
  return self->_publicEventCategoryNodes;
}

- (void)setPublicEventCategoryNodes:(id)a3
{
  objc_storeStrong((id *)&self->_publicEventCategoryNodes, a3);
}

- (NSDictionary)optionsByDomain
{
  return self->_optionsByDomain;
}

- (void)setOptionsByDomain:(id)a3
{
  objc_storeStrong((id *)&self->_optionsByDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsByDomain, 0);
  objc_storeStrong((id *)&self->_publicEventCategoryNodes, 0);
  objc_storeStrong((id *)&self->_publicEventPerformerNodes, 0);
  objc_storeStrong((id *)&self->_publicEventNodes, 0);
  objc_storeStrong((id *)&self->_holidayNodes, 0);
  objc_storeStrong((id *)&self->_businessCategoryNodes, 0);
  objc_storeStrong((id *)&self->_businessNodes, 0);
  objc_storeStrong((id *)&self->_areaNodes, 0);
  objc_storeStrong((id *)&self->_countryNodes, 0);
  objc_storeStrong((id *)&self->_stateNodes, 0);
  objc_storeStrong((id *)&self->_cityNodes, 0);
  objc_storeStrong((id *)&self->_districtNodes, 0);
  objc_storeStrong((id *)&self->_meaningNodes, 0);
  objc_storeStrong((id *)&self->_poiNodes, 0);
  objc_storeStrong((id *)&self->_roiNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_sceneNodes, 0);
  objc_storeStrong((id *)&self->_numberOfAssetsBySceneNode, 0);
  objc_storeStrong((id *)&self->_momentIdentifiers, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isIndexed")
    && objc_msgSend(v5, "isSuitableForSuggestions")
    && objc_msgSend(v12, "isReliable"))
  {
    v6 = objc_msgSend(v12, "numberOfAssets");
    objc_msgSend(*(id *)(a1 + 32), "numberOfAssetsBySceneNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "unsignedIntegerValue") + v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "numberOfAssetsBySceneNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v5);

    objc_msgSend(*(id *)(a1 + 32), "sceneNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

  }
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isMeNode") & 1) == 0)
  {
    objc_msgSend(v6, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "personNodes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
  }

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "roiNodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "poiNodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  objc_msgSend(v10, "parentMeaningNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

    if ((v8 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_6(id *a1, uint64_t a2, void *a3)
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
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "districtNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(a1[4], "addObject:", v5);
  objc_msgSend(v14, "cityNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(a1[5], "addObject:", v7);
  objc_msgSend(v14, "stateNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(a1[6], "addObject:", v9);
  objc_msgSend(v14, "countryNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(a1[7], "addObject:", v11);
  objc_msgSend(v14, "areaNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "temporarySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[8], "unionSet:", v13);
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "businessNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_8;
  v6[3] = &unk_1E842DD10;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateBusinessCategoryNodesUsingBlock:", v6);

}

uint64_t __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_9(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_10;
  v3[3] = &unk_1E8433B30;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateHolidayNodesUsingBlock:", v3);
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "publicEventNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_12;
  v8[3] = &unk_1E8436458;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumeratePublicEventCategoryNodesUsingBlock:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_13;
  v7[3] = &unk_1E842BCC0;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumeratePerformerNodesUsingBlock:", v7);

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "publicEventCategoryNodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "publicEventPerformerNodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "holidayNodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "businessCategoryNodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

}

+ (id)_naturalLanguageOptionsByDomain
{
  _QWORD v3[16];
  _QWORD v4[17];

  v4[16] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E84E3AD0;
  v3[1] = &unk_1E84E3B00;
  v4[0] = &unk_1E84E3AE8;
  v4[1] = &unk_1E84E3B18;
  v3[2] = &unk_1E84E3B30;
  v3[3] = &unk_1E84E3B48;
  v4[2] = &unk_1E84E3AE8;
  v4[3] = &unk_1E84E3AE8;
  v3[4] = &unk_1E84E3B60;
  v3[5] = &unk_1E84E3B78;
  v4[4] = &unk_1E84E3AE8;
  v4[5] = &unk_1E84E3B90;
  v3[6] = &unk_1E84E3B18;
  v3[7] = &unk_1E84E3BA8;
  v4[6] = &unk_1E84E3B90;
  v4[7] = &unk_1E84E3B90;
  v3[8] = &unk_1E84E3BC0;
  v3[9] = &unk_1E84E3BD8;
  v4[8] = &unk_1E84E3B90;
  v4[9] = &unk_1E84E3B90;
  v3[10] = &unk_1E84E3BF0;
  v3[11] = &unk_1E84E3C08;
  v4[10] = &unk_1E84E3B90;
  v4[11] = &unk_1E84E3C08;
  v3[12] = &unk_1E84E3C20;
  v3[13] = &unk_1E84E3C38;
  v4[12] = &unk_1E84E3B90;
  v4[13] = &unk_1E84E3B90;
  v3[14] = &unk_1E84E3C50;
  v3[15] = &unk_1E84E3C68;
  v4[14] = &unk_1E84E3B90;
  v4[15] = &unk_1E84E3C08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_knowledgeOptionsByDomain
{
  _QWORD v3[16];
  _QWORD v4[17];

  v4[16] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E84E3AD0;
  v3[1] = &unk_1E84E3B00;
  v4[0] = &unk_1E84E3C80;
  v4[1] = &unk_1E84E3C80;
  v3[2] = &unk_1E84E3B30;
  v3[3] = &unk_1E84E3B48;
  v4[2] = &unk_1E84E3C80;
  v4[3] = &unk_1E84E3C80;
  v3[4] = &unk_1E84E3B60;
  v3[5] = &unk_1E84E3B78;
  v4[4] = &unk_1E84E3C80;
  v4[5] = &unk_1E84E3C80;
  v3[6] = &unk_1E84E3B18;
  v3[7] = &unk_1E84E3BA8;
  v4[6] = &unk_1E84E3C80;
  v4[7] = &unk_1E84E3C80;
  v3[8] = &unk_1E84E3BC0;
  v3[9] = &unk_1E84E3BD8;
  v4[8] = &unk_1E84E3C80;
  v4[9] = &unk_1E84E3C80;
  v3[10] = &unk_1E84E3BF0;
  v3[11] = &unk_1E84E3C08;
  v4[10] = &unk_1E84E3C80;
  v4[11] = &unk_1E84E3C80;
  v3[12] = &unk_1E84E3C20;
  v3[13] = &unk_1E84E3C38;
  v4[12] = &unk_1E84E3C80;
  v4[13] = &unk_1E84E3C80;
  v3[14] = &unk_1E84E3C50;
  v3[15] = &unk_1E84E3C68;
  v4[14] = &unk_1E84E3C80;
  v4[15] = &unk_1E84E3C80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
