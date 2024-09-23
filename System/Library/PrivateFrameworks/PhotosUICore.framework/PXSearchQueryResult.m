@implementation PXSearchQueryResult

- (PXSearchQueryResult)initWithSearchQuery:(id)a3 searchResults:(id)a4 searchAssetResults:(id)a5 curatedAssetsFetchResult:(id)a6 searchSuggestions:(id)a7 searchQueryMatchInfo:(id)a8 reloadItemIdentifiers:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PXSearchQueryResult *v23;
  uint64_t v24;
  PXSearchQuery *searchQuery;
  uint64_t v26;
  NSArray *searchResults;
  uint64_t v28;
  NSArray *searchAssetResults;
  uint64_t v30;
  NSArray *searchSuggestions;
  uint64_t v32;
  NSArray *reloadItemIdentifiers;
  uint64_t v34;
  PXSearchQueryMatchInfo *searchQueryMatchInfo;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResult.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResult.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchAssetResults"));

      if (v22)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResult.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResults"));

  if (!v18)
    goto LABEL_10;
LABEL_4:
  if (v22)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResult.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reloadItemIdentifiers"));

LABEL_5:
  v41.receiver = self;
  v41.super_class = (Class)PXSearchQueryResult;
  v23 = -[PXSearchQueryResult init](&v41, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    searchQuery = v23->_searchQuery;
    v23->_searchQuery = (PXSearchQuery *)v24;

    v26 = objc_msgSend(v17, "copy");
    searchResults = v23->_searchResults;
    v23->_searchResults = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    searchAssetResults = v23->_searchAssetResults;
    v23->_searchAssetResults = (NSArray *)v28;

    objc_storeStrong((id *)&v23->_curatedAssetsFetchResult, a6);
    v30 = objc_msgSend(v20, "copy");
    searchSuggestions = v23->_searchSuggestions;
    v23->_searchSuggestions = (NSArray *)v30;

    v32 = objc_msgSend(v22, "copy");
    reloadItemIdentifiers = v23->_reloadItemIdentifiers;
    v23->_reloadItemIdentifiers = (NSArray *)v32;

    v34 = objc_msgSend(v21, "copy");
    searchQueryMatchInfo = v23->_searchQueryMatchInfo;
    v23->_searchQueryMatchInfo = (PXSearchQueryMatchInfo *)v34;

  }
  return v23;
}

- (id)initEmptySearchQueryResultForQuery:(id)a3
{
  return -[PXSearchQueryResult initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:](self, "initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60]);
}

- (PXSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (NSArray)searchAssetResults
{
  return self->_searchAssetResults;
}

- (PHFetchResult)curatedAssetsFetchResult
{
  return self->_curatedAssetsFetchResult;
}

- (NSArray)searchSuggestions
{
  return self->_searchSuggestions;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (NSArray)reloadItemIdentifiers
{
  return self->_reloadItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_searchSuggestions, 0);
  objc_storeStrong((id *)&self->_curatedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_searchAssetResults, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end
