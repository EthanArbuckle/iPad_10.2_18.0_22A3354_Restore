@implementation PXUISearchResultsViewController

- (void)ppt_expandAllSections
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  PLPhotosSearchGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[PXUISearchResultsViewController(PPT) ppt_expandAllSections]";
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Enter: %s", buf, 0xCu);
  }

  -[PXUISearchResultsViewController _ppt_resultsSectionProvider](self, "_ppt_resultsSectionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+PPT.m"), 28, CFSTR("Expected resultsSectionProvider"));

  }
  objc_msgSend(v3, "sectionIdentifiers");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    v24 = *MEMORY[0x1E0DC48A8];
    do
    {
      v7 = 0;
      v26 = v5;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v7);
        if (objc_msgSend(v3, "searchResultTypeForSection:", v8) != 5)
        {
          objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXUISearchResultsViewController dataSource](self, "dataSource");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "indexPathForItemIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "section");
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXUISearchResultsViewController collectionView](self, "collectionView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "supplementaryViewForElementKind:atIndexPath:", v24, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = v16;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "px_descriptionForAssertionMessage");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+PPT.m"), 45, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewHeader"), v21, v19);

            }
          }
          objc_msgSend(v3, "setExpanded:forSection:sectionHeaderView:", 1, v8, v16);

          v5 = v26;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

}

- (id)_ppt_resultsSectionProvider
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXUISearchResultsViewController dataSource](self, "dataSource", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "type") == 2)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)didSelectSeeAllForAssetUUIDs:(id)a3 title:(id)a4 searchQueryMatchInfo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXPhotosUIViewController *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUIDs"));

    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    -[PXUISearchResultsViewController photoLibrary](self, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    v13 = 0;
    goto LABEL_4;
  }
  if (!v9)
    goto LABEL_6;
LABEL_3:
  -[PXUISearchResultsViewController photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  v13 = v9;
LABEL_4:
  PXPhotosViewConfigurationForSearchResultsWithAllowedAssetUUIDs(v12, v13, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(CFSTR("SEARCH_RESULT_ALL_PHOTOS_RESULT_TITLE"), CFSTR("PhotosUICore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v15);

  objc_msgSend(v14, "setSearchQueryMatchInfo:", v10);
  objc_msgSend(v10, "ocrAssetUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _PXUISearchResultsViewControllerBadgesModifier(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBadgesModifier:", v17);

  v18 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v14);
  -[PXUISearchResultsViewController _pushViewController:](self, "_pushViewController:", v18);

}

- (void)didSelectAssetSearchResult:(id)a3 searchQueryMatchInfo:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  PLPhotosSearchGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PXUISearchResultsViewController(ResultSelection) didSelectAssetSearchResult:searchQueryMatchInfo:]";
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%s, searchResult: %@", buf, 0x16u);
  }

  -[PXUISearchResultsViewController showOneUpForAssetSearchResult:searchQueryMatchInfo:](self, "showOneUpForAssetSearchResult:searchQueryMatchInfo:", v7, v8);
}

- (void)didSelectAssetAggregationSearchResult:(id)a3 searchQueryMatchInfo:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXPhotosUIViewController *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  PLPhotosSearchGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[PXUISearchResultsViewController(ResultSelection) didSelectAssetAggregationSearchResult:searchQueryMatchInfo:]";
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%s, searchResult: %@", buf, 0x16u);
  }

  -[PXUISearchResultsViewController photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchResultViewControllerDataFetching photosViewConfigurationForAssetAggregationSearchResult:photoLibrary:](PXSearchResultViewControllerDataFetching, "photosViewConfigurationForAssetAggregationSearchResult:photoLibrary:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSearchQueryMatchInfo:", v8);
  objc_msgSend(v8, "ocrAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _PXUISearchResultsViewControllerBadgesModifier(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBadgesModifier:", v13);

  v14 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v11);
  -[PXUISearchResultsViewController _pushViewController:](self, "_pushViewController:", v14);

}

- (void)didSelectCollectionSearchResult:(id)a3 searchQueryMatchInfo:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  PLPhotosSearchGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[PXUISearchResultsViewController(ResultSelection) didSelectCollectionSearchResult:searchQueryMatchInfo:]";
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%s, searchResult: %@", buf, 0x16u);
  }

  switch(objc_msgSend(v7, "subtype"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 90, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      -[PXUISearchResultsViewController _didSelectAlbumSearchResult:searchQueryMatchInfo:](self, "_didSelectAlbumSearchResult:searchQueryMatchInfo:", v7, v8);
      break;
    case 2:
      -[PXUISearchResultsViewController _didSelectDetailCollectionSearchResult:](self, "_didSelectDetailCollectionSearchResult:", v7);
      break;
    case 3:
      -[PXUISearchResultsViewController _didSelectMemoryCollectionSearchResult:](self, "_didSelectMemoryCollectionSearchResult:", v7);
      break;
    default:
      break;
  }

}

- (void)_didSelectAlbumSearchResult:(id)a3 searchQueryMatchInfo:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotosUIViewController *v13;
  PXPhotosUIViewController *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  PLPhotosSearchGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[PXUISearchResultsViewController(ResultSelection) _didSelectAlbumSearchResult:searchQueryMatchInfo:]";
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%s, searchResult: %@", buf, 0x16u);
  }

  +[PXSearchResultViewControllerDataFetching photosViewConfigurationForAlbumSearchResult:](PXSearchResultViewControllerDataFetching, "photosViewConfigurationForAlbumSearchResult:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSearchQueryMatchInfo:", v8);
  objc_msgSend(v8, "ocrAssetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _PXUISearchResultsViewControllerBadgesModifier(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBadgesModifier:", v12);

  if (v10)
  {
    v13 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v10);
  }
  else
  {
    -[PXUISearchResultsViewController _emptyPhotosViewControllerForSearchResult:](self, "_emptyPhotosViewControllerForSearchResult:", v7);
    v13 = (PXPhotosUIViewController *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  -[PXUISearchResultsViewController _pushViewController:](self, "_pushViewController:", v13);

}

- (void)_didSelectDetailCollectionSearchResult:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  PXPhotosUIViewController *v8;
  PXPhotosUIViewController *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  PLPhotosSearchGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PXUISearchResultsViewController(ResultSelection) _didSelectDetailCollectionSearchResult:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%s, searchResult: %@", buf, 0x16u);
  }

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    +[PXSearchResultViewControllerDataFetching photosViewConfigurationForCollectionSearchResult:](PXSearchResultViewControllerDataFetching, "photosViewConfigurationForCollectionSearchResult:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v7);
  }
  else
  {
    +[PXSearchResultViewControllerDataFetching photosDetailsContextForCollectionSearchResult:](PXSearchResultViewControllerDataFetching, "photosDetailsContextForCollectionSearchResult:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[PXPhotosDetailsUIViewController initWithContext:options:]([PXPhotosDetailsUIViewController alloc], "initWithContext:options:", v7, 0);
    }
    else
    {
      -[PXUISearchResultsViewController _emptyPhotosViewControllerForSearchResult:](self, "_emptyPhotosViewControllerForSearchResult:", v5);
      v8 = (PXPhotosUIViewController *)objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = v8;

  -[PXUISearchResultsViewController _pushViewController:](self, "_pushViewController:", v9);
}

- (void)_didSelectMemoryCollectionSearchResult:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  PLPhotosSearchGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[PXUISearchResultsViewController(ResultSelection) _didSelectMemoryCollectionSearchResult:]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%s, searchResult: %@", buf, 0x16u);
  }

  +[PXSearchResultViewControllerDataFetching storyConfigurationForCollectionSearchResult:](PXSearchResultViewControllerDataFetching, "storyConfigurationForCollectionSearchResult:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:](PXStoryUIFactory, "viewControllerWithConfiguration:contentViewController:", v7, 0);
  else
    -[PXUISearchResultsViewController _emptyPhotosViewControllerForSearchResult:](self, "_emptyPhotosViewControllerForSearchResult:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController _pushViewController:](self, "_pushViewController:", v8);

}

- (void)didSelectPersonSearchResult:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXPhotosUIViewController *v11;
  PXPeopleDetailViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+ResultSelection.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  PLPhotosSearchGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[PXUISearchResultsViewController(ResultSelection) didSelectPersonSearchResult:]";
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%s, searchResult: %@", buf, 0x16u);
  }

  +[PXSearchResultViewControllerDataFetching personForPersonSearchResult:](PXSearchResultViewControllerDataFetching, "personForPersonSearchResult:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      v16 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXPhotosViewConfigurationForPeople(v8, 0, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v10);
    }
    else
    {
      v12 = [PXPeopleDetailViewController alloc];
      v15 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PXPeopleDetailViewController initWithPeople:ignoreSharedLibraryFilters:](v12, "initWithPeople:ignoreSharedLibraryFilters:", v13, 1);

    }
  }
  else
  {
    -[PXUISearchResultsViewController _emptyPhotosViewControllerForSearchResult:](self, "_emptyPhotosViewControllerForSearchResult:", v5);
    v11 = (PXPhotosUIViewController *)objc_claimAutoreleasedReturnValue();
  }
  -[PXUISearchResultsViewController _pushViewController:](self, "_pushViewController:", v11);

}

- (id)_emptyPhotosViewControllerForSearchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PXPhotosUIViewController *v7;

  objc_msgSend(a3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotosViewConfigurationForSearchResultsWithAllowedAssetUUIDs(MEMORY[0x1E0C9AA60], v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setOneUpPresentationOrigin:", 35);
  v7 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v6);

  return v7;
}

- (void)_pushViewController:(id)a3
{
  _BOOL4 v4;
  char isKindOfClass;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = isKindOfClass;
  if (v4)
  {
    if ((isKindOfClass & 1) != 0)
    {
      v7 = v13;
LABEL_10:
      v9 = v7;
      objc_msgSend(v7, "sheetPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPrefersGrabberVisible:", 1);
      -[PXUISearchResultsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

      goto LABEL_11;
    }
    -[PXUISearchResultsViewController viewControllerPresenter](self, "viewControllerPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
      goto LABEL_10;
    }
    -[PXUISearchResultsViewController viewControllerPresenter](self, "viewControllerPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v13, 1);
  }
  else
  {
    -[PXUISearchResultsViewController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v8, "presentViewController:animated:completion:", v13, 1, 0);
    }
    else
    {
      objc_msgSend(v8, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushViewController:animated:", v13, 1);

    }
  }
LABEL_11:

}

- (void)showOneUpForAssetSearchResult:(id)a3 searchQueryMatchInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  PXSearchResultsOneUpViewModel *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResult"));

  }
  -[PXUISearchResultsViewController _searchResultsSectionProvider](self, "_searchResultsSectionProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetForSearchResult:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PXUISearchResultsViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionIdentifierForSectionContainingItemIdentifier:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "assetsFetchResultForSection:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PXSearchResultsOneUpViewModel initWithOneUpWithAsset:atIndex:inAssetCollection:searchQueryMatchInfo:]([PXSearchResultsOneUpViewModel alloc], "initWithOneUpWithAsset:atIndex:inAssetCollection:searchQueryMatchInfo:", v10, objc_msgSend(v14, "indexOfObject:", v10), v15, v8);
      -[PXUISearchResultsViewController setOneUpViewModel:](self, "setOneUpViewModel:", v16);

      -[PXUISearchResultsViewController searchController](self, "searchController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "searchBar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resignFirstResponder");

      -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "canStart"))
        objc_msgSend(v19, "startWithConfigurationHandler:", 0);

    }
    else
    {
      PXAssertGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Failed to find section containing search result: %@", buf, 0xCu);
      }

      v13 = 0;
    }
  }
  else
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to find Section Provider containing search result: %@", buf, 0xCu);
    }
  }

}

- (id)_searchResultsSectionProvider
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXUISearchResultsViewController dataSource](self, "dataSource", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "type") == 2)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 35;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  return 5;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  void *v3;
  void *v4;

  -[PXUISearchResultsViewController oneUpViewModel](self, "oneUpViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  void *v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  -[PXUISearchResultsViewController oneUpViewModel](self, "oneUpViewModel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.oneUpViewModel.mediaProvider"), v10);
LABEL_6:

    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.oneUpViewModel.mediaProvider"), v10, v12);

    goto LABEL_6;
  }
  return v6;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 90, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v30, v33);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 90, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetReference.asset"), v30);
  }

LABEL_3:
  -[PXUISearchResultsViewController _searchResultsSectionProvider](self, "_searchResultsSectionProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultsSectionProvider"));

  }
  if (v6)
    objc_msgSend(v6, "indexPath");
  objc_msgSend(v8, "assetSearchResultForAsset:inSection:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

    }
    -[PXUISearchResultsViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForItemIdentifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cellIndexPath"));

    }
    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutAttributesForItemAtIndexPath:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cellLayoutAttributes"));

    }
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = objc_alloc((Class)off_1E50B4620);
    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithRect:inCoordinateSpace:", v25, v17, v19, v21, v23);

  }
  else
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v7;
      v39 = 2048;
      v40 = 0;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to find search result for asset: %@, inSection: %ld", buf, 0x16u);
    }
    v26 = 0;
  }

  return v26;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  void *v3;
  void *v4;

  -[PXUISearchResultsViewController oneUpViewModel](self, "oneUpViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXUISearchResultsViewController _searchResultsSectionProvider](self, "_searchResultsSectionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultsSectionProvider"));

  }
  if (v6)
    objc_msgSend(v6, "indexPath");
  objc_msgSend(v6, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v19, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetReference.asset"), v19);
  }

LABEL_7:
  objc_msgSend(v7, "assetSearchResultForAsset:inSection:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

    }
    -[PXUISearchResultsViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForItemIdentifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cellIndexPath"));

    }
    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutIfNeeded");
    objc_msgSend(v14, "layoutAttributesForItemAtIndexPath:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    objc_msgSend(v14, "scrollRectToVisible:animated:", 0);

  }
  else
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2048;
      v27 = 0;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to find search result for asset: %@, inSection: %ld", buf, 0x16u);
    }
  }

}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id obj;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXUISearchResultsViewController _searchResultsSectionProvider](self, "_searchResultsSectionProvider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultsSectionProvider"));

  }
  v6 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    obj = v7;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
      objc_msgSend(v12, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "px_descriptionForAssertionMessage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 158, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v22, v24);

        goto LABEL_18;
      }
LABEL_10:
      v47 = 0u;
      v48 = 0u;
      if (v12)
      {
        objc_msgSend(v12, "indexPath");
        v14 = *((_QWORD *)&v47 + 1);
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v42, "assetSearchResultForAsset:inSection:", v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        PXAssertGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v55 = v13;
          v56 = 2048;
          v57 = v14;
          _os_log_error_impl(&dword_1A6789000, v38, OS_LOG_TYPE_ERROR, "Failed to find search result for asset: %@, inSection: %ld", buf, 0x16u);
        }

        v7 = obj;
        v27 = obj;
        goto LABEL_31;
      }
      v16 = (void *)v15;
      -[PXUISearchResultsViewController dataSource](self, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "indexPathForItemIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "addObject:", v19);
      if (v9 == ++v11)
      {
        v7 = obj;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        v9 = v25;
        if (v25)
          goto LABEL_5;
        goto LABEL_20;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController+OneUp.m"), 158, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetReference.asset"), v22);
