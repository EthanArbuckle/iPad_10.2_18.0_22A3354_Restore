@implementation PXSearchResultsViewModel

- (PXSearchResultsViewModel)initWithSectionedDataSourceManager:(id)a3 configurationType:(unint64_t)a4
{
  id v6;
  PXSearchResultsViewModel *v7;
  PXSearchResultsViewModel *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSearchResultsViewModel;
  v7 = -[PXSearchResultsViewModel init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PXSearchResultsViewModel setDataSourceManager:](v7, "setDataSourceManager:", v6);
    -[PXSearchResultsViewModel setConfigurationType:](v8, "setConfigurationType:", a4);
  }

  return v8;
}

- (PXSearchResultsViewModel)initWithSearchSectionedDataSource:(id)a3 configurationType:(unint64_t)a4
{
  id v6;
  PXSearchResultsViewModel *v7;
  PXSearchResultsSectionedDataSourceManager *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSearchResultsViewModel;
  v7 = -[PXSearchResultsViewModel init](&v10, sel_init);
  if (v7)
  {
    v8 = -[PXSearchResultsSectionedDataSourceManager initWithSearchSectionedDataSource:]([PXSearchResultsSectionedDataSourceManager alloc], "initWithSearchSectionedDataSource:", v6);
    -[PXSearchResultsViewModel setDataSourceManager:](v7, "setDataSourceManager:", v8);

    -[PXSearchResultsViewModel setConfigurationType:](v7, "setConfigurationType:", a4);
  }

  return v7;
}

- (void)fetchImageForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  PXPeopleFaceCropFetchOptions *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a6;
  v12 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v10, width, height, a5);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__PXSearchResultsViewModel_fetchImageForPerson_targetSize_displayScale_completion___block_invoke;
  v16[3] = &unk_1E51426A0;
  v17 = v10;
  v18 = v11;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v13, "requestFaceCropForOptions:resultHandler:", v12, v16);

}

- (unint64_t)sectionTypeForSection:(int64_t)a3
{
  unint64_t v5;
  NSObject *v7;
  BOOL v8;
  int v9;
  int64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Results View Model: Requested section type for invalid section: %lu, for config type %lu", (uint8_t *)&v9, 0x16u);
    }

    return 3;
  }
  if (-[PXSearchResultsViewModel hasNoResults](self, "hasNoResults"))
    return 3;
  v5 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
  if (!v5)
  {
    v8 = -[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
    if (a3 || !v8)
      goto LABEL_5;
    return 0;
  }
  if (v5 != 3)
    return 0;
LABEL_5:
  if (-[PXSearchResultsViewModel _sectionIsTopAssetsSection:](self, "_sectionIsTopAssetsSection:", a3))
    return 1;
  else
    return 2;
}

- (unint64_t)rowTypeForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", objc_msgSend(v4, "section")))
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134218240;
      v10 = objc_msgSend(v4, "section");
      v11 = 2048;
      v12 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Results View Model: Requested row type for invalid section: %lu, for config type %lu", (uint8_t *)&v9, 0x16u);
    }

    goto LABEL_10;
  }
  v5 = -[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", objc_msgSend(v4, "section"));
  if (v5 == 3)
  {
LABEL_10:
    v6 = 5;
    goto LABEL_11;
  }
  if (v5 == 2)
  {
    v6 = 4;
  }
  else if (v5)
  {
    v6 = 3;
  }
  else if (-[PXSearchResultsViewModel _resultsAreWordEmbeddingsOnly](self, "_resultsAreWordEmbeddingsOnly"))
  {
    v6 = objc_msgSend(v4, "row") != 0;
  }
  else
  {
    v6 = 2;
  }
LABEL_11:

  return v6;
}

