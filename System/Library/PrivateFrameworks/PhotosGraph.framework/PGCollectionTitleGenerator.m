@implementation PGCollectionTitleGenerator

- (PGCollectionTitleGenerator)initWithCollection:(id)a3 titleGenerationContext:(id)a4
{
  id v7;
  id v8;
  PGCollectionTitleGenerator *v9;
  PGCollectionTitleGenerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGCollectionTitleGenerator;
  v9 = -[PGCollectionTitleGenerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeStrong((id *)&v10->_titleGenerationContext, a4);
  }

  return v10;
}

- (PGCollectionTitleGenerator)initWithCollection:(id)a3 whitelistedMeaningLabels:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  PGCollectionTitleGenerator *v10;
  PGCollectionTitleGenerator *v11;

  v9 = a4;
  v10 = -[PGCollectionTitleGenerator initWithCollection:titleGenerationContext:](self, "initWithCollection:titleGenerationContext:", a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_whitelistedMeaningLabels, a4);

  return v11;
}

- (PGCollectionTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v11;
  id v12;
  PGCollectionTitleGenerator *v13;
  PGCollectionTitleGenerator *v14;

  v11 = a4;
  v12 = a5;
  v13 = -[PGCollectionTitleGenerator initWithCollection:titleGenerationContext:](self, "initWithCollection:titleGenerationContext:", a3, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_keyAsset, a4);
    objc_storeStrong((id *)&v14->_curatedAssetCollection, a5);
  }

  return v14;
}

- (PGTitleTuple)titleTuple
{
  PGTitleTuple *titleTuple;

  titleTuple = self->_titleTuple;
  if (!titleTuple)
  {
    -[PGCollectionTitleGenerator _generateTitleTuples](self, "_generateTitleTuples");
    titleTuple = self->_titleTuple;
  }
  return titleTuple;
}

- (void)_generateTitleTuples
{
  void *v3;
  PGTripCollectionTitleGenerator *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  PGMeaningfulEventTitleGenerator *v10;
  void *v11;
  void *v12;
  PGTitleTuple *v13;
  PGTitleTuple *titleTuple;
  PGTripCollectionTitleGenerator *v15;
  PGTripCollectionTitleGenerator *v16;

  -[PGCollectionTitleGenerator collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTrip"))
  {
    v4 = -[PGDefaultCollectionTitleGenerator initWithCollection:keyAsset:curatedAssetCollection:titleGenerationContext:]([PGTripCollectionTitleGenerator alloc], "initWithCollection:keyAsset:curatedAssetCollection:titleGenerationContext:", self->_collection, self->_keyAsset, self->_curatedAssetCollection, self->_titleGenerationContext);
  }
  else
  {
    -[PGCollectionTitleGenerator _meaningLabelForTitle](self, "_meaningLabelForTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!-[NSSet count](self->_whitelistedMeaningLabels, "count")
       || -[NSSet containsObject:](self->_whitelistedMeaningLabels, "containsObject:", v5))
      && (+[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "containsObject:", v5), v6, v7))
    {
      -[PGEventEnrichment reliableMeaningLabels](self->_collection, "reliableMeaningLabels");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v5);

      v10 = -[PGMeaningfulEventTitleGenerator initWithCollection:meaningLabel:meaningIsReliable:titleGenerationContext:]([PGMeaningfulEventTitleGenerator alloc], "initWithCollection:meaningLabel:meaningIsReliable:titleGenerationContext:", self->_collection, v5, v9, self->_titleGenerationContext);
    }
    else
    {
      v10 = -[PGDefaultCollectionTitleGenerator initWithCollection:keyAsset:curatedAssetCollection:titleGenerationContext:]([PGDefaultCollectionTitleGenerator alloc], "initWithCollection:keyAsset:curatedAssetCollection:titleGenerationContext:", self->_collection, self->_keyAsset, self->_curatedAssetCollection, self->_titleGenerationContext);
    }
    v15 = (PGTripCollectionTitleGenerator *)v10;

    v4 = v15;
  }
  v16 = v4;
  -[PGDefaultCollectionTitleGenerator setForDiagnostics:](v4, "setForDiagnostics:", self->_forDiagnostics);
  -[PGTitleGenerator title](v16, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerator subtitle](v16, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", &stru_1E8436F28, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v11, v12);
  titleTuple = self->_titleTuple;
  self->_titleTuple = v13;

}

- (id)_meaningLabelForTitle
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PGEventEnrichment meaningLabels](self->_collection, "meaningLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PGCollectionTitleGenerator _sortedMeaningLabels](self, "_sortedMeaningLabels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v3, "containsObject:", v8))
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_sortedMeaningLabels
{
  if (_sortedMeaningLabels_onceToken != -1)
    dispatch_once(&_sortedMeaningLabels_onceToken, &__block_literal_global_15750);
  return (id)_sortedMeaningLabels_sortedLabels;
}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (void)setTitleTuple:(id)a3
{
  objc_storeStrong((id *)&self->_titleTuple, a3);
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_keyAsset, a3);
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (void)setCuratedAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_curatedAssetCollection, a3);
}

- (BOOL)forDiagnostics
{
  return self->_forDiagnostics;
}

- (void)setForDiagnostics:(BOOL)a3
{
  self->_forDiagnostics = a3;
}

- (NSSet)whitelistedMeaningLabels
{
  return self->_whitelistedMeaningLabels;
}

- (void)setWhitelistedMeaningLabels:(id)a3
{
  objc_storeStrong((id *)&self->_whitelistedMeaningLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedMeaningLabels, 0);
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_titleTuple, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

uint64_t __50__PGCollectionTitleGenerator__sortedMeaningLabels__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99DE8];
  +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_sortedMeaningLabels_sortedLabels;
  _sortedMeaningLabels_sortedLabels = v2;

  objc_msgSend((id)_sortedMeaningLabels_sortedLabels, "removeObject:", CFSTR("HolidayEvent"));
  return objc_msgSend((id)_sortedMeaningLabels_sortedLabels, "addObject:", CFSTR("HolidayEvent"));
}

@end
