@implementation PXSearchResultsDataUtility

+ (id)fetchResultFromTopAssetsSearchResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "topAssetsFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CD14E0];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientCollectionListWithCollections:title:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)photosDetailsContextFromCollectionUUID:(id)a3 collectionClass:(Class)a4 dateRangeFormatter:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXPhotosDataSourceConfiguration *v18;
  PXPhotosDataSource *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  PXPhotosDetailsContext *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  SEL v39;
  void *v40;
  id v41;
  uint64_t v42;
  _QWORD aBlock[4];
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CD16F8];
  v11 = a3;
  objc_msgSend(v10, "px_deprecated_appPhotoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class localIdentifierWithUUID:](a4, "localIdentifierWithUUID:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CD13B8];
  v45[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchAssetCollectionsWithLocalIdentifiers:options:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    v18 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v17, 0);
    v19 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v18);
    -[PXPhotosDataSource firstAssetCollection](v19, "firstAssetCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      v39 = a2;
      v41 = v9;
      v22 = objc_msgSend(v20, "titleCategory");
      if (v22)
        v23 = v22;
      else
        v23 = 6;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __104__PXSearchResultsDataUtility_photosDetailsContextFromCollectionUUID_collectionClass_dateRangeFormatter___block_invoke;
      aBlock[3] = &unk_1E5138A20;
      v24 = v21;
      v44 = v24;
      v40 = _Block_copy(aBlock);
      v42 = v23;
      if ((-[objc_class isEqual:](a4, "isEqual:", objc_opt_class()) & 1) != 0)
      {
        v25 = a1;
        v26 = v24;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "px_descriptionForAssertionMessage");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v39, v25, CFSTR("PXSearchResultsDataUtility.m"), 95, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v37, v36);

        }
        objc_msgSend(v26, "verboseSmartDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dateDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v23;
      }
      else
      {
        +[PXSearchResultsDataUtility _localizedTitleForAssetCollection:titleCategory:dateRangeFormatter:](PXSearchResultsDataUtility, "_localizedTitleForAssetCollection:titleCategory:dateRangeFormatter:", v24, &v42, v41);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(off_1E50B3470, "defaultHelper");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "titleForDisplayableText:titleCategory:options:", v31, v42, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "localizedSubtitle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v42;
      }
      +[PXDisplayTitleInfo displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:defaultTitle:defaultTitleCategory:titleKey:titleCategoryKey:defaultSubtitle:subtitleKey:simulatedLoadingDelay:preferredAttributesPromise:](PXDisplayTitleInfo, "displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:defaultTitle:defaultTitleCategory:titleKey:titleCategoryKey:defaultSubtitle:subtitleKey:simulatedLoadingDelay:preferredAttributesPromise:", v24, v23, v27, v29, *MEMORY[0x1E0CD1CD0], *MEMORY[0x1E0CD1CC8], 0.0, v28, *MEMORY[0x1E0CD1CC0], v40);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v19, v33, 0, 0);

      v9 = v41;
    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (id)photosDetailsContextFromMemoryUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotosDataSourceConfiguration *v9;
  PXPhotosDataSource *v10;
  PXPhotosDetailsContext *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1630], "localIdentifierWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CD13B8];
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetCollectionsWithLocalIdentifiers:options:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v9 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v8, 0);
    v10 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v9);
    v11 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v10, 0, 0, 0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)photosDetailsContextForPhotosUUIDs:(id)a3 title:(id)a4
{
  void *v5;
  id v6;
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
  void *v17;
  PXDisplayTitleInfo *v18;
  PXPhotosDataSourceConfiguration *v19;
  PXPhotosDataSource *v20;
  PXPhotosDetailsContext *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CD16F8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setInternalPredicate:", v10);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CD14E0];
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transientCollectionListWithCollections:title:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "titleFontNameForTitleCategory:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXDisplayTitleInfo initWithTitle:subtitle:fontName:]([PXDisplayTitleInfo alloc], "initWithTitle:subtitle:fontName:", v6, 0, v17);

  v19 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v16, 0);
  v20 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v19);
  -[PXPhotosDataSource startBackgroundFetchIfNeeded](v20, "startBackgroundFetchIfNeeded");
  v21 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v20, v18, 0, 0);

  return v21;
}

