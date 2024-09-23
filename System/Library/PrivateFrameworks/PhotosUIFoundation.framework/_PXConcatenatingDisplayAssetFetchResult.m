@implementation _PXConcatenatingDisplayAssetFetchResult

- (_PXConcatenatingDisplayAssetFetchResult)initWithFetchResults:(id)a3
{
  id v4;
  _PXConcatenatingDisplayAssetFetchResult *v5;
  void *v6;
  id *p_fetchResults;
  int64_t *v8;
  unint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PXConcatenatingDisplayAssetFetchResult;
  v5 = -[_PXConcatenatingDisplayAssetFetchResult init](&v14, sel_init);
  if (v5)
  {
    PXFilter(v4, &__block_literal_global_2876);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_fetchResults = (id *)&v5->_fetchResults;
    objc_storeStrong((id *)&v5->_fetchResults, v6);
    v8 = (int64_t *)malloc_type_malloc(8 * -[NSArray count](v5->_fetchResults, "count"), 0x100004000313F17uLL);
    v5->_startIndexes = v8;
    if (-[NSArray count](v5->_fetchResults, "count"))
    {
      v9 = 0;
      v10 = 0;
      do
      {
        objc_msgSend(*p_fetchResults, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");
        v8[v9] = v10;
        v10 += v12;

        ++v9;
      }
      while (v9 < objc_msgSend(*p_fetchResults, "count"));
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
  v3.super_class = (Class)_PXConcatenatingDisplayAssetFetchResult;
  -[_PXConcatenatingDisplayAssetFetchResult dealloc](&v3, sel_dealloc);
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

  v3 = (void *)MEMORY[0x24BDD17C8];
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
  -[_PXConcatenatingDisplayAssetFetchResult _subFetchResultForIndex:localIndex:](self, "_subFetchResultForIndex:localIndex:", a3, &v6);
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
  _PXConcatenatingDisplayAssetFetchResult *v15;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __60___PXConcatenatingDisplayAssetFetchResult_objectsAtIndexes___block_invoke;
  v13 = &unk_2514D1018;
  v14 = v6;
  v15 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

- (PXDisplayAsset)firstObject
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_fetchResults, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)lastObject
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_fetchResults, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAsset *)v3;
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSArray count](self->_fetchResults, "count"))
  {
    v6 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_fetchResults, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexOfObject:", v4);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        break;

      if (++v6 >= -[NSArray count](self->_fetchResults, "count"))
      {
        v5 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_7;
      }
    }
    v5 = self->_startIndexes[v6] + v8;

  }
LABEL_7:

  return v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
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

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_fetchResults;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "countOfAssetsWithMediaType:", a3, (_QWORD)v11);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_fetchResults;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "cachedCountOfAssetsWithMediaType:", a3, (_QWORD)v11);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)count
{
  return self->_count;
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  -[_PXConcatenatingDisplayAssetFetchResult _subFetchResultForIndex:localIndex:](self, "_subFetchResultForIndex:localIndex:", a3, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResults, 0);
}

@end