- (int64_t)startingSectionNumberForType:(unint64_t)a3
{
  if (-[PXSearchResultsViewModel hasNoResults](self, "hasNoResults"))
    return -1;
  if (a3 == 2)
  {
    if (-[PXSearchResultsViewModel _resultsAreWordEmbeddingsOnly](self, "_resultsAreWordEmbeddingsOnly")
      || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 2
      || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 1)
    {
      return -1;
    }
    if (-[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions"))
      return 2;
    else
      return 1;
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3 && -[PXSearchResultsViewModel configurationType](self, "configurationType") != 3)
        return -[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions") - 1;
      return -1;
    }
    if (-[PXSearchResultsViewModel _resultsAreWordEmbeddingsOnly](self, "_resultsAreWordEmbeddingsOnly")
      || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 2
      || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 1)
    {
      return -1;
    }
    return -[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
  }
}

- (void)searchResultDataForIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, void *, void *, void *, void *, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, void *, void *, void *, void *, uint64_t))a4;
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", objc_msgSend(v6, "section")))
  {
    -[PXSearchResultsViewModel searchResultAtIndexPath:](self, "searchResultAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchResultsDataUtility titleForSearchResult:](PXSearchResultsDataUtility, "titleForSearchResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchResultsDataUtility subtitleForSearchResult:](PXSearchResultsDataUtility, "subtitleForSearchResult:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "approximateCount");
    PLSharedCountFormatter();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "assetUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "assets");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "person");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, v10, v14, v18, v16, v19, objc_msgSend(v8, "approximateCount"));

  }
  else
  {
    PXAssertGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = 134218240;
      v22 = objc_msgSend(v6, "section");
      v23 = 2048;
      v24 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Results View Model: Requested result data for invalid section: %lu, for config type %lu", (uint8_t *)&v21, 0x16u);
    }

    v7[2](v7, 0, 0, 0, 0, 0, 0, 0);
  }

}

- (id)thumbnailAssetsForResultIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", objc_msgSend(v11, "section", (_QWORD)v17)) != 1)
        {
          -[PXSearchResultsViewModel searchResultAtIndexPath:](self, "searchResultAtIndexPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "assets");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

- (int64_t)numberOfSections
{
  void *v3;
  void *v4;
  int64_t v5;
  unint64_t v6;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchResultsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  v6 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
  if (v6 - 1 < 2)
    return -[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
  if (!v6)
    v5 += -[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
  return v5;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchResultsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchQueryMatchInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSearchQueryMatchInfo *)v4;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = a3;
      v12 = 2048;
      v13 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Results View Model: Requested number of rows in invalid section: %lu, for config type %lu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  v5 = -[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", a3);
  v6 = -[PXSearchResultsViewModel _displayableSuggestionCount](self, "_displayableSuggestionCount");
  v7 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
  if (v7)
  {
    if (v7 != 3)
    {
      if (v7 != 1)
        return v6;
      goto LABEL_12;
    }
    if (v5 != 3)
      return -[PXSearchResultsViewModel numberOfVisibleSearchResultsInSection:](self, "numberOfVisibleSearchResultsInSection:", a3);
    return 0;
  }
  if (v5 == 3)
    return 0;
  if (!v5)
  {
LABEL_12:
    v6 += -[PXSearchResultsViewModel _resultsAreWordEmbeddingsOnly](self, "_resultsAreWordEmbeddingsOnly");
    return v6;
  }
  return -[PXSearchResultsViewModel numberOfVisibleSearchResultsInSection:](self, "numberOfVisibleSearchResultsInSection:", a3);
}

- (BOOL)hasDisplayableSuggestions
{
  return -[PXSearchResultsViewModel _displayableSuggestionCount](self, "_displayableSuggestionCount") != 0;
}

- (id)expandSection:(int64_t)a3
{
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  int64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    v5 = -[PXSearchResultsViewModel numberOfVisibleSearchResultsInSection:](self, "numberOfVisibleSearchResultsInSection:", a3);
    v6 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
    if ((v6 & 0x8000000000000000) == 0)
    {
      v7 = v6;
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchResultsDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "expandSection:", v7);

    }
    v10 = (void *)objc_opt_new();
    v11 = -[PXSearchResultsViewModel numberOfVisibleSearchResultsInSection:](self, "numberOfVisibleSearchResultsInSection:", a3);
    if (v5 < v11)
    {
      v12 = v11;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5, a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        ++v5;
      }
      while (v12 != v5);
    }
    v14 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 134218240;
      v18 = a3;
      v19 = 2048;
      v20 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Results View Model: Requested to expland invalid section: %lu, for config type %lu", (uint8_t *)&v17, 0x16u);
    }

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v14;
}

- (id)collapseSection:(int64_t)a3
{
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  int64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    v5 = -[PXSearchResultsViewModel numberOfVisibleSearchResultsInSection:](self, "numberOfVisibleSearchResultsInSection:", a3);
    v6 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
    if ((v6 & 0x8000000000000000) == 0)
    {
      v7 = v6;
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchResultsDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collapseSection:", v7);

    }
    v10 = (void *)objc_opt_new();
    v11 = -[PXSearchResultsViewModel numberOfVisibleSearchResultsInSection:](self, "numberOfVisibleSearchResultsInSection:", a3);
    if (v11 < v5)
    {
      v12 = v11;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v12, a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        ++v12;
      }
      while (v5 != v12);
    }
    v14 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 134218240;
      v18 = a3;
      v19 = 2048;
      v20 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Results View Model: Requested to collapse invalid section: %lu, for config type %lu", (uint8_t *)&v17, 0x16u);
    }

    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v14;
}