+ (id)_localizedTitleForAssetCollection:(id)a3 titleCategory:(int64_t *)a4 dateRangeFormatter:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate:toDate:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = 5;
    }
    else
    {
      v12 = (uint64_t)v9;
    }

    v9 = (void *)v12;
  }

  return v9;
}

+ (id)searchTokenRepresentedObjectsFromSearchTokens:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "representedObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          PXAssertGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Expected searchTokenRepresentedObject", v14, 2u);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

+ (id)searchTokenRepresentedObjectFromSearchText:(id)a3
{
  id v3;
  void *v4;
  PXSearchTokenRepresentedObject *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71C08]), "initWithText:userCategory:matchType:", v3, 0, 0);
    v5 = -[PXSearchTokenRepresentedObject initWithTitle:queryToken:]([PXSearchTokenRepresentedObject alloc], "initWithTitle:queryToken:", v3, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)searchTokenFromQueryToken:(id)a3
{
  id v3;
  void *v4;
  PXSearchTokenRepresentedObject *v5;
  void *v6;
  PXSearchToken *v7;

  v3 = a3;
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[PXSearchTokenRepresentedObject initWithTitle:queryToken:]([PXSearchTokenRepresentedObject alloc], "initWithTitle:queryToken:", v4, v3);
    +[PXSearchResultsDataUtility imageForSearchUserCategory:useSearchFieldStyle:](PXSearchResultsDataUtility, "imageForSearchUserCategory:useSearchFieldStyle:", objc_msgSend(v3, "userCategory"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXSearchToken initWithText:image:representedObject:]([PXSearchToken alloc], "initWithText:image:representedObject:", v4, v6, v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)searchTokenFromWordEmbedding:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PXSearchTokenRepresentedObject *v6;
  PXSearchToken *v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71C08]), "initWithText:userCategory:matchType:", v3, 13, 2);
    +[PXSearchResultsDataUtility imageForSearchUserCategory:useSearchFieldStyle:](PXSearchResultsDataUtility, "imageForSearchUserCategory:useSearchFieldStyle:", 13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXSearchTokenRepresentedObject initWithTitle:queryToken:]([PXSearchTokenRepresentedObject alloc], "initWithTitle:queryToken:", v3, v4);
    v7 = -[PXSearchToken initWithText:image:representedObject:]([PXSearchToken alloc], "initWithText:image:representedObject:", v3, v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)suggestionsDisplayDataFromToken:(id)a3 searchText:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6 isTextCompletion:(BOOL)a7 completion:(id)a8
{
  +[PXSearchResultsDataUtility suggestionsDisplayDataFromToken:orSuggestion:searchText:matchedColor:remainingColor:isTextCompletion:completion:](PXSearchResultsDataUtility, "suggestionsDisplayDataFromToken:orSuggestion:searchText:matchedColor:remainingColor:isTextCompletion:completion:", a3, 0, a4, a5, a6, a7, a8);
}

+ (void)suggestionsDisplayDataFromSuggestion:(id)a3 searchText:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6 isTextCompletion:(BOOL)a7 completion:(id)a8
{
  +[PXSearchResultsDataUtility suggestionsDisplayDataFromToken:orSuggestion:searchText:matchedColor:remainingColor:isTextCompletion:completion:](PXSearchResultsDataUtility, "suggestionsDisplayDataFromToken:orSuggestion:searchText:matchedColor:remainingColor:isTextCompletion:completion:", 0, a3, a4, a5, a6, a7, a8);
}

