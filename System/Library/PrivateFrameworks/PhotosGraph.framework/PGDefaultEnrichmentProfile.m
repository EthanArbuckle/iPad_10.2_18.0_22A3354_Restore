@implementation PGDefaultEnrichmentProfile

- (PGDefaultEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGDefaultEnrichmentProfile *v9;
  PGDefaultEnrichmentProfile *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *debugInfos;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDefaultEnrichmentProfile;
  v9 = -[PGDefaultEnrichmentProfile init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curationManager, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    debugInfos = v10->_debugInfos;
    v10->_debugInfos = v11;

  }
  return v10;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("Default Enrichment Profile");
}

- (unsigned)targetEnrichmentState
{
  return 1;
}

- (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4
{
  return +[PGHighlightEnrichmentUtilities canUseLocationInformationWithHighlightInfo:graph:](PGHighlightEnrichmentUtilities, "canUseLocationInformationWithHighlightInfo:graph:", a3, a4);
}

- (PGCurationOptions)curationOptions
{
  PGCurationOptions *v2;

  v2 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 0);
  -[PGCurationOptions setLastPassMovieAdditionEnabled:](v2, "setLastPassMovieAdditionEnabled:", 0);
  return v2;
}

- (PGKeyAssetCurationOptions)keyAssetCurationOptions
{
  PGKeyAssetCurationOptions *v2;

  v2 = objc_alloc_init(PGKeyAssetCurationOptions);
  -[PGKeyAssetCurationOptions setPromoteAutoplayableItems:](v2, "setPromoteAutoplayableItems:", 1);
  return v2;
}

- (id)keyAssetCurationCriteriaWithHighlightInfo:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  PGCurationContentOrAestheticScoreTrait *v36;
  PGCurationContentOrAestheticScoreTrait *v37;
  int v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v46;
  id v47;
  void *v48;
  id v49;
  PGDefaultEnrichmentProfile *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "highlightNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meaningLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v50 = self;
    +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v11)
    {
      v12 = v11;
      v48 = v8;
      v49 = v7;
      v13 = 0;
      v14 = *(_QWORD *)v56;
LABEL_4:
      v15 = 0;
      v16 = v13;
      while (1)
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(v10);
        v13 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * v15);

        if ((objc_msgSend(v9, "containsObject:", v13) & 1) != 0)
          break;
        ++v15;
        v16 = v13;
        if (v12 == v15)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
          if (v12)
            goto LABEL_4;

          v13 = 0;
          v17 = 0;
          v18 = 0;
          v19 = v10;
          v8 = v48;
          v7 = v49;
          goto LABEL_33;
        }
      }

      if (!v13)
      {
        v17 = 0;
        v18 = 0;
        v8 = v48;
        v7 = v49;
        goto LABEL_39;
      }
      -[PGCurationManager curationCriteriaFactory](v50->_curationManager, "curationCriteriaFactory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v48;
      v7 = v49;
      objc_msgSend(v20, "curationCriteriaWithCollection:meaningLabel:inGraph:client:", v48, v13, v49, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "scenesTrait");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTargetNumberOfMatches:", 3);

      if (!v50->_collectsDebugInfo)
      {
        v17 = 0;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v46 = v19;
        v47 = v6;
        v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v23 = v10;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v52 != v26)
                objc_enumerationMutation(v23);
              v28 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
              if (v28 != v13
                && objc_msgSend(v9, "containsObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i)))
              {
                objc_msgSend(v22, "addObject:", v28);
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          }
          while (v25);
        }

        objc_msgSend(v22, "componentsJoinedByString:", CFSTR(") - ("));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringByAppendingFormat:", CFSTR(" - (%@)"), v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v47;
        v8 = v48;
        v7 = v49;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Meanings: %@"), v19);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
      v17 = 0;
      v18 = 0;
      v19 = v10;
    }
LABEL_33:

LABEL_39:
    self = v50;
    if (v18)
      goto LABEL_40;
    goto LABEL_42;
  }
  v30 = objc_msgSend(v8, "isPartOfTrip");
  -[PGCurationManager curationCriteriaFactory](self->_curationManager, "curationCriteriaFactory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!v30)
  {
    objc_msgSend(v6, "highlightTailorContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "curationContext");
    v41 = v8;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "petCurationCriteriaWithCollection:client:curationContext:", v41, 0, v42);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v41;
LABEL_35:
    v17 = 0;
    if (!v18)
      goto LABEL_42;
    goto LABEL_40;
  }
  objc_msgSend(v31, "tripCurationCriteriaWithCollection:client:", v8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "infoNode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topTierAestheticScoreForTripKeyAsset");
  v35 = v34;

  v36 = [PGCurationContentOrAestheticScoreTrait alloc];
  v37 = -[PGCurationContentOrAestheticScoreTrait initWithMinimumContentScore:minimumAestheticScore:](v36, "initWithMinimumContentScore:minimumAestheticScore:", *MEMORY[0x1E0D77DD8], v35);
  objc_msgSend(v18, "setContentOrAestheticScoreTrait:", v37);

  if (!self->_collectsDebugInfo)
    goto LABEL_35;
  v38 = objc_msgSend(v8, "isPartOfShortTrip");
  v39 = CFSTR("Part of Long Trip");
  if (v38)
    v39 = CFSTR("Part of Short Trip");
  v17 = v39;
  if (v18)
  {
LABEL_40:
    if (self->_collectsDebugInfo)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_debugInfos, "setObject:forKeyedSubscript:", v17, CFSTR("keyAssetReason"));
      objc_msgSend(v18, "niceDescriptionWithGraph:", v7);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_debugInfos, "setObject:forKeyedSubscript:", v43, CFSTR("keyAssetCurationCriteria"));

    }
  }