- (BOOL)sectionIsExpandable:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  NSObject *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    v5 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v6 = v5;
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResultsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v8, "isSectionExpandable:", v6);

      return v6;
    }
  }
  else
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218240;
      v12 = a3;
      v13 = 2048;
      v14 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Results View Model: Requested if section is expandable section: %lu, for config type %lu", (uint8_t *)&v11, 0x16u);
    }

  }
  return 0;
}

- (BOOL)sectionIsExpanded:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  NSObject *v10;
  int v11;
  int64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    v5 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v6 = v5;
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResultsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v8, "isSectionExpanded:", v6);

      return v6;
    }
  }
  else
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218240;
      v12 = a3;
      v13 = 2048;
      v14 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Results View Model: Requested if section is expanded section: %lu, for config type %lu", (uint8_t *)&v11, 0x16u);
    }

  }
  return 0;
}

- (id)searchResultAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", objc_msgSend(v4, "section")))
  {
    -[PXSearchResultsViewModel _adjustedIndexPathForIndexPath:](self, "_adjustedIndexPathForIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchResultsDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResultAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = v4;
      v13 = 2048;
      v14 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Results View Model: Requested search value for invalid indexPath: %@, for config type %lu", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)topAssetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", objc_msgSend(v4, "section")))
  {
    -[PXSearchResultsViewModel _adjustedIndexPathForIndexPath:](self, "_adjustedIndexPathForIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", objc_msgSend(v5, "section")) == 1)
    {
      -[PXSearchResultsViewModel topAssetsSearchResult](self, "topAssetsSearchResult");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAssetsFetchResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v4, "row");
      if (v8 >= objc_msgSend(v7, "count"))
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v7, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v4;
      v14 = 2048;
      v15 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Results View Model: Requested search value for invalid indexPath: %@, for config type %lu", (uint8_t *)&v12, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

- (int64_t)numberOfVisibleSearchResultsInSection:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v11;
  int v12;
  int64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    v5 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v6 = v5;
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResultsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfVisibleSearchResultsInSection:", v6);

      return v9;
    }
  }
  else
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Results View Model: Requested number of search results for invalid section: %lu, for config type %lu", (uint8_t *)&v12, 0x16u);
    }

  }
  return 0;
}

- (int64_t)numberOfSearchResultsInSection:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v11;
  int v12;
  int64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    v5 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v6 = v5;
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResultsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfSearchResultsInSection:", v6);

      return v9;
    }
  }
  else
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Results View Model: Requested number of search results for invalid section: %lu, for config type %lu", (uint8_t *)&v12, 0x16u);
    }

  }
  return 0;
}