+ (void)suggestionsDisplayDataFromToken:(id)a3 orSuggestion:(id)a4 searchText:(id)a5 matchedColor:(id)a6 remainingColor:(id)a7 isTextCompletion:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;

  v9 = a8;
  v27 = a3;
  v14 = a4;
  v15 = (__CFString *)a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  if (v14)
  {
    objc_msgSend(v14, "px_symbolName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PXImageUtilities symbolIsEmbeddedGlyph:](PXImageUtilities, "symbolIsEmbeddedGlyph:", v19))
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", v19);
    else
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v14, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v25 = v15;
      else
        v25 = &stru_1E5149688;
      +[PXSearchDisplayUtility highlightedAttributedStringForString:highlightedSubstring:matchedColor:remainingColor:](PXSearchDisplayUtility, "highlightedAttributedStringForString:highlightedSubstring:matchedColor:remainingColor:", v24, v25, v16, v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *, _QWORD, void *))v18 + 2))(v18, 0, v26, 0, v23);
    }
    else
    {
      objc_msgSend(v27, "suggestionText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, _QWORD, void *))v18 + 2))(v18, v26, 0, 0, v23);
    }

  }
  else
  {
    +[PXSearchResultsDataUtility imageForSearchUserCategory:useSearchFieldStyle:](PXSearchResultsDataUtility, "imageForSearchUserCategory:useSearchFieldStyle:", objc_msgSend(v27, "userCategory"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v27, "resultCount");
    if (v9)
    {
      objc_msgSend(v27, "suggestionText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v22 = v15;
      else
        v22 = &stru_1E5149688;
      +[PXSearchDisplayUtility highlightedAttributedStringForString:highlightedSubstring:matchedColor:remainingColor:](PXSearchDisplayUtility, "highlightedAttributedStringForString:highlightedSubstring:matchedColor:remainingColor:", v21, v22, v16, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *, uint64_t, void *))v18 + 2))(v18, 0, v23, v20, v19);
    }
    else
    {
      objc_msgSend(v27, "suggestionText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, uint64_t, void *))v18 + 2))(v18, v23, 0, v20, v19);
    }
  }

}

+ (id)imageForSearchUserCategory:(unint64_t)a3 useSearchFieldStyle:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (!a4 || (v4 = 0, a3) && a3 != 13)
  {
    +[PXNewSearchToken symbolNameForSearchUserCategory:](PXNewSearchToken, "symbolNameForSearchUserCategory:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      +[PXNewSearchToken symbolNameForSearchUserCategory:](PXNewSearchToken, "symbolNameForSearchUserCategory:", 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    if (+[PXImageUtilities symbolIsEmbeddedGlyph:](PXImageUtilities, "symbolIsEmbeddedGlyph:", v8))
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", v8);
    else
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)recentSearchFromActiveSearch:(id)a3
{
  id v3;
  PXSearchRecentSearch *v4;
  void *v5;
  void *v6;
  void *v7;
  PXSearchRecentSearch *v8;
  void *v9;

  v3 = a3;
  if ((objc_msgSend(v3, "isEmpty") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "searchTokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchResultsDataUtility searchTokenRepresentedObjectsFromSearchTokens:](PXSearchResultsDataUtility, "searchTokenRepresentedObjectsFromSearchTokens:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = [PXSearchRecentSearch alloc];
    objc_msgSend(v3, "searchText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXSearchRecentSearch initWithRepresentedObjects:searchText:](v8, "initWithRepresentedObjects:searchText:", v7, v9);

  }
  return v4;
}

+ (id)titleForSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  +[PXSearchDisplayUtility defaultStringAttributes](PXSearchDisplayUtility, "defaultStringAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "collectionTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_stringByDeletingCharactersInSet:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (void *)v8;

    goto LABEL_4;
  }
  if (objc_msgSend(v3, "itemType") == 1)
  {
    objc_msgSend(v3, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "person");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_localizedName");
    }
    else
    {
      objc_msgSend(v3, "displayTitleWithDefaultAttributes:dimmedAttributes:selectedDisplayTitle:", v4, v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "string");
    }
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v9 = 0;
LABEL_4:
  if (objc_msgSend(v3, "isOCRStringMatchedResult"))
  {
    PXLocalizedStringFromTable(CFSTR("SEARCH_RESULT_OCR_RESULT_TITLE_FORMAT"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }

  return v9;
}

+ (id)subtitleForSearchResult:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "collectionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "collectionSubtitle");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "itemType") != 1
      || ((objc_msgSend(v3, "searchCategories") & 1) != 0
        ? (LODWORD(v7) = 1)
        : (v7 = ((unint64_t)objc_msgSend(v3, "searchCategories") >> 9) & 1),
          (objc_msgSend(v3, "searchCategories") & 0x20000000000) == 0
       && (v7 | ((unint64_t)objc_msgSend(v3, "searchCategories") >> 42) & 1) != 1))
    {
      v6 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v3, "displaySubtitle");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_12:

  return v6;
}

+ (id)wordEmbeddingSubstitutionsForSearchText:(id)a3 wantsSubstitutedString:(BOOL)a4 sceneAncestoryInformation:(id)a5 substitutions:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  BOOL v31;

  v10 = a3;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x1E0C99DE8];
  v13 = a6;
  v14 = objc_alloc_init(v12);
  objc_msgSend(a1, "sortedWordEmbeddingsForCurrentQueryFromSubstitutions:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = +[PXSearchDisplayUtility layoutDirectionIsRTL](PXSearchDisplayUtility, "layoutDirectionIsRTL");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke;
  v24[3] = &unk_1E5136958;
  v25 = v15;
  v26 = v11;
  v30 = a4;
  v31 = v16;
  v29 = a1;
  v27 = v10;
  v17 = v14;
  v28 = v17;
  v18 = v10;
  v19 = v11;
  v20 = v15;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v24);
  v21 = v28;
  v22 = v17;

  return v22;
}

