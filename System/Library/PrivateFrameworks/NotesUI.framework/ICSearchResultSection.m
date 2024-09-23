@implementation ICSearchResultSection

- (ICSearchResultSection)init
{
  ICSearchResultSection *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSearchResultSection;
  v2 = -[ICSearchResultSection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[ICSearchResultSection setSearchResults:](v2, "setSearchResults:", v3);

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICSearchResultSection setIdentifierToSearchResult:](v2, "setIdentifierToSearchResult:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICSearchResultSection setHiddenSearchResults:](v2, "setHiddenSearchResults:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICSearchResultSection setUnhiddenSearchResults:](v2, "setUnhiddenSearchResults:", v6);

  }
  return v2;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ICSearchResultSection searchResults](self, "searchResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)identifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[ICSearchResultSection identifierToSearchResult](self, "identifierToSearchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return v6;
}

- (id)hiddenIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[ICSearchResultSection hiddenSearchResults](self, "hiddenSearchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return v6;
}

- (BOOL)removeSearchResultForIdentifier:(id)a3 forHiding:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[ICSearchResultSection identifierToSearchResult](self, "identifierToSearchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
    if (v8)
    {
      -[ICSearchResultSection searchResults](self, "searchResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v8);

      -[ICSearchResultSection identifierToSearchResult](self, "identifierToSearchResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v6);

      if (v4)
      {
        -[ICSearchResultSection hiddenSearchResults](self, "hiddenSearchResults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v6);

        -[ICSearchResultSection unhiddenSearchResults](self, "unhiddenSearchResults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v6);

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifier", "-[ICSearchResultSection removeSearchResultForIdentifier:forHiding:]", 1, 0, CFSTR("identifier is nil"));
    v9 = 0;
  }

  return v9;
}

- (void)addSearchResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "searchIndexingIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[ICSearchResultSection searchResults](self, "searchResults");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v9);

          -[ICSearchResultSection identifierToSearchResult](self, "identifierToSearchResult");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, v11);

          -[ICSearchResultSection hiddenSearchResults](self, "hiddenSearchResults");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v11);

          -[ICSearchResultSection unhiddenSearchResults](self, "unhiddenSearchResults");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v11);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifier", "-[ICSearchResultSection addSearchResults:]", 1, 0, CFSTR("Search result identifier is nil %@"), v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)resetToSearchResults:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_opt_new();
  -[ICSearchResultSection setSearchResults:](self, "setSearchResults:", v4);

  v5 = (void *)objc_opt_new();
  -[ICSearchResultSection setIdentifierToSearchResult:](self, "setIdentifierToSearchResult:", v5);

  -[ICSearchResultSection addSearchResults:](self, "addSearchResults:", v6);
}

- (NSMutableOrderedSet)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (NSMutableDictionary)identifierToSearchResult
{
  return self->_identifierToSearchResult;
}

- (void)setIdentifierToSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToSearchResult, a3);
}

- (NSMutableDictionary)hiddenSearchResults
{
  return self->_hiddenSearchResults;
}

- (void)setHiddenSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenSearchResults, a3);
}

- (NSMutableDictionary)unhiddenSearchResults
{
  return self->_unhiddenSearchResults;
}

- (void)setUnhiddenSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_unhiddenSearchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhiddenSearchResults, 0);
  objc_storeStrong((id *)&self->_hiddenSearchResults, 0);
  objc_storeStrong((id *)&self->_identifierToSearchResult, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
