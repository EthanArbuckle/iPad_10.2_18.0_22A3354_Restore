@implementation UNCHybridContentProtectionStrategy

- (UNCHybridContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4 delegate:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  UNCHybridContentProtectionStrategy *v11;
  UNCHybridContentProtectionStrategy *v12;
  UNCAtomicDataContentProtectionStrategy *v13;
  UNCAtomicDataContentProtectionStrategy *protectedContentAvailableStrategy;
  UNCFileHandleContentProtectionStrategy *v15;
  uint64_t v16;
  UNCFileHandleContentProtectionStrategy *protectedContentUnavailableStrategy;
  objc_super v19;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNCHybridContentProtectionStrategy;
  v11 = -[UNCHybridContentProtectionStrategy init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_minimumProtection, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = -[UNCAtomicDataContentProtectionStrategy initWithFileProtectionType:excludeFromBackup:]([UNCAtomicDataContentProtectionStrategy alloc], "initWithFileProtectionType:excludeFromBackup:", v12->_minimumProtection, v6);
    protectedContentAvailableStrategy = v12->_protectedContentAvailableStrategy;
    v12->_protectedContentAvailableStrategy = v13;

    v15 = [UNCFileHandleContentProtectionStrategy alloc];
    v16 = -[UNCFileHandleContentProtectionStrategy initWithFileProtectionType:excludeFromBackup:](v15, "initWithFileProtectionType:excludeFromBackup:", *MEMORY[0x24BDD0CD8], v6);
    protectedContentUnavailableStrategy = v12->_protectedContentUnavailableStrategy;
    v12->_protectedContentUnavailableStrategy = (UNCFileHandleContentProtectionStrategy *)v16;

  }
  return v12;
}

- (BOOL)isProtectedDataAvailable
{
  UNCHybridContentProtectionStrategyDelegate **p_delegate;
  id WeakRetained;
  char v5;
  NSString *minimumProtection;
  id v8;
  char v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "isProtectedDataAvailable");

  if ((v5 & 1) != 0)
    return 1;
  minimumProtection = self->_minimumProtection;
  if (minimumProtection == (NSString *)*MEMORY[0x24BDD0CE0])
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_msgSend(v8, "deviceUnlockedSinceBoot");

    if ((v9 & 1) != 0)
      return 1;
    minimumProtection = self->_minimumProtection;
  }
  return minimumProtection == (NSString *)*MEMORY[0x24BDBCC28];
}

- (BOOL)dataIsAvailableAtPath:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UNCHybridContentProtectionStrategy _strategyForProtectionState](self, "_strategyForProtectionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataIsAvailableAtPath:", v4);

  return v6;
}

- (id)dataAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UNCHybridContentProtectionStrategy _strategyForProtectionState](self, "_strategyForProtectionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataAtPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  UNCFileHandleContentProtectionStrategy *v10;

  v8 = a4;
  v9 = a3;
  -[UNCHybridContentProtectionStrategy _strategyForProtectionState](self, "_strategyForProtectionState");
  v10 = (UNCFileHandleContentProtectionStrategy *)objc_claimAutoreleasedReturnValue();
  self->_needsMerge = v10 == self->_protectedContentUnavailableStrategy;
  LOBYTE(a5) = -[UNCFileHandleContentProtectionStrategy writeData:atPath:error:](v10, "writeData:atPath:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[UNCHybridContentProtectionStrategy _strategyForProtectionState](self, "_strategyForProtectionState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "removeItemAtPath:error:", v6, a4);

  return (char)a4;
}

- (void)migrateDataAtPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UNCHybridContentProtectionStrategy _strategyForProtectionState](self, "_strategyForProtectionState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "migrateDataAtPath:toPath:", v7, v6);

}

- (void)importDataWithImportHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  UNCFileHandleContentProtectionStrategy *protectedContentUnavailableStrategy;
  id v18;
  UNCFileHandleContentProtectionStrategy *v19;
  id obj;
  uint64_t v21;
  UNCHybridContentProtectionStrategy *v22;
  uint64_t v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (-[UNCHybridContentProtectionStrategy isProtectedDataAvailable](self, "isProtectedDataAvailable")
    && self->_needsMerge)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[UNCFileHandleContentProtectionStrategy allPaths](self->_protectedContentUnavailableStrategy, "allPaths");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v23)
    {
      v21 = *(_QWORD *)v31;
      v22 = self;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[UNCFileHandleContentProtectionStrategy allDataAtPath:](self->_protectedContentUnavailableStrategy, "allDataAtPath:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCAtomicDataContentProtectionStrategy dataAtPath:](self->_protectedContentAvailableStrategy, "dataAtPath:", v6);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v9 = v7;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          v11 = v8;
          if (v10)
          {
            v12 = v10;
            v13 = *(_QWORD *)v27;
            v11 = v8;
            do
            {
              v14 = 0;
              v15 = v11;
              do
              {
                if (*(_QWORD *)v27 != v13)
                  objc_enumerationMutation(v9);
                v4[2](v4, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14), v15);
                v11 = (void *)objc_claimAutoreleasedReturnValue();

                ++v14;
                v15 = v11;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v12);
          }

          v25 = 0;
          self = v22;
          -[UNCHybridContentProtectionStrategy writeData:atPath:error:](v22, "writeData:atPath:error:", v11, v6, &v25);
          v16 = v25;
          protectedContentUnavailableStrategy = v22->_protectedContentUnavailableStrategy;
          v24 = v16;
          -[UNCFileHandleContentProtectionStrategy removeAllDataAtPath:error:](protectedContentUnavailableStrategy, "removeAllDataAtPath:error:", v6, &v24);
          v18 = v24;

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v23);
    }

    v19 = self->_protectedContentUnavailableStrategy;
    self->_protectedContentUnavailableStrategy = 0;

    self->_needsMerge = 0;
  }

}

- (id)_strategyForProtectionState
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[UNCHybridContentProtectionStrategy isProtectedDataAvailable](self, "isProtectedDataAvailable");
  v4 = 40;
  if (v3)
    v4 = 32;
  return *(id *)((char *)&self->super.isa + v4);
}

- (BOOL)_mergeIsSupported
{
  return !self->_needsMerge || self->_minimumProtection != (NSString *)*MEMORY[0x24BDD0CF8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedContentUnavailableStrategy, 0);
  objc_storeStrong((id *)&self->_protectedContentAvailableStrategy, 0);
  objc_storeStrong((id *)&self->_minimumProtection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
