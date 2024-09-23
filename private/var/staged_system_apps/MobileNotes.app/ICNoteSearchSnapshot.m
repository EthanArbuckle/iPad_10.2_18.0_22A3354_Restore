@implementation ICNoteSearchSnapshot

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICNoteSearchSnapshot)initWithDiffableDataSource:(id)a3 containerViewMode:(int64_t)a4 collectionView:(id)a5 searchContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  ICNoteSearchSnapshot *v14;
  ICNoteSearchSnapshot *v15;
  uint64_t v16;
  NSDiffableDataSourceSnapshot *currentSnapshot;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICNoteSearchSnapshot;
  v14 = -[ICNoteSearchSnapshot init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_diffableDataSource, a3);
    v15->_containerViewMode = a4;
    objc_storeStrong((id *)&v15->_collectionView, a5);
    objc_storeWeak((id *)&v15->_searchContext, v13);
    v15->_mode = +[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions");
    v15->_includesCannedSuggestionToken = 0;
    v16 = objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshotClearingPreviousResults:](v15, "currentSnapshotClearingPreviousResults:", 0));
    currentSnapshot = v15->_currentSnapshot;
    v15->_currentSnapshot = (NSDiffableDataSourceSnapshot *)v16;

  }
  return v15;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (id)currentSnapshotClearingPreviousResults:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot diffableDataSource](self, "diffableDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshot"));

  if (v3)
    objc_msgSend(v5, "deleteAllItems");
  return v5;
}

- (BOOL)isCompactSize
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot collectionView](self, "collectionView"));
  v3 = objc_msgSend(v2, "ic_hasCompactSize");

  return v3;
}

- (BOOL)integratesSuggestions
{
  unsigned __int8 v3;
  unsigned int v4;
  BOOL result;

  v3 = -[ICNoteSearchSnapshot isCompactSize](self, "isCompactSize");
  v4 = +[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions");
  result = v3 & v4;
  if ((v3 & 1) == 0)
  {
    if (v4)
      return -[ICNoteSearchSnapshot containerViewMode](self, "containerViewMode") == 0;
  }
  return result;
}

- (NSArray)currentSuggestions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSArray *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot searchResults](self, "searchResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "suggestions"));
  v4 = objc_msgSend(v3, "copy");
  v5 = v4;
  if (!v4)
    v4 = &__NSArray0__struct;
  v6 = (NSArray *)v4;

  return v6;
}

- (void)prepareSearchWithCannedSuggestionToken:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  SearchResults *v8;
  const __CFString *v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshot](self, "currentSnapshot"));
  v9 = CFSTR("ICNoteSearchDataSourceSuggestionsSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(v5, "deleteSectionsWithIdentifiers:", v6);

  -[ICNoteSearchSnapshot applyAndUpdateHeaders:animated:](self, "applyAndUpdateHeaders:animated:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshotClearingPreviousResults:](self, "currentSnapshotClearingPreviousResults:", 1));
  -[ICNoteSearchSnapshot setCurrentSnapshot:](self, "setCurrentSnapshot:", v7);

  -[ICNoteSearchSnapshot setIncludesCannedSuggestionToken:](self, "setIncludesCannedSuggestionToken:", v3);
  v8 = objc_alloc_init(SearchResults);
  -[ICNoteSearchSnapshot setSearchResults:](self, "setSearchResults:", v8);

}

- (void)insertItems:(id)a3 intoSection:(id)a4 snapshot:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v9, "numberOfSections")
    || objc_msgSend(v9, "indexOfSectionIdentifier:", v8) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v9, "appendSectionsWithIdentifiers:", v10);

  }
  if (v7 && objc_msgSend(v7, "count"))
  {
    v11 = objc_msgSend(v7, "copy");
    objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v11, v8);

  }
}

- (void)updateWithResults:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if ((id)-[ICNoteSearchSnapshot behavior](self, "behavior") != (id)1
          || objc_msgSend(v9, "isMathNote"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot searchResults](self, "searchResults"));
          objc_msgSend(v10, "addResult:", v9);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[ICNoteSearchSnapshot switchToMode:force:](self, "switchToMode:force:", -[ICNoteSearchSnapshot mode](self, "mode"), 1);

}