+ (id)_bestParentWordEmbeddingsWithWordEmbeddings:(id)a3 sceneAncestoryInformation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v36 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v42;
    v13 = *MEMORY[0x1E0D72DD0];
    obj = v8;
    v35 = *MEMORY[0x1E0D72DC0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v36, "addObject:", v17);
          if (!v11)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v35);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

      }
      v8 = obj;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v10);

    if (!v11)
    {
      v30 = 0;
      goto LABEL_23;
    }
    v32 = v7;
    v33 = v6;
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = v36;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
      v23 = *MEMORY[0x1E0D72DC8];
      do
      {
        for (j = 0; j != v21; ++j)
        {
          v25 = v18;
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v19);
          v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          v27 = objc_msgSend(v19, "countForObject:", v26);
          v46[0] = v11;
          v45[0] = v35;
          v45[1] = v23;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v45[2] = v13;
          v46[1] = v28;
          v46[2] = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v25;
          objc_msgSend(v25, "addObject:", v29);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v21);
    }

    objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_210342);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v33;
    v8 = obj;
    v7 = v32;
  }
  else
  {
    v11 = 0;
    v30 = 0;
    v18 = v8;
  }

LABEL_23:
  return v30;
}

+ (id)sortedWordEmbeddingsForCurrentQueryFromSubstitutions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (!sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn
    || (objc_msgSend((id)sortedWordEmbeddingsForCurrentQueryFromSubstitutions__previousWordEmbeddings, "isEqualToDictionary:", v4) & 1) == 0)
  {
    objc_storeStrong((id *)&sortedWordEmbeddingsForCurrentQueryFromSubstitutions__previousWordEmbeddings, a3);
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_187_210333);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__210334;
    v15 = __Block_byref_object_dispose__210335;
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__PXSearchResultsDataUtility_sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke_2;
    v10[3] = &unk_1E51369E0;
    v10[4] = &v11;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    objc_storeStrong((id *)&sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn, (id)v12[5]);
    _Block_object_dispose(&v11, 8);

  }
  v8 = (id)sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn;

  return v8;
}

