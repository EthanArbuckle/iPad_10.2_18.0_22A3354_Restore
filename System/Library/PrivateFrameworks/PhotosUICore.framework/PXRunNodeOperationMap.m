@implementation PXRunNodeOperationMap

- (PXRunNodeOperationMap)init
{
  PXRunNodeOperationMap *v2;
  uint64_t v3;
  NSMapTable *operationMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXRunNodeOperationMap;
  v2 = -[PXRunNodeOperationMap init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    operationMap = v2->_operationMap;
    v2->_operationMap = (NSMapTable *)v3;

  }
  return v2;
}

- (id)operationForRunNode:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSMapTable objectForKey:](self->_operationMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(v5, "newOperation");
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNodeRunner.m"), 117, CFSTR("Attempt to process run node that's already being processed: %@"), v5);

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "dependencies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          -[PXRunNodeOperationMap operationForRunNode:](self, "operationForRunNode:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addDependency:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    -[NSMapTable setObject:forKey:](self->_operationMap, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationMap, 0);
}

@end
