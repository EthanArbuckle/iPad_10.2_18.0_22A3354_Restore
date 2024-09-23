@implementation UITextSearchingFindSession

- (UITextSearchingFindSession)initWithSearchableObject:(id)searchableObject
{
  id v4;
  UITextSearchingFindSession *v5;
  UITextSearchingFindSession *v6;
  NSMutableArray *v7;
  NSMutableArray *blocksAwaitingSearchResults;
  objc_super v10;

  v4 = searchableObject;
  v10.receiver = self;
  v10.super_class = (Class)UITextSearchingFindSession;
  v5 = -[UITextSearchingFindSession init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_searchableObject, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    blocksAwaitingSearchResults = v6->_blocksAwaitingSearchResults;
    v6->_blocksAwaitingSearchResults = v7;

    -[UITextSearchingFindSession _updateSearchableObjectProtocolConformance](v6, "_updateSearchableObjectProtocolConformance");
  }

  return v6;
}

- (UITextSearchingFindSession)initWithStronglyHeldSearchableObject:(id)a3
{
  id v5;
  UITextSearchingFindSession *v6;
  UITextSearchingFindSession *v7;

  v5 = a3;
  v6 = -[UITextSearchingFindSession initWithSearchableObject:](self, "initWithSearchableObject:", v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stronglyHeldSearchableObject, a3);

  return v7;
}