- (id)allSearchResultsForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = a3;
      v12 = 2048;
      v13 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Results View Model: Requested number of rows in invalid section: %lu, for config type %lu", (uint8_t *)&v10, 0x16u);
    }

    goto LABEL_7;
  }
  if (-[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", a3) != 2)
  {
LABEL_7:
    v7 = 0;
    return v7;
  }
  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchResultsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allSearchResultsForSection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)titleForHeaderInSection:(int64_t)a3 accessibilityIdentifier:(id *)a4
{
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  int64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218240;
      v15 = a3;
      v16 = 2048;
      v17 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Results View Model: Requested title for invalid section: %lu, for config type %lu", (uint8_t *)&v14, 0x16u);
    }

    goto LABEL_7;
  }
  v7 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
  if (v7 < 0)
  {
LABEL_7:
    v11 = 0;
    return v11;
  }
  v8 = v7;
  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchResultsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleForHeaderInSection:accessibilityIdentifier:", v8, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)titleForHeaderButtonInSection:(int64_t)a3
{
  __CFString *v5;
  NSObject *v6;
  void *v7;
  int v9;
  int64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Results View Model: Requested title for header button for invalid section: %lu, for config type %lu", (uint8_t *)&v9, 0x16u);
    }

    goto LABEL_12;
  }
  if (-[PXSearchResultsViewModel sectionIsExpandable:](self, "sectionIsExpandable:", a3))
  {
    if (-[PXSearchResultsViewModel sectionIsExpanded:](self, "sectionIsExpanded:", a3))
      v5 = CFSTR("SEARCH_RESULTS_SECTION_SEE_LESS_BUTTON");
    else
      v5 = CFSTR("SEARCH_RESULTS_SECTION_SEE_ALL_BUTTON");
    goto LABEL_11;
  }
  if (-[PXSearchResultsViewModel sectionTypeForSection:](self, "sectionTypeForSection:", a3) != 1)
  {
LABEL_12:
    v7 = 0;
    return v7;
  }
  v5 = CFSTR("SEARCH_RESULTS_SECTION_SEE_ALL_BUTTON");
LABEL_11:
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)shouldDisplayHeaderViewForSection:(int64_t)a3
{
  unint64_t v5;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  int64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134218240;
      v10 = a3;
      v11 = 2048;
      v12 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Results View Model: Requested header view for invalid section: %lu, for config type %lu", (uint8_t *)&v9, 0x16u);
    }

    return 0;
  }
  if (-[PXSearchResultsViewModel hasNoResults](self, "hasNoResults"))
    return 0;
  v5 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
  if (v5)
    return v5 == 3;
  v8 = !-[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
  return a3 > 0 || v8;
}

- (id)wordEmbeddingForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", objc_msgSend(v4, "section")))
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218240;
      v14 = objc_msgSend(v4, "section");
      v15 = 2048;
      v16 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Results View Model: Requested word embedding for invalid section: %lu, for config type %lu", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_11;
  }
  if (objc_msgSend(v4, "section")
    || !-[PXSearchResultsViewModel _resultsAreWordEmbeddingsOnly](self, "_resultsAreWordEmbeddingsOnly")
    || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 3
    || (v5 = objc_msgSend(v4, "row")) == 0
    || (v6 = v5,
        -[PXSearchResultsViewModel wordEmbeddingSubstitutions](self, "wordEmbeddingSubstitutions"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 > v8))
  {
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  -[PXSearchResultsViewModel wordEmbeddingSubstitutions](self, "wordEmbeddingSubstitutions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "row") - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v10;
}

- (double)heightForRowType:(unint64_t)a3 info:(id)a4
{
  double v4;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PXSearchResultsViewModelHeightInfoText"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PXSearchResultsViewModelHeightInfoTextSize"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "CGSizeValue");
      v14 = v13;
      objc_msgSend(v12, "CGSizeValue");
      v16 = v15;
      v22 = *MEMORY[0x1E0DC1138];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PXSearchResultsViewModelHeightInfoTextFont"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 3, v18, 0, v14, v16);
      v20 = v19;

      v4 = v20 + 1.0 + 6.0;
      goto LABEL_9;
    case 1uLL:
    case 2uLL:
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PXSearchResultsViewModelHeightInfoShouldUseAccessibilityLayout"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "BOOLValue"))
      {
        +[PXSearchDisplayUtility automaticRowHeight](PXSearchDisplayUtility, "automaticRowHeight");
        v4 = v10;
      }
      else
      {
        v4 = 50.0;
      }
LABEL_9:

      break;
    case 3uLL:
      -[PXSearchResultsViewModel calculatedRowHeightForTopAssets](self, "calculatedRowHeightForTopAssets");
      goto LABEL_7;
    case 4uLL:
    case 5uLL:
      +[PXSearchDisplayUtility automaticRowHeight](PXSearchDisplayUtility, "automaticRowHeight");
LABEL_7:
      v4 = v11;
      break;
    default:
      break;
  }

  return v4;
}

