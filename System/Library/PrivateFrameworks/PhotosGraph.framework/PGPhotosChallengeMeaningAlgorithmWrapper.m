@implementation PGPhotosChallengeMeaningAlgorithmWrapper

- (PGPhotosChallengeMeaningAlgorithmWrapper)initWithEvaluationContext:(id)a3
{
  id v4;
  PGPhotosChallengeMeaningAlgorithmWrapper *v5;
  uint64_t v6;
  PHPhotoLibrary *photoLibrary;
  uint64_t v8;
  PGGraph *graph;
  uint64_t v10;
  CLSSceneTaxonomyHierarchy *sceneTaxonomy;
  uint64_t v12;
  CLSServiceManager *serviceManager;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPhotosChallengeMeaningAlgorithmWrapper;
  v5 = -[PGPhotosChallengeMeaningAlgorithmWrapper init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "photoLibrary");
    v6 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v6;

    objc_msgSend(v4, "graph");
    v8 = objc_claimAutoreleasedReturnValue();
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v8;

    objc_msgSend(v4, "sceneTaxonomy");
    v10 = objc_claimAutoreleasedReturnValue();
    sceneTaxonomy = v5->_sceneTaxonomy;
    v5->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v10;

    objc_msgSend(v4, "serviceManager");
    v12 = objc_claimAutoreleasedReturnValue();
    serviceManager = v5->_serviceManager;
    v5->_serviceManager = (CLSServiceManager *)v12;

  }
  return v5;
}

- (unsigned)predictQuestionStateForMeaningIdentifier:(id)a3 assetUUID:(id)a4 params:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PGMeaningfulEventProcessorCache *v22;
  void *v23;
  PGMeaningfulEventProcessorCache *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CD1390];
  v31[0] = v9;
  v13 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetsWithUUIDs:options:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v16, 3, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[PGGraph momentNodeForMoment:](self->_graph, "momentNodeForMoment:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v28 = v8;
        if (objc_msgSend(v10, "count"))
        {
          v29 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:params:](PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory, "requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:params:", v20, 0, self->_graph, self->_sceneTaxonomy, v10);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:](PGMeaningfulEventRequiredCriteriaFactory, "requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:", v20, 0, self->_graph, self->_sceneTaxonomy);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v27 = (void *)v21;

        v22 = [PGMeaningfulEventProcessorCache alloc];
        objc_msgSend(v19, "collection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[PGMeaningfulEventProcessorCache initWithMomentNodes:](v22, "initWithMomentNodes:", v23);
        +[PGMeaningfulEventProcessor processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:](PGMeaningfulEventProcessor, "processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:", v27, v19, v24, self->_serviceManager);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "count"))
          v13 = 2;
        else
          v13 = 3;

        v8 = v28;
      }
      else
      {
        v13 = 1;
      }

    }
    else
    {
      v13 = 1;
    }

  }
  return v13;
}

- (id)debugInformationForMeaningIdentifier:(id)a3 assetUUID:(id)a4
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CD1390];
  v37[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAssetsWithUUIDs:options:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v10, 3, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v12, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v15, self->_graph);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "sceneNodes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sceneNames");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allObjects");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "reliableSceneNodes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sceneNames");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "allObjects");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "highConfidenceSceneNodes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sceneNames");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "allObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "searchConfidenceSceneNodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sceneNames");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "allObjects");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "componentsJoinedByString:", CFSTR(","));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR(","));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = CFSTR("sceneNames");
        v35[1] = CFSTR("reliableSceneNames");
        v36[0] = v25;
        v36[1] = v26;
        v35[2] = CFSTR("highConfidenceSceneNames");
        v35[3] = CFSTR("searchConfidenceSceneNames");
        v36[2] = v27;
        v36[3] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = (void *)MEMORY[0x1E0C9AA70];
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v29;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

@end