LABEL_42:
  v44 = v18;

  return v44;
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v4;
  int v5;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
    LOBYTE(v5) = 1;
  else
    v5 = objc_msgSend(v4, "isRecent") ^ 1;

  return v5;
}

- (id)highlightInfoWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  PGHighlightTailorHighlightInfo *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PGHighlightTailorHighlightInfo initWithHighlight:graph:highlightTailorContext:]([PGHighlightTailorHighlightInfo alloc], "initWithHighlight:graph:highlightTailorContext:", v9, v8, v7);

  return v10;
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  PGHighlightTitleGenerator *v19;
  PGDayHighlightTitleGenerator *v20;
  void *v21;
  id v22;
  void *v23;
  PGDayHighlightTitleGenerator *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PGHighlightTitleGenerator *v29;
  void *v30;
  void *v31;
  void *v32;
  PGHighlightTitleGenerator *v33;
  void *v34;
  void *v35;
  id v37;

  v9 = a7;
  v12 = a4;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  objc_msgSend(v14, "highlightNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGHighlightEnrichmentUtilities filteredMomentNodesWithHighlightNode:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredMomentNodesWithHighlightNode:forSharingFilter:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    if (!_os_feature_enabled_impl() || v9)
    {
      if (v9)
      {
        v29 = [PGHighlightTitleGenerator alloc];
        objc_msgSend(v14, "highlightNode");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "highlightTailorContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "titleGenerationContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PGHighlightTitleGenerator initWithCollection:filteredMomentNodes:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:](v29, "initWithCollection:filteredMomentNodes:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", v30, v18, 0, 0, 1, v32);
      }
      else
      {
        +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v15, objc_msgSend(v17, "sharingComposition"), v12);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v15;
        if (objc_msgSend(v30, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v30, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v31 = 0;
        }
        v33 = [PGHighlightTitleGenerator alloc];
        objc_msgSend(v14, "highlightNode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "highlightTailorContext");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "titleGenerationContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PGHighlightTitleGenerator initWithCollection:filteredMomentNodes:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:](v33, "initWithCollection:filteredMomentNodes:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", v32, v18, v31, v16, 0, v35);

        v15 = v37;
      }

      -[PGHighlightTitleGenerator titleTuple](v19, "titleTuple");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PGHighlightEnrichmentUtilities filteredSummarizedFeaturesForHighlightWithInfo:sharingFilter:](PGHighlightEnrichmentUtilities, "filteredSummarizedFeaturesForHighlightWithInfo:sharingFilter:", v14, v12);
      v19 = (PGHighlightTitleGenerator *)objc_claimAutoreleasedReturnValue();
      v20 = [PGDayHighlightTitleGenerator alloc];
      objc_msgSend(v14, "highlightTailorContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "titleGenerationContext");
      v22 = v15;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PGDayHighlightTitleGenerator initWithSummarizedFeatures:momentNodes:titleGenerationContext:loggingConnection:](v20, "initWithSummarizedFeatures:momentNodes:titleGenerationContext:loggingConnection:", v19, v18, v23, self->_loggingConnection);

      v15 = v22;
      -[PGDayHighlightTitleGenerator titleTuple](v24, "titleTuple");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  if (a8)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = (void *)MEMORY[0x1E0CB3940];
    PHDescriptionForSharingFilter();
    v19 = (PGHighlightTitleGenerator *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("No moment nodes for sharing filter %@"), v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDescription:", v28);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v25 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v25 = 0;
LABEL_16:

  return v25;
}