- (BOOL)supportsReplacement
{
  id WeakRetained;
  char v4;

  if ((*(_WORD *)&self->_searchableObjectConformsTo & 1) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  v4 = objc_msgSend(WeakRetained, "supportsTextReplacement");

  return v4;
}

- (BOOL)allowsReplacementForCurrentlyHighlightedResult
{
  _BOOL4 v3;
  id WeakRetained;
  char v5;

  v3 = -[UITextSearchingFindSession supportsReplacement](self, "supportsReplacement");
  if (v3)
  {
    if (self->_highlightedTextRange)
    {
      if ((*(_WORD *)&self->_searchableObjectConformsTo & 2) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
        v5 = objc_msgSend(WeakRetained, "shouldReplaceFoundTextInRange:inDocument:withText:", self->_highlightedTextRange, self->_highlightedDocument, &stru_1E16EDF20);

        LOBYTE(v3) = v5;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)_isCurrentSearchQueryValid
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UITextSearchingFindSession _hasResults](self, "_hasResults");
  if (v3)
  {
    -[UIFindSession searchText](self, "searchText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", self->_lastSearchQuery);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_nextResultRelativeToRange:(id *)a3 document:(id *)a4 inDirection:(int64_t)a5
{
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableOrderedSet *sortedDocumentIdentifiers;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v9 = (unint64_t)-[NSMutableOrderedSet count](self->_sortedDocumentIdentifiers, "count") < 2;
  -[NSMutableDictionary objectForKey:](self->_sortedResultsByDocument, "objectForKey:", *a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSearchingFindSession _textRangeComparatorForDocument:](self, "_textRangeComparatorForDocument:", *a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSearchingFindSession _nextItemInOrderedSet:usingComparator:fromItem:inDirection:loopAround:](self, "_nextItemInOrderedSet:usingComparator:fromItem:inDirection:loopAround:", v10, v11, *a3, a5, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    sortedDocumentIdentifiers = self->_sortedDocumentIdentifiers;
    -[UITextSearchingFindSession _documentComparator](self, "_documentComparator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSearchingFindSession _nextItemInOrderedSet:usingComparator:fromItem:inDirection:loopAround:](self, "_nextItemInOrderedSet:usingComparator:fromItem:inDirection:loopAround:", sortedDocumentIdentifiers, v14, *a4, a5, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_storeStrong(a4, v15);
      -[NSMutableDictionary objectForKey:](self->_sortedResultsByDocument, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (a5)
        objc_msgSend(v16, "lastObject");
      else
        objc_msgSend(v16, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  v18 = *a3;
  *a3 = v12;

}

- (void)_readilyHighlightNextResultInDirection:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  UITextSearchOptions *lastSearchOptions;
  UITextSearchOptions *v8;
  UITextSearchOptions *v9;
  void *v10;
  UITextRange *highlightedTextRange;
  NSObject *v12;
  UITextRange *v13;

  if (!self->_awaitingFirstResults
    && !-[UITextSearchingFindSession _isCurrentSearchQueryValid](self, "_isCurrentSearchQueryValid"))
  {
    -[UIFindSession searchText](self, "searchText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      -[UITextSearchingFindSession _setHighlightedRange:inDocument:](self, "_setHighlightedRange:inDocument:", 0, 0);
      lastSearchOptions = self->_lastSearchOptions;
      if (lastSearchOptions)
      {
        v8 = lastSearchOptions;
      }
      else
      {
        +[UITextSearchOptions defaultSearchOptions](UITextSearchOptions, "defaultSearchOptions");
        v8 = (UITextSearchOptions *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      -[UIFindSession searchText](self, "searchText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSearchingFindSession performSearchWithQuery:options:](self, "performSearchWithQuery:options:", v10, v9);

    }
  }
  highlightedTextRange = self->_highlightedTextRange;
  if (highlightedTextRange)
  {
    v13 = highlightedTextRange;
    v12 = self->_highlightedDocument;
    -[UITextSearchingFindSession _nextResultRelativeToRange:document:inDirection:](self, "_nextResultRelativeToRange:document:inDirection:", &v13, &v12, a3);
    -[UITextSearchingFindSession _setHighlightedRange:inDocument:](self, "_setHighlightedRange:inDocument:", v13, v12);

  }
  else
  {
    -[UITextSearchingFindSession highlightNearestFoundRangeToSelectedRangeIfNecessary](self, "highlightNearestFoundRangeToSelectedRangeIfNecessary");
  }
}

- (void)highlightNextResultInDirection:(int64_t)a3
{
  _QWORD v5[6];

  if (-[UITextSearchingFindSession _hasResults](self, "_hasResults") || !self->_isSearching)
  {
    -[UITextSearchingFindSession _readilyHighlightNextResultInDirection:](self, "_readilyHighlightNextResultInDirection:", a3);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__UITextSearchingFindSession_highlightNextResultInDirection___block_invoke;
    v5[3] = &unk_1E16B1888;
    v5[4] = self;
    v5[5] = a3;
    -[UITextSearchingFindSession _performBlockWhenSearchResultsAreAvailable:](self, "_performBlockWhenSearchResultsAreAvailable:", v5);
  }
}

void __61__UITextSearchingFindSession_highlightNextResultInDirection___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[19];
  if (v3)
  {
    v9 = v3;
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(*(id *)(a1 + 32), "_nextResultRelativeToRange:document:inDirection:", &v9, &v8, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_setHighlightedRange:inDocument:", v9, v8);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(_QWORD *)(v4 + 152) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 160);
    *(_QWORD *)(v6 + 160) = 0;

  }
  else
  {
    objc_msgSend(v2, "_readilyHighlightNextResultInDirection:", *(_QWORD *)(a1 + 40));
  }
}

- (int64_t)highlightedResultIndex
{
  void *v3;
  int64_t v4;

  -[UITextSearchingFindSession _allFoundRanges](self, "_allFoundRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self->_highlightedTextRange);

  return v4;
}

- (void)performSearchWithQuery:(id)a3 options:(id)a4
{
  NSString *v6;
  UITextSearchOptions *v7;
  NSString *lastSearchQuery;
  NSString *v9;
  UITextSearchOptions *lastSearchOptions;
  UITextSearchOptions *v11;
  id WeakRetained;
  _UITextSearchingFindSessionAggregator *v13;
  _UITextSearchingFindSessionAggregator *aggregator;
  id v15;

  v6 = (NSString *)a3;
  v7 = (UITextSearchOptions *)a4;
  self->_isSearching = 1;
  -[UITextSearchingFindSession reset](self, "reset");
  if (!v7)
  {
    +[UITextSearchOptions defaultSearchOptions](UITextSearchOptions, "defaultSearchOptions");
    v7 = (UITextSearchOptions *)objc_claimAutoreleasedReturnValue();
  }
  lastSearchQuery = self->_lastSearchQuery;
  self->_lastSearchQuery = v6;
  v9 = v6;

  lastSearchOptions = self->_lastSearchOptions;
  self->_lastSearchOptions = v7;
  v11 = v7;

  self->_awaitingFirstResults = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentInteraction);
  objc_msgSend(WeakRetained, "updateResultCount");

  -[_UITextSearchingFindSessionAggregator setValid:](self->_aggregator, "setValid:", 0);
  v13 = -[_UITextSearchingFindSessionAggregator initWithSession:]([_UITextSearchingFindSessionAggregator alloc], "initWithSession:", self);
  aggregator = self->_aggregator;
  self->_aggregator = v13;

  v15 = objc_loadWeakRetained((id *)&self->_searchableObject);
  objc_msgSend(v15, "performTextSearchWithQueryString:usingOptions:resultAggregator:", v9, v11, self->_aggregator);

}

- (void)_replaceHighlightedTextRangeWithReplacementString:(id)a3
{
  UITextRange *highlightedTextRange;
  UITextRange *v5;
  NSObject *v6;
  UITextSearching **p_searchableObject;
  id WeakRetained;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  highlightedTextRange = self->_highlightedTextRange;
  if (highlightedTextRange
    || (-[UITextSearchingFindSession _readilyHighlightNearestRangeToSelectedRangeIfNecessary](self, "_readilyHighlightNearestRangeToSelectedRangeIfNecessary"), (highlightedTextRange = self->_highlightedTextRange) != 0))
  {
    v5 = highlightedTextRange;
    v6 = self->_highlightedDocument;
    p_searchableObject = &self->_searchableObject;
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
    objc_msgSend(WeakRetained, "replaceFoundTextInRange:inDocument:withText:", v5, v6, v15);

    v9 = objc_msgSend(v15, "length");
    if (v9 == -[NSString length](self->_lastSearchQuery, "length"))
    {
      if ((objc_msgSend(v15, "isEqualToString:", self->_lastSearchQuery) & 1) == 0)
      {
        v10 = objc_loadWeakRetained((id *)p_searchableObject);
        objc_msgSend(v10, "decorateFoundTextRange:inDocument:usingStyle:", v5, v6, 0);

        if (v6)
          v11 = (const __CFString *)v6;
        else
          v11 = CFSTR("__singleton__");
        -[NSMutableDictionary objectForKey:](self->_sortedResultsByDocument, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v5);

        -[UITextSearchingFindSession _updateResultCountLabel](self, "_updateResultCountLabel");
      }
    }
    else
    {
      if (self->_highlightedTextRange)
      {
        v13 = objc_loadWeakRetained((id *)p_searchableObject);
        objc_msgSend(v13, "selectedTextRange");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_storeStrong((id *)&self->_highlightedRangeBeforeSubsequentSearch, self->_highlightedTextRange);
          objc_storeStrong((id *)&self->_highlightedDocumentBeforeSubsequentSearch, self->_highlightedDocument);
        }
      }
      -[UITextSearchingFindSession performSearchWithQuery:options:](self, "performSearchWithQuery:options:", self->_lastSearchQuery, self->_lastSearchOptions);
    }

  }
}

- (void)performSingleReplacementWithSearchQuery:(id)a3 replacementString:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  UITextSearchingFindSession *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[UITextSearchingFindSession supportsReplacement](self, "supportsReplacement"))
  {
    -[UIFindSession setSearchText:](self, "setSearchText:", v8);
    -[UIFindSession setReplacementText:](self, "setReplacementText:", v9);
    if (-[UITextSearchingFindSession _hasResults](self, "_hasResults")
      && objc_msgSend(v8, "isEqualToString:", self->_lastSearchQuery))
    {
      -[UITextSearchingFindSession _replaceHighlightedTextRangeWithReplacementString:](self, "_replaceHighlightedTextRangeWithReplacementString:", v9);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __96__UITextSearchingFindSession_performSingleReplacementWithSearchQuery_replacementString_options___block_invoke;
      v12[3] = &unk_1E16B47A8;
      v11 = v8;
      v13 = v11;
      v14 = self;
      v15 = v9;
      -[UITextSearchingFindSession _performBlockWhenSearchResultsAreAvailable:](self, "_performBlockWhenSearchResultsAreAvailable:", v12);
      -[UITextSearchingFindSession performSearchWithQuery:options:](self, "performSearchWithQuery:options:", v11, v10);
      -[UITextSearchingFindSession highlightNearestFoundRangeToSelectedRangeIfNecessary](self, "highlightNearestFoundRangeToSelectedRangeIfNecessary");

    }
  }

}

uint64_t __96__UITextSearchingFindSession_performSingleReplacementWithSearchQuery_replacementString_options___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_replaceHighlightedTextRangeWithReplacementString:", *(_QWORD *)(a1 + 48));
  return result;
}

- (void)replaceAllInstancesOfSearchQuery:(id)a3 withReplacementString:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id WeakRetained;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  UITextSearchingFindSession *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[UITextSearchingFindSession supportsReplacement](self, "supportsReplacement"))
  {
    -[UIFindSession setSearchText:](self, "setSearchText:", v8);
    -[UIFindSession setReplacementText:](self, "setReplacementText:", v9);
    if ((*(_WORD *)&self->_searchableObjectConformsTo & 8) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
      objc_msgSend(WeakRetained, "replaceAllOccurrencesOfQueryString:usingOptions:withText:", v8, v10, v9);

      -[UITextSearchingFindSession performSearchWithQuery:options:](self, "performSearchWithQuery:options:", v9, self->_lastSearchOptions);
    }
    else
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke;
      v16 = &unk_1E16B1B50;
      v17 = self;
      v18 = v9;
      v11 = (void (**)(_QWORD))_Block_copy(&v13);
      if (objc_msgSend(v8, "isEqualToString:", self->_lastSearchQuery, v13, v14, v15, v16, v17)
        && -[UITextSearchingFindSession _hasResults](self, "_hasResults"))
      {
        v11[2](v11);
      }
      else
      {
        -[UITextSearchingFindSession _performBlockWhenSearchResultsAreAvailable:](self, "_performBlockWhenSearchResultsAreAvailable:", v11);
        -[UITextSearchingFindSession performSearchWithQuery:options:](self, "performSearchWithQuery:options:", v8, v10);
      }

    }
  }

}

void __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  uint64_t v9;
  id v10;

  v5 = MEMORY[0x1E0C809B0];
  v7 = __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke_2;
  v8 = &unk_1E16E34F0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 112);
  v6 = 3221225472;
  v9 = v2;
  v10 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "performSearchWithQuery:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), v5, v6, v7, v8, v9);

}

void __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 184));
        objc_msgSend(WeakRetained, "replaceFoundTextInRange:inDocument:withText:", v11, v5, *(_QWORD *)(a1 + 40));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (int64_t)resultCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
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
  -[NSMutableDictionary allValues](self->_sortedResultsByDocument, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasResults
{
  return -[UITextSearchingFindSession resultCount](self, "resultCount") > 0;
}

- (void)reset
{
  id WeakRetained;
  UITextRange *highlightedTextRange;
  NSObject *highlightedDocument;
  UITextSearchOptions *lastSearchOptions;
  NSString *lastSearchQuery;
  id v8;

  -[NSMutableDictionary removeAllObjects](self->_sortedResultsByDocument, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_sortedDocumentIdentifiers, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  objc_msgSend(WeakRetained, "clearAllDecoratedFoundText");

  self->_awaitingFirstResults = 0;
  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  highlightedDocument = self->_highlightedDocument;
  self->_highlightedDocument = 0;

  lastSearchOptions = self->_lastSearchOptions;
  self->_lastSearchOptions = 0;

  lastSearchQuery = self->_lastSearchQuery;
  self->_lastSearchQuery = 0;

  v8 = objc_loadWeakRetained((id *)&self->_parentInteraction);
  objc_msgSend(v8, "updateResultCount");

}

- (void)_updateSearchableObjectProtocolConformance
{
  UITextSearching **p_searchableObject;
  id WeakRetained;
  id v5;
  __int16 v6;
  id v7;
  __int16 v8;
  id v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  __int16 v27;
  id v28;

  p_searchableObject = &self->_searchableObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFFE | objc_opt_respondsToSelector() & 1;

  v5 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFFD | v6;

  v7 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFFB | v8;

  v9 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 8;
  else
    v10 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFF7 | v10;

  v11 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 16;
  else
    v12 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFEF | v12;

  v13 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 32;
  else
    v14 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFDF | v14;

  v15 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = 64;
  else
    v16 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFBF | v16;

  v17 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = 128;
  else
    v18 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFF7F | v18;

  v19 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = 256;
  else
    v20 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFEFF | v20;

  v21 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = 512;
  else
    v22 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFDFF | v22;

  v23 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = 1024;
  else
    v24 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFBFF | v24;

  v25 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v26 = 4096;
  else
    v26 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xEFFF | v26;

  v28 = objc_loadWeakRetained((id *)p_searchableObject);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v27 = 2048;
  else
    v27 = 0;
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xF7FF | v27;

}

- (id)_nextItemInOrderedSet:(id)a3 usingComparator:(id)a4 fromItem:(id)a5 inDirection:(int64_t)a6 loopAround:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  void *v20;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = objc_msgSend(v11, "indexOfObject:", v13);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v13)
    {
      if (a6)
        objc_msgSend(v11, "lastObject");
      else
        objc_msgSend(v11, "firstObject");
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    v15 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, objc_msgSend(v11, "count"), 1024, v12)- (a6 == 1);
  }
  else if (a6)
  {
    v15 = v14 - 1;
  }
  else
  {
    v15 = v14 + 1;
  }
  v16 = objc_msgSend(v11, "count");
  if (v16)
  {
    v17 = v15 < 0 || v15 >= v16;
    v18 = !v17;
    if (v17 && v7)
    {
      if ((v15 & 0x8000000000000000) == 0)
      {
        v15 = 0;
LABEL_27:
        objc_msgSend(v11, "objectAtIndex:", v15);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_29:
        v20 = (void *)v19;
        goto LABEL_30;
      }
      v15 = v16 - 1;
    }
    else if (!v18)
    {
      goto LABEL_26;
    }
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_27;
  }