- (void)clear
{
  void *v3;
  SearchResults *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshotClearingPreviousResults:](self, "currentSnapshotClearingPreviousResults:", 1));
  -[ICNoteSearchSnapshot setCurrentSnapshot:](self, "setCurrentSnapshot:", v3);

  v4 = objc_alloc_init(SearchResults);
  -[ICNoteSearchSnapshot setSearchResults:](self, "setSearchResults:", v4);

  if (-[ICNoteSearchSnapshot integratesSuggestions](self, "integratesSuggestions"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchSuggestion orderedDefaultSearchSuggestions](ICSearchSuggestion, "orderedDefaultSearchSuggestions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshot](self, "currentSnapshot"));
    -[ICNoteSearchSnapshot insertItems:intoSection:snapshot:](self, "insertItems:intoSection:snapshot:", v5, CFSTR("ICNoteSearchDataSourceSuggestionsSectionIdentifier"), v6);

  }
  -[ICNoteSearchSnapshot applyAndUpdateHeaders:animated:](self, "applyAndUpdateHeaders:animated:", 0, 0);
}

- (void)performBlockAndUpdateHeaders:(BOOL)a3 animated:(BOOL)a4 block:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1000C1558;
  v20 = sub_1000C1568;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshot](self, "currentSnapshot"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000C1570;
  v13 = &unk_100553F40;
  v9 = v8;
  v14 = v9;
  v15 = &v16;
  performBlockOnMainThreadAndWait(&v10);
  -[ICNoteSearchSnapshot setCurrentSnapshot:](self, "setCurrentSnapshot:", v17[5], v10, v11, v12, v13);
  -[ICNoteSearchSnapshot applyAndUpdateHeaders:animated:](self, "applyAndUpdateHeaders:animated:", v6, v5);

  _Block_object_dispose(&v16, 8);
}

- (void)applyAndUpdateHeaders:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;
  void **v9;
  uint64_t (*v10)(uint64_t);
  void ***v11;
  void **v12;
  void **v13;
  void *v14;
  void **v15;
  void **v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshot](self, "currentSnapshot"));

  if (!v7)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.currentSnapshot != ((void *)0)", "-[ICNoteSearchSnapshot applyAndUpdateHeaders:animated:]", 1, 0, CFSTR("Unexpected nil snapshot"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C170C;
  v17[3] = &unk_100550688;
  v19 = a3;
  v17[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot currentSnapshot](self, "currentSnapshot"));
  v18 = v8;
  v9 = objc_retainBlock(v17);
  if (v4)
  {
    v16 = _NSConcreteStackBlock;
    v10 = sub_1000C1898;
    v11 = &v16;
  }
  else
  {
    v15 = _NSConcreteStackBlock;
    v10 = sub_1000C18DC;
    v11 = &v15;
  }
  v11[1] = (void **)3221225472;
  v11[2] = (void **)v10;
  v11[3] = (void **)&unk_10054FEA8;
  v11[4] = (void **)&self->super.isa;
  v12 = (void **)v8;
  v11[5] = v12;
  v11[6] = v9;
  v13 = v9;
  performBlockOnMainThread(v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "postNotificationName:object:", ICDataSourceDataUpdateDidRenderNotification, self);

}

- (void)updateHeaderView:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot diffableDataSource](self, "diffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshot"));
  -[ICNoteSearchSnapshot updateHeaderView:forIndexPath:usingSnapshot:](self, "updateHeaderView:forIndexPath:usingSnapshot:", v7, v6, v8);

}

