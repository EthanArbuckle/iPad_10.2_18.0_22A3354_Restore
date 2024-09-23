@implementation PGMeaningfulEventSceneCollectionTrait

- (PGMeaningfulEventSceneCollectionTrait)initWithNodes:(id)a3
{
  return -[PGMeaningfulEventSceneCollectionTrait initWithNodes:negativeNodes:](self, "initWithNodes:negativeNodes:", a3, 0);
}

- (PGMeaningfulEventSceneCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4
{
  PGMeaningfulEventSceneCollectionTrait *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventSceneCollectionTrait;
  result = -[PGMeaningfulEventCollectionTrait initWithNodes:negativeNodes:](&v5, sel_initWithNodes_negativeNodes_, a3, a4);
  if (result)
  {
    result->_minimumNumberOfHighConfidenceAssets = 1;
    result->_minimumNumberOfNegativeHighConfidenceAssets = 1;
    result->_minimumRatioOfHighConfidenceAssets = 0.0;
  }
  return result;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint64_t aBlock;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;

  v4 = a3;
  aBlock = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __72__PGMeaningfulEventSceneCollectionTrait_debugDescriptionWithMomentNode___block_invoke;
  v25 = &unk_1E84328E8;
  v26 = v4;
  v5 = v4;
  v6 = (void (**)(void *, void *))_Block_copy(&aBlock);
  -[PGMeaningfulEventCollectionTrait nodes](self, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMeaningfulEventCollectionTrait negativeNodes](self, "negativeNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v13 = -[__CFString count](v12, "count");
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR(" ");
  v19 = &stru_1E8436F28;
  if (v13)
    v19 = v12;
  else
    v18 = &stru_1E8436F28;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p> %@%@%@"), v16, self, v9, v18, v19, aBlock, v23, v24, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)minimumNumberOfHighConfidenceAssets
{
  return self->_minimumNumberOfHighConfidenceAssets;
}

- (void)setMinimumNumberOfHighConfidenceAssets:(unint64_t)a3
{
  self->_minimumNumberOfHighConfidenceAssets = a3;
}

- (unint64_t)minimumNumberOfNegativeHighConfidenceAssets
{
  return self->_minimumNumberOfNegativeHighConfidenceAssets;
}

- (void)setMinimumNumberOfNegativeHighConfidenceAssets:(unint64_t)a3
{
  self->_minimumNumberOfNegativeHighConfidenceAssets = a3;
}

- (double)minimumRatioOfHighConfidenceAssets
{
  return self->_minimumRatioOfHighConfidenceAssets;
}

- (void)setMinimumRatioOfHighConfidenceAssets:(double)a3
{
  self->_minimumRatioOfHighConfidenceAssets = a3;
}

- (BOOL)accumulateHighConfidenceAssetCounts
{
  return self->_accumulateHighConfidenceAssetCounts;
}

- (void)setAccumulateHighConfidenceAssetCounts:(BOOL)a3
{
  self->_accumulateHighConfidenceAssetCounts = a3;
}

id __72__PGMeaningfulEventSceneCollectionTrait_debugDescriptionWithMomentNode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v8, "collection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphSceneEdgeCollection, "edgesFromNodes:toNodes:", v24, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anyEdge");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v9) = objc_msgSend(v11, "isReliable");
        v12 = objc_msgSend(v11, "numberOfAssets");
        v13 = objc_msgSend(v11, "numberOfHighConfidenceAssets");
        v14 = objc_msgSend(v11, "numberOfSearchConfidenceAssets");
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "confidence");
        v18 = CFSTR("NO");
        if ((_DWORD)v9)
          v18 = CFSTR("YES");
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ (confidence %.2f, #assets %lu, #highConf. %lu, #searchConf. %lu, reliable %@)"), v16, v17, v12, v13, v14, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v19);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }

  objc_msgSend(v25, "keysSortedByValueUsingSelector:", sel_compare_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
