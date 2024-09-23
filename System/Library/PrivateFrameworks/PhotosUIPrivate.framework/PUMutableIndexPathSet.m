@implementation PUMutableIndexPathSet

- (PUMutableIndexPathSet)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUIndexPathSet.m"), 48, CFSTR("Do not use this initializer, use the designated one instead"));

  return 0;
}

- (PUMutableIndexPathSet)initWithCapacity:(unint64_t)a3
{
  PUMutableIndexPathSet *v4;
  uint64_t v5;
  NSMutableSet *indexPaths;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUMutableIndexPathSet;
  v4 = -[PUMutableIndexPathSet init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a3);
    indexPaths = v4->_indexPaths;
    v4->_indexPaths = (NSMutableSet *)v5;

  }
  return v4;
}

- (int64_t)count
{
  return -[NSMutableSet count](self->_indexPaths, "count");
}

- (void)enumerateIndexPathsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_indexPaths;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PUMutableIndexPathSet *v4;
  PUMutableIndexPathSet *v5;

  v4 = -[PUMutableIndexPathSet initWithCapacity:]([PUMutableIndexPathSet alloc], "initWithCapacity:", -[NSMutableSet count](self->_indexPaths, "count"));
  v5 = v4;
  if (v4)
    -[NSMutableSet setSet:](v4->_indexPaths, "setSet:", self->_indexPaths);
  return v5;
}

- (void)addIndexPath:(id)a3
{
  -[NSMutableSet addObject:](self->_indexPaths, "addObject:", a3);
}

- (void)removeIndexPath:(id)a3
{
  -[NSMutableSet removeObject:](self->_indexPaths, "removeObject:", a3);
}

- (BOOL)containsIndexPath:(id)a3
{
  return -[NSMutableSet containsObject:](self->_indexPaths, "containsObject:", a3);
}

- (void)setIndexPathSet:(id)a3
{
  _QWORD *v4;
  _QWORD v5[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableSet setSet:](self->_indexPaths, "setSet:", v4[1]);
  }
  else
  {
    -[PUMutableIndexPathSet removeAllIndexPaths](self, "removeAllIndexPaths");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__PUMutableIndexPathSet_setIndexPathSet___block_invoke;
    v5[3] = &unk_1E58A0F20;
    v5[4] = self;
    objc_msgSend(v4, "enumerateIndexPathsUsingBlock:", v5);
  }

}

- (void)removeAllIndexPaths
{
  -[NSMutableSet removeAllObjects](self->_indexPaths, "removeAllObjects");
}

- (unint64_t)hash
{
  return -[NSMutableSet hash](self->_indexPaths, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  uint64_t v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSMutableSet isEqualToSet:](self->_indexPaths, "isEqualToSet:", v5[1]);
    *((_BYTE *)v12 + 24) = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v5 = v4;
    v7 = objc_msgSend(v5, "count");
    if (v7 == -[PUMutableIndexPathSet count](self, "count"))
    {
      *((_BYTE *)v12 + 24) = 1;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __33__PUMutableIndexPathSet_isEqual___block_invoke;
      v10[3] = &unk_1E58A7BC0;
      v10[4] = self;
      v10[5] = &v11;
      objc_msgSend(v5, "enumerateIndexPathsUsingBlock:", v10);
    }
  }

LABEL_7:
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p %@> indexPaths: %@"), self, v5, self->_indexPaths);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPaths, 0);
}

uint64_t __33__PUMutableIndexPathSet_isEqual___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndexPath:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __41__PUMutableIndexPathSet_setIndexPathSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexPath:", a2);
}

@end