- (id)momentTitleByMomentUUIDWithHighlightInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PGTitleGenerator *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  PGTitleTuple *v17;
  void *v18;
  void *v20;
  id obj;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = v3;
  objc_msgSend(v3, "highlightTailorContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleGenerationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v6;
  objc_msgSend(v6, "locationHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v25)
  {
    v22 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        v9 = -[PGTitleGenerator initWithMomentNode:type:titleGenerationContext:]([PGTitleGenerator alloc], "initWithMomentNode:type:titleGenerationContext:", v28, 0, v23);
        -[PGTitleGenerator setPreferredTitleType:](v9, "setPreferredTitleType:", 2);
        -[PGTitleGenerator setLineBreakBehavior:](v9, "setLineBreakBehavior:", 2);
        -[PGTitleGenerator title](v9, "title");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGTitleGenerator subtitle](v9, "subtitle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        -[PGTitleGenerator usedLocationNodes](v9, "usedLocationNodes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v30;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v30 != v14)
                objc_enumerationMutation(v11);
              +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15), v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v10, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v13);
        }

        v17 = -[PGTitleTuple initWithWithTitle:subtitle:locationNames:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:locationNames:", v27, v26, v10);
        objc_msgSend(v28, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, v18);

        ++v8;
      }
      while (v8 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }

  return v24;
}

