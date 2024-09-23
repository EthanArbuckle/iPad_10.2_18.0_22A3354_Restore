@implementation PGHighlightTailorHighlightInfo

- (PGHighlightTailorHighlightInfo)initWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PGHighlightTailorHighlightInfo *v18;
  PGHighlightTailorHighlightInfo *v19;
  NSArray *privateSummarizedFeatures;
  void *v21;
  NSArray *v22;
  NSArray *sharedSummarizedFeatures;
  NSArray *mixedSummarizedFeatures;
  id *p_highlightNode;
  void *v26;
  NSSet *v27;
  NSDictionary *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSDictionary *meaningLabelsByChildHighlightUUID;
  NSSet *meaningLabels;
  PGHighlightTailorHighlightInfo *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  CLSInvestigationPhotoKitFeeder *feeder;
  NSSet *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightNodeCollection, "highlightNodeForUUID:inGraph:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v15;
  if (!v15)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v13;
      _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "Cannot find highlight node for highlightUUID %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  objc_msgSend(v15, "eventEnrichmentMomentNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "temporarySet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v17, "count"))
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v70 = obj;
      v71 = 2112;
      v72 = v13;
      _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "No Moment nodes connected to highlight node %@ with highlightUUID %@", buf, 0x16u);
    }

LABEL_18:
    v41 = 0;
    goto LABEL_26;
  }
  v67.receiver = self;
  v67.super_class = (Class)PGHighlightTailorHighlightInfo;
  v18 = -[PGHighlightTailorHighlightInfo init](&v67, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_highlight, a3);
    objc_storeStrong((id *)&v19->_highlightTailorContext, a5);
    v19->_promotionScore = -1.0;
    privateSummarizedFeatures = v19->_privateSummarizedFeatures;
    v21 = v17;
    v22 = (NSArray *)MEMORY[0x1E0C9AA60];
    v19->_privateSummarizedFeatures = (NSArray *)MEMORY[0x1E0C9AA60];

    sharedSummarizedFeatures = v19->_sharedSummarizedFeatures;
    v19->_sharedSummarizedFeatures = v22;

    mixedSummarizedFeatures = v19->_mixedSummarizedFeatures;
    v19->_mixedSummarizedFeatures = v22;

    objc_storeStrong((id *)&v19->_loggingConnection, v12);
    p_highlightNode = (id *)&v19->_highlightNode;
    v26 = obj;
    objc_storeStrong((id *)&v19->_highlightNode, obj);
    v59 = v21;
    objc_storeStrong((id *)&v19->_momentNodes, v21);
    v60 = v13;
    v61 = v12;
    if (-[PGGraphHighlightNode isTrip](v19->_highlightNode, "isTrip"))
    {
      v56 = v11;
      v57 = v10;
      v58 = v9;
      v27 = (NSSet *)*p_highlightNode;
      v28 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v55 = v27;
      -[NSSet highlightNodes](v27, "highlightNodes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v64 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_msgSend(v34, "eventEnrichmentMomentNodes");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "meaningNodes");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "meaningLabels");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "localIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v37, v38);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        }
        while (v31);
      }

      meaningLabelsByChildHighlightUUID = v19->_meaningLabelsByChildHighlightUUID;
      v19->_meaningLabelsByChildHighlightUUID = v28;

      v10 = v57;
      v9 = v58;
      p_highlightNode = (id *)&v19->_highlightNode;
      v11 = v56;
      v26 = obj;
      meaningLabels = v55;
    }
    else
    {
      objc_msgSend(obj, "meaningLabels");
      v42 = objc_claimAutoreleasedReturnValue();
      meaningLabels = v19->_meaningLabels;
      v19->_meaningLabels = (NSSet *)v42;
    }

    v19->_petIsPresent = objc_msgSend(v26, "petIsPresent");
    if (_os_feature_enabled_impl()
      && (objc_msgSend(*p_highlightNode, "isAggregation") & 1) == 0
      && (objc_msgSend(*p_highlightNode, "isTrip") & 1) == 0)
    {
      -[PGHighlightTailorHighlightInfo setHighlightSummarizedFeaturesWithGraph:](v19, "setHighlightSummarizedFeaturesWithGraph:", v10);
    }
    objc_msgSend(v11, "photoLibrary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "librarySpecificFetchOptions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "mutableCopy");

    objc_msgSend(v46, "addObject:", *MEMORY[0x1E0CD1A18]);
    objc_msgSend(v44, "addFetchPropertySets:", v46);
    objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0D4B1B8];
    objc_msgSend(v9, "assetCollection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "curationContext");
    v50 = v11;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v49, v44, v47, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    feeder = v19->_feeder;
    v19->_feeder = (CLSInvestigationPhotoKitFeeder *)v52;

    v11 = v50;
    v13 = v60;
    v12 = v61;
    v17 = v59;
  }
  self = v19;

  v41 = self;