+ (id)stringWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 dateComponents:(id)a6 dateIntervalFormatter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "setEra:", objc_msgSend(v15, "era"));
  objc_msgSend(v12, "setYear:", objc_msgSend(v15, "year"));
  objc_msgSend(v12, "setMonth:", objc_msgSend(v15, "month"));
  v16 = objc_msgSend(v15, "day");

  objc_msgSend(v12, "setDay:", v16);
  objc_msgSend(v13, "dateFromComponents:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEra:", objc_msgSend(v14, "era"));
  objc_msgSend(v12, "setYear:", objc_msgSend(v14, "year"));
  objc_msgSend(v12, "setMonth:", objc_msgSend(v14, "month"));
  v18 = objc_msgSend(v14, "day");

  objc_msgSend(v12, "setDay:", v18);
  objc_msgSend(v13, "dateFromComponents:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringFromDate:toDate:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)sectionTitleFromSearchResultSection:(id)a3 shouldCombineAssetsSections:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  __CFString *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "categoryMask");
  v7 = +[PXSearchResultsDataUtility sectionIsHighlightsSection:](PXSearchResultsDataUtility, "sectionIsHighlightsSection:", v5);

  if (v7)
  {
    v8 = CFSTR("SEARCH_RESULT_SECTION_HEADER_PHOTO_MOMENTS");
  }
  else if (v6 == 4096)
  {
    v8 = CFSTR("SEARCH_RESULT_SECTION_HEADER_MEMORIES");
  }
  else if (v6 == 256)
  {
    v8 = CFSTR("SEARCH_RESULT_SECTION_HEADER_ALBUMS");
  }
  else
  {
    if (!v4)
    {
      +[PXSearchResultsSection sectionTitleForCategoryMask:](PXSearchResultsSection, "sectionTitleForCategoryMask:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    v8 = CFSTR("SEARCH_RESULT_SECTION_HEADER_OTHER_RESULTS");
  }
  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

+ (BOOL)sectionIsHighlightsSection:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "categoryMask");
  v5 = objc_msgSend(v3, "resultTypes");

  v6 = (v5 >> 1) & 1;
  if (v4 == 4096)
    LOBYTE(v6) = 0;
  return v4 != 256 && v6;
}

void __83__PXSearchResultsDataUtility_sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v17 = a1;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0D72DC0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectForKey:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v13);

        if (v15)
        {
          objc_msgSend(v11, "addObject:", v3);

          goto LABEL_13;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }

    a1 = v17;
  }
  else
  {

    v8 = *MEMORY[0x1E0D72DC0];
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "addObject:", v3);
  objc_msgSend(v3, "objectForKey:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, v16);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);
LABEL_13:

}

BOOL __83__PXSearchResultsDataUtility_sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x1E0D72DC0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v9 = *MEMORY[0x1E0D72DC8];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);
    if (!v12)
    {
      v13 = *MEMORY[0x1E0D72DD0];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DD0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "caseInsensitiveCompare:", v15);

    }
    v16 = v12 == -1;

  }
  else
  {
    v17 = objc_msgSend(v7, "length");
    v18 = objc_msgSend(v8, "length");
    if (v17 == v18)
    {
      v19 = *MEMORY[0x1E0D72DD0];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D72DD0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v20, "caseInsensitiveCompare:", v21) == -1;

    }
    else
    {
      v16 = v17 > v18;
    }
  }

  return v16;
}

uint64_t __100__PXSearchResultsDataUtility__bestParentWordEmbeddingsWithWordEmbeddings_sceneAncestoryInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x1E0D72DC8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72DC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v9 > v12)
    v13 = -1;
  else
    v13 = v9 < v12;
  if (!v13)
  {
    v14 = *MEMORY[0x1E0D72DD0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72DD0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "compare:", v16);

  }
  return v13;
}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _BYTE *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  __int16 v48;
  _QWORD v49[4];
  void *v50;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v9 = objc_msgSend(v7, "count");
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v43 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v43);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "_bestParentWordEmbeddingsWithWordEmbeddings:sceneAncestoryInformation:", v11, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 < 2)
  {
    if (v12)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v12);
      v18 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2;
      v49[3] = &unk_1E5136908;
      v50 = v11;
      v19 = v11;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v49);
      objc_msgSend(v17, "addObjectsFromArray:", v19);
      v44[0] = v18;
      v44[1] = 3221225472;
      v44[2] = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2_180;
      v44[3] = &unk_1E5136930;
      v48 = *(_WORD *)(a1 + 72);
      v45 = v43;
      v46 = *(id *)(a1 + 48);
      v47 = *(id *)(a1 + 56);
      v15 = v43;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v44);

      v16 = v50;
      v11 = v17;
      v43 = v13;