- (id)momentProcessedLocationByMomentUUIDWithHighlightInfo:(id)a3 graph:(id)a4
{
  id v5;
  id v6;
  PGGraphMomentNodeCollection *v7;
  void *v8;
  PGGraphMomentNodeCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  PGGraphMomentNodeCollection *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [PGGraphMomentNodeCollection alloc];
  objc_msgSend(v5, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAElementCollection initWithSet:graph:](v7, "initWithSet:graph:", v8, v6);

  v10 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode poiOfMoment](PGGraphMomentNode, "poiOfMoment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjacencyWithSources:relation:targetsClass:", v9, v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __89__PGDefaultEnrichmentProfile_momentProcessedLocationByMomentUUIDWithHighlightInfo_graph___block_invoke;
  v31[3] = &unk_1E8427D70;
  v14 = v13;
  v32 = v14;
  objc_msgSend(v12, "enumerateTargetsBySourceWithBlock:", v31);
  if (objc_msgSend(v14, "count"))
  {
    v25 = v9;
    v26 = v6;
    objc_msgSend(v5, "momentFetchResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v20, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 && objc_msgSend(v20, "processedLocation") != 6)
            objc_msgSend(v14, "removeObjectForKey:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v17);
    }
    if (objc_msgSend(v14, "count"))
      v23 = v14;
    else
      v23 = 0;
    v9 = v25;
    v6 = v26;

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "highlightNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGDefaultEnrichmentProfile targetEnrichmentState](self, "targetEnrichmentState");
  v7 = objc_msgSend(v4, "numberOfExtendedAssets");
  objc_msgSend(v4, "highlightTailorContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "neighborScoreComputer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHighlightNode promotionScoreWithHighlightNode:enrichmentState:numberOfExtendedAssets:neighborScoreComputer:](PGGraphHighlightNode, "promotionScoreWithHighlightNode:enrichmentState:numberOfExtendedAssets:neighborScoreComputer:", v5, v6, v7, v9);
  v11 = v10;

  return v11;
}

- (id)keyAssetWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 graph:(id)a5 progressBlock:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  double v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL8 v19;
  void *v20;
  PGKeyCurator_PHAsset *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double Current;
  char v30;
  PGKeyCurator_PHAsset *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  uint64_t v57;

  v8 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v35 = a5;
  v34 = a6;
  v11 = _Block_copy(v34);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x2020000000;
  v48 = 0;
  if (v11
    && (v12 = CFAbsoluteTimeGetCurrent(), v12 - v46[3] >= 0.01)
    && (v46[3] = v12,
        v44 = 0,
        (*((void (**)(void *, char *, double))v11 + 2))(v11, &v44, 0.0),
        v13 = *((_BYTE *)v50 + 24) | v44,
        (*((_BYTE *)v50 + 24) = v13) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v54 = 295;
      v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enr"
            "ichment Profile/PGDefaultEnrichmentProfile.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(v10, "assetsForSharingFilter:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      -[PGDefaultEnrichmentProfile keyAssetCurationOptions](self, "keyAssetCurationOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGDefaultEnrichmentProfile keyAssetCurationCriteriaWithHighlightInfo:graph:](self, "keyAssetCurationCriteriaWithHighlightInfo:graph:", v10, v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "highlight");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "type") == 5;

      if (v18)
      {
        v19 = +[PGUserDefaults useIconicScoreForTrips](PGUserDefaults, "useIconicScoreForTrips");
        objc_msgSend(v16, "setUseIconicScore:", v19);
        objc_msgSend(v16, "setAvoidPromotingAutoplayableItemsWhenUsingIconicScore:", v19);
      }
      if (self->_collectsDebugInfo)
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B140]), "initWithItems:", v15);
      else
        v20 = 0;
      v21 = [PGKeyCurator_PHAsset alloc];
      -[PGCurationManager curationCriteriaFactory](self->_curationManager, "curationCriteriaFactory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[PGKeyCurator initWithCurationCriteriaFactory:](v21, "initWithCurationCriteriaFactory:", v22);

      v23 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke;
      v39[3] = &unk_1E8434F30;
      v24 = v11;
      v40 = v24;
      v41 = &v45;
      v42 = &v49;
      v43 = 0x3F847AE147AE147BLL;
      -[PGKeyCurator_PHAsset keyAssetInAssets:options:criteria:debugInfo:progressBlock:](v32, "keyAssetInAssets:options:criteria:debugInfo:progressBlock:", v15, v16, v33, v20, v39);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v36[0] = v23;
        v36[1] = 3221225472;
        v36[2] = __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke_2;
        v36[3] = &unk_1E842D5F8;
        v37 = v33;
        v38 = v35;
        objc_msgSend(v20, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", v36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        objc_msgSend(v16, "dictionaryRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("curationOptions"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_debugInfos, "setObject:forKeyedSubscript:", v27, CFSTR("keyAsset"));
      }
      if (v11
        && (Current = CFAbsoluteTimeGetCurrent(), Current - v46[3] >= 0.01)
        && (v46[3] = Current,
            v44 = 0,
            (*((void (**)(id, char *, double))v24 + 2))(v24, &v44, 1.0),
            v30 = *((_BYTE *)v50 + 24) | v44,
            (*((_BYTE *)v50 + 24) = v30) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v54 = 339;
          v55 = 2080;
          v56 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich"
                "/Enrichment Profile/PGDefaultEnrichmentProfile.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v14 = 0;
      }
      else
      {
        v14 = v25;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v14;
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  -[PGDefaultEnrichmentProfile curationOptions](self, "curationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promotionScore");
  if (v8 == -1.0)
    -[PGDefaultEnrichmentProfile promotionScoreWithHighlightInfo:](self, "promotionScoreWithHighlightInfo:", v6);
  if (v8 > 0.4)
  {
    v9 = objc_msgSend((id)objc_opt_class(), "durationForSummary");
    v10 = v7;
LABEL_7:
    objc_msgSend(v10, "setDuration:", v9);
    goto LABEL_8;
  }
  if (v8 == 0.4)
  {
    v10 = v7;
    v9 = 12;
    goto LABEL_7;
  }
  if (v8 < 0.4)
  {
    objc_msgSend(v7, "setDuration:", 12);
    objc_msgSend(v7, "setFocusOnInterestingItems:", 1);
  }
LABEL_8:
  objc_msgSend(v6, "uuidsOfRequiredAssetsForSharingFilter:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v7, "setUuidsOfRequiredAssets:", v11);
  objc_msgSend(v6, "uuidsOfEligibleAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
    objc_msgSend(v7, "setUuidsOfEligibleAssets:", v13);

  }
  objc_msgSend(v7, "setSharingFilter:", v4);
  objc_msgSend(v7, "setUseDurationBasedCuration:", 1);
  objc_msgSend(v7, "setMinimumDuration:", 0.0);
  objc_msgSend((id)objc_opt_class(), "targetCurationDurationWithHighlightInfo:sharingFilter:options:", v6, v4, v7);
  objc_msgSend(v7, "setTargetDuration:");
  objc_msgSend(v7, "setFailIfMinimumDurationNotReached:", 0);

  return v7;
}

- (id)extendedCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  double v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PGDejunkerDeduper_PHAsset *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double Current;
  char v30;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v6 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a5;
  v9 = _Block_copy(v32);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (!v9
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v42[3] < 0.01)
    || (v42[3] = v10,
        v40 = 0,
        (*((void (**)(void *, char *, double))v9 + 2))(v9, &v40, 0.0),
        v11 = *((_BYTE *)v46 + 24) | v40,
        (*((_BYTE *)v46 + 24) = v11) == 0))
  {
    objc_msgSend(v8, "feeder", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_collectsDebugInfo)
    {
      v13 = objc_alloc(MEMORY[0x1E0D4B140]);
      objc_msgSend(v34, "allItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v13, "initWithItems:", v14);

    }
    else
    {
      v33 = 0;
    }
    -[PGDefaultEnrichmentProfile extendedCurationOptions](self, "extendedCurationOptions");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = -[PGDejunkerDeduperOptions initForCuratedLibrary]([PGDejunkerDeduperOptions alloc], "initForCuratedLibrary");
      objc_msgSend(v8, "uuidsOfRequiredAssetsForSharingFilter:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
        objc_msgSend(v15, "setIdentifiersOfRequiredItems:", v16);

    }
    v17 = -[PGDejunkerDeduper initWithSimilarityModelClass:]([PGDejunkerDeduper_PHAsset alloc], "initWithSimilarityModelClass:", objc_opt_class());
    -[PGDejunkerDeduper setLoggingConnection:](v17, "setLoggingConnection:", self->_loggingConnection);
    objc_msgSend(v34, "allItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "highlight");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v18, objc_msgSend(v19, "sharingComposition"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __92__PGDefaultEnrichmentProfile_extendedCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke;
    v35[3] = &unk_1E8434F30;
    v21 = v9;
    v36 = v21;
    v37 = &v41;
    v38 = &v45;
    v39 = 0x3F847AE147AE147BLL;
    -[PGDejunkerDeduper_PHAsset dejunkedDedupedAssetsInAssets:options:debugInfo:progressBlock:](v17, "dejunkedDedupedAssetsInAssets:options:debugInfo:progressBlock:", v20, v15, v33, v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (*((_BYTE *)v46 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v50 = 466;
        v51 = 2080;
        v52 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/PGDefaultEnrichmentProfile.m";
        v24 = MEMORY[0x1E0C81028];
LABEL_17:
        _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!objc_msgSend(v22, "count"))
      {
        v25 = v20;

        v23 = v25;
      }
      if (self->_collectsDebugInfo)
      {
        -[PGDefaultEnrichmentProfile debugInfoDictionaryByAddingItemInfosToDebugInfo:](self, "debugInfoDictionaryByAddingItemInfosToDebugInfo:", v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        objc_msgSend(v15, "dictionaryRepresentationRestrictingToGlobalOptions:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("curationOptions"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_debugInfos, "setObject:forKeyedSubscript:", v27, CFSTR("extended"));
      }
      if (!v9
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v42[3] < 0.01)
        || (v42[3] = Current,
            v40 = 0,
            (*((void (**)(id, char *, double))v21 + 2))(v21, &v40, 1.0),
            v30 = *((_BYTE *)v46 + 24) | v40,
            (*((_BYTE *)v46 + 24) = v30) == 0))
      {
        v23 = v23;
        v12 = v23;
        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v50 = 480;
        v51 = 2080;
        v52 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/PGDefaultEnrichmentProfile.m";
        v24 = MEMORY[0x1E0C81028];
        goto LABEL_17;
      }
    }
    v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_29:

    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v50 = 442;
    v51 = 2080;
    v52 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enric"
          "hment Profile/PGDefaultEnrichmentProfile.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_30:
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v12;
}

- (id)summaryCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  double v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  PGDejunkerDeduper_PHAsset *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  PGDefaultEnrichmentProfile *v34;
  PGCurator_PHAsset *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  double Current;
  char v59;
  void *v60;
  void (**v62)(id, _BYTE *, double);
  id v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  _QWORD v86[4];
  id v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  char v95;
  uint64_t v96;
  double *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint8_t v106[128];
  uint8_t buf[4];
  int v108;
  __int16 v109;
  const char *v110;
  uint64_t v111;

  v6 = a4;
  v111 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v100 = 0;
  v101 = &v100;
  v102 = 0x2020000000;
  v103 = 0;
  v96 = 0;
  v97 = (double *)&v96;
  v98 = 0x2020000000;
  v99 = 0;
  v70 = _Block_copy(v8);
  v71 = v7;
  v65 = v8;
  if (v70
    && (v9 = CFAbsoluteTimeGetCurrent(), v9 - v97[3] >= 0.01)
    && (v97[3] = v9,
        v95 = 0,
        (*((void (**)(void *, char *, double))v70 + 2))(v70, &v95, 0.0),
        v10 = *((_BYTE *)v101 + 24) | v95,
        (*((_BYTE *)v101 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v108 = 488;
      v109 = 2080;
      v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/En"
             "richment Profile/PGDefaultEnrichmentProfile.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "feeder");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highlightTailorContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "curationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v69, "allItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "highlightTailorContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topTierAestheticScore");
    +[PGMemoryGenerationHelper scoringContextForMemoriesWithAssets:withTopTierAestheticScore:](PGMemoryGenerationHelper, "scoringContextForMemoriesWithAssets:withTopTierAestheticScore:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v92 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          if (objc_msgSend(v22, "prepareWithAlternateJunkingHeuristics:withContext:curationContext:", 1, v16, v13))objc_msgSend(v17, "addObject:", v22);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
      }
      while (v19);
    }

    -[PGDefaultEnrichmentProfile curationOptionsWithHighlightInfo:sharingFilter:](self, "curationOptionsWithHighlightInfo:sharingFilter:", v71, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDuration:", 21);
    v72 = v23;
    v24 = -[PGDejunkerDeduperOptions initForMemories]([PGDejunkerDeduperOptions alloc], "initForMemories");
    objc_msgSend(v24, "setUseAllPersonsForDeduping:", 1);
    objc_msgSend(v23, "uuidsOfRequiredAssets");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIdentifiersOfRequiredItems:", v25);

    objc_msgSend(v72, "uuidsOfEligibleAssets");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIdentifiersOfEligibleItems:", v26);

    v27 = -[PGDejunkerDeduper initWithSimilarityModelClass:]([PGDejunkerDeduper_PHAsset alloc], "initWithSimilarityModelClass:", objc_opt_class());
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke;
    v86[3] = &unk_1E8434F30;
    v63 = v70;
    v87 = v63;
    v88 = &v96;
    v89 = &v100;
    v90 = 0x3F847AE147AE147BLL;
    -[PGDejunkerDeduper_PHAsset dejunkedDedupedAssetsInAssets:options:debugInfo:progressBlock:](v27, "dejunkedDedupedAssetsInAssets:options:debugInfo:progressBlock:", v18, v24, 0, v86);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = *((unsigned __int8 *)v101 + 24);
    if (*((_BYTE *)v101 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v108 = 517;
        v109 = 2080;
        v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/"
               "Enrichment Profile/PGDefaultEnrichmentProfile.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v28, "valueForKey:", CFSTR("uuid"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setWithArray:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setUuidsOfEligibleAssets:", v33);

    }
    if (v30)
    {
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v34 = self;
      v35 = objc_alloc_init(PGCurator_PHAsset);
      -[PGCurator setLoggingConnection:](v35, "setLoggingConnection:", self->_loggingConnection);
      if (self->_collectsDebugInfo)
      {
        v36 = objc_alloc(MEMORY[0x1E0D4B140]);
        objc_msgSend(v69, "allItems");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v36, "initWithItems:", v37);

        v34 = self;
      }
      else
      {
        v38 = 0;
      }
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke_240;
      v81[3] = &unk_1E8434F30;
      v39 = v63;
      v82 = v39;
      v83 = &v96;
      v84 = &v100;
      v85 = 0x3F847AE147AE147BLL;
      -[PGCurator_PHAsset bestAssetsForFeeder:options:debugInfo:progressBlock:](v35, "bestAssetsForFeeder:options:debugInfo:progressBlock:", v69, v72, v38, v81);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v101 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v108 = 529;
          v109 = 2080;
          v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enric"
                 "h/Enrichment Profile/PGDefaultEnrichmentProfile.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v11 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        if (v34->_collectsDebugInfo)
        {
          -[PGDefaultEnrichmentProfile debugInfoDictionaryByAddingItemInfosToDebugInfo:](v34, "debugInfoDictionaryByAddingItemInfosToDebugInfo:", v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v41, "mutableCopy");

          objc_msgSend(v72, "dictionaryRepresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("curationOptions"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_debugInfos, "setObject:forKeyedSubscript:", v42, CFSTR("curation"));
        }
        v62 = (void (**)(id, _BYTE *, double))v39;
        v64 = v40;
        if (v40 && objc_msgSend(v40, "count"))
        {
          v44 = objc_msgSend(v40, "count");
          objc_msgSend(v72, "uuidsOfRequiredAssets");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v44 == objc_msgSend(v45, "count");

          v47 = v64;
          if (v46)
          {
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v48 = v64;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v105, 16);
            if (v49)
            {
              v67 = v38;
              v50 = *(_QWORD *)v78;
              v47 = (void *)MEMORY[0x1E0C9AA60];
              while (2)
              {
                for (j = 0; j != v49; ++j)
                {
                  if (*(_QWORD *)v78 != v50)
                    objc_enumerationMutation(v48);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "clsIsUtility", v62) & 1) == 0)
                  {
                    v47 = v48;
                    goto LABEL_45;
                  }
                }
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v105, 16);
                if (v49)
                  continue;
                break;
              }
LABEL_45:
              v38 = v67;
            }
            else
            {
              v47 = (void *)MEMORY[0x1E0C9AA60];
            }

          }
          v52 = v47;
        }
        else
        {
          v52 = (id)MEMORY[0x1E0C9AA60];
        }
        v68 = v52;
        v53 = v38;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v54 = v17;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
        if (v55)
        {
          v56 = *(_QWORD *)v74;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v74 != v56)
                objc_enumerationMutation(v54);
              objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "prepareWithAlternateJunkingHeuristics:withContext:curationContext:", 0, v16, v13, v62);
            }
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v104, 16);
          }
          while (v55);
        }

        v38 = v53;
        if (v70
          && (Current = CFAbsoluteTimeGetCurrent(), Current - v97[3] >= 0.01)
          && (v97[3] = Current,
              v95 = 0,
              v62[2](v62, &v95, 1.0),
              v59 = *((_BYTE *)v101 + 24) | v95,
              (*((_BYTE *)v101 + 24) = v59) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v108 = 559;
            v109 = 2080;
            v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enr"
                   "ich/Enrichment Profile/PGDefaultEnrichmentProfile.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v11 = (id)MEMORY[0x1E0C9AA60];
          v60 = v68;
        }
        else
        {
          v60 = v68;
          v11 = v68;
        }

        v40 = v64;
      }

    }
  }
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);

  return v11;
}

