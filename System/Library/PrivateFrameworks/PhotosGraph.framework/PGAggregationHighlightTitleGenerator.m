@implementation PGAggregationHighlightTitleGenerator

- (PGAggregationHighlightTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PGAggregationHighlightTitleGenerator *v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v10, "isAggregation") & 1) != 0)
  {
    objc_msgSend(v10, "eventEnrichmentMomentNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "temporarySet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[PGAggregationHighlightTitleGenerator initWithMomentNodes:keyAsset:curatedAssetCollection:titleGenerationContext:](self, "initWithMomentNodes:keyAsset:curatedAssetCollection:titleGenerationContext:", v15, v11, v12, v13);
    v16 = self;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Collection is not an aggregation, can't use aggregation collection title generator", v20, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (PGAggregationHighlightTitleGenerator)initWithMomentNodes:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGAggregationHighlightTitleGenerator;
  return -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v7, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, a3, 0, a4, a5, a5, 0, a6);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *, _QWORD);

  v12 = (void (**)(id, void *, _QWORD))a3;
  -[PGTitleGenerator keyAsset](self, "keyAsset");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PGTitleGenerator curatedAssetCollection](self, "curatedAssetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PGTitleGenerator _addressNodeFromKeyAsset](self, "_addressNodeFromKeyAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleGenerator _addressNodesFromCuratedAssetCollection](self, "_addressNodesFromCuratedAssetCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGAggregationHighlightTitleGenerator _locationTitleUsingKeyAssetAddressNode:curationAddressNodes:](self, "_locationTitleUsingKeyAssetAddressNode:curationAddressNodes:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v9, 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      if (v12)
        v12[2](v12, v10, 0);

      goto LABEL_11;
    }
  }
  v11 = v12;
  if (v12)
  {
    v12[2](v12, 0, 0);
LABEL_11:
    v11 = v12;
  }

}

- (id)_locationTitleUsingKeyAssetAddressNode:(id)a3 curationAddressNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v9, "cityNodeFromAddressNode:", v6),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "anyNode"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v32 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v9, "cityNodeFromAddressNode:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "anyNode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v17) = objc_msgSend(v11, "isSameNodeAsNode:", v18);
          if (!(_DWORD)v17)
          {
            v19 = 1;
            goto LABEL_14;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v14)
          continue;
        break;
      }
    }
    v19 = 0;
LABEL_14:

    +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v11, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v19)
      v25 = CFSTR("PGAggregationHighlightTitleFormatOneLocationAndMore %@");
    else
      v25 = CFSTR("PGAggregationHighlightTitleFormatOneLocation %@");
    objc_msgSend(v23, "localizedStringForKey:value:table:", v25, v25, CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v26, v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = -[PGTitleGenerator lineBreakBehavior](self, "lineBreakBehavior");
    v37 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLocationTitleUtility _titleWithLineBreakBehavior:forTitle:titleComponents:](PGLocationTitleUtility, "_titleWithLineBreakBehavior:forTitle:titleComponents:", v28, v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v30;
    v7 = v32;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 0;
}

@end
