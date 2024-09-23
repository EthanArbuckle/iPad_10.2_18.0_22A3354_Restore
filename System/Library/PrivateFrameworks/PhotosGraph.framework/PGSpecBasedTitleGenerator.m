@implementation PGSpecBasedTitleGenerator

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 specCollection:(id)a4 titleGenerationContext:(id)a5
{
  return -[PGSpecBasedTitleGenerator initWithMomentNodes:features:specCollection:titleGenerationContext:](self, "initWithMomentNodes:features:specCollection:titleGenerationContext:", a3, 0, a4, a5);
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 memoryCategory:(unint64_t)a4 subcategory:(unint64_t)a5 titleGenerationContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  PGSpecBasedTitleGenerator *v13;

  v10 = a3;
  v11 = a6;
  +[PGTitleSpecFactory specCollectionForMemoryCategory:subcategory:](PGTitleSpecFactory, "specCollectionForMemoryCategory:subcategory:", a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[PGSpecBasedTitleGenerator initWithMomentNodes:features:specCollection:titleGenerationContext:](self, "initWithMomentNodes:features:specCollection:titleGenerationContext:", v10, 0, v12, v11);
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 memoryCategory:(unint64_t)a5 subcategory:(unint64_t)a6 titleGenerationContext:(id)a7
{
  id v12;
  id v13;
  void *v14;
  PGSpecBasedTitleGenerator *v15;

  v12 = a3;
  v13 = a7;
  +[PGTitleSpecFactory specCollectionForMemoryCategory:subcategory:personNodes:](PGTitleSpecFactory, "specCollectionForMemoryCategory:subcategory:personNodes:", a5, a6, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[PGSpecBasedTitleGenerator initWithMomentNodes:features:specCollection:titleGenerationContext:](self, "initWithMomentNodes:features:specCollection:titleGenerationContext:", v12, 0, v14, v13);
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 meaningLabel:(id)a4 titleGenerationContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PGSpecBasedTitleGenerator *v11;

  v8 = a3;
  v9 = a5;
  +[PGTitleSpecFactory specCollectionForMeaningLabel:](PGTitleSpecFactory, "specCollectionForMeaningLabel:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[PGSpecBasedTitleGenerator initWithMomentNodes:features:specCollection:titleGenerationContext:](self, "initWithMomentNodes:features:specCollection:titleGenerationContext:", v8, 0, v10, v9);
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 features:(id)a4 meaningLabel:(id)a5 isAggregation:(BOOL)a6 titleGenerationContext:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PGSpecBasedTitleGenerator *v17;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v8)
    +[PGAggregationsTitleSpecFactory specCollectionForMeaningLabel:features:](PGAggregationsTitleSpecFactory, "specCollectionForMeaningLabel:features:", v14, v13);
  else
    +[PGTitleSpecFactory specCollectionForMeaningLabel:](PGTitleSpecFactory, "specCollectionForMeaningLabel:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = -[PGSpecBasedTitleGenerator initWithMomentNodes:features:specCollection:titleGenerationContext:](self, "initWithMomentNodes:features:specCollection:titleGenerationContext:", v12, v13, v16, v15);
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 features:(id)a4 specCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGSpecBasedTitleGenerator *v15;
  PGSpecBasedTitleGenerator *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGSpecBasedTitleGenerator;
  v15 = -[PGSpecBasedTitleGenerator init](&v18, sel_init);
  if (v15)
  {
    if (!objc_msgSend(v11, "count"))
    {
      v16 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v15->_momentNodes, a3);
    objc_storeStrong((id *)&v15->_features, a4);
    objc_storeStrong((id *)&v15->_specCollection, a5);
    v15->_lineBreakBehavior = 1;
    objc_storeStrong((id *)&v15->_titleGenerationContext, a6);
  }
  v16 = v15;
LABEL_6:

  return v16;
}

- (PGTitle)title
{
  PGTitle *title;
  PGTitle *v4;
  PGTitle *v5;

  title = self->_title;
  if (!title)
  {
    -[PGSpecBasedTitleGenerator _title](self, "_title");
    v4 = (PGTitle *)objc_claimAutoreleasedReturnValue();
    v5 = self->_title;
    self->_title = v4;

    title = self->_title;
  }
  return title;
}

- (id)_title
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PGTitleSpecCollection specPools](self->_specCollection, "specPools", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      if (v6)
        break;
      objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "specs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSpecBasedTitleGenerator _titleFromSpecs:](self, "_titleFromSpecs:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_titleFromSpecs:(id)a3
{
  unint64_t v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  PGTitleSpecArgumentEvaluationContext *v15;
  void *v16;
  void *v17;
  PGTitleSpecArgumentEvaluationContext *v18;
  NSSet *momentNodes;
  NSSet *features;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PGSpecBasedTitleGenerator momentNodes](self, "momentNodes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "universalStartDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSince1970");
        v11 = fmin(v11, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
    v3 = (unint64_t)v11;
  }

  v15 = [PGTitleSpecArgumentEvaluationContext alloc];
  -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerationContext serviceManager](self->_titleGenerationContext, "serviceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PGTitleSpecArgumentEvaluationContext initWithLocationHelper:serviceManager:](v15, "initWithLocationHelper:serviceManager:", v16, v17);

  while (1)
  {

    if (!objc_msgSend(v6, "count"))
    {
      v21 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", v3 % objc_msgSend(v6, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInsertNonBreakableSpace:", (self->_lineBreakBehavior >> 1) & 1 & ~objc_msgSend(v16, "hasSpecArgumentHandlingLineBreakBehavior"));
    objc_msgSend(v16, "setDelegate:", self);
    momentNodes = self->_momentNodes;
    features = self->_features;
    if (features)
      objc_msgSend(v16, "titleWithMomentNodes:features:argumentEvaluationContext:", momentNodes, features, v18);
    else
      objc_msgSend(v16, "titleWithMomentNodes:argumentEvaluationContext:", momentNodes, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      break;
    objc_msgSend(v6, "removeObject:", v16);
  }

LABEL_18:
  return v21;
}

- (id)titleSpec:(id)a3 inputForArgument:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "titleGenerator:inputForArgument:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_momentNodes, a3);
}

- (NSSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (PGTitleSpecCollection)specCollection
{
  return self->_specCollection;
}

- (void)setSpecCollection:(id)a3
{
  objc_storeStrong((id *)&self->_specCollection, a3);
}

- (PGSpecBasedTitleGeneratorDelegate)delegate
{
  return (PGSpecBasedTitleGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_specCollection, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

@end