LABEL_26:
  v20 = 0;
LABEL_30:

  return v20;
}

- (id)_nearestRangeToSelectedRangeInDocument:(id)a3
{
  id v4;
  UITextSearching **p_searchableObject;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;

  v4 = a3;
  p_searchableObject = &self->_searchableObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  objc_msgSend(WeakRetained, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_sortedResultsByDocument, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
    goto LABEL_14;
  v10 = objc_msgSend(v8, "count");
  -[UITextSearchingFindSession _textRangeComparatorForDocument:](self, "_textRangeComparatorForDocument:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v10, 1024, v11);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  v13 = objc_msgSend(v9, "count");
  if (v12 >= v13 - 1)
    v14 = v13 - 1;
  else
    v14 = v12;
  objc_msgSend(v9, "objectAtIndex:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqual:", v7) && v12 < objc_msgSend(v9, "count") - 1)
  {
    objc_msgSend(v9, "objectAtIndex:", v12 + 1);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v17 = objc_loadWeakRetained((id *)p_searchableObject);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)p_searchableObject);
    objc_msgSend(v19, "endOfDocument");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "start");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqual:", v20);

    if (v22)
    {
      objc_msgSend(v9, "firstObject");
      v23 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v23;
    }

  }
  if (!v15)
  {
LABEL_14:
    objc_msgSend(v9, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)_readilyHighlightNearestRangeToSelectedRangeIfNecessary
{
  NSObject *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;

  if (!self->_highlightedTextRange)
  {
    v3 = self->_highlightedDocument;
    if (!v3)
    {
      if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x400) == 0
        || (WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject),
            objc_msgSend(WeakRetained, "selectedTextSearchDocument"),
            v7 = objc_claimAutoreleasedReturnValue(),
            WeakRetained,
            (v3 = v7) == 0))
      {
        -[NSMutableOrderedSet firstObject](self->_sortedDocumentIdentifiers, "firstObject");
        v5 = objc_claimAutoreleasedReturnValue();
        if (v5)
          v3 = v5;
        else
          v3 = CFSTR("__singleton__");
      }
    }
    v8 = v3;
    -[UITextSearchingFindSession _nearestRangeToSelectedRangeInDocument:](self, "_nearestRangeToSelectedRangeInDocument:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSearchingFindSession _setHighlightedRange:inDocument:](self, "_setHighlightedRange:inDocument:", v6, v8);

  }
}

