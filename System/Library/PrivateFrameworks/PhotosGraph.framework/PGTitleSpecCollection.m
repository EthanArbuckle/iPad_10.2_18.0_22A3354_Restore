@implementation PGTitleSpecCollection

- (PGTitleSpecCollection)initWithSpecPools:(id)a3
{
  id v5;
  PGTitleSpecCollection *v6;
  PGTitleSpecCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGTitleSpecCollection;
  v6 = -[PGTitleSpecCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specPools, a3);

  return v7;
}

- (id)allPossibleTitlesWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  return -[PGTitleSpecCollection _allPossibleTitlesWithMomentNodes:forHighlight:argumentEvaluationContext:](self, "_allPossibleTitlesWithMomentNodes:forHighlight:argumentEvaluationContext:", a3, 0, a4);
}

- (id)allPossibleTitlesWithHighlightMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  return -[PGTitleSpecCollection _allPossibleTitlesWithMomentNodes:forHighlight:argumentEvaluationContext:](self, "_allPossibleTitlesWithMomentNodes:forHighlight:argumentEvaluationContext:", a3, 1, a4);
}

- (id)_allPossibleTitlesWithMomentNodes:(id)a3 forHighlight:(BOOL)a4 argumentEvaluationContext:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSArray *obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_specPools;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v12, "specs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
              if (v6)
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "setInsertNonBreakableSpace:", 1);
              objc_msgSend(v18, "titleWithMomentNodes:argumentEvaluationContext:", v8, v9);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                objc_msgSend(v10, "addObject:", v19);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v15);
        }

        ++v11;
      }
      while (v11 != v23);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecCollection;
  -[PGTitleSpecCollection description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \n\tspecPools %@"), v4, self->_specPools);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)specPools
{
  return self->_specPools;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specPools, 0);
}

+ (PGTitleSpecCollection)collectionWithSpecPools:(id)a3
{
  id v3;
  PGTitleSpecCollection *v4;

  v3 = a3;
  v4 = -[PGTitleSpecCollection initWithSpecPools:]([PGTitleSpecCollection alloc], "initWithSpecPools:", v3);

  return v4;
}

@end