- (double)calculatedRowHeightForTopAssets
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[PXSearchResultsViewModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageViewSize");
  v5 = v4;

  -[PXSearchResultsViewModel numberOfTopAssetRows](self, "numberOfTopAssetRows");
  return v5 * v6;
}

- (double)numberOfTopAssetRows
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double result;

  -[PXSearchResultsViewModel topAssetsSearchResult](self, "topAssetsSearchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAssetsFetchResult");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v4, "count");

  -[PXSearchResultsViewModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PXSearchResultsViewModel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumNumberOfThumbnailsPerRow");

  }
  else
  {
    v8 = 0;
  }
  result = 1.0;
  if (v5 > v8)
    return 2.0;
  return result;
}

- (BOOL)topAssetsExistForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  int64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218240;
      v15 = a3;
      v16 = 2048;
      v17 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Results View Model: Requested top assets for invalid section: %lu, for config type %lu", (uint8_t *)&v14, 0x16u);
    }

    return 0;
  }
  if (-[PXSearchResultsViewModel configurationType](self, "configurationType") == 2
    || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 1)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultsViewModel searchResultAtIndexPath:](self, "searchResultAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v11 = 0;
  if (v6)
  {
    v8 = objc_msgSend(v6, "itemType") == 2 ? v7 : 0;
    objc_msgSend(v8, "assetUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
      v11 = 1;
  }

  return v11;
}

- (PXSearchTopAssetsResult)topAssetsSearchResult
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[PXSearchResultsViewModel startingSectionNumberForType:](self, "startingSectionNumberForType:", 1);
  v4 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", v3);
  if (v3 < 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchResultsDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchResultAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "itemType") != 2)
    {

      v8 = 0;
    }

  }
  return (PXSearchTopAssetsResult *)v8;
}

- (id)suggestionItemForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", objc_msgSend(v4, "section")))
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218240;
      v16 = objc_msgSend(v4, "section");
      v17 = 2048;
      v18 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Results View Model: Requested suggestion item for invalid section: %lu, for config type %lu", (uint8_t *)&v15, 0x16u);
    }

    goto LABEL_11;
  }
  v5 = objc_msgSend(v4, "row");
  if (objc_msgSend(v4, "section") || -[PXSearchResultsViewModel configurationType](self, "configurationType") == 3)
    goto LABEL_11;
  if (!-[PXSearchResultsViewModel _resultsAreWordEmbeddingsOnly](self, "_resultsAreWordEmbeddingsOnly"))
  {
    -[PXSearchResultsViewModel suggestions](self, "suggestions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[PXSearchResultsViewModel _sugestionForIndexPath:](self, "_sugestionForIndexPath:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v5
    || (-[PXSearchResultsViewModel wordEmbeddingSubstitutions](self, "wordEmbeddingSubstitutions"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5 > v7))
  {
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  -[PXSearchResultsViewModel _selectedWordEmbeddingTextAtRow:](self, "_selectedWordEmbeddingTextAtRow:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71C08]), "initWithText:userCategory:matchType:", v9, 0, 2);
LABEL_12:

  return v10;
}

- (id)_sugestionForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:", objc_msgSend(v4, "section")))
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218240;
      v11 = objc_msgSend(v4, "section");
      v12 = 2048;
      v13 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Results View Model: Requested suggestion for index path for invalid section: %lu, for config type %lu", (uint8_t *)&v10, 0x16u);
    }

    goto LABEL_8;
  }
  if (-[PXSearchResultsViewModel configurationType](self, "configurationType") == 3)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_11;
  }
  v5 = objc_msgSend(v4, "row");
  -[PXSearchResultsViewModel suggestions](self, "suggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= objc_msgSend(v6, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v7;
}