- (void)highlightNearestFoundRangeToSelectedRangeIfNecessary
{
  _QWORD v3[5];

  if (-[UITextSearchingFindSession _hasResults](self, "_hasResults"))
  {
    -[UITextSearchingFindSession _readilyHighlightNearestRangeToSelectedRangeIfNecessary](self, "_readilyHighlightNearestRangeToSelectedRangeIfNecessary");
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __82__UITextSearchingFindSession_highlightNearestFoundRangeToSelectedRangeIfNecessary__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    -[UITextSearchingFindSession _performBlockWhenSearchResultsAreAvailable:](self, "_performBlockWhenSearchResultsAreAvailable:", v3);
  }
}

uint64_t __82__UITextSearchingFindSession_highlightNearestFoundRangeToSelectedRangeIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readilyHighlightNearestRangeToSelectedRangeIfNecessary");
}

- (void)_updateResultCountLabel
{
  id WeakRetained;

  self->_needsResultCountUpdate = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentInteraction);
  objc_msgSend(WeakRetained, "updateResultCount");

}

- (void)_setNeedsResultCountUpdate
{
  if (!self->_needsResultCountUpdate)
  {
    self->_needsResultCountUpdate = 1;
    -[UITextSearchingFindSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateResultCountLabel, 0, 0.0);
  }
}