- (void)updateHeaderView:(id)a3 forIndexPath:(id)a4 usingSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "section");
  if ((uint64_t)v10 < (uint64_t)objc_msgSend(v9, "numberOfSections"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionIdentifiers"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));

    if (v12 == CFSTR("ICNoteSearchDataSourceTopHitsSectionIdentifier"))
    {
      if (objc_msgSend(v9, "indexOfSectionIdentifier:", CFSTR("ICNoteSearchDataSourceTopHitsSectionIdentifier")) == (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_17;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Top Hits"), &stru_1005704B8, 0));

      v17 = objc_msgSend(v9, "numberOfItemsInSection:", CFSTR("ICNoteSearchDataSourceTopHitsSectionIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("%lu (Top_Hits) Found");
    }
    else
    {
      if (v12 != CFSTR("ICNoteSearchDataSourceNoteSectionIdentifier"))
      {
        if (v12 == CFSTR("ICNoteSearchDataSourceSuggestionsSectionIdentifier"))
        {
          if (objc_msgSend(v9, "indexOfSectionIdentifier:", CFSTR("ICNoteSearchDataSourceSuggestionsSectionIdentifier")) != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Suggested"), &stru_1005704B8, 0));
            v13 = 0;
            goto LABEL_15;
          }
        }
        else if (v12 == CFSTR("ICNoteSearchDataSourceAttachmentSectionIdentifier")
               && objc_msgSend(v9, "indexOfSectionIdentifier:", CFSTR("ICNoteSearchDataSourceAttachmentSectionIdentifier")) != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (-[ICNoteSearchSnapshot includesCannedSuggestionToken](self, "includesCannedSuggestionToken"))
          {
            v13 = 0;
            v14 = 0;
            v15 = 1;
LABEL_18:
            objc_msgSend(v24, "setHidden:", v15);
            objc_msgSend(v24, "setTitle:detail:", v14, v13);

            goto LABEL_19;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Attachments"), &stru_1005704B8, 0));

          v17 = objc_msgSend(v9, "numberOfItemsInSection:", CFSTR("ICNoteSearchDataSourceAttachmentSectionIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v19 = v18;
          v20 = CFSTR("%lu (Attachments) Found");
          goto LABEL_14;
        }
LABEL_17:
        v15 = 0;
        v13 = 0;
        v14 = 0;
        goto LABEL_18;
      }
      if (objc_msgSend(v9, "indexOfSectionIdentifier:", CFSTR("ICNoteSearchDataSourceNoteSectionIdentifier")) == (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Notes"), &stru_1005704B8, 0));

      v17 = objc_msgSend(v9, "numberOfItemsInSection:", CFSTR("ICNoteSearchDataSourceNoteSectionIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      v20 = CFSTR("%lu (Notes) Found");
    }
LABEL_14:
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1005704B8, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v17));

LABEL_15:
    v15 = 0;
    goto LABEL_18;
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteSearchSnapshot updateHeaderView:forIndexPath:usingSnapshot:]", 1, 0, CFSTR("Snapshot out of sync with collection view. Asked to update visible header view for section that doesn't exist in snapshot. Asking for section %ld, got %ld sections."), objc_msgSend(v8, "section"), objc_msgSend(v9, "numberOfSections"));
LABEL_19:

}

- (void)switchToMode:(unint64_t)a3
{
  -[ICNoteSearchSnapshot switchToMode:force:](self, "switchToMode:force:", a3, 0);
}

- (void)switchToMode:(unint64_t)a3 force:(BOOL)a4
{
  _QWORD v4[6];

  if (a4 || self->_mode != a3)
  {
    self->_mode = a3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000C1DE4;
    v4[3] = &unk_100553F68;
    v4[4] = self;
    v4[5] = a3;
    -[ICNoteSearchSnapshot performBlockAndUpdateHeaders:animated:block:](self, "performBlockAndUpdateHeaders:animated:block:", 1, 0, v4);
  }
}

- (void)setVisibleSearchSuggestions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((id)-[ICNoteSearchSnapshot behavior](self, "behavior") != (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v7));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot searchResults](self, "searchResults"));
    objc_msgSend(v5, "setSuggestions:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchSnapshot delegate](self, "delegate"));
    objc_msgSend(v6, "searchSnapshotDidUpdateSuggestions:", self);

  }
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (ICNoteSearchSnapshotDelegate)delegate
{
  return (ICNoteSearchSnapshotDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ICSearchSuggestionsContext)searchContext
{
  return (ICSearchSuggestionsContext *)objc_loadWeakRetained((id *)&self->_searchContext);
}

- (void)setSearchContext:(id)a3
{
  objc_storeWeak((id *)&self->_searchContext, a3);
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_currentSnapshot, a3);
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (int64_t)containerViewMode
{
  return self->_containerViewMode;
}

- (void)setContainerViewMode:(int64_t)a3
{
  self->_containerViewMode = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)setIsCompactSize:(BOOL)a3
{
  self->_isCompactSize = a3;
}

- (SearchResults)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)includesCannedSuggestionToken
{
  return self->_includesCannedSuggestionToken;
}

- (void)setIncludesCannedSuggestionToken:(BOOL)a3
{
  self->_includesCannedSuggestionToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_destroyWeak((id *)&self->_searchContext);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
