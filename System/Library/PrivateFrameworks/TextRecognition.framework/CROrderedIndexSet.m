@implementation CROrderedIndexSet

- (CROrderedIndexSet)initWithArray:(id)a3
{
  id v5;
  CROrderedIndexSet *v6;
  CROrderedIndexSet *v7;
  uint64_t v8;
  NSMutableArray *indexedObjects;
  uint64_t v10;
  NSMutableOrderedSet *indicesSet;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CROrderedIndexSet;
  v6 = -[CROrderedIndexSet init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceArray, a3);
    v8 = objc_opt_new();
    indexedObjects = v7->_indexedObjects;
    v7->_indexedObjects = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    indicesSet = v7->_indicesSet;
    v7->_indicesSet = (NSMutableOrderedSet *)v10;

  }
  return v7;
}

- (id)subIndexSetWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  CROrderedIndexSet *v8;
  void *v9;
  CROrderedIndexSet *v10;

  length = a3.length;
  location = a3.location;
  -[CROrderedIndexSet indices](self, "indices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subarrayWithRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [CROrderedIndexSet alloc];
    -[CROrderedIndexSet sourceArray](self, "sourceArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CROrderedIndexSet initWithArray:](v8, "initWithArray:", v9);

    -[CROrderedIndexSet addIndices:](v10, "addIndices:", v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)indices
{
  void *v2;
  void *v3;

  -[CROrderedIndexSet indicesSet](self, "indicesSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)objects
{
  void *v2;
  void *v3;

  -[CROrderedIndexSet indexedObjects](self, "indexedObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[CROrderedIndexSet indices](self, "indices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)addIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CROrderedIndexSet sourceArray](self, "sourceArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    CROSLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a3;
      _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_FAULT, "Attempting to add an out-of-bounds index %lu to ordered index set", buf, 0xCu);
    }

  }
  else
  {
    -[CROrderedIndexSet indicesSet](self, "indicesSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if ((v9 & 1) == 0)
    {
      -[CROrderedIndexSet indicesSet](self, "indicesSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      -[CROrderedIndexSet indexedObjects](self, "indexedObjects");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[CROrderedIndexSet sourceArray](self, "sourceArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v13);

    }
  }
}

- (void)addIndices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CROrderedIndexSet addIndex:](self, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "unsignedIntegerValue"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addIndexSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "sourceArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROrderedIndexSet sourceArray](self, "sourceArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "indices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROrderedIndexSet addIndices:](self, "addIndices:", v8);

  }
  else
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_FAULT, "Attempting to combine two index sets with different backing arrays", v9, 2u);
    }

  }
}

- (void)addAllIndices
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[CROrderedIndexSet sourceArray](self, "sourceArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[CROrderedIndexSet addIndex:](self, "addIndex:", v5++);
      -[CROrderedIndexSet sourceArray](self, "sourceArray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

    }
    while (v5 < v7);
  }
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CROrderedIndexSet indices](self, "indices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CROrderedIndexSet_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E98DAFF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __48__CROrderedIndexSet_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = objc_msgSend(a2, "unsignedIntegerValue");
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sourceArray");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v9, v7, a3, a4);

}

- (NSArray)sourceArray
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourceArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)indexedObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIndexedObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableOrderedSet)indicesSet
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIndicesSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicesSet, 0);
  objc_storeStrong((id *)&self->_indexedObjects, 0);
  objc_storeStrong((id *)&self->_sourceArray, 0);
}

@end
