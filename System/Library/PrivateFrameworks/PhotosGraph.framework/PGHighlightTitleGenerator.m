@implementation PGHighlightTitleGenerator

- (PGHighlightTitleGenerator)initWithCollection:(id)a3 curatedAssetCollection:(id)a4 keyAsset:(id)a5 createVerboseTitle:(BOOL)a6 titleGenerationContext:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PGHighlightTitleGenerator *v17;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "eventEnrichmentMomentNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGHighlightTitleGenerator initWithCollection:filteredMomentNodes:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:](self, "initWithCollection:filteredMomentNodes:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", v15, v16, v14, v13, v7, v12);

  return v17;
}

- (PGHighlightTitleGenerator)initWithCollection:(id)a3 filteredMomentNodes:(id)a4 curatedAssetCollection:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 titleGenerationContext:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PGHighlightTitleGenerator *v18;
  PGHighlightTitleGenerator *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PGHighlightTitleGenerator;
  v18 = -[PGHighlightTitleGenerator init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_collection, a3);
    objc_storeStrong((id *)&v19->_momentNodes, a4);
    objc_storeStrong((id *)&v19->_curatedAssetCollection, a5);
    objc_storeStrong((id *)&v19->_keyAsset, a6);
    v19->_createVerboseTitle = a7;
    objc_storeStrong((id *)&v19->_titleGenerationContext, a8);
  }

  return v19;
}

- (PGTitleTuple)titleTuple
{
  PGTitleTuple *titleTuple;

  titleTuple = self->_titleTuple;
  if (!titleTuple)
  {
    -[PGHighlightTitleGenerator _generateTitleTuples](self, "_generateTitleTuples");
    titleTuple = self->_titleTuple;
  }
  return titleTuple;
}

- (void)_generateTitleTuples
{
  void *v3;
  PGTitleTuple *titleTuple;
  void *v5;
  PGSpecBasedHighlightTitleGenerator *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  PGSpecBasedHighlightTitleGenerator *v16;
  void *v17;
  PGTitleGenerator *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  PGTitleTuple *v23;
  PGTitleTuple *v24;
  uint8_t buf[16];

  -[PGHighlightTitleGenerator collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAggregation"))
  {
    titleTuple = self->_titleTuple;
    self->_titleTuple = 0;

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = (PGSpecBasedHighlightTitleGenerator *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, &v6->super.super, OS_LOG_TYPE_INFO, "Collection is aggregation, skipping title generation", buf, 2u);
    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v3, "isTrip"))
  {
    -[MAElementCollection temporarySet](self->_momentNodes, "temporarySet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "commonMeaningLabelForTitleUsingMomentNodes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_15;
    +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v8);

    if (!v10)
      goto LABEL_15;
    if (+[PGUserDefaults isAlwaysShowingHolidayCalendarEvents](PGUserDefaults, "isAlwaysShowingHolidayCalendarEvents"))
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HolidayEvent")) & 1) == 0)
      {
LABEL_14:
        v6 = -[PGSpecBasedHighlightTitleGenerator initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:]([PGSpecBasedHighlightTitleGenerator alloc], "initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:", v7, v8, self->_createVerboseTitle, self->_titleGenerationContext);
        if (v6)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_15:
        -[PGGraphMomentNodeCollection publicEventNodes](self->_momentNodes, "publicEventNodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "categoryNodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGTitleGenerationContext appleEventsCategoryNodes](self->_titleGenerationContext, "appleEventsCategoryNodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "intersectsCollection:", v14);

        if (!v15
          || (v16 = [PGSpecBasedHighlightTitleGenerator alloc],
              objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v6 = -[PGSpecBasedHighlightTitleGenerator initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:](v16, "initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:", v7, v17, self->_createVerboseTitle, self->_titleGenerationContext), v17, !v6))
        {
          v18 = [PGTitleGenerator alloc];
          -[PGHighlightTitleGenerator keyAsset](self, "keyAsset");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](v18, "initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:", v7, 0, v19, self->_curatedAssetCollection, self->_curatedAssetCollection, 0, self->_titleGenerationContext);

          -[PGTitleGenerator setIsForHighlight:](v6, "setIsForHighlight:", 1);
        }
        goto LABEL_18;
      }
    }
    else
    {
      v11 = +[PGUserDefaults isShowingHolidayCalendarEvents](PGUserDefaults, "isShowingHolidayCalendarEvents");
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HolidayEvent")) & 1) == 0)
        goto LABEL_14;
      if (!v11)
        goto LABEL_15;
    }
    if (self->_createVerboseTitle)
      goto LABEL_15;
    goto LABEL_14;
  }
  v6 = -[PGTripHighlightTitleGenerator initWithCollection:titleGenerationContext:]([PGTripHighlightTitleGenerator alloc], "initWithCollection:titleGenerationContext:", v3, self->_titleGenerationContext);
