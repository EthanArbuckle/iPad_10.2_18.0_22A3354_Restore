@implementation PXSearchSuggestionsSectionProvider

- (PXSearchSuggestionsSectionProvider)init
{
  PXSearchSuggestionsSectionProvider *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSearchSuggestionsSectionProvider;
  v2 = -[PXSearchSuggestionsSectionProvider init](&v4, sel_init);
  if (v2)
  {
    v2->identifier = sub_1A7ADF414();
    -[PXSearchSuggestionsSectionProvider _setSearchSuggestions:showsSuggestedSearchesHeader:](v2, "_setSearchSuggestions:showsSuggestedSearchesHeader:", MEMORY[0x1E0C9AA60], 0);
  }
  return v2;
}

- (void)setSearchQueryResult:(id)a3
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryResult"));

    v5 = 0;
  }
  objc_msgSend(v5, "searchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v11, "searchSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count") != 0;

  }
  objc_msgSend(v11, "searchSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchSuggestionsSectionProvider _setSearchSuggestions:showsSuggestedSearchesHeader:](self, "_setSearchSuggestions:showsSuggestedSearchesHeader:", v9, v7);

}

- (id)suggestions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[PXSearchSuggestionsSectionProvider sortedItemIdentifiers](self, "sortedItemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXSearchSuggestionsSectionProvider sortedItemIdentifiers](self, "sortedItemIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[PXSearchSuggestionsSectionProvider identifierToSuggestionMap](self, "identifierToSuggestionMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (void)_setSearchSuggestions:(id)a3 showsSuggestedSearchesHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchSuggestions"));

  }
  -[PXSearchSuggestionsSectionProvider setShowsSuggestedSearchesHeader:](self, "setShowsSuggestedSearchesHeader:", v4);
  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchSuggestionsSectionProvider setSortedItemIdentifiers:](self, "setSortedItemIdentifiers:", v8);

  v9 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[PXSearchSuggestionsSectionProvider setIdentifierToSuggestionMap:](self, "setIdentifierToSuggestionMap:", v9);
  -[PXSearchSuggestionsSectionProvider changeObserver](self, "changeObserver");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchDataSourceSectionProviderDidChange:animateChanges:", self, 0);

}

- (id)searchSuggestionForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionIdentifier"));

  }
  -[PXSearchSuggestionsSectionProvider identifierToSuggestionMap](self, "identifierToSuggestionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)type
{
  return 3;
}

- (NSArray)sectionIdentifiers
{
  void *v2;

  -[PXSearchSuggestionsSectionProvider sortedItemIdentifiers](self, "sortedItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return (NSArray *)&unk_1E53E9978;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  return -[PXSearchSuggestionsSectionProvider sortedItemIdentifiers](self, "sortedItemIdentifiers");
}

- (void)registerClassesForCellReuseIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = objc_opt_class();
  +[PXSearchSuggestionCell reuseIdentifier](PXSearchSuggestionCell, "reuseIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, id))a3 + 2))(v4, v5, v6);

}

- (id)cellReuseIdentifierForItemIdentifier:(id)a3
{
  return +[PXSearchSuggestionCell reuseIdentifier](PXSearchSuggestionCell, "reuseIdentifier", a3);
}

- (void)configureCell:(id)a3 forItemIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v17 = v7;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 131, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell"), v13, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 131, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell"), v13);
  }

LABEL_3:
  -[PXSearchSuggestionsSectionProvider identifierToSuggestionMap](self, "identifierToSuggestionMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchTokenSuggestion"));

  }
  objc_msgSend(v17, "setSearchSuggestion:", v10);

}

- (void)registerClassesForSupplementaryViewReuseIdentifiers:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = objc_opt_class();
  v5 = *MEMORY[0x1E0DC57A0];
  +[PXSearchSuggestionsHeaderView reuseIdentifier](PXSearchSuggestionsHeaderView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, uint64_t, void *))a3 + 2))(v8, v4, v5, v6);

  v7 = objc_opt_class();
  (*((void (**)(id, uint64_t, _QWORD, const __CFString *))a3 + 2))(v8, v7, *MEMORY[0x1E0DC5798], CFSTR("PXSearchSuggestionsSectionFooterReuseIdentifier"));

}

- (id)supplementaryViewReuseIdentifierForKind:(id)a3 indexPath:(id)a4
{
  id v7;
  id v8;
  __CFString *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if ((id)*MEMORY[0x1E0DC57A0] == v7)
  {
    +[PXSearchSuggestionsHeaderView reuseIdentifier](PXSearchSuggestionsHeaderView, "reuseIdentifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((id)*MEMORY[0x1E0DC5798] != v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionsSectionProvider.m"), 153, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v9 = CFSTR("PXSearchSuggestionsSectionFooterReuseIdentifier");
  }

  return v9;
}

- (id)layoutForSectionIdentifier:(id)a3 environment:(id)a4 collectionViewLayoutMargins:(UIEdgeInsets)a5
{
  double bottom;
  id v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  _BOOL4 v20;

  bottom = a5.bottom;
  v7 = a4;
  v8 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  objc_msgSend(v7, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "horizontalSizeClass") == 2 || v8;

  if (v10)
    v11 = 2;
  else
    v11 = 1;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4098]), "initWithAppearanceStyle:layoutEnvironment:", v11, v7);
  v13 = -[PXSearchSuggestionsSectionProvider showsSuggestedSearchesHeader](self, "showsSuggestedSearchesHeader");
  v14 = 1.79769313e308;
  if (!v13)
    v14 = 0.0;
  objc_msgSend(v12, "setSectionHeaderHeight:", v14);
  objc_msgSend(v12, "setSectionFooterHeight:", 1.0);
  if (v8)
  {
    +[PXLemonadePeopleCellSpecsConstants smallCornerRadius](PXLemonadePeopleCellSpecsConstants, "smallCornerRadius");
    objc_msgSend(v12, "setCornerRadius:");
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4090]), "initWithConfiguration:layoutEnvironment:", v12, v7);
  v16 = v15;
  if (v8)
  {
    v17 = 2;
  }
  else
  {
    v18 = 0.0;
    if (v10)
      v18 = bottom;
    objc_msgSend(v15, "setContentInsets:", v18, 0.0, 0.0, 0.0);
    objc_msgSend(v7, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "horizontalSizeClass") == 2;

    v17 = 4 * v20;
  }
  objc_msgSend(v16, "setContentInsetsReference:", v17);

  return v16;
}

- (PXSearchDataSourceSectionProviderChangeObserver)changeObserver
{
  return (PXSearchDataSourceSectionProviderChangeObserver *)objc_loadWeakRetained((id *)&self->changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->changeObserver, a3);
}

- (int64_t)identifier
{
  return self->identifier;
}

- (NSDictionary)identifierToSuggestionMap
{
  return self->_identifierToSuggestionMap;
}

- (void)setIdentifierToSuggestionMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)sortedItemIdentifiers
{
  return self->_sortedItemIdentifiers;
}

- (void)setSortedItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)showsSuggestedSearchesHeader
{
  return self->_showsSuggestedSearchesHeader;
}

- (void)setShowsSuggestedSearchesHeader:(BOOL)a3
{
  self->_showsSuggestedSearchesHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifierToSuggestionMap, 0);
  objc_destroyWeak((id *)&self->changeObserver);
}

uint64_t __89__PXSearchSuggestionsSectionProvider__setSearchSuggestions_showsSuggestedSearchesHeader___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