LABEL_18:

    goto LABEL_10;
  }
LABEL_20:

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[PXUISearchResultsViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "visibleCells");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v28)
  {
    v29 = v28;
    v30 = v7;
    v31 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[PXUISearchResultsViewController collectionView](self, "collectionView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "indexPathForCell:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_msgSend(v6, "containsObject:", v35);
        objc_msgSend(v33, "contentView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setHidden:", v36);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v29);
    v7 = v30;
  }
LABEL_31:

}

- (id)oneUpPresentationSearchQueryMatchInfo:(id)a3
{
  void *v3;
  void *v4;

  -[PXUISearchResultsViewController oneUpViewModel](self, "oneUpViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchQueryMatchInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PXUISearchResultsViewController)initWithSearchBar:(id)a3 photoLibrary:(id)a4
{
  id v8;
  id v9;
  PXUISearchResultsViewController *v10;
  PXUISearchResultsViewController *v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *biomeRequestQueue;
  void *v16;
  PXSearchResultsSectionProvider *v17;
  uint64_t v18;
  PXUISearchResultsViewController *v19;
  id *v20;
  void *v21;
  void *v22;
  PXSearchTapToRadarSectionProvider *v23;
  void *v24;
  PXPhotosProgressBannerView *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  _QWORD v32[4];
  id *v33;
  SEL v34;
  _QWORD v35[4];
  PXUISearchResultsViewController *v36;
  objc_super v37;
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PXUISearchResultsViewController;
  v10 = -[PXUISearchResultsViewController init](&v37, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_searchBar, a3);
    v12 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = v8;
    objc_storeStrong((id *)&v11->_photoLibrary, v12);
    if (!v9)

    v11->_automaticallyPerformSearches = 1;
    v11->_showTopAssets = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.photosui.searchResults.biome", v13);
    biomeRequestQueue = v11->_biomeRequestQueue;
    v11->_biomeRequestQueue = (OS_dispatch_queue *)v14;

    v16 = (void *)objc_opt_new();
    v17 = -[PXSearchResultsSectionProvider initWithPhotoLibrary:]([PXSearchResultsSectionProvider alloc], "initWithPhotoLibrary:", v11->_photoLibrary);
    -[PXSearchResultsSectionProvider setParsecReportingDelegate:](v17, "setParsecReportingDelegate:", v11);
    v18 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __66__PXUISearchResultsViewController_initWithSearchBar_photoLibrary___block_invoke;
    v35[3] = &unk_1E513AF18;
    v19 = v11;
    v36 = v19;
    -[PXSearchResultsSectionProvider setAssetsSeeAllButtonHandler:](v17, "setAssetsSeeAllButtonHandler:", v35);
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __66__PXUISearchResultsViewController_initWithSearchBar_photoLibrary___block_invoke_2;
    v32[3] = &unk_1E513AF40;
    v20 = v19;
    v33 = v20;
    v34 = a2;
    -[PXSearchResultsSectionProvider setCollectionsSeeAllButtonHandler:](v17, "setCollectionsSeeAllButtonHandler:", v32);
    -[PXSearchResultsSectionProvider setShowAssetResults:](v17, "setShowAssetResults:", objc_msgSend(v20, "showTopAssets"));
    v21 = (void *)objc_opt_new();
    v22 = (void *)objc_opt_new();
    v23 = -[PXSearchTapToRadarSectionProvider initWithDelegate:]([PXSearchTapToRadarSectionProvider alloc], "initWithDelegate:", v20);
    v38[0] = v16;
    v38[1] = v17;
    v38[2] = v22;
    v38[3] = v21;
    v38[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_configureQueryControllerWithResultsSectionProvider:suggestionsSectionProvider:queryStatusSectionProvider:tapToRadarSectionProvider:indexStatusSectionProvider:", v17, v16, v22, v23, v21);
    objc_msgSend(v20, "_configureCollectionViewWithSectionProviders:", v24);
    objc_msgSend(v20, "_configureDataSourceForCollectionView:sectionProviders:", v20[123], v24);
    v25 = objc_alloc_init(PXPhotosProgressBannerView);
    v26 = v20[135];
    v20[135] = v25;

    objc_msgSend(v20[135], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v20, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v20[135]);

    objc_msgSend(v20, "_updateIndexingBannerView");
    objc_msgSend(v20, "_updateIndexingBannerConstraints");
    +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addDeferredKeyObserver:", v20);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v20, sel__searchIndexStatusDidChange_, *MEMORY[0x1E0CD1DB8], 0);

    v8 = v31;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXUISearchResultsViewController;
  -[PXUISearchResultsViewController dealloc](&v4, sel_dealloc);
}

- (void)setShowTopAssets:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXUISearchResultsViewController dataSource](self, "dataSource", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 2)
          objc_msgSend(v10, "setShowAssetResults:", v3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)showsIndexingFooter
{
  void *v3;
  unint64_t v4;
  void *v5;
  char v6;

  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexingBannerPercentageThreshold");

  if (-[PXUISearchResultsViewController isIndexingPaused](self, "isIndexingPaused")
    || -[PXUISearchResultsViewController itemsRemainingCount](self, "itemsRemainingCount") >= v4)
  {
    return 1;
  }
  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceIndexingFooter");

  return v6;
}

- (void)setIsIndexingPaused:(BOOL)a3
{
  if (self->_isIndexingPaused != a3)
  {
    self->_isIndexingPaused = a3;
    -[PXUISearchResultsViewController _updateIndexingBannerView](self, "_updateIndexingBannerView");
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXUISearchResultsViewController;
  -[PXUISearchResultsViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PXUISearchResultsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v6);

    v7 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithEffect:", v8);

    objc_msgSend(v3, "bounds");
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "addSubview:", v9);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXUISearchResultsViewController;
  -[PXUISearchResultsViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PXUISearchResultsViewController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startIndexingAndMonitoringSearchIndexStatus");

  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[PXUISearchResultsViewController _notifyAnalyticsSearchChanged](self, "_notifyAnalyticsSearchChanged");
  -[PXUISearchResultsViewController _registerNotificationsForAnalytics](self, "_registerNotificationsForAnalytics");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUISearchResultsViewController;
  -[PXUISearchResultsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PXUISearchResultsViewController _updateIndexingBannerView](self, "_updateIndexingBannerView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXUISearchResultsViewController;
  -[PXUISearchResultsViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[PXUISearchResultsViewController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopIndexingAndMonitoringSearchIndexStatus");

  -[PXUISearchResultsViewController _unregisterNotificationsForAnalytics](self, "_unregisterNotificationsForAnalytics");
}

- (void)setResultsStatus:(unint64_t)a3 queryResult:(id)a4
{
  id v6;
  void (**v7)(id, unint64_t, id);

  v6 = a4;
  -[PXUISearchResultsViewController resultsHandler](self, "resultsHandler");
  v7 = (void (**)(id, unint64_t, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, a3, v6);

}

- (void)_configureQueryControllerWithResultsSectionProvider:(id)a3 suggestionsSectionProvider:(id)a4 queryStatusSectionProvider:(id)a5 tapToRadarSectionProvider:(id)a6 indexStatusSectionProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PXSearchQueryController *v23;
  void *v24;
  void *v25;
  PXSearchQueryController *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36[2];
  id location;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_initWeak(&location, self);
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __194__PXUISearchResultsViewController__configureQueryControllerWithResultsSectionProvider_suggestionsSectionProvider_queryStatusSectionProvider_tapToRadarSectionProvider_indexStatusSectionProvider___block_invoke;
  v30 = &unk_1E513AF68;
  objc_copyWeak(v36, &location);
  v36[1] = (id)a2;
  v18 = v13;
  v31 = v18;
  v19 = v14;
  v32 = v19;
  v20 = v15;
  v33 = v20;
  v21 = v16;
  v34 = v21;
  v22 = v17;
  v35 = v22;
  -[PXUISearchResultsViewController setResultsHandler:](self, "setResultsHandler:", &v27);
  v23 = [PXSearchQueryController alloc];
  -[PXUISearchResultsViewController photoLibrary](self, "photoLibrary", v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController resultsHandler](self, "resultsHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PXSearchQueryController initWithPhotoLibrary:requestSceneAncestryInformation:resultsHandler:](v23, "initWithPhotoLibrary:requestSceneAncestryInformation:resultsHandler:", v24, 1, v25);
  -[PXUISearchResultsViewController setQueryController:](self, "setQueryController:", v26);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);

}

- (void)_configureCollectionViewWithSectionProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXUISearchResultsViewController _collectionViewLayoutWithProviders:](self, "_collectionViewLayoutWithProviders:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PXUISearchResultsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v10);

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  -[PXUISearchResultsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_msgSend(v6, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v6, "setRemembersLastFocusedIndexPath:", 1);
  objc_msgSend(v6, "setDelegate:", self);
  -[PXUISearchResultsViewController setCollectionView:](self, "setCollectionView:", v6);
  -[PXUISearchResultsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v6);

}

- (void)_configureDataSourceForCollectionView:(id)a3 sectionProviders:(id)a4
{
  id v6;
  id v7;
  PXSearchComposableDataSource *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PXSearchComposableDataSource initWithCollectionView:searchDataSourceSectionProviders:]([PXSearchComposableDataSource alloc], "initWithCollectionView:searchDataSourceSectionProviders:", v7, v6);

  -[PXUISearchResultsViewController setDataSource:](self, "setDataSource:", v8);
}

- (id)_collectionViewLayoutWithProviders:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  -[PXUISearchResultsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentInsetsReference:", -[PXUISearchResultsViewController _contentInsetsReferenceForTraitCollection:](self, "_contentInsetsReferenceForTraitCollection:", v6));

  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PXUISearchResultsViewController__collectionViewLayoutWithProviders___block_invoke;
  v10[3] = &unk_1E513AF90;
  objc_copyWeak(&v11, &location);
  v8 = (void *)objc_msgSend(v7, "initWithSectionProvider:configuration:", v10, v5);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (int64_t)_contentInsetsReferenceForTraitCollection:(id)a3
{
  return 4 * (objc_msgSend(a3, "horizontalSizeClass") == 2);
}

- (void)_updateSearchResults:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  PXSearchQuery *v18;
  void *v19;
  PXSearchQueryOptions *v20;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E5149688;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v4, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PXMap();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  v14 = -[PXUISearchResultsViewController _searchSuggestionLimit](self, "_searchSuggestionLimit");
  v20 = objc_alloc_init(PXSearchQueryOptions);
  -[PXUISearchResultsViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "horizontalSizeClass");

  if (v16 == 1)
    v17 = 9;
  else
    v17 = 10;
  -[PXSearchQueryOptions setCuratedAssetLimit:](v20, "setCuratedAssetLimit:", v17);
  -[PXSearchQueryOptions setSuggestionLimit:](v20, "setSuggestionLimit:", v14);
  -[PXSearchQueryOptions setLibraryScope:](v20, "setLibraryScope:", 0);
  v18 = -[PXSearchQuery initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:]([PXSearchQuery alloc], "initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:", v8, v13, 0, -[PXUISearchResultsViewController _searchResultTypes](self, "_searchResultTypes"), v20);

  -[PXUISearchResultsViewController setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v18);
  if (-[PXUISearchResultsViewController automaticallyPerformSearches](self, "automaticallyPerformSearches"))
  {
    -[PXUISearchResultsViewController queryController](self, "queryController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "performSearch:", v18);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PXSearchQuery *v16;
  void *v17;
  void *v18;
  PXSearchQuery *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXUISearchResultsViewController;
  -[PXUISearchResultsViewController traitCollectionDidChange:](&v23, sel_traitCollectionDidChange_, v4);
  -[PXUISearchResultsViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  if (v6 != objc_msgSend(v4, "horizontalSizeClass"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
    -[PXUISearchResultsViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentInsetsReference:", -[PXUISearchResultsViewController _contentInsetsReferenceForTraitCollection:](self, "_contentInsetsReferenceForTraitCollection:", v8));

    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionViewLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setConfiguration:", v7);
    v11 = objc_msgSend(v5, "horizontalSizeClass");
    if ((v11 == 1) == (objc_msgSend(v4, "horizontalSizeClass") != 1))
    {
      -[PXUISearchResultsViewController currentSearchQuery](self, "currentSearchQuery");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "options");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11 == 1)
        v15 = 9;
      else
        v15 = 10;
      objc_msgSend(v13, "setCuratedAssetLimit:", v15);
      v16 = [PXSearchQuery alloc];
      objc_msgSend(v12, "searchText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchTokens");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PXSearchQuery initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:](v16, "initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:", v17, v18, 0, -[PXUISearchResultsViewController _searchResultTypes](self, "_searchResultTypes"), v14);

      -[PXUISearchResultsViewController setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v19);
      -[PXUISearchResultsViewController queryController](self, "queryController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "performSearch:", v19);

    }
    -[PXUISearchResultsViewController _updateIndexingBannerConstraints](self, "_updateIndexingBannerConstraints");

  }
  v21 = objc_msgSend(v5, "horizontalSizeClass");
  if (v21 != objc_msgSend(v4, "horizontalSizeClass")
    || (v22 = objc_msgSend(v5, "verticalSizeClass"), v22 != objc_msgSend(v4, "verticalSizeClass")))
  {
    -[PXUISearchResultsViewController _reportTraitCollectionChangeToParsec](self, "_reportTraitCollectionChangeToParsec");
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isTracking"))
  {
    -[PXUISearchResultsViewController searchController](self, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      -[PXUISearchResultsViewController searchBar](self, "searchBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resignFirstResponder");

    }
    -[PXUISearchResultsViewController _notifyAnalyticsInteractedWithCurrentSearch](self, "_notifyAnalyticsInteractedWithCurrentSearch");
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PXUISearchResultsViewController _scrollViewStoppedScrolling](self, "_scrollViewStoppedScrolling", a3);
}

- (UISearchController)searchController
{
  UISearchController **p_searchController;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  p_searchController = &self->_searchController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  if (WeakRetained)
    return (UISearchController *)objc_loadWeakRetained((id *)p_searchController);
  -[PXUISearchResultsViewController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    PLPhotosSearchGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "UI Search Results SearchController is nil", v10, 2u);
    }

    v8 = 0;
  }
  return (UISearchController *)v8;
}

- (void)setSearchController:(id)a3
{
  UISearchController **p_searchController;
  id v5;
  id v6;

  p_searchController = &self->_searchController;
  v5 = a3;
  objc_storeWeak((id *)p_searchController, v5);
  objc_msgSend(v5, "searchBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", self);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXUISearchResultsViewController _updateSearchResults:](self, "_updateSearchResults:", v5);
}

- (void)_didSelectTopAssetsSeeAllButtonForSection:(id)a3 allAssetResultUUIDs:(id)a4 title:(id)a5 searchQueryMatchInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController currentSearchQuery](self, "currentSearchQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "saveRecentSearch:", v13);

  -[PXUISearchResultsViewController didSelectSeeAllForAssetUUIDs:title:searchQueryMatchInfo:](self, "didSelectSeeAllForAssetUUIDs:title:searchQueryMatchInfo:", v11, v10, v9);
  -[PXUISearchResultsViewController _notifyAnalyticsSeeAllSelectedWithResultType:](self, "_notifyAnalyticsSeeAllSelectedWithResultType:", 5);
  -[PXUISearchResultsViewController _notifyAnalyticsInteractedWithCurrentSearch](self, "_notifyAnalyticsInteractedWithCurrentSearch");
}

- (void)_didSelectCollectionsSeeAllButtonForSection:(id)a3 sectionProvider:(id)a4 searchResultsHeaderView:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "setExpanded:forSection:sectionHeaderView:", objc_msgSend(v9, "isSectionExpanded:", v10) ^ 1, v10, v8);

  v11 = objc_msgSend(v9, "searchResultTypeForSection:", v10);
  -[PXUISearchResultsViewController _notifyAnalyticsSeeAllSelectedWithResultType:](self, "_notifyAnalyticsSeeAllSelectedWithResultType:", v11);
  -[PXUISearchResultsViewController _notifyAnalyticsInteractedWithCurrentSearch](self, "_notifyAnalyticsInteractedWithCurrentSearch");
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  -[PXUISearchResultsViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[PXUISearchResultsViewController dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchDataSourceSectionProviderForSection:", v6);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "type") == 2)
        break;

      ++v6;
      -[PXUISearchResultsViewController dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfSections");

      if (v6 >= v9)
        return;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", *MEMORY[0x1E0DC48A8], v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "frame");
    v14 = v13;
    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "adjustedContentInset");
    v17 = v14 - v16;

    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentOffset:animated:", 1, 0.0, v17);

  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[PXUISearchResultsViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_scrollToEdge:animated:", 1, 0);

  objc_msgSend(v7, "searchTextField");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "length");
  objc_msgSend(v17, "tokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 | v11)
  {
    -[PXUISearchResultsViewController _notifyAnalyticsSearchChanged](self, "_notifyAnalyticsSearchChanged");
  }
  else
  {
    -[PXUISearchResultsViewController _endAnalyticsSession](self, "_endAnalyticsSession");
    +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportSearchFieldContentCleared");

    -[PXUISearchResultsViewController searchDidEndHandler](self, "searchDidEndHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PXUISearchResultsViewController searchDidEndHandler](self, "searchDidEndHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v14)[2](v14, v17, 0);

    }
  }
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PXUISearchResultsViewController searchBar](self, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUISearchResultsViewController _updateSearchResults:](self, "_updateSearchResults:", v16);

  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void (**v9)(void);
  id v10;

  v10 = a3;
  -[PXUISearchResultsViewController _endAnalyticsSession](self, "_endAnalyticsSession");
  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportSearchFieldBackButtonSelected");

  -[PXUISearchResultsViewController searchDidEndHandler](self, "searchDidEndHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXUISearchResultsViewController searchDidEndHandler](self, "searchDidEndHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v6)[2](v6, v7, 1);

  }
  -[PXUISearchResultsViewController cancelButtonHandler](self, "cancelButtonHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXUISearchResultsViewController cancelButtonHandler](self, "cancelButtonHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PXUISearchResultsViewController _notifyAnalyticsInteractedWithCurrentSearch](self, "_notifyAnalyticsInteractedWithCurrentSearch");
  -[PXUISearchResultsViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXUISearchResultsViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchDataSourceSectionProviderForItemIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v12, "type"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 543, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      PXAssertGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v12;
        _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Selection not handled for selected index path %@, in search section provider: %@", (uint8_t *)&v19, 0x16u);
      }

      break;
    case 2:
      -[PXUISearchResultsViewController searchController](self, "searchController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "searchBar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUISearchResultsViewController setSearchBarWantsFirstResponder:](self, "setSearchBarWantsFirstResponder:", objc_msgSend(v15, "isFirstResponder"));

      if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
      {
        -[PXUISearchResultsViewController searchBar](self, "searchBar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXUISearchResultsViewController setSearchBarWantsFirstResponder:](self, "setSearchBarWantsFirstResponder:", objc_msgSend(v16, "isFirstResponder"));

      }
      -[PXUISearchResultsViewController _didSelectItemIdentifier:inResultsSectionProvider:](self, "_didSelectItemIdentifier:inResultsSectionProvider:", v10, v12);
      break;
    case 3:
      -[PXUISearchResultsViewController _didSelectItemIdentifier:inSuggestionsSectionProvider:](self, "_didSelectItemIdentifier:inSuggestionsSectionProvider:", v10, v12);
      break;
    default:
      break;
  }
  -[PXUISearchResultsViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deselectItemAtIndexPath:animated:", v8, 1);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)_didSelectItemIdentifier:(id)a3 inSuggestionsSectionProvider:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  v9 = v8;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 558, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("suggestionsSectionProvider"), v24, v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 558, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("suggestionsSectionProvider"), v24);
  }

LABEL_5:
  objc_msgSend(v9, "searchSuggestionForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotosSearchGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Selected Search Suggestion: %@", buf, 0xCu);
  }

  -[PXUISearchResultsViewController _notifyAnalyticsSuggestionSelectedWithType:](self, "_notifyAnalyticsSuggestionSelectedWithType:", objc_msgSend(v10, "type"));
  -[PXUISearchResultsViewController _notifyAnalyticsSearchChanged](self, "_notifyAnalyticsSearchChanged");
  -[PXUISearchResultsViewController searchController](self, "searchController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PXUISearchResultsViewController searchBar](self, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchTextField");
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x1E0DC3C50], "px_searchTokenWithRepresentedObjectToken:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textualRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tokens");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "replaceTextualPortionOfRange:withToken:atIndex:", v18, v17, objc_msgSend(v19, "count"));

  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "legacyReportSearchSuggestionSelected:", v17);

}