- (id)debugInfoDictionaryByAddingItemInfosToDebugInfo:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  PGDefaultEnrichmentProfile *v12;

  v4 = (objc_class *)MEMORY[0x1E0D77E18];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PGDefaultEnrichmentProfile_debugInfoDictionaryByAddingItemInfosToDebugInfo___block_invoke;
  v10[3] = &unk_1E842D5F8;
  v11 = v6;
  v12 = self;
  v7 = v6;
  objc_msgSend(v5, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)faceInfosWithAsset:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _BYTE v37[128];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PGCurationManager photoLibrary](self->_curationManager, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = *MEMORY[0x1E0CD1B50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  v26 = v5;
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v9;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "faceClusteringProperties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "faceprint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v35[0] = CFSTR("personLocalIdentifier");
        objc_msgSend(v11, "personLocalIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = CFSTR("unknown");
        if (v14)
          v16 = (const __CFString *)v14;
        v36[0] = v16;
        v35[1] = CFSTR("size");
        v17 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "size");
        objc_msgSend(v17, "numberWithDouble:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v18;
        v35[2] = CFSTR("quality");
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "quality");
        objc_msgSend(v19, "numberWithDouble:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2] = v20;
        v35[3] = CFSTR("faceprint");
        objc_msgSend(v13, "faceprintData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v3;
        }
        v36[3] = v22;
        v35[4] = CFSTR("faceprintVersion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "faceprintVersion"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v36[4] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        objc_msgSend(v29, "addObject:", v24);

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v30);
  }

  return v29;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (BOOL)collectsDebugInfo
{
  return self->_collectsDebugInfo;
}

- (void)setCollectsDebugInfo:(BOOL)a3
{
  self->_collectsDebugInfo = a3;
}

- (NSDictionary)debugInfos
{
  return &self->_debugInfos->super;
}

- (PGDejunkerDeduperOptions)extendedCurationOptions
{
  return self->_extendedCurationOptions;
}

- (void)setExtendedCurationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_extendedCurationOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedCurationOptions, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_debugInfos, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __78__PGDefaultEnrichmentProfile_debugInfoDictionaryByAddingItemInfosToDebugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  void *v31;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[2];
  _QWORD v66[3];
  CLLocationCoordinate2D v67;

  v66[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "curationScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("persistedCurationScore"));

  objc_msgSend(v5, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("creationDate"));

  objc_msgSend(v5, "localCreationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("localCreationDate"));

  objc_msgSend(v5, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "coordinate");
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9E500];
    v16 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  v67.latitude = v14;
  v67.longitude = v16;
  if (CLLocationCoordinate2DIsValid(v67))
  {
    v65[0] = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = CFSTR("longitude");
    v66[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("location"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E84EB5B8, CFSTR("location"));
  }
  objc_msgSend(v5, "clsSceneprint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v64 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, &v64);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("sceneprint"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingVideo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("isInterestingVideo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingLivePhoto"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("isInterestingLivePhoto"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingPanorama"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("isInterestingPanorama"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingSDOF"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("isInterestingSDOF"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingHDR"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("isInterestingHDR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsHasInterestingAudioClassification"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("hasInterestingAudioClassification"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsHasCustomPlaybackVariation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("hasCustomPlaybackVariation"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsSharpnessScore");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("sharpnessScore"));

  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsExposureScore");
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("exposureScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsBlurry"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("isBlurry"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInhabited"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("isInhabited"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsHasInterestingScenes"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("hasInterestingScenes"));

  objc_msgSend(v5, "clsPersonLocalIdentifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("peopleNames"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isVideo"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("isVideo"));

  +[PGCurationManager sceneInfoWithAsset:curationSession:](PGCurationManager, "sceneInfoWithAsset:curationSession:", v5, *(_QWORD *)(a1 + 32));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("scenes"));

  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsBehavioralScore");
  objc_msgSend(v39, "numberWithFloat:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("behavioralScore"));

  v41 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsInteractionScore");
  objc_msgSend(v41, "numberWithFloat:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, CFSTR("interactionScore"));

  v43 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsHighlightVisibilityScore");
  objc_msgSend(v43, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("highlightVisibilityScore"));

  v45 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsAutoplaySuggestionScore");
  objc_msgSend(v45, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("autoplaySuggestionScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isShinyGem"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("isShinyGem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isRegularGem"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v48, CFSTR("isRegularGem"));

  v49 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsFaceScore");
  objc_msgSend(v49, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("faceScore"));

  objc_msgSend(*(id *)(a1 + 40), "faceInfosWithAsset:", v5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v51, CFSTR("faceInfos"));

  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsDuration");
  objc_msgSend(v52, "numberWithDouble:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsNonMemorable"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("isNonMemorable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsLoopOrBounce"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("isLoopOrBounce"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsLongExposure"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, CFSTR("isLongExposure"));

  v57 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "pl_gpsHorizontalAccuracy");
  objc_msgSend(v57, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("gpsHorizontalAccuracy"));

  v59 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsSquareCropScore");
  objc_msgSend(v59, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v60, CFSTR("squareCropScore"));

  objc_msgSend(v5, "clsFaceInformationSummary");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "dictionaryRepresentation");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v62, CFSTR("faceInformationSummary"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInSharedLibrary"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v63, CFSTR("isInSharedLibrary"));

}

void __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke_240(uint64_t a1, _BYTE *a2, double a3)
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

void __92__PGDefaultEnrichmentProfile_extendedCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v12 = 0;
    v13 = 0.0;
    v8 = objc_msgSend(v7, "passesForItem:score:graph:reasonString:", v5, &v13, *(_QWORD *)(a1 + 40), &v12);
    v9 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("passesCriteria"));

    if ((_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("criteriaScore"));

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("criteriaReason"));

  }
}

void __89__PGDefaultEnrichmentProfile_momentProcessedLocationByMomentUUIDWithHighlightInfo_graph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("Travel"));

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v10, "uuids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E84E27E0, v9);

  }
}

+ (unint64_t)durationForSummary
{
  return 13;
}

+ (double)targetCurationDurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 options:(id)a5
{
  double v5;
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;

  v7 = a4;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "highlight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sharingComposition");

  if (v12 == 2)
  {
    objc_msgSend(v9, "assetsForSharingFilter:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetsForSharingFilter:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "targetCurationDurationWithPrivateAssets:sharedAssets:sharingFilter:options:", v14, v15, v7, v10);
    v5 = v16;

    goto LABEL_10;
  }
  if (v12 == 1)
  {
    v13 = (_DWORD)v7 == 0;
  }
  else
  {
    if (v12)
      goto LABEL_10;
    v13 = (_DWORD)v7 == 1;
  }
  if (v13)
    v5 = 0.0;
  else
    v5 = 90.0;
LABEL_10:

  return v5;
}

+ (double)targetCurationDurationWithPrivateAssets:(id)a3 sharedAssets:(id)a4 sharingFilter:(unsigned __int16)a5 options:(id)a6
{
  int v6;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a1, "evaluatedDurationsWithAssets:options:", a3, v10);
  v13 = v12;
  objc_msgSend(a1, "evaluatedDurationsWithAssets:options:", v11, v10);
  v15 = v14;

  if (v6)
    v16 = v15;
  else
    v16 = v13;
  return v16 * 90.0 / (v13 + v15);
}

+ (double)evaluatedDurationsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  double v10;
  double v11;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a3, "assetsForSharingFilter:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "evaluatedDurationsWithAssets:options:", v9, v8);
  v11 = v10;

  return v11;
}

+ (double)evaluatedDurationsWithAssets:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  objc_msgSend(v24, "uuidsOfEligibleAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v25 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "containsObject:", v15);

          if (!v16)
            continue;
        }
        if (objc_msgSend(v14, "isVideo"))
        {
          ++v10;
        }
        else if (objc_msgSend(v14, "clsIsInterestingLivePhoto"))
        {
          ++v25;
        }
        else
        {
          ++v11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v25 = 0;
    v11 = 0;
  }

  objc_msgSend(v24, "defaultDurationOfStillPhoto");
  v18 = v17;
  objc_msgSend(v24, "defaultDurationOfLivePhoto");
  v20 = v19;
  objc_msgSend(v24, "defaultDurationOfVideo");
  v22 = v21;

  return v20 * (double)v25 + v18 * (double)v11 + v22 * (double)v10;
}

@end