LABEL_26:

  return v41;
}

- (PGHighlightTailorHighlightInfo)initWithHighlight:(id)a3 serviceManager:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGHighlightTailorHighlightInfo *v12;
  PGHighlightTailorHighlightInfo *v13;
  void *v14;
  void *v15;
  PGHighlightTailorContext *v16;
  PGHighlightTailorContext *highlightTailorContext;
  NSArray *privateSummarizedFeatures;
  NSArray *v19;
  NSArray *sharedSummarizedFeatures;
  NSArray *mixedSummarizedFeatures;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CLSInvestigationPhotoKitFeeder *feeder;
  id v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)PGHighlightTailorHighlightInfo;
  v12 = -[PGHighlightTailorHighlightInfo init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_highlight, a3);
    objc_msgSend(v9, "assetCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[PGHighlightTailorContext initWithPhotoLibrary:graph:serviceManager:loggingConnection:]([PGHighlightTailorContext alloc], "initWithPhotoLibrary:graph:serviceManager:loggingConnection:", v15, 0, v10, v11);
    highlightTailorContext = v13->_highlightTailorContext;
    v13->_highlightTailorContext = v16;

    v13->_promotionScore = -1.0;
    privateSummarizedFeatures = v13->_privateSummarizedFeatures;
    v32 = v10;
    v19 = (NSArray *)MEMORY[0x1E0C9AA60];
    v13->_privateSummarizedFeatures = (NSArray *)MEMORY[0x1E0C9AA60];

    sharedSummarizedFeatures = v13->_sharedSummarizedFeatures;
    v13->_sharedSummarizedFeatures = v19;

    mixedSummarizedFeatures = v13->_mixedSummarizedFeatures;
    v13->_mixedSummarizedFeatures = v19;

    objc_storeStrong((id *)&v13->_loggingConnection, a5);
    objc_msgSend(v15, "librarySpecificFetchOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    objc_msgSend(v24, "addObject:", *MEMORY[0x1E0CD1A18]);
    objc_msgSend(v22, "addFetchPropertySets:", v24);
    objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0D4B1B8];
    objc_msgSend(v9, "assetCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGHighlightTailorContext curationContext](v13->_highlightTailorContext, "curationContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v27, v22, v25, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    feeder = v13->_feeder;
    v13->_feeder = (CLSInvestigationPhotoKitFeeder *)v29;

    v10 = v32;
  }

  return v13;
}