LABEL_14:

    }
  }
  else if (v12)
  {
    objc_msgSend(v12, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D72DD0]);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 72))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v15);
    }
    else
    {
      v42 = a4;
      if (*(_BYTE *)(a1 + 73))
      {
        PXLocalizedStringFromTable(CFSTR("SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_RTL"), CFSTR("PhotosUICore"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v15, v20, v43);
      }
      else
      {
        PXLocalizedStringFromTable(CFSTR("SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_LTR"), CFSTR("PhotosUICore"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v43, v20, v15);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v21, "initWithString:", v22);
      v40 = (void *)v20;

      objc_msgSend(v16, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "rangeOfString:", v20);
      v36 = v25;
      v37 = v24;
      v26 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v27);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_msgSend(v23, "rangeOfString:", v41);
      v29 = v28;
      v39 = objc_msgSend(v23, "rangeOfString:", v43) + v28;
      v38 = v30 - v29;
      v31 = *MEMORY[0x1E0DC1140];
      +[PXSearchDisplayUtility wordEmbeddingTextColor](PXSearchDisplayUtility, "wordEmbeddingTextColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:range:", v31, v32, v37, v36);

      +[PXSearchDisplayUtility wordEmbeddingTextColor](PXSearchDisplayUtility, "wordEmbeddingTextColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:range:", v31, v33, v35, v29);

      +[PXSearchDisplayUtility wordEmbeddingPathColor](PXSearchDisplayUtility, "wordEmbeddingPathColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttribute:value:range:", v31, v34, v39, v38);

      a4 = v42;
    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);
    if (a3 >= 3)
      *a4 = 1;
    v19 = v13;
    goto LABEL_14;
  }

}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__210334;
  v17 = __Block_byref_object_dispose__210335;
  v18 = 0;
  v4 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_178;
  v10 = &unk_1E51368E0;
  v5 = v3;
  v11 = v5;
  v12 = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  if (v14[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7, v8, v9, v10);
    v6 = (void *)v14[5];
    v14[5] = 0;

  }
  _Block_object_dispose(&v13, 8);

}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2_180(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  _BYTE *v30;
  id v31;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D72DD0]);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v31);
  }
  else
  {
    v29 = a3;
    v30 = a4;
    if (*(_BYTE *)(a1 + 57))
    {
      PXLocalizedStringFromTable(CFSTR("SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_RTL"), CFSTR("PhotosUICore"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v31, v8, *(_QWORD *)(a1 + 32));
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_LTR"), CFSTR("PhotosUICore"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), *(_QWORD *)(a1 + 32), v8, v31);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v9, "initWithString:", v10);
    v28 = (void *)v8;

    objc_msgSend(v7, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v11, "rangeOfString:", v8);
    v13 = v12;
    v14 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v11, "rangeOfString:", v16);
    v19 = v18;
    v27 = objc_msgSend(v11, "rangeOfString:", *(_QWORD *)(a1 + 32)) + v18;
    v26 = v20 - v19;
    v21 = *MEMORY[0x1E0DC1140];
    +[PXSearchDisplayUtility wordEmbeddingTextColor](PXSearchDisplayUtility, "wordEmbeddingTextColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", v21, v22, v25, v13);

    +[PXSearchDisplayUtility wordEmbeddingTextColor](PXSearchDisplayUtility, "wordEmbeddingTextColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", v21, v23, v17, v19);

    +[PXSearchDisplayUtility wordEmbeddingPathColor](PXSearchDisplayUtility, "wordEmbeddingPathColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", v21, v24, v27, v26);

    a3 = v29;
    a4 = v30;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  if (a3 >= 3)
    *a4 = 1;

}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_178(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v7 = a2;
  v8 = *MEMORY[0x1E0D72DD0];
  v12 = v7;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D72DD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __104__PXSearchResultsDataUtility_photosDetailsContextFromCollectionUUID_collectionClass_dateRangeFormatter___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "preferredAttributesForMemoryCreationFromAssetCollection:proposedAttributes:", *(_QWORD *)(a1 + 32), a2);
}

@end