- (unint64_t)_searchSuggestionLimit
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4 == 320.0;
  if (v6 != 568.0)
    v7 = 0;
  v8 = v6 == 320.0;
  if (v4 != 568.0)
    v8 = 0;
  if (v7 || v8)
    return 4;
  else
    return 5;
}

- (void)_didSelectItemIdentifier:(id)a3 inResultsSectionProvider:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  v9 = v8;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 597, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("resultsSectionProvider"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 597, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("resultsSectionProvider"), v21);
  }

LABEL_5:
  objc_msgSend(v9, "searchResultForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotosSearchGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v10;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Selected Search Result: %@", buf, 0xCu);
  }

  -[PXUISearchResultsViewController _notifyAnalyticsSearchResultSelected:](self, "_notifyAnalyticsSearchResultSelected:", v10);
  switch(objc_msgSend(v10, "type"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 620, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v12 = v10;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_13;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 610, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v31, v39);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 610, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v31);
      }

LABEL_13:
      objc_msgSend(v9, "searchQueryMatchInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUISearchResultsViewController didSelectAssetAggregationSearchResult:searchQueryMatchInfo:](self, "didSelectAssetAggregationSearchResult:searchQueryMatchInfo:", v12, v13);
      goto LABEL_17;
    case 2:
      v12 = v10;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_16;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 613, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v34, v41);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 613, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v34);
      }

