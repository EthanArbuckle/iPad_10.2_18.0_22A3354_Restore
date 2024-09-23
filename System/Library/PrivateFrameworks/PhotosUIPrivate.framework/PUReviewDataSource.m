@implementation PUReviewDataSource

- (PUReviewDataSource)init
{
  PUReviewDataSource *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSMutableArray *v5;
  NSMutableArray *assetIdentifiers;
  NSMutableDictionary *v7;
  NSMutableDictionary *assetsByIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *representativeAssetsByBurstIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *enqueuedBurstAssetIdentifiersByBurstIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *enqueuedBurstAssetsByAssetIdentifier;
  NSMutableSet *v15;
  NSMutableSet *updatedAssetIdentifiers;
  PUReviewDataSource *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PUReviewDataSource;
  v2 = -[PUReviewDataSource init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->__observers;
    v2->__observers = (NSHashTable *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetIdentifiers = v2->__assetIdentifiers;
    v2->__assetIdentifiers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetsByIdentifier = v2->__assetsByIdentifier;
    v2->__assetsByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    representativeAssetsByBurstIdentifier = v2->__representativeAssetsByBurstIdentifier;
    v2->__representativeAssetsByBurstIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enqueuedBurstAssetIdentifiersByBurstIdentifier = v2->__enqueuedBurstAssetIdentifiersByBurstIdentifier;
    v2->__enqueuedBurstAssetIdentifiersByBurstIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enqueuedBurstAssetsByAssetIdentifier = v2->__enqueuedBurstAssetsByAssetIdentifier;
    v2->__enqueuedBurstAssetsByAssetIdentifier = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    updatedAssetIdentifiers = v2->__updatedAssetIdentifiers;
    v2->__updatedAssetIdentifiers = v15;

    v17 = v2;
  }

  return v2;
}

- (id)existingAssetForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUReviewDataSource _assetsByIdentifier](self, "_assetsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)existingRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUReviewDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertAsset:(id)a3
{
  -[PUReviewDataSource insertAsset:atIndex:](self, "insertAsset:atIndex:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)insertAsset:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PUReviewDataSource *v10;
  unint64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PUReviewDataSource_insertAsset_atIndex___block_invoke;
  v8[3] = &unk_1E58A9DF0;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[PUReviewDataSource performChanges:](self, "performChanges:", v8);

}

- (void)insertAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PUReviewDataSource *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PUReviewDataSource_insertAssets___block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[PUReviewDataSource performChanges:](self, "performChanges:", v6);

}

- (void)replaceAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  PUReviewDataSource *v16;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "burstIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewDataSource existingAssetForIdentifier:](self, "existingAssetForIdentifier:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  -[PUReviewDataSource existingRepresentativeAssetForBurstIdentifier:](self, "existingRepresentativeAssetForBurstIdentifier:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 | v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35__PUReviewDataSource_replaceAsset___block_invoke;
    v11[3] = &unk_1E58A9328;
    v12 = (id)v8;
    v13 = v9;
    v14 = v5;
    v15 = v4;
    v16 = self;
    -[PUReviewDataSource performChanges:](self, "performChanges:", v11);

    v10 = v12;
  }
  else
  {
    PLCameraGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEBUG, "Ignoring update for review asset because we can't actually update anything", buf, 2u);
    }
  }

}

- (void)removeAssetWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PUReviewDataSource_removeAssetWithIdentifier___block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUReviewDataSource performChanges:](self, "performChanges:", v6);

}

- (void)removeAllAssets
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__PUReviewDataSource_removeAllAssets__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUReviewDataSource performChanges:](self, "performChanges:", v2);
}

- (void)removeRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUReviewDataSource performChanges:](self, "performChanges:", v6);

}

- (void)enqueuePendingBurstAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "burstIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PUReviewDataSource _enqueuedBurstAssetsByAssetIdentifier](self, "_enqueuedBurstAssetsByAssetIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    -[PUReviewDataSource _enqueuedBurstAssetIdentifiersByBurstIdentifier](self, "_enqueuedBurstAssetIdentifiersByBurstIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isEqualToString:", v5) & 1) != 0)
      {
LABEL_11:
        -[NSObject objectForKey:](v7, "objectForKey:", v5);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[NSObject setObject:forKey:](v7, "setObject:forKey:", v12, v5);
        }
        objc_msgSend(v12, "addObject:", v4);

        goto LABEL_14;
      }
      objc_msgSend(v8, "setObject:forKey:", v5, v6);
      -[NSObject removeObjectForKey:](v7, "removeObjectForKey:", v10);
    }
    else
    {
      objc_msgSend(v8, "setObject:forKey:", v5, v6);
    }
    PLCameraGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "Pending asset for %{public}@ is now %{public}@", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_11;
  }
  PLCameraGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Unable to enqueue a pending burst asset because this asset does not have a burst identifier!", (uint8_t *)&v13, 2u);
  }
