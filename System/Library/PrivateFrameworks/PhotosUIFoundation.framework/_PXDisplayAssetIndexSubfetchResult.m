@implementation _PXDisplayAssetIndexSubfetchResult

- (_PXDisplayAssetIndexSubfetchResult)initWithFetchResult:(id)a3 indexSet:(id)a4
{
  id v8;
  id v9;
  unint64_t v10;
  _PXDisplayAssetIndexSubfetchResult *v11;
  _PXDisplayAssetIndexSubfetchResult *v12;
  int64_t *v13;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetFetchResult.m"), 499, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexSet.count > 0"));

  }
  v10 = objc_msgSend(v9, "lastIndex");
  if (v10 >= objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetFetchResult.m"), 500, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexSet.lastIndex < fetchResult.count"));

  }
  v19.receiver = self;
  v19.super_class = (Class)_PXDisplayAssetIndexSubfetchResult;
  v11 = -[_PXDisplayAssetIndexSubfetchResult init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_originalFetchResult, a3);
    v12->_count = objc_msgSend(v9, "count");
    objc_storeStrong((id *)&v12->_indexSet, a4);
    v13 = (int64_t *)malloc_type_malloc(8 * v12->_count, 0x100004000313F17uLL);
    v12->_indexMap = v13;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = v13;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __67___PXDisplayAssetIndexSubfetchResult_initWithFetchResult_indexSet___block_invoke;
    v17[3] = &unk_2514CF978;
    v17[4] = v18;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v17);
    _Block_object_dispose(v18, 8);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_indexMap);
  v3.receiver = self;
  v3.super_class = (Class)_PXDisplayAssetIndexSubfetchResult;
  -[_PXDisplayAssetIndexSubfetchResult dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PXDisplayAssetIndexSubfetchResult count](self, "count");
  -[PXDisplayAssetFetchResult description](self->_originalFetchResult, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: count = %li; originalFetchResult = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[PXDisplayAssetFetchResult objectAtIndex:](self->_originalFetchResult, "objectAtIndex:", self->_indexMap[a3]);
}

- (id)objectsAtIndexes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _PXDisplayAssetIndexSubfetchResult *v15;

  v4 = (objc_class *)MEMORY[0x24BDD1698];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __55___PXDisplayAssetIndexSubfetchResult_objectsAtIndexes___block_invoke;
  v13 = &unk_2514D1018;
  v14 = v6;
  v15 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v10);

  -[PXDisplayAssetFetchResult objectsAtIndexes:](self->_originalFetchResult, "objectsAtIndexes:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXDisplayAsset)firstObject
{
  void *v3;

  if (-[_PXDisplayAssetIndexSubfetchResult count](self, "count") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[_PXDisplayAssetIndexSubfetchResult objectAtIndex:](self, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)lastObject
{
  void *v3;

  if (-[_PXDisplayAssetIndexSubfetchResult count](self, "count") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[_PXDisplayAssetIndexSubfetchResult objectAtIndex:](self, "objectAtIndex:", -[_PXDisplayAssetIndexSubfetchResult count](self, "count") - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAsset *)v3;
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  NSIndexSet *indexSet;
  _QWORD v9[7];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = -[PXDisplayAssetFetchResult indexOfObject:](self->_originalFetchResult, "indexOfObject:", v4);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = 0;
    indexSet = self->_indexSet;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52___PXDisplayAssetIndexSubfetchResult_indexOfObject___block_invoke;
    v9[3] = &unk_2514CF9A0;
    v9[5] = v10;
    v9[6] = v5;
    v9[4] = &v11;
    -[NSIndexSet enumerateIndexesUsingBlock:](indexSet, "enumerateIndexesUsingBlock:", v9);
    _Block_object_dispose(v10, 8);
    v6 = v12[3];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v4;

  v4 = -[PXDisplayAssetFetchResult indexOfObject:](self->_originalFetchResult, "indexOfObject:", a3);
  return v4 != 0x7FFFFFFFFFFFFFFFLL && -[NSIndexSet containsIndex:](self->_indexSet, "containsIndex:", v4);
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetFetchResult.m"), 570, CFSTR("not implemented yet"));

  abort();
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetFetchResult.m"), 574, CFSTR("not implemented yet"));

  abort();
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return (id)-[PXDisplayAssetFetchResult thumbnailAssetAtIndex:](self->_originalFetchResult, "thumbnailAssetAtIndex:", self->_indexMap[a3]);
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
  objc_storeStrong((id *)&self->_originalFetchResult, 0);
}

@end
