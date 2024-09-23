@implementation PGSharingSuggestionSource

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PGSharingSuggestionSource;
  -[PGSharingSuggestionSource description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharingSuggestionSource name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharingSuggestionSource weight](self, "weight");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - name:%@, weight:%.2f"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sourceDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PGSharingSuggestionSource name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharingSuggestionSource weight](self, "weight");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (weight %.2f)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)suggestionResultWithPerson:(id)a3
{
  return -[PGSharingSuggestionSource suggestionResultWithPerson:weight:](self, "suggestionResultWithPerson:weight:", a3, 0.0);
}

- (id)suggestionResultWithPerson:(id)a3 weight:(double)a4
{
  id v6;
  PGSharingSuggestionResult *v7;
  double v8;
  double v9;
  void *v10;
  PGSharingSuggestionResult *v11;

  v6 = a3;
  v7 = [PGSharingSuggestionResult alloc];
  -[PGSharingSuggestionSource weight](self, "weight");
  v9 = v8;
  -[PGSharingSuggestionSource name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGSharingSuggestionResult initWithPerson:weight:sourceWeight:sourceName:](v7, "initWithPerson:weight:sourceWeight:sourceName:", v6, v10, a4, v9);

  return v11;
}

- (id)suggestionResultsWithPersons:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
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
        -[PGSharingSuggestionSource suggestionResultWithPerson:](self, "suggestionResultWithPerson:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSString)name
{
  abort();
}

- (NSString)details
{
  abort();
}

- (double)weight
{
  abort();
}

- (BOOL)canRunWithOptions:(id)a3
{
  return 1;
}

- (BOOL)canRunWithInput:(id)a3
{
  return 1;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  abort();
}

@end