- (BOOL)hasNoResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchResultsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  v6 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
  v7 = v6 - 1;
  if (v6 - 1 < 2)
  {
    v7 = !-[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
  }
  else if (v6 == 3)
  {
    v7 = v5 == 0;
  }
  else if (!v6)
  {
    v7 = (v5 == 0) & ~-[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
  }
  return v7 & 1;
}

- (BOOL)shouldShowTableFooterView
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchResultsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  return (-[PXSearchResultsViewModel configurationType](self, "configurationType") | v5) == 0;
}

- (BOOL)_resultsAreWordEmbeddingsOnly
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchResultsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfSections"))
  {
    v5 = 0;
  }
  else
  {
    -[PXSearchResultsViewModel wordEmbeddingSubstitutions](self, "wordEmbeddingSubstitutions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (id)_selectedWordEmbeddingTextAtRow:(int64_t)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3 - 1;
  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchResultsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedWordEmbeddingTextAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_sectionIsTopAssetsSection:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v11;
  int v12;
  int64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultsViewModel isValidSection:](self, "isValidSection:"))
  {
    v5 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", a3);
    if ((a3 & 0x8000000000000000) == 0)
    {
      v6 = v5;
      -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchResultsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isTopAssetsSection:", v6);

      return v9;
    }
  }
  else
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = -[PXSearchResultsViewModel configurationType](self, "configurationType");
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Results View Model: Requested section is top assets for invalid section: %lu, for config type %lu", (uint8_t *)&v12, 0x16u);
    }

  }
  return 0;
}

- (BOOL)isValidSection:(int64_t)a3
{
  int64_t v4;

  v4 = -[PXSearchResultsViewModel numberOfSections](self, "numberOfSections");
  return a3 >= 0 && v4 > a3;
}

- (unint64_t)_displayableSuggestionCount
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;

  if (-[PXSearchResultsViewModel configurationType](self, "configurationType") <= 2)
  {
    -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchResultsDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSections");

    if (v5 >= 1)
    {
      -[PXSearchResultsViewModel suggestions](self, "suggestions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
LABEL_11:

      return v7;
    }
    if (-[PXSearchResultsViewModel configurationType](self, "configurationType") != 2)
    {
      -[PXSearchResultsViewModel wordEmbeddingSubstitutions](self, "wordEmbeddingSubstitutions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultsViewModel delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[PXSearchResultsViewModel delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "maximumNumberWordEmbeddingRows");

      }
      else
      {
        v7 = 0;
      }
      v11 = objc_msgSend(v6, "count");
      if (v11 < v7)
        v7 = v11;
      goto LABEL_11;
    }
  }
  return 0;
}

- (id)_adjustedIndexPathForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[PXSearchResultsViewModel _adjustedSectionForSection:](self, "_adjustedSectionForSection:", objc_msgSend(v4, "section"));
  if (v5 < 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v4, "row"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (int64_t)_adjustedSectionForSection:(int64_t)a3
{
  if (-[PXSearchResultsViewModel configurationType](self, "configurationType") != 3)
    a3 -= -[PXSearchResultsViewModel hasDisplayableSuggestions](self, "hasDisplayableSuggestions");
  return a3;
}

- (NSArray)attachmentURLs
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchResultsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tapToRadarAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)wordEmbeddingSubstitutions
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchResultsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wordEmbeddingSubstitutions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)suggestions
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSearchResultsViewModel dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchResultsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (PXSearchResultsLayoutDataSource)delegate
{
  return (PXSearchResultsLayoutDataSource *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (PXSearchResultsSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __83__PXSearchResultsViewModel_fetchImageForPerson_targetSize_displayScale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGRectValue");
    v10 = *(id *)(a1 + 40);
    v9 = v5;
    px_dispatch_on_main_queue();

    v7 = v10;
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v12 = "-[PXSearchResultsViewModel fetchImageForPerson:targetSize:displayScale:completion:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "%s failed to get face tile for person %@, error: %@", buf, 0x20u);
    }
  }

}

uint64_t __83__PXSearchResultsViewModel_fetchImageForPerson_targetSize_displayScale_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

@end