LABEL_16:
      objc_msgSend(v9, "searchQueryMatchInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUISearchResultsViewController didSelectCollectionSearchResult:searchQueryMatchInfo:](self, "didSelectCollectionSearchResult:searchQueryMatchInfo:", v12, v13);
LABEL_17:

      goto LABEL_21;
    case 3:
    case 4:
      v12 = v10;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_10;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 617, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v26, v28);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 617, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v26);
      }

LABEL_10:
      -[PXUISearchResultsViewController didSelectPersonSearchResult:](self, "didSelectPersonSearchResult:", v12);
      goto LABEL_21;
    case 5:
      v14 = v10;
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_20;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "px_descriptionForAssertionMessage");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 605, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v37, v43);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISearchResultsViewController.m"), 605, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v37);
      }

LABEL_20:
      objc_msgSend(v9, "searchQueryMatchInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUISearchResultsViewController didSelectAssetSearchResult:searchQueryMatchInfo:](self, "didSelectAssetSearchResult:searchQueryMatchInfo:", v14, v15);

      -[PXUISearchResultsViewController _notifyAnalyticsOneUpTopAssets](self, "_notifyAnalyticsOneUpTopAssets");
      objc_msgSend(v14, "identifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[PXUISearchResultsViewController _sendSearchResultSelectionEventToBiomeWithAssetUUID:](self, "_sendSearchResultSelectionEventToBiomeWithAssetUUID:", v12);
LABEL_21:

LABEL_22:
      +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUISearchResultsViewController currentSearchQuery](self, "currentSearchQuery");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "saveRecentSearch:", v17);

      return;
    default:
      goto LABEL_22;
  }
}

