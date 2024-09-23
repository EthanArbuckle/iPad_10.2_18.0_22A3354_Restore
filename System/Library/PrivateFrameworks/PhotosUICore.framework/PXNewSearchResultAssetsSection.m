@implementation PXNewSearchResultAssetsSection

- (PXNewSearchResultAssetsSection)initWithCuratedAssetSearchResults:(id)a3 curatedAssetSearchResultsFetchResult:(id)a4 allAssetSearchResults:(id)a5
{
  id v9;
  id v10;
  PXNewSearchResultAssetsSection *v11;
  PXNewSearchResultAssetsSection *v12;
  uint64_t v13;
  NSArray *allAssetResults;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXNewSearchResultAssetsSection;
  v11 = -[PXNewSearchResultsSection initWithType:results:](&v16, sel_initWithType_results_, 17, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_curatedAssetFetchResult, a4);
    v13 = objc_msgSend(v10, "copy");
    allAssetResults = v12->_allAssetResults;
    v12->_allAssetResults = (NSArray *)v13;

  }
  return v12;
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;

  PXLocalizedStringFromTable(CFSTR("SEARCH_RESULT_SECTION_HEADER_PHOTOS_TITLE"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNewSearchResultAssetsSection allAssetResults](self, "allAssetResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");
  PXLocalizedStringWithValidatedFormat(v3, CFSTR("%lu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)allAssetResultUUIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[PXNewSearchResultAssetsSection allAssetResults](self, "allAssetResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v4;
}

- (id)assetForSearchResultIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchResultAssetsSection_Internal.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  -[PXNewSearchResultsSection searchResultForIdentifier:](self, "searchResultForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNewSearchResultAssetsSection_Internal.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  -[PXNewSearchResultsSection results](self, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PXNewSearchResultsSection description](self, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = (unint64_t)v6;
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v16;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Photos Search Result Section: Asset result %@ for identifier %@ does not exist in section: %@", buf, 0x20u);

    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  -[PXNewSearchResultAssetsSection curatedAssetFetchResult](self, "curatedAssetFetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v8 >= v11)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[PXNewSearchResultAssetsSection curatedAssetFetchResult](self, "curatedAssetFetchResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXNewSearchResultsSection description](self, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v22 = v8;
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Photos Search Result Section: Index %lu for item identifier %@ search result %@ is greater than the size of the asset fetch result: %@\nSection: %@", buf, 0x34u);

    }
    goto LABEL_14;
  }
  -[PXNewSearchResultAssetsSection curatedAssetFetchResult](self, "curatedAssetFetchResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v13;
}

- (id)searchResultForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PXNewSearchResultsSection results](self, "results", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "assetUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v14 = v12;
        if (v13 == v14)
        {

LABEL_13:
          v17 = v10;
          goto LABEL_14;
        }
        v15 = v14;
        v16 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_14:

  return v17;
}

- (void)setAllAssetResultUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PHFetchResult)curatedAssetFetchResult
{
  return self->_curatedAssetFetchResult;
}

- (void)setCuratedAssetFetchResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)allAssetResults
{
  return self->_allAssetResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssetResults, 0);
  objc_storeStrong((id *)&self->_curatedAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_allAssetResultUUIDs, 0);
}

uint64_t __53__PXNewSearchResultAssetsSection_allAssetResultUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetUUID");
}

@end
