@implementation PGShareBackSuggesterResult

- (PGShareBackSuggesterResult)initWithInputs:(id)a3 processingValue:(unsigned __int16)a4 momentNodes:(id)a5
{
  id v8;
  id v9;
  PGShareBackSuggesterResult *v10;
  uint64_t v11;
  NSArray *suggesterInputs;
  uint64_t v13;
  NSSet *momentNodes;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGShareBackSuggesterResult;
  v10 = -[PGShareBackSuggesterResult init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    suggesterInputs = v10->_suggesterInputs;
    v10->_suggesterInputs = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    momentNodes = v10->_momentNodes;
    v10->_momentNodes = (NSSet *)v13;

    v10->_processingValue = a4;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PGShareBackSuggesterResult;
  -[PGShareBackSuggesterResult description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGShareBackSuggesterResult processingValue](self, "processingValue");
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGShareBackSuggesterResult momentNodes](self, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - Reason: %@ - momentNodes: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)suggesterInputs
{
  return self->_suggesterInputs;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (unsigned)processingValue
{
  return self->_processingValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_suggesterInputs, 0);
}

+ (id)momentNodesForSuggesterResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "momentNodes", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

@end