- (unint64_t)_searchResultTypes
{
  return 3;
}

- (void)_searchIndexStatusDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1DB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Expected PHSearchIndexIndexingPausedKey in PHSearchIndexIndexingStatusDidChangeNotification", buf, 2u);
    }

  }
  v7 = objc_msgSend(v5, "BOOLValue");
  -[PXUISearchResultsViewController setIsIndexingPaused:](self, "setIsIndexingPaused:", v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1DC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Expected PHSearchIndexItemsRemainingKey in PHSearchIndexIndexingStatusDidChangeNotification", v11, 2u);
    }

  }
  v10 = objc_msgSend(v8, "unsignedIntegerValue");
  if ((_DWORD)v7 != -[PXUISearchResultsViewController isIndexingPaused](self, "isIndexingPaused")
    || -[PXUISearchResultsViewController itemsRemainingCount](self, "itemsRemainingCount") != v10)
  {
    -[PXUISearchResultsViewController setIsIndexingPaused:](self, "setIsIndexingPaused:", v7);
    -[PXUISearchResultsViewController setItemsRemainingCount:](self, "setItemsRemainingCount:", v10);
    -[PXUISearchResultsViewController _updateIndexingBannerView](self, "_updateIndexingBannerView");
  }

}

- (void)_updateIndexingBannerView
{
  _BOOL4 v3;
  void *v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  -[PXUISearchResultsViewController indexingBanner](self, "indexingBanner");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXUISearchResultsViewController showsIndexingFooter](self, "showsIndexingFooter");
  if (v3)
  {
    PXLocalizedStringFromTable(CFSTR("SEARCH_INDEXING_BANNER_TITLE"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v4);

    v5 = CFSTR("PXSearchIndexingPausedBannerSubtitle");
    if (!-[PXUISearchResultsViewController isIndexingPaused](self, "isIndexingPaused"))
    {
      +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "forceIndexingPausedTitle");

      if (!v7)
        v5 = CFSTR("SEARCH_INDEXING_BANNER_SUBTITLE");
    }
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSubtitle:", v8);

    objc_msgSend(v21, "frame");
    v10 = v9;
    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = v10;
  }
  else
  {
    v17 = *MEMORY[0x1E0DC49E8];
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[PXUISearchResultsViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v17;
    v14 = v18;
    v16 = v19;
    v15 = v20;
  }
  objc_msgSend(v11, "setContentInset:", v13, v14, v16, v15);

  objc_msgSend(v21, "setHidden:", !v3);
}

- (void)_updateIndexingBannerConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  -[PXUISearchResultsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController indexingBanner](self, "indexingBanner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v5 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v5;
  -[PXUISearchResultsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  objc_msgSend(v4, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(v4, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 2)
    v13 = v3;
  else
    v13 = (void *)v5;
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
}

- (void)didSelectTapToRadar
{
  id v3;

  -[PXUISearchResultsViewController currentSearchQuery](self, "currentSearchQuery");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController _didSelectTapToRadar:](self, "_didSelectTapToRadar:", v3);

}

- (void)_registerNotificationsForAnalytics
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__shouldEndAnalyticsSession_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__shouldEndAnalyticsSession_, *MEMORY[0x1E0DC4870], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__shouldEndAnalyticsSession_, *MEMORY[0x1E0D71E70], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__reportVisibleSearchResultsToParsec_, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__reportVisibleSearchResultsToParsec_, *MEMORY[0x1E0DC4E68], 0);

}

- (void)_unregisterNotificationsForAnalytics
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4870], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D71E70], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);

}

- (void)_notifyAnalyticsSearchChanged
{
  void *v3;
  int v4;
  PXSearchCPAnalyticsSession *v5;
  id v6;

  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractedWithCurrentSearch:", 0);

  }
  else
  {
    v5 = -[PXSearchCPAnalyticsSession initWithBeginType:]([PXSearchCPAnalyticsSession alloc], "initWithBeginType:", -[PXUISearchResultsViewController nextAnalyticsSessionBeginType](self, "nextAnalyticsSessionBeginType"));
    -[PXUISearchResultsViewController setAnalyticsSession:](self, "setAnalyticsSession:", v5);

    -[PXUISearchResultsViewController setNextAnalyticsSessionBeginType:](self, "setNextAnalyticsSessionBeginType:", 1);
  }
}

- (void)_notifyAnalyticsInteractedWithCurrentSearch
{
  void *v3;
  id v4;

  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "userInteractedWithCurrentSearch") & 1) == 0)
  {
    objc_msgSend(v4, "setUserInteractedWithCurrentSearch:", 1);
    -[PXUISearchResultsViewController currentSearchQuery](self, "currentSearchQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logSearch:", v3);

  }
}

- (void)_notifyAnalyticsOneUpTopAssets
{
  id v2;

  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logOneUpInTopAssets");

}

- (void)_notifyAnalyticsSuggestionSelectedWithType:(unint64_t)a3
{
  id v3;
  id v4;
  id v5;

  switch(a3)
  {
    case 4uLL:
      -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logSearchWordEmbeddingSelected");

      break;
    case 3uLL:
      -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logSearchNextTokenSuggestionTapped");

      break;
    case 2uLL:
      -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logSearchWordCompletionTapped");

      break;
  }
}

- (void)_notifyAnalyticsWordEmbeddingPresented
{
  id v2;

  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logSearchWordEmbeddingsPresented");

}

- (void)_notifyAnalyticsNoResultsForSearch
{
  id v2;

  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logNoSearchResultsFound");

}

- (void)_notifyAnalyticsSeeAllSelectedWithResultType:(unint64_t)a3
{
  unint64_t v4;
  id v5;

  v4 = -[PXUISearchResultsViewController _searchAnalyticsSessionResultTypeForSearchResultType:subtype:](self, "_searchAnalyticsSessionResultTypeForSearchResultType:subtype:", a3, 0);
  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEnteredCollectionResult:", v4);

}

- (void)_notifyAnalyticsSearchResultSelected:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[PXUISearchResultsViewController _searchAnalyticsSessionResultTypeForSearchResult:](self, "_searchAnalyticsSessionResultTypeForSearchResult:", v4);
  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEnteredCollectionResult:", v5);

  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyReportSearchResultSelected:", v4);

}

- (void)_endAnalyticsSession
{
  void *v3;
  id v4;

  -[PXUISearchResultsViewController analyticsSession](self, "analyticsSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController setAnalyticsSession:](self, "setAnalyticsSession:", 0);
  if (objc_msgSend(v4, "isValid"))
  {
    if ((objc_msgSend(v4, "userInteractedWithCurrentSearch") & 1) == 0)
    {
      -[PXUISearchResultsViewController currentSearchQuery](self, "currentSearchQuery");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logSearch:", v3);

    }
    objc_msgSend(v4, "endAndInvalidateSession");
  }

}

- (void)_shouldEndAnalyticsSession:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D71E78]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "integerValue") != 12)
    -[PXUISearchResultsViewController _endAnalyticsSession](self, "_endAnalyticsSession");

}