- (void)_setHighlightedRange:(id)a3 inDocument:(id)a4
{
  id v7;
  id WeakRetained;
  UITextRange **p_highlightedTextRange;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
    objc_msgSend(WeakRetained, "willHighlightFoundTextRange:inDocument:", v16, v7);

  }
  p_highlightedTextRange = &self->_highlightedTextRange;
  if (self->_highlightedTextRange)
  {
    -[NSMutableDictionary objectForKey:](self->_sortedResultsByDocument, "objectForKey:", self->_highlightedDocument);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", *p_highlightedTextRange);

    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)&self->_searchableObject);
      objc_msgSend(v12, "decorateFoundTextRange:inDocument:usingStyle:", *p_highlightedTextRange, self->_highlightedDocument, 1);

    }
  }
  objc_storeStrong((id *)&self->_highlightedTextRange, a3);
  objc_storeStrong((id *)&self->_highlightedDocument, a4);
  if (v16)
  {
    v13 = objc_loadWeakRetained((id *)&self->_searchableObject);
    objc_msgSend(v13, "decorateFoundTextRange:inDocument:usingStyle:", v16, v7, 2);

    if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x20) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_searchableObject);
      objc_msgSend(v14, "scrollRangeToVisible:inDocument:", v16, v7);

    }
    -[UITextSearchingFindSession parentInteraction](self, "parentInteraction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateResultCount");

  }
}

