@implementation STStorageGroupSizeOperation

+ (id)operationForOperations:(id)a3
{
  id v3;
  STStorageGroupSizeOperation *v4;

  v3 = a3;
  v4 = objc_alloc_init(STStorageGroupSizeOperation);
  -[STStorageGroupSizeOperation setOperations:](v4, "setOperations:", v3);

  return v4;
}

- (void)main
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[STStorageGroupSizeOperation operations](self, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperations:waitUntilFinished:", v3, 1);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "error", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "error");
          v14 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v14;
        }
        v9 += objc_msgSend(v12, "size");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  -[STStorageSizeOperation setSize:](self, "setSize:", v9);
  -[STStorageOperation setError:](self, "setError:", v8);

}

- (void)cancel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[STStorageGroupSizeOperation operations](self, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)STStorageGroupSizeOperation;
  -[STStorageGroupSizeOperation cancel](&v8, sel_cancel);

}

- (NSArray)operations
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

@end
