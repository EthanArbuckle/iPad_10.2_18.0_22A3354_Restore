@implementation PGAggregationEnrichmentProfile

- (PGAggregationEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4
{
  PGAggregationEnrichmentProfile *v4;
  PLDateRangeTitleGenerator *v5;
  PLDateRangeTitleGenerator *dateRangeTitleGenerator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGAggregationEnrichmentProfile;
  v4 = -[PGDayGroupAbstractEnrichmentProfile initWithCurationManager:loggingConnection:](&v8, sel_initWithCurationManager_loggingConnection_, a3, a4);
  if (v4)
  {
    v5 = (PLDateRangeTitleGenerator *)objc_alloc_init(MEMORY[0x1E0D716B8]);
    dateRangeTitleGenerator = v4->_dateRangeTitleGenerator;
    v4->_dateRangeTitleGenerator = v5;

  }
  return v4;
}

- (id)identifier
{
  return CFSTR("Aggregation Enrichment Profile");
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  return objc_msgSend(a3, "type") == 3;
}

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "childHighlights", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "promotionScore");
        if (v7 < v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PGAggregationHighlightTitleGenerator *v18;
  void *v19;
  void *v20;
  void *v21;
  PGAggregationHighlightTitleGenerator *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PGTitleTuple *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[3];

  v11 = a4;
  v47[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v46 = a6;
  v13 = a5;
  objc_msgSend(v12, "highlightNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v13, objc_msgSend(v14, "sharingComposition"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  +[PGHighlightEnrichmentUtilities filteredMomentNodesWithHighlightNode:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredMomentNodesWithHighlightNode:forSharingFilter:", v14, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v14;
  if (objc_msgSend(v17, "count"))
  {
    v44 = v16;
    v18 = [PGAggregationHighlightTitleGenerator alloc];
    objc_msgSend(v17, "temporarySet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "highlightTailorContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "titleGenerationContext");
    v42 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PGAggregationHighlightTitleGenerator initWithMomentNodes:keyAsset:curatedAssetCollection:titleGenerationContext:](v18, "initWithMomentNodes:keyAsset:curatedAssetCollection:titleGenerationContext:", v19, v46, v44, v21);

    -[PGTitleGenerator setLineBreakBehavior:](v22, "setLineBreakBehavior:", 2);
    -[PGTitleGenerator setPreferredTitleType:](v22, "setPreferredTitleType:", 2);
    -[PGTitleGenerator title](v22, "title");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "sortedArrayUsingDescriptors:", v40);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localCreationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localCreationDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLDateRangeTitleGenerator dateRangeTitleWithStartDate:endDate:category:kind:type:](self->_dateRangeTitleGenerator, "dateRangeTitleWithStartDate:endDate:category:kind:type:", v27, v29, 0, 3, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v41, v31);

    v16 = v44;
    v12 = v42;

  }
  else
  {
    if (a8)
    {
      v33 = v16;
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = (void *)MEMORY[0x1E0CB3940];
      PHDescriptionForSharingFilter();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("No moment nodes for sharing filter %@"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v34;
      v16 = v33;
      objc_msgSend(v38, "errorWithDescription:", v37);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v32 = 0;
  }

  return v32;
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  PGCurationOptions *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 12);
  -[PGCurationOptions setSemanticalDedupingEnabled:](v6, "setSemanticalDedupingEnabled:", 1);
  -[PGCurationOptions setMovieDedupingEnabled:](v6, "setMovieDedupingEnabled:", 1);
  -[PGCurationOptions setLastPassMovieAdditionEnabled:](v6, "setLastPassMovieAdditionEnabled:", 0);
  -[PGCurationOptions setFocusOnInterestingItems:](v6, "setFocusOnInterestingItems:", 1);
  objc_msgSend(v5, "uuidsOfRequiredAssetsForSharingFilter:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    -[PGCurationOptions setUuidsOfRequiredAssets:](v6, "setUuidsOfRequiredAssets:", v7);

  return v6;
}

- (PLDateRangeTitleGenerator)dateRangeTitleGenerator
{
  return self->_dateRangeTitleGenerator;
}

- (void)setDateRangeTitleGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_dateRangeTitleGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangeTitleGenerator, 0);
}

@end