- (void)_reportVisibleSearchResultsToParsec:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PXUISearchResultsViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v12, "type") == 2)
        {
          v13 = v9;
          v14 = v8;
          v9 = v12;
        }
        else
        {
          v13 = v8;
          v14 = v12;
          if (objc_msgSend(v12, "type") != 3)
            continue;
        }
        v15 = v12;

        v8 = v14;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (!v7)
        goto LABEL_14;
    }
  }
  v8 = 0;
  v9 = 0;
LABEL_14:

  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUISearchResultsViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "indexPathsForVisibleItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reportSearchSuggestions:searchResultSections:visibleIndexPaths:reportVisibleResultChangesOnly:", v17, v18, v20, 1);

}

- (void)_reportTraitCollectionChangeToParsec
{
  px_dispatch_on_main_queue_when_idle_after_delay();
}

- (void)_sendSearchResultSelectionEventToBiomeWithAssetUUID:(id)a3
{
  id v4;
  NSObject *biomeRequestQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  biomeRequestQueue = self->_biomeRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PXUISearchResultsViewController__sendSearchResultSelectionEventToBiomeWithAssetUUID___block_invoke;
  block[3] = &unk_1E5149198;
  v8 = v4;
  v6 = v4;
  dispatch_async(biomeRequestQueue, block);

}

- (unint64_t)_searchAnalyticsSessionResultTypeForSearchResult:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "subtype");
  else
    v5 = 0;
  v6 = -[PXUISearchResultsViewController _searchAnalyticsSessionResultTypeForSearchResultType:subtype:](self, "_searchAnalyticsSessionResultTypeForSearchResultType:subtype:", objc_msgSend(v4, "type"), v5);

  return v6;
}

- (unint64_t)_searchAnalyticsSessionResultTypeForSearchResultType:(unint64_t)a3 subtype:(unint64_t)a4
{
  unint64_t result;

  result = 0;
  switch(a3)
  {
    case 1uLL:
      result = 1;
      break;
    case 2uLL:
      result = +[PXUISearchResultsViewController _analyticsSessionResultTypeForCollectionType:](PXUISearchResultsViewController, "_analyticsSessionResultTypeForCollectionType:", a4);
      break;
    case 3uLL:
      result = 4;
      break;
    case 5uLL:
      result = 2;
      break;
    default:
      return result;
  }
  return result;
}

- (void)reportVisibleSearchResultsToParsec
{
  -[PXUISearchResultsViewController _reportVisibleSearchResultsToParsec:](self, "_reportVisibleSearchResultsToParsec:", 0);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  v6 = a4;
  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v12)
  {
    NSStringFromSelector(sel_forceIndexingFooter);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
    {
      NSStringFromSelector(sel_indexingBannerPercentageThreshold);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", v9))
      {
        NSStringFromSelector(sel_forceIndexingPausedTitle);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "isEqualToString:", v10);

        if ((v11 & 1) == 0)
          goto LABEL_8;
        goto LABEL_7;
      }

    }
LABEL_7:
    -[PXUISearchResultsViewController _updateIndexingBannerView](self, "_updateIndexingBannerView");
    goto LABEL_8;
  }

LABEL_8:
}

- (BOOL)automaticallyPerformSearches
{
  return self->_automaticallyPerformSearches;
}

- (void)setAutomaticallyPerformSearches:(BOOL)a3
{
  self->_automaticallyPerformSearches = a3;
}

- (BOOL)showTopAssets
{
  return self->_showTopAssets;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (PXSearchComposableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)searchBarWantsFirstResponder
{
  return self->_searchBarWantsFirstResponder;
}

- (void)setSearchBarWantsFirstResponder:(BOOL)a3
{
  self->_searchBarWantsFirstResponder = a3;
}

- (unint64_t)nextAnalyticsSessionBeginType
{
  return self->_nextAnalyticsSessionBeginType;
}

- (void)setNextAnalyticsSessionBeginType:(unint64_t)a3
{
  self->_nextAnalyticsSessionBeginType = a3;
}

- (PXViewControllerPresenter)viewControllerPresenter
{
  return self->_viewControllerPresenter;
}

- (void)setViewControllerPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerPresenter, a3);
}

- (id)cancelButtonHandler
{
  return self->_cancelButtonHandler;
}

- (void)setCancelButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (PXSearchQueryController)queryController
{
  return self->_queryController;
}

- (void)setQueryController:(id)a3
{
  objc_storeStrong((id *)&self->_queryController, a3);
}

- (PXSearchQuery)currentSearchQuery
{
  return self->_currentSearchQuery;
}

- (void)setCurrentSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (PXSearchCPAnalyticsSession)analyticsSession
{
  return self->_analyticsSession;
}

- (void)setAnalyticsSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSession, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (OS_dispatch_queue)biomeRequestQueue
{
  return self->_biomeRequestQueue;
}

- (void)setBiomeRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_biomeRequestQueue, a3);
}

- (BOOL)isIndexingPaused
{
  return self->_isIndexingPaused;
}

- (unint64_t)itemsRemainingCount
{
  return self->_itemsRemainingCount;
}

- (void)setItemsRemainingCount:(unint64_t)a3
{
  self->_itemsRemainingCount = a3;
}

- (PXPhotosProgressBannerView)indexingBanner
{
  return self->_indexingBanner;
}

- (void)setIndexingBanner:(id)a3
{
  objc_storeStrong((id *)&self->_indexingBanner, a3);
}

- (PXSearchResultsOneUpViewModel)oneUpViewModel
{
  return self->_oneUpViewModel;
}

- (void)setOneUpViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpViewModel, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)searchDidEndHandler
{
  return self->_searchDidEndHandler;
}

- (void)setSearchDidEndHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_searchDidEndHandler, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_oneUpViewModel, 0);
  objc_storeStrong((id *)&self->_indexingBanner, 0);
  objc_storeStrong((id *)&self->_biomeRequestQueue, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_storeStrong((id *)&self->_currentSearchQuery, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong(&self->_cancelButtonHandler, 0);
  objc_storeStrong((id *)&self->_viewControllerPresenter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_searchController);
}

void __87__PXUISearchResultsViewController__sendSearchResultSelectionEventToBiomeWithAssetUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Photos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "Search");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02148]), "initWithIdentifier:subset:type:", *(_QWORD *)(a1 + 32), v3, 1);
    objc_msgSend(v8, "sendEvent:", v9);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v4, "timeIntervalSince1970");
    v14 = v13;
    PLSearchUIBiomeGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 134218242;
      v18 = v12 - v14;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_INFO, "Photos Search Biome: sent tapped asset event (%f s) to Biome Photos Search stream with asset UUID : %@", (uint8_t *)&v17, 0x16u);
    }

  }
}

uint64_t __71__PXUISearchResultsViewController__reportTraitCollectionChangeToParsec__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportVisibleSearchResultsToParsec:", 0);
}

uint64_t __56__PXUISearchResultsViewController__updateSearchResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "representedObject");
}