LABEL_14:

}

- (void)processPendingBurstAssets
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PUReviewDataSource _enqueuedBurstAssetIdentifiersByBurstIdentifier](self, "_enqueuedBurstAssetIdentifiersByBurstIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewDataSource _enqueuedBurstAssetsByAssetIdentifier](self, "_enqueuedBurstAssetsByAssetIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v5)
  {
    v7 = v5;
    v21 = *(_QWORD *)v28;
    *(_QWORD *)&v6 = 138543618;
    v20 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PLCameraGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v20;
          v33 = v10;
          v34 = 2114;
          v35 = v9;
          _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEBUG, "Processing %{public}@ for burst %{public}@", buf, 0x16u);
        }

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v24 != v17)
                objc_enumerationMutation(v13);
              v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
              if ((v16 & 1) != 0)
                -[PUReviewDataSource replaceAsset:](self, "replaceAsset:", v19);
              else
                -[PUReviewDataSource insertAsset:](self, "insertAsset:", v19);
              v16 = 1;
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v15);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "removeAllObjects");
  objc_msgSend(v22, "removeAllObjects");

}

- (void)performChanges:(id)a3
{
  void (**v5)(_QWORD);
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  v6 = -[PUReviewDataSource _nestedPerformChanges](self, "_nestedPerformChanges");
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[PUReviewDataSource _assetIdentifiers](self, "_assetIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copy");

    -[PUReviewDataSource _updatedAssetIdentifiers](self, "_updatedAssetIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewDataSource.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[self _updatedAssetIdentifiers] count] == 0"));

    }
  }
  -[PUReviewDataSource _setNestedPerformChanges:](self, "_setNestedPerformChanges:", -[PUReviewDataSource _nestedPerformChanges](self, "_nestedPerformChanges") + 1);
  v5[2](v5);
  -[PUReviewDataSource _setNestedPerformChanges:](self, "_setNestedPerformChanges:", -[PUReviewDataSource _nestedPerformChanges](self, "_nestedPerformChanges") - 1);
  if (!v6)
  {
    -[PUReviewDataSource _updatedAssetIdentifiers](self, "_updatedAssetIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {

    }
    else
    {
      -[PUReviewDataSource _assetIdentifiers](self, "_assetIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "isEqualToArray:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_17;
    }
    -[PUReviewDataSource _assetIdentifiers](self, "_assetIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    -[PUReviewDataSource _updatedAssetIdentifiers](self, "_updatedAssetIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUReviewDataSource _updatedAssetIdentifiers](self, "_updatedAssetIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllObjects");

    objc_msgSend(MEMORY[0x1E0D7CCC8], "changeDetailsFromArray:toArray:changedObjects:", v7, v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewDataSource _observers](self, "_observers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "reviewDataSourceDidChange:changeDetails:", self, v19);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v22);
    }

  }
LABEL_17:

}

- (void)registerChangeObserver:(id)a3
{
  -[NSHashTable addObject:](self->__observers, "addObject:", a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->__observers, "removeObject:", a3);
}