- (id)_documentComparator
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id to;

  objc_copyWeak(&to, (id *)&self->_searchableObject);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__UITextSearchingFindSession__documentComparator__block_invoke;
  v4[3] = &unk_1E16E3518;
  objc_copyWeak(&v5, &to);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&to);
  return v2;
}

uint64_t __49__UITextSearchingFindSession__documentComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v8 = objc_msgSend(WeakRetained, "compareOrderFromDocument:toDocument:", v6, v5);

  return v8;
}

- (id)_textRangeComparatorForDocument:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_searchableObject);
  if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x1000) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke;
    v12[3] = &unk_1E16E3540;
    v12[4] = self;
    v13 = v4;
    v7 = v4;
    v6 = _Block_copy(v12);

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke_2;
    aBlock[3] = &unk_1E16E3568;
    objc_copyWeak(&v11, &to);
    v10 = v4;
    v5 = v4;
    v6 = _Block_copy(aBlock);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&to);
  return v6;
}

uint64_t __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 184);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = objc_msgSend(WeakRetained, "compareFoundRange:toRange:inDocument:", v7, v6, *(_QWORD *)(a1 + 40));

  return v9;
}

uint64_t __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "start");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(WeakRetained, "offsetFromPosition:toPosition:inDocument:", v9, v10, *(_QWORD *)(a1 + 32));
  if (v11)
    return -1;
  else
    return 0;
}