id __70__PXUISearchResultsViewController__collectionViewLayoutWithProviders___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchDataSourceSectionProviderForSection:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained(v4);
  objc_msgSend(v13, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMargins");
  objc_msgSend(v8, "layoutForSectionIdentifier:environment:collectionViewLayoutMargins:", v12, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __194__PXUISearchResultsViewController__configureQueryControllerWithResultsSectionProvider_suggestionsSectionProvider_queryStatusSectionProvider_tapToRadarSectionProvider_indexStatusSectionProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), WeakRetained, CFSTR("PXUISearchResultsViewController.m"), 224, CFSTR("Expected main thread"));

  }
  objc_msgSend(v5, "searchResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("PPT_SearchResultsDidFinishSearchQuery"), 0);

  }
  +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportSearchQueryExecutionCompleted");

  if (a2 == 3)
  {
    PLPhotosSearchGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v32 = 134218242;
      v33 = 3;
      v34 = 2112;
      v35 = v5;
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "Search Query failed with status: %lu, queryResult: %@", (uint8_t *)&v32, 0x16u);
    }

  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSearchQueryResult:", v5);
    objc_msgSend(*(id *)(a1 + 40), "setSearchQueryResult:", v5);
    v11 = *(void **)(a1 + 48);
    objc_msgSend(v5, "searchQuery");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSearchQuery:queryResult:", v12, v5);

    objc_msgSend(v5, "searchQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v13, "isEmpty");

    objc_msgSend(v5, "searchResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = v15 == 0;

    objc_msgSend(*(id *)(a1 + 56), "setShouldDisplayRadarDescriptionLabel:", v16 & ~(_DWORD)v12);
    objc_msgSend(*(id *)(a1 + 64), "setIsAllowedToBeVisible:", v16 & ~(_DWORD)v12);
    if ((v12 & 1) == 0 && !v15)
    {
      objc_msgSend(v5, "searchSuggestions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v19, "_notifyAnalyticsWordEmbeddingPresented");

      }
      v20 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v20, "_notifyAnalyticsNoResultsForSearch");

    }
    objc_msgSend(v5, "searchQuery");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEmpty") ^ 1;

    v23 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v23, "searchController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShowsSearchResultsController:", v22);

    +[PXSearchParsecAnalyticsSession sharedSession](PXSearchParsecAnalyticsSession, "sharedSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchSuggestions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sections");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "collectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "indexPathsForVisibleItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "reportSearchSuggestions:searchResultSections:visibleIndexPaths:reportVisibleResultChangesOnly:", v26, v27, v29, 0);

  }
}

uint64_t __66__PXUISearchResultsViewController_initWithSearchBar_photoLibrary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didSelectTopAssetsSeeAllButtonForSection:allAssetResultUUIDs:title:searchQueryMatchInfo:", a2, a3, a4, a5);
}

void __66__PXUISearchResultsViewController_initWithSearchBar_photoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchDataSourceSectionProviderForSectionIdentifier:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXUISearchResultsViewController.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self.dataSource searchDataSourceSectionProviderForSectionIdentifier:sectionIdentifier]"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("PXUISearchResultsViewController.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self.dataSource searchDataSourceSectionProviderForSectionIdentifier:sectionIdentifier]"), v13, v17);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(*(id *)(a1 + 32), "_didSelectCollectionsSeeAllButtonForSection:sectionProvider:searchResultsHeaderView:", v18, v8, v6);

}

+ (unint64_t)_analyticsSessionResultTypeForCollectionType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_1A7C0AE38[a3 - 1];
}

- (void)_didSelectTapToRadar:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PXFeedbackTapToRadarViewController *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PXUISearchResultsViewController *v14;
  id v15;
  uint8_t buf[16];

  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Did Select Search Results Tap to Radar", buf, 2u);
  }

  +[PXFeedbackTapToRadarUtilities captureScreenshot](PXFeedbackTapToRadarUtilities, "captureScreenshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(PXFeedbackTapToRadarViewController);
  -[PXFeedbackTapToRadarViewController setRequestScreenshotPermission:](v7, "setRequestScreenshotPermission:", 1);
  -[PXUISearchResultsViewController _radarRoutes](self, "_radarRoutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackTapToRadarViewController setRoutes:](v7, "setRoutes:", v8);

  -[PXUISearchResultsViewController _radarRoutesDescription](self, "_radarRoutesDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackTapToRadarViewController setRoutesDescription:](v7, "setRoutesDescription:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PXUISearchResultsViewController_TapToRadar___didSelectTapToRadar___block_invoke;
  v12[3] = &unk_1E5147460;
  v13 = v6;
  v14 = self;
  v15 = v4;
  v10 = v4;
  v11 = v6;
  -[PXFeedbackTapToRadarViewController setFileRadarHandler:](v7, "setFileRadarHandler:", v12);
  -[PXUISearchResultsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)_radarRoutes
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Search");
  v3[1] = CFSTR("Search Term Feedback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_radarRoutesDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Choose \"%@\" to suggest the addition of a search term for Photos Search."), CFSTR("Search Term Feedback"));
}

- (id)_titleForRadarRoute:(id)a3 searchQuery:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Search Term Feedback")))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "searchText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Photos Search Taxonomy Feedback for Search Query: \"%@\"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_keywordForRadarRoute:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Search Term Feedback")))
    return CFSTR("1275789");
  else
    return 0;
}

- (id)_templateForRadarRoute:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Search Term Feedback")))
    return CFSTR("What general category does your search fall into: (e.g. food, clothing, vehicle, document, object, etc)?\n\n\nIs this search specific to your geographic region?\n\n\nHow often do you capture photos for this search term: (e.g. often, sometimes, rarely, etc)?\n\n\n");
  else
    return CFSTR("Summary:\n\n\nSteps To Reproduce:\n\n\nResults:\n\n\nRegression:\n\n\nNotes:\n\n\n");
}

- (id)_radarInfoForRadarRoute:(id)a3 searchQuery:(id)a4
{
  id v6;
  id v7;
  _PXUISearchResultsRadarInfo *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_PXUISearchResultsRadarInfo);
  v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("Search Term Feedback"));
  if (v9)
    v10 = CFSTR("936730");
  else
    v10 = CFSTR("570553");
  if (v9)
    v11 = CFSTR("Photos Search");
  else
    v11 = CFSTR("Photos UI Search");
  if (v9)
    v12 = CFSTR("all");
  else
    v12 = CFSTR("iOS");
  if (v9)
    v13 = CFSTR("Enhancement");
  else
    v13 = CFSTR("Other Bug");
  -[_PXUISearchResultsRadarInfo setComponentID:](v8, "setComponentID:", v10);
  -[_PXUISearchResultsRadarInfo setComponentName:](v8, "setComponentName:", v11);
  -[_PXUISearchResultsRadarInfo setComponentVersion:](v8, "setComponentVersion:", v12);
  -[_PXUISearchResultsRadarInfo setRadarClassification:](v8, "setRadarClassification:", v13);
  -[PXUISearchResultsViewController _titleForRadarRoute:searchQuery:](self, "_titleForRadarRoute:searchQuery:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PXUISearchResultsRadarInfo setRadarTitle:](v8, "setRadarTitle:", v14);
  -[PXUISearchResultsViewController _templateForRadarRoute:](self, "_templateForRadarRoute:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXUISearchResultsRadarInfo setRadarDescription:](v8, "setRadarDescription:", v15);

  -[PXUISearchResultsViewController _keywordForRadarRoute:](self, "_keywordForRadarRoute:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXUISearchResultsRadarInfo setRadarKeyword:](v8, "setRadarKeyword:", v16);

  return v8;
}

void __68__PXUISearchResultsViewController_TapToRadar___didSelectTapToRadar___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a2 && *(_QWORD *)(a1 + 32))
  {
    v21[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_radarInfoForRadarRoute:searchQuery:", v7, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  if (a3)
  {
    v20[0] = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
    v20[1] = CFSTR("com.apple.Search.framework.SpotlightDiagnostic");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v8, "radarTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radarDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radarClassification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radarKeyword");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v17) = a3;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v10, v11, v12, v13, v14, v15, v16, v18, 0, v17, v9, 0);

}

@end