- (id)assetsByIdentifier
{
  void *v2;
  void *v3;

  -[PUReviewDataSource _assetsByIdentifier](self, "_assetsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)orderedIdentifiers
{
  void *v2;
  void *v3;

  -[PUReviewDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PUReviewDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewDataSource _assetsByIdentifier](self, "_assetsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewDataSource _representativeAssetsByBurstIdentifier](self, "_representativeAssetsByBurstIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewDataSource _enqueuedBurstAssetIdentifiersByBurstIdentifier](self, "_enqueuedBurstAssetIdentifiersByBurstIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewDataSource _enqueuedBurstAssetsByAssetIdentifier](self, "_enqueuedBurstAssetsByAssetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ assetIdentifiers:%@, assetsByIdentifier:%@, representativeAssetsByBurstIDs:%@, enquedBurstAssetIdentifierByBurstID:%@, enqueuedBurstConvertiblesByAssetIdentifier:%@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (NSMutableArray)_assetIdentifiers
{
  return self->__assetIdentifiers;
}

- (NSMutableDictionary)_assetsByIdentifier
{
  return self->__assetsByIdentifier;
}

- (NSMutableDictionary)_representativeAssetsByBurstIdentifier
{
  return self->__representativeAssetsByBurstIdentifier;
}

- (NSMutableDictionary)_enqueuedBurstAssetIdentifiersByBurstIdentifier
{
  return self->__enqueuedBurstAssetIdentifiersByBurstIdentifier;
}

- (NSMutableDictionary)_enqueuedBurstAssetsByAssetIdentifier
{
  return self->__enqueuedBurstAssetsByAssetIdentifier;
}

- (int64_t)_nestedPerformChanges
{
  return self->__nestedPerformChanges;
}

- (void)_setNestedPerformChanges:(int64_t)a3
{
  self->__nestedPerformChanges = a3;
}

- (NSMutableSet)_updatedAssetIdentifiers
{
  return self->__updatedAssetIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__updatedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->__enqueuedBurstAssetsByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->__enqueuedBurstAssetIdentifiersByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__representativeAssetsByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__assetsByIdentifier, 0);
  objc_storeStrong((id *)&self->__assetIdentifiers, 0);
  objc_storeStrong((id *)&self->__observers, 0);
}

void __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "existingRepresentativeAssetForBurstIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeAssetWithIdentifier:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_enqueuedBurstAssetsByAssetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__78936;
    v19 = __Block_byref_object_dispose__78937;
    v20 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke_27;
    v12 = &unk_1E58A72B0;
    v13 = *(id *)(a1 + 40);
    v14 = &v15;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v9);
    objc_msgSend(v5, "objectForKey:", v16[5], v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "removeObjectForKey:", v16[5]);
      PLCameraGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = v16[5];
        *(_DWORD *)buf = 138543362;
        v22 = v8;
        _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "Removed enqueued assets with no processed representative asset for identifier %{public}@", buf, 0xCu);
      }

    }
    _Block_object_dispose(&v15, 8);

  }
}

void __66__PUReviewDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke_27(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "burstIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __37__PUReviewDataSource_removeAllAssets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_assetsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "removeAssetWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __48__PUReviewDataSource_removeAssetWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "existingAssetForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "burstIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_assetIdentifiers");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_assetsByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_enqueuedBurstAssetsByAssetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v5, "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_representativeAssetsByBurstIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v4);
      objc_msgSend(*(id *)(a1 + 32), "_enqueuedBurstAssetIdentifiersByBurstIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v4);

    }
    PLCameraGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEBUG, "Removed review asset for %{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_enqueuedBurstAssetsByAssetIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_8;
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    PLCameraGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "Removed enqueued assets with no processed asset for identifier %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }

LABEL_8:
}

void __35__PUReviewDataSource_replaceAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "creationDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "creationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v3);
    if (v9 >= 0.0)
    {
      PLCameraGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(__CFString **)(a1 + 48);
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEBUG, "Ignoring update for review asset due to creation date of convertible %{public}@", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "removeAssetWithIdentifier:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 64), "insertAsset:", *(_QWORD *)(a1 + 56));
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "_assetsByIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 56), v2);
    objc_msgSend(*(id *)(a1 + 64), "_updatedAssetIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v2);

    if (objc_msgSend(*(id *)(a1 + 56), "mediaType") == 1)
    {
      v5 = CFSTR("still image");
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 56), "mediaType");
      v5 = CFSTR("unknown");
      if (v6 == 2)
        v5 = CFSTR("video");
    }
    v7 = v5;
    PLCameraGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v2;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "Updated review asset for %{public}@ %{public}@", (uint8_t *)&v12, 0x16u);
    }

  }
}

void __35__PUReviewDataSource_insertAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "insertAsset:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __42__PUReviewDataSource_insertAsset_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "burstIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_assetIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_assetsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 > objc_msgSend(v4, "count"))
    objc_msgSend(v4, "addObject:", v2);
  else
    objc_msgSend(v4, "insertObject:atIndex:", v2, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 32), v2);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_representativeAssetsByBurstIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(a1 + 32), v3);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "mediaType") == 1)
  {
    v8 = CFSTR("still image");
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
    v8 = CFSTR("unknown");
    if (v9 == 2)
      v8 = CFSTR("video");
  }
  v10 = v8;
  PLCameraGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138543618;
    v13 = v10;
    v14 = 2114;
    v15 = v2;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "Inserted review asset for %{public}@ %{public}@", (uint8_t *)&v12, 0x16u);
  }

}

@end
