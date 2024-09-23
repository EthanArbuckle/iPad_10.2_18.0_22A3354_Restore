@implementation _PXConcatenatingAudioAssetFetchResult

- (_PXConcatenatingAudioAssetFetchResult)initWithFetchResults:(id)a3
{
  id v4;
  _PXConcatenatingAudioAssetFetchResult *v5;
  uint64_t v6;
  NSArray *fetchResults;
  int64_t *v8;
  unint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PXConcatenatingAudioAssetFetchResult;
  v5 = -[_PXConcatenatingAudioAssetFetchResult init](&v14, sel_init);
  if (v5)
  {
    PXFilter();
    v6 = objc_claimAutoreleasedReturnValue();
    fetchResults = v5->_fetchResults;
    v5->_fetchResults = (NSArray *)v6;

    v8 = (int64_t *)malloc_type_malloc(8 * -[NSArray count](v5->_fetchResults, "count"), 0x100004000313F17uLL);
    v5->_startIndexes = v8;
    if (-[NSArray count](v5->_fetchResults, "count"))
    {
      v9 = 0;
      v10 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v5->_fetchResults, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");
        v8[v9] = v10;
        v10 += v12;

        ++v9;
      }
      while (v9 < -[NSArray count](v5->_fetchResults, "count"));
    }
    else
    {
      v10 = 0;
    }
    v5->_count = v10;
    v5->_subFetchResultsCount = -[NSArray count](v5->_fetchResults, "count");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_startIndexes);
  v3.receiver = self;
  v3.super_class = (Class)_PXConcatenatingAudioAssetFetchResult;
  -[_PXConcatenatingAudioAssetFetchResult dealloc](&v3, sel_dealloc);
}

- (id)_subFetchResultForIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  int64_t *startIndexes;
  int64_t subFetchResultsCount;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  id result;

  startIndexes = self->_startIndexes;
  subFetchResultsCount = self->_subFetchResultsCount;
  if (subFetchResultsCount < 2)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = subFetchResultsCount - 1;
    do
    {
      v10 = v9 - v8;
      if (v9 < v8)
        ++v10;
      v11 = v8 + (v10 >> 1);
      if (startIndexes[v11] < a3)
        v8 = v11 + 1;
      else
        v9 = v11;
    }
    while (v8 < v9);
  }
  v12 = startIndexes[v8 - (startIndexes[v8] > a3)];
  result = -[NSArray objectAtIndexedSubscript:](self->_fetchResults, "objectAtIndexedSubscript:");
  if (a4)
    *a4 = a3 - v12;
  return result;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: fetchResults = %@>"), v5, self, self->_fetchResults);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  -[_PXConcatenatingAudioAssetFetchResult _subFetchResultForIndex:localIndex:](self, "_subFetchResultForIndex:localIndex:", a3, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectsAtIndexes:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _PXConcatenatingAudioAssetFetchResult *v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __58___PXConcatenatingAudioAssetFetchResult_objectsAtIndexes___block_invoke;
  v13 = &unk_1E51460E8;
  v14 = v6;
  v15 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

- (PXAudioAsset)firstObject
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_fetchResults, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAudioAsset *)v3;
}

- (PXAudioAsset)lastObject
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_fetchResults, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAudioAsset *)v3;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_fetchResults;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsObject:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  NSArray *fetchResults;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[4];

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  fetchResults = self->_fetchResults;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E5137440;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[NSArray enumerateObjectsUsingBlock:](fetchResults, "enumerateObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResults, 0);
}

@end
