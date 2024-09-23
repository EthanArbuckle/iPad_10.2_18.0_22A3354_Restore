@implementation PGLocationFeatureSummarySource

- (PGLocationFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGLocationFeatureSummarySource *v12;
  PGLocationFeatureSummarySource *v13;
  uint64_t v14;
  PGGraphLocationCityNodeCollection *supersetCityNodes;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PGLocationFeatureSummarySource;
  v12 = -[PGLocationFeatureSummarySource init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
    -[PGGraph supersetCityNodes](v13->_graph, "supersetCityNodes");
    v14 = objc_claimAutoreleasedReturnValue();
    supersetCityNodes = v13->_supersetCityNodes;
    v13->_supersetCityNodes = (PGGraphLocationCityNodeCollection *)v14;

  }
  return v13;
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  PGLocationFeatureSummarySource *v16;
  id v17;
  void *v18;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addressNodesByMomentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__PGLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke;
    v14[3] = &unk_1E84282F8;
    v15 = v6;
    v16 = self;
    v8 = v7;
    v17 = v8;
    v18 = v5;
    v9 = v5;
    v10 = v6;
    objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v14);
    v11 = v18;
    v12 = v8;

  }
  else
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)summarizedHomeWorkNodesForMomentNode:(id)a3 momentAddressNodes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  PGLocationSummarizedFeature *v26;
  void *v28;
  uint64_t v29;
  PGLocationFeatureSummarySource *v30;
  id v31;
  id v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  v30 = self;
  -[PGTitleGenerationContext serviceManager](self->_titleGenerationContext, "serviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v6;
  +[PGLocationTitleUtility peopleLocationTitleComponentsFromAddressNodes:peopleDisplayType:serviceManager:](PGLocationTitleUtility, "peopleLocationTitleComponentsFromAddressNodes:peopleDisplayType:serviceManager:", v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    v29 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      v33 = v10;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
        objc_msgSend(v13, "addressNodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15 == 1)
        {
          objc_msgSend(v13, "node");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addressNodes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "anyObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "collection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", v32, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "universalDateIntervals");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:](PGLocationSummarizedFeature, "summarizedFeatureSubtypeForLocationNode:", v18);
          objc_msgSend(v13, "edge");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGTitleGenerationContext serviceManager](v30->_titleGenerationContext, "serviceManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:](PGPeopleTitleUtility, "beautifiedLocationStringWithPersonNode:peopleAddressEdge:titleComponent:insertLineBreak:allowFamilyHome:serviceManager:", v16, v23, v13, 0, 0, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:personNode:locationName:]([PGLocationSummarizedFeature alloc], "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:personNode:locationName:", v22, v21, objc_msgSend(v20, "numberOfAssets"), 1, v18, v16, v25);
          objc_msgSend(v31, "addObject:", v26);

          v11 = v29;
          v10 = v33;

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v10);
  }

  return v31;
}

- (id)summarizedAreaNodesForMomentNode:(id)a3 momentAddressNodesAsSet:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  PGGraphAddressNodeCollection *v19;
  void *v20;
  PGGraphAddressNodeCollection *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PGLocationSummarizedFeature *v25;
  void *v26;
  PGLocationSummarizedFeature *v27;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  PGLocationFeatureSummarySource *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = +[PGLocationTitleUtility containsAmusementParkPOIFromMomentNodes:](PGLocationTitleUtility, "containsAmusementParkPOIFromMomentNodes:", v8);
  v33 = self;
  -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v8;
  v30 = v7;
  +[PGLocationTitleUtility commonAOIComponentsForMomentNodes:addressNodes:aoiDisplayType:containsAmusementParkPOI:locationHelper:](PGLocationTitleUtility, "commonAOIComponentsForMomentNodes:addressNodes:aoiDisplayType:containsAmusementParkPOI:locationHelper:", v8, v7, 3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v6;
  objc_msgSend(v6, "collection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v16, "addressNodes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          v19 = [PGGraphAddressNodeCollection alloc];
          objc_msgSend(v16, "addressNodes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[MAElementCollection initWithSet:graph:](v19, "initWithSet:graph:", v20, v33->_graph);

          +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", v34, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "node");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:](PGLocationSummarizedFeature, "summarizedFeatureSubtypeForLocationNode:", v23);
          v25 = [PGLocationSummarizedFeature alloc];
          objc_msgSend(v22, "universalDateIntervals");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:](v25, "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:", v24, v26, objc_msgSend(v22, "numberOfAssets"), 1, v23);

          objc_msgSend(v35, "addObject:", v27);
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

  return v35;
}

- (id)summarizedDistrictNodesForMomentNode:(id)a3 momentAddressNodes:(id)a4 momentCityNodes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  PGGraphLocationDistrictNodeCollection *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1
    && -[MAElementCollection containsCollection:](self->_supersetCityNodes, "containsCollection:", v10))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v12 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke;
    v26[3] = &unk_1E8428320;
    v14 = v11;
    v27 = v14;
    v29 = &v30;
    v15 = v12;
    v28 = v15;
    objc_msgSend(v9, "enumerateIdentifiersAsCollectionsWithBlock:", v26);
    if (*((_BYTE *)v31 + 24))
    {
      v16 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphLocationDistrictNodeCollection alloc], "initWithGraph:elementIdentifiers:", self->_graph, v15);
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke_2;
      v22[3] = &unk_1E8428348;
      v23 = v14;
      v24 = v8;
      v18 = v17;
      v25 = v18;
      -[MAElementCollection enumerateIdentifiersAsCollectionsWithBlock:](v16, "enumerateIdentifiersAsCollectionsWithBlock:", v22);
      v19 = v25;
      v20 = v18;

    }
    else
    {
      v20 = (id)MEMORY[0x1E0C9AA60];
    }

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v20 = (id)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