- (void)_performDelayedSearchOperations
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_blocksAwaitingSearchResults, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeObjectsInArray:](self->_blocksAwaitingSearchResults, "removeObjectsInArray:", v4, (_QWORD)v9);
  self->_readyToPerformDelayedSearchOperations = 0;

}

- (void)_setReadyToPerformDelayedSearchOperations
{
  if (!self->_readyToPerformDelayedSearchOperations)
  {
    -[UITextSearchingFindSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performDelayedSearchOperations, 0, 0.0);
    self->_readyToPerformDelayedSearchOperations = 1;
  }
}

- (void)_performBlockWhenSearchResultsAreAvailable:(id)a3
{
  NSMutableArray *blocksAwaitingSearchResults;
  void *v4;
  id v5;

  blocksAwaitingSearchResults = self->_blocksAwaitingSearchResults;
  v5 = (id)objc_msgSend(a3, "copy");
  v4 = _Block_copy(v5);
  -[NSMutableArray addObject:](blocksAwaitingSearchResults, "addObject:", v4);

}

- (id)_allFoundRanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableOrderedSet *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_sortedDocumentIdentifiers;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[NSMutableDictionary objectForKey:](self->_sortedResultsByDocument, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)_foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  NSMutableOrderedSet *sortedDocumentIdentifiers;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *v16;
  NSMutableOrderedSet *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *sortedResultsByDocument;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id WeakRetained;
  void *v32;
  id v33;

  v33 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v11 = v10;
  v12 = CFSTR("__singleton__");
  if (v10)
    v12 = v10;
  v13 = v12;
  sortedDocumentIdentifiers = self->_sortedDocumentIdentifiers;
  if (!sortedDocumentIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v15 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    v16 = self->_sortedDocumentIdentifiers;
    self->_sortedDocumentIdentifiers = v15;

    sortedDocumentIdentifiers = self->_sortedDocumentIdentifiers;
  }
  if ((-[NSMutableOrderedSet containsObject:](sortedDocumentIdentifiers, "containsObject:", v13) & 1) == 0)
  {
    if (-[NSMutableOrderedSet count](self->_sortedDocumentIdentifiers, "count")
      && (*(_WORD *)&self->_searchableObjectConformsTo & 0x800) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextSearchingFindSession.m"), 618, CFSTR("UITextSearching: When providing multiple documents to the aggregator, you must implement the optional method compareOrderFromDocument:toDocument:."));

    }
    v17 = self->_sortedDocumentIdentifiers;
    v18 = -[NSMutableOrderedSet count](v17, "count");
    -[UITextSearchingFindSession _documentComparator](self, "_documentComparator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](v17, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, v18, 1024, v19);

    -[NSMutableOrderedSet insertObject:atIndex:](self->_sortedDocumentIdentifiers, "insertObject:atIndex:", v13, v20);
  }
  sortedResultsByDocument = self->_sortedResultsByDocument;
  if (!sortedResultsByDocument)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v23 = self->_sortedResultsByDocument;
    self->_sortedResultsByDocument = v22;

    sortedResultsByDocument = self->_sortedResultsByDocument;
  }
  -[NSMutableDictionary objectForKey:](sortedResultsByDocument, "objectForKey:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v25 = self->_sortedResultsByDocument;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, v13);

  }
  -[NSMutableDictionary objectForKey:](self->_sortedResultsByDocument, "objectForKey:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");
  -[UITextSearchingFindSession _textRangeComparatorForDocument:](self, "_textRangeComparatorForDocument:", v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v27, "indexOfObject:inSortedRange:options:usingComparator:", v33, 0, v28, 1024, v29);

  objc_msgSend(v27, "insertObject:atIndex:", v33, v30);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  objc_msgSend(WeakRetained, "decorateFoundTextRange:inDocument:usingStyle:", v33, v11, 1);

  self->_awaitingFirstResults = 0;
  -[UITextSearchingFindSession _setNeedsResultCountUpdate](self, "_setNeedsResultCountUpdate");
  -[UITextSearchingFindSession _setReadyToPerformDelayedSearchOperations](self, "_setReadyToPerformDelayedSearchOperations");

}

