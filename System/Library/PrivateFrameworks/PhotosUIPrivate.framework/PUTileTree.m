@implementation PUTileTree

- (PUTileTree)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileTree.m"), 18, CFSTR("use designated initializer"));

  return (PUTileTree *)-[PUTileTree initUsingUniqueLeafs:](self, "initUsingUniqueLeafs:", 0);
}

- (id)initUsingUniqueLeafs:(BOOL)a3
{
  PUTileTree *v4;
  PUTileTree *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *objectsByTileIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUTileTree;
  v4 = -[PUTileTree init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_useUniqueLeafs = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objectsByTileIdentifier = v5->__objectsByTileIdentifier;
    v5->__objectsByTileIdentifier = v6;

  }
  return v5;
}

- (PUTileTree)initWithTileTree:(id)a3
{
  _QWORD *v4;
  PUTileTree *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *objectsByTileIdentifier;
  objc_class *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  _QWORD v16[4];
  NSMutableDictionary *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUTileTree;
  v5 = -[PUTileTree init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "useUniqueLeafs");
    v5->_useUniqueLeafs = v6;
    v7 = (void *)v4[2];
    if (v6)
    {
      v8 = objc_msgSend(v7, "mutableCopy");
      objectsByTileIdentifier = v5->__objectsByTileIdentifier;
      v5->__objectsByTileIdentifier = (NSMutableDictionary *)v8;
    }
    else
    {
      v10 = (objc_class *)MEMORY[0x1E0C99E08];
      objectsByTileIdentifier = v7;
      v11 = (void *)objc_msgSend([v10 alloc], "initWithCapacity:", -[NSMutableDictionary count](objectsByTileIdentifier, "count"));
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __31__PUTileTree_initWithTileTree___block_invoke;
      v16[3] = &unk_1E58A8F60;
      v12 = v11;
      v17 = v12;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objectsByTileIdentifier, "enumerateKeysAndObjectsUsingBlock:", v16);
      v13 = v5->__objectsByTileIdentifier;
      v5->__objectsByTileIdentifier = v12;
      v14 = v12;

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTileTree:", self);
}

- (void)addObject:(id)a3 withTileIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUTileTree useUniqueLeafs](self, "useUniqueLeafs"))
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v6);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);
    }
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)removeObject:(id)a3 withTileIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUTileTree useUniqueLeafs](self, "useUniqueLeafs"))
  {
    objc_msgSend(v7, "removeObjectForKey:", v6);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeObject:", v9);
    v6 = v8;
  }

}

- (void)removeObjectWithTileIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)removeAllObjects
{
  id v2;

  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (BOOL)containsObject:(id)a3 withTileIdentifier:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  char v11;

  v6 = a4;
  v7 = a3;
  v8 = -[PUTileTree useUniqueLeafs](self, "useUniqueLeafs");
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    v11 = v10 == v7;
  else
    v11 = objc_msgSend(v10, "containsObject:", v7);

  return v11;
}

- (id)objectWithTileIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateObjectsWithTileIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, char *);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, char *))a4;
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v13)
        objc_enumerationMutation(v10);
      v7[2](v7, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14), &v19);
      if (v19)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = -[PUTileTree useUniqueLeafs](self, "useUniqueLeafs");
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = MEMORY[0x1E0C809B0];
    v7 = &unk_1E58A8F88;
    v8 = __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke;
    v9 = &v12;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v7 = &unk_1E58A8FB0;
    v8 = __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke_2;
    v9 = &v11;
  }
  v9[1] = 3221225472;
  v9[2] = (uint64_t)v8;
  v9[3] = (uint64_t)v7;
  v9[4] = (uint64_t)v4;
  v10 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUTileTree;
  -[PUTileTree description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileTree _objectsByTileIdentifier](self, "_objectsByTileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" objects: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)useUniqueLeafs
{
  return self->_useUniqueLeafs;
}

- (NSMutableDictionary)_objectsByTileIdentifier
{
  return self->__objectsByTileIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__objectsByTileIdentifier, 0);
}

void __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(v6);
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
      if (a4)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __41__PUTileTree_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__PUTileTree_initWithTileTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKey:", v5, a2);

}

@end