- (id)summarizedCityOrCountyNodesForMomentNode:(id)a3 momentAddressNodesAsSet:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  PGIncompleteLocationResolver *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  PGGraphAddressNodeCollection *v18;
  void *v19;
  PGGraphAddressNodeCollection *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  PGLocationSummarizedFeature *v24;
  void *v25;
  PGLocationSummarizedFeature *v26;
  void *v28;
  PGIncompleteLocationResolver *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  PGLocationFeatureSummarySource *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = self;
  -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[PGIncompleteLocationResolver initWithAddressNodes:locationHelper:]([PGIncompleteLocationResolver alloc], "initWithAddressNodes:locationHelper:", v7, v8);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  v30 = (void *)v8;
  v31 = v7;
  +[PGLocationTitleUtility commonCityTitleComponentsFromMomentNodes:addressNodes:incompleteLocationResolver:locationHelper:](PGLocationTitleUtility, "commonCityTitleComponentsFromMomentNodes:addressNodes:incompleteLocationResolver:locationHelper:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v6;
  objc_msgSend(v6, "collection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v15, "addressNodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
        {
          v18 = [PGGraphAddressNodeCollection alloc];
          objc_msgSend(v15, "addressNodes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[MAElementCollection initWithSet:graph:](v18, "initWithSet:graph:", v19, v34->_graph);

          +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", v35, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "node");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:](PGLocationSummarizedFeature, "summarizedFeatureSubtypeForLocationNode:", v22);
          v24 = [PGLocationSummarizedFeature alloc];
          objc_msgSend(v21, "universalDateIntervals");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:](v24, "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:", v23, v25, objc_msgSend(v21, "numberOfAssets"), 1, v22);

          objc_msgSend(v36, "addObject:", v26);
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v12);
  }

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supersetCityNodes, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)a1[4];
  objc_msgSend(a3, "anyNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "districtNodeFromAddressNode:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v8 = (void *)a1[5];
    objc_msgSend(v10, "elementIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionWithIdentifierSet:", v9);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PGLocationSummarizedFeature *v9;
  void *v10;
  PGLocationSummarizedFeature *v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "addressNodesFromLocationNodes:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", *(_QWORD *)(a1 + 40), v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:](PGLocationSummarizedFeature, "summarizedFeatureSubtypeForLocationNode:", v7);
  v9 = [PGLocationSummarizedFeature alloc];
  objc_msgSend(v6, "universalDateIntervals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:](v9, "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:", v8, v10, objc_msgSend(v6, "numberOfAssets"), 1, v7);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
}

void __67__PGLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "anyNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1[4], "targetsForSources:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(a1[5], "summarizedHomeWorkNodesForMomentNode:momentAddressNodes:", v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(a1[6], "addObjectsFromArray:", v7);
      }
      else
      {
        objc_msgSend(v6, "set");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "summarizedAreaNodesForMomentNode:momentAddressNodesAsSet:", v5, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(a1[6], "addObjectsFromArray:", v9);
        }
        else
        {
          objc_msgSend(a1[7], "cityNodesFromAddressNodes:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "summarizedDistrictNodesForMomentNode:momentAddressNodes:momentCityNodes:", v4, v6, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count"))
          {
            objc_msgSend(a1[6], "addObjectsFromArray:", v11);
          }
          else
          {
            objc_msgSend(a1[5], "summarizedCityOrCountyNodesForMomentNode:momentAddressNodesAsSet:", v5, v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              objc_msgSend(a1[6], "addObjectsFromArray:", v12);
            }
            else if (objc_msgSend(v6, "count"))
            {
              v13 = *((_QWORD *)a1[5] + 1);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                v14 = v13;
                objc_msgSend(v5, "localIdentifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v17 = v15;
                _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGLocationFeatureSummarySource] No summarized location features found from momentNode %@", buf, 0xCu);

              }
            }

          }
        }

      }
    }

  }
}

@end