- (id)initForTestingWithHighlight:(id)a3
{
  id v5;
  PGHighlightTailorHighlightInfo *v6;
  PGHighlightTailorHighlightInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightTailorHighlightInfo;
  v6 = -[PGHighlightTailorHighlightInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_highlight, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightTailorHighlightInfo;
  -[PGHighlightTailorHighlightInfo description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightTailorHighlightInfo highlight](self, "highlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightTailorHighlightInfo highlightNode](self, "highlightNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setHighlightSummarizedFeaturesWithGraph:(id)a3
{
  PGDayHighlightFeatureSummaryGenerator *v4;
  int v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *privateSummarizedFeatures;
  NSArray *v12;
  NSArray *sharedSummarizedFeatures;
  NSArray *v14;
  NSArray *mixedSummarizedFeatures;
  NSArray *v16;
  NSArray *v17;
  id v18;

  v18 = a3;
  v4 = -[PGDayHighlightFeatureSummaryGenerator initWithHighlightNode:loggingConnection:highlightTailorContext:graph:]([PGDayHighlightFeatureSummaryGenerator alloc], "initWithHighlightNode:loggingConnection:highlightTailorContext:graph:", self->_highlightNode, self->_loggingConnection, self->_highlightTailorContext, v18);
  v5 = -[PGHighlightModel sharingComposition](self->_highlight, "sharingComposition");
  switch(v5)
  {
    case 2:
      -[PGHighlightTailorHighlightInfo generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:](self, "generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:", 0, v18, v4);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      privateSummarizedFeatures = self->_privateSummarizedFeatures;
      self->_privateSummarizedFeatures = v10;

      -[PGHighlightTailorHighlightInfo generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:](self, "generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:", 1, v18, v4);
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sharedSummarizedFeatures = self->_sharedSummarizedFeatures;
      self->_sharedSummarizedFeatures = v12;

      -[PGHighlightTailorHighlightInfo generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:](self, "generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:", 2, v18, v4);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      mixedSummarizedFeatures = self->_mixedSummarizedFeatures;
      self->_mixedSummarizedFeatures = v14;
LABEL_8:

      break;
    case 1:
      v16 = self->_privateSummarizedFeatures;
      v9 = (NSArray *)MEMORY[0x1E0C9AA60];
      self->_privateSummarizedFeatures = (NSArray *)MEMORY[0x1E0C9AA60];

      -[PGHighlightTailorHighlightInfo generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:](self, "generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:", 1, v18, v4);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_sharedSummarizedFeatures;
      self->_sharedSummarizedFeatures = v17;
      goto LABEL_7;
    case 0:
      -[PGHighlightTailorHighlightInfo generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:](self, "generateSortedSummarizedFeaturesForSharingFilter:graph:featureSummaryGenerator:", 0, v18, v4);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_privateSummarizedFeatures;
      self->_privateSummarizedFeatures = v6;

      v8 = self->_sharedSummarizedFeatures;
      v9 = (NSArray *)MEMORY[0x1E0C9AA60];
      self->_sharedSummarizedFeatures = (NSArray *)MEMORY[0x1E0C9AA60];
LABEL_7:

      mixedSummarizedFeatures = self->_mixedSummarizedFeatures;
      self->_mixedSummarizedFeatures = v9;
      goto LABEL_8;
  }

}

- (NSArray)childHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *childHighlights;
  int v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (self->_childHighlights || -[PGHighlightModel kind](self->_highlight, "kind") != 3)
    return self->_childHighlights;
  -[PGHighlightModel assetCollection](self->_highlight, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v8);

  objc_msgSend(MEMORY[0x1E0CD1708], "fetchChildDayGroupHighlightsForHighlight:options:", v3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "fetchedObjects");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    childHighlights = self->_childHighlights;
    self->_childHighlights = v10;

    return self->_childHighlights;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Day Group Highlight does not have any child day highlights: %@", (uint8_t *)&v13, 0xCu);
  }

  return (NSArray *)0;
}

- (id)uuidsOfRequiredAssetsForSharingFilter:(unsigned __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
  if (v3 == 1)
    goto LABEL_5;
  -[PGHighlightTailorHighlightInfo keyAssetPrivateUUID](self, "keyAssetPrivateUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PGHighlightTailorHighlightInfo keyAssetPrivateUUID](self, "keyAssetPrivateUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if (v3)
  {
LABEL_5:
    -[PGHighlightTailorHighlightInfo keyAssetSharedUUID](self, "keyAssetSharedUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PGHighlightTailorHighlightInfo keyAssetSharedUUID](self, "keyAssetSharedUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
  }
  return v5;
}

- (id)assetsForSharingFilter:(unsigned __int16)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (a3 == 2)
  {
    -[PGHighlightTailorHighlightInfo feeder](self, "feeder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allItems");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[PGHighlightTailorHighlightInfo feeder](self, "feeder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedItems");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v5 = (void *)MEMORY[0x1E0C9AA60];
      return v5;
    }
    -[PGHighlightTailorHighlightInfo feeder](self, "feeder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "privateItems");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (PHFetchResult)momentFetchResult
{
  PHFetchResult *momentFetchResult;
  void *v4;
  void *v5;
  PHFetchResult *v6;
  PHFetchResult *v7;

  momentFetchResult = self->_momentFetchResult;
  if (!momentFetchResult)
  {
    -[PGHighlightTailorHighlightInfo highlight](self, "highlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsInHighlight:options:", v5, 0);
    v6 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v7 = self->_momentFetchResult;
    self->_momentFetchResult = v6;

    momentFetchResult = self->_momentFetchResult;
  }
  return momentFetchResult;
}

- (id)generateSortedSummarizedFeaturesForSharingFilter:(unsigned __int16)a3 graph:(id)a4 featureSummaryGenerator:(id)a5
{
  uint64_t v5;
  PGGraphHighlightNode *highlightNode;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  highlightNode = self->_highlightNode;
  v7 = a5;
  +[PGHighlightEnrichmentUtilities filteredMomentNodesWithHighlightNode:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredMomentNodesWithHighlightNode:forSharingFilter:", highlightNode, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedSummarizedFeaturesForMomentNodes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PGHighlightModel)highlight
{
  return self->_highlight;
}

- (PGGraphHighlightNode)highlightNode
{
  return self->_highlightNode;
}

- (NSSet)meaningLabels
{
  return self->_meaningLabels;
}

- (void)setMeaningLabels:(id)a3
{
  objc_storeStrong((id *)&self->_meaningLabels, a3);
}

- (NSDictionary)meaningLabelsByChildHighlightUUID
{
  return self->_meaningLabelsByChildHighlightUUID;
}

- (BOOL)petIsPresent
{
  return self->_petIsPresent;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (CLSInvestigationPhotoKitFeeder)feeder
{
  return self->_feeder;
}

- (NSString)keyAssetPrivateUUID
{
  return self->_keyAssetPrivateUUID;
}

- (void)setKeyAssetPrivateUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)keyAssetSharedUUID
{
  return self->_keyAssetSharedUUID;
}

- (void)setKeyAssetSharedUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (void)setPromotionScore:(double)a3
{
  self->_promotionScore = a3;
}

- (unint64_t)numberOfExtendedAssets
{
  return self->_numberOfExtendedAssets;
}

- (void)setNumberOfExtendedAssets:(unint64_t)a3
{
  self->_numberOfExtendedAssets = a3;
}

- (NSArray)uuidsOfEligibleAssets
{
  return self->_uuidsOfEligibleAssets;
}

- (void)setUuidsOfEligibleAssets:(id)a3
{
  objc_storeStrong((id *)&self->_uuidsOfEligibleAssets, a3);
}

- (void)setChildHighlights:(id)a3
{
  objc_storeStrong((id *)&self->_childHighlights, a3);
}

- (PGHighlightTailorContext)highlightTailorContext
{
  return (PGHighlightTailorContext *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)privateSummarizedFeatures
{
  return self->_privateSummarizedFeatures;
}

- (NSArray)sharedSummarizedFeatures
{
  return self->_sharedSummarizedFeatures;
}

- (NSArray)mixedSummarizedFeatures
{
  return self->_mixedSummarizedFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixedSummarizedFeatures, 0);
  objc_storeStrong((id *)&self->_sharedSummarizedFeatures, 0);
  objc_storeStrong((id *)&self->_privateSummarizedFeatures, 0);
  objc_storeStrong((id *)&self->_momentFetchResult, 0);
  objc_storeStrong((id *)&self->_highlightTailorContext, 0);
  objc_storeStrong((id *)&self->_childHighlights, 0);
  objc_storeStrong((id *)&self->_uuidsOfEligibleAssets, 0);
  objc_storeStrong((id *)&self->_keyAssetSharedUUID, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivateUUID, 0);
  objc_storeStrong((id *)&self->_feeder, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_meaningLabelsByChildHighlightUUID, 0);
  objc_storeStrong((id *)&self->_meaningLabels, 0);
  objc_storeStrong((id *)&self->_highlightNode, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