- (void)_invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  const __CFString *v6;
  NSMutableDictionary *sortedResultsByDocument;
  id v8;
  void *v9;
  id v10;

  if (a4)
    v6 = (const __CFString *)a4;
  else
    v6 = CFSTR("__singleton__");
  sortedResultsByDocument = self->_sortedResultsByDocument;
  v10 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKey:](sortedResultsByDocument, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v8);

  LODWORD(v9) = objc_msgSend(v8, "isEqual:", self->_highlightedTextRange);
  if ((_DWORD)v9)
    -[UITextSearchingFindSession highlightNextResultInDirection:](self, "highlightNextResultInDirection:", 0);
  -[UITextSearchingFindSession _setNeedsResultCountUpdate](self, "_setNeedsResultCountUpdate");

}

- (void)_invalidateAllFoundRanges
{
  -[UITextSearchingFindSession reset](self, "reset");
  -[UITextSearchingFindSession _setNeedsResultCountUpdate](self, "_setNeedsResultCountUpdate");
}

- (void)_finishedSearching
{
  self->_isSearching = 0;
  -[UITextSearchingFindSession _setNeedsResultCountUpdate](self, "_setNeedsResultCountUpdate");
  -[UITextSearchingFindSession _performDelayedSearchOperations](self, "_performDelayedSearchOperations");
}

- (id)parentInteraction
{
  return objc_loadWeakRetained((id *)&self->_parentInteraction);
}

- (void)setParentInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_parentInteraction, a3);
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (id)searchableObject
{
  return objc_loadWeakRetained((id *)&self->_searchableObject);
}

- (void)setSearchableObject:(id)a3
{
  objc_storeWeak((id *)&self->_searchableObject, a3);
}

- (UITextSearching)stronglyHeldSearchableObject
{
  return self->_stronglyHeldSearchableObject;
}

- (void)setStronglyHeldSearchableObject:(id)a3
{
  objc_storeStrong((id *)&self->_stronglyHeldSearchableObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stronglyHeldSearchableObject, 0);
  objc_destroyWeak((id *)&self->_searchableObject);
  objc_destroyWeak((id *)&self->_parentInteraction);
  objc_storeStrong((id *)&self->_highlightedDocumentBeforeSubsequentSearch, 0);
  objc_storeStrong((id *)&self->_highlightedRangeBeforeSubsequentSearch, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_lastSearchOptions, 0);
  objc_storeStrong((id *)&self->_lastSearchQuery, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingSearchResults, 0);
  objc_storeStrong((id *)&self->_sortedResultsByDocument, 0);
  objc_storeStrong((id *)&self->_sortedDocumentIdentifiers, 0);
  objc_storeStrong((id *)&self->_highlightedDocument, 0);
  objc_storeStrong((id *)&self->_highlightedTextRange, 0);
}

@end