LABEL_19:
  -[PGTitleGenerator setLineBreakBehavior:](v6, "setLineBreakBehavior:", 2);
  if (self->_createVerboseTitle)
    v20 = 3;
  else
    v20 = 2;
  -[PGTitleGenerator setPreferredTitleType:](v6, "setPreferredTitleType:", v20);
  -[PGTitleGenerator title](v6, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", &stru_1E8436F28, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v21, v22);
  v24 = self->_titleTuple;
  self->_titleTuple = v23;

LABEL_23:
}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_momentNodes, a3);
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (void)setCuratedAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_curatedAssetCollection, a3);
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_keyAsset, a3);
}

- (void)setTitleTuple:(id)a3
{
  objc_storeStrong((id *)&self->_titleTuple, a3);
}

- (BOOL)createVerboseTitle
{
  return self->_createVerboseTitle;
}

- (void)setCreateVerboseTitle:(BOOL)a3
{
  self->_createVerboseTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTuple, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

+ (id)commonMeaningLabelForTitleUsingMomentNodes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v25 = a1;
  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v3;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  v5 = 0;
  if (v28)
  {
    v27 = *(_QWORD *)v43;
    do
    {
      v6 = 0;
      do
      {
        v30 = v5;
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(obj);
        v29 = v6;
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "numberOfAssets", v25);
        objc_msgSend(v7, "meaningLabels");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v39 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v4, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + v8);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v14);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v11);
        }
        v5 = v8 + v30;

        v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v28);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __72__PGHighlightTitleGenerator_commonMeaningLabelForTitleUsingMomentNodes___block_invoke;
  v35[3] = &unk_1E842B5A8;
  v37 = v5;
  v18 = v17;
  v36 = v18;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v35);
  objc_msgSend((id)objc_opt_class(), "meaningLabelsSortedByPriority");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v32;
    while (2)
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v18, "containsObject:", v23, v25))
        {
          v20 = v23;
          goto LABEL_25;
        }
      }
      v20 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_25:

  return v20;
}

+ (id)meaningLabelsSortedByPriority
{
  if (meaningLabelsSortedByPriority_onceToken != -1)
    dispatch_once(&meaningLabelsSortedByPriority_onceToken, &__block_literal_global_15578);
  return (id)meaningLabelsSortedByPriority_sortedLabels;
}

void __58__PGHighlightTitleGenerator_meaningLabelsSortedByPriority__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", CFSTR("Birthday"), CFSTR("HolidayEvent"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)meaningLabelsSortedByPriority_sortedLabels;
  meaningLabelsSortedByPriority_sortedLabels = v0;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObjectsInArray:", meaningLabelsSortedByPriority_sortedLabels);
  objc_msgSend((id)meaningLabelsSortedByPriority_sortedLabels, "addObjectsFromArray:", v4);

}

void __72__PGHighlightTitleGenerator_commonMeaningLabelForTitleUsingMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  v6 = v5 / (double)*(unint64_t *)(a1 + 40);
  if (v6 >= 0.75 || v6 >= 0.5 && objc_msgSend(v7, "isEqualToString:", CFSTR("Birthday")))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

@end
