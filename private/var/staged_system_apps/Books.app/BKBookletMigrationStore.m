@implementation BKBookletMigrationStore

- (BKBookletMigrationStore)init
{
  BKBookletMigrationStore *v2;
  BLBookletMigrationStore *v3;
  BLBookletMigrationStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKBookletMigrationStore;
  v2 = -[BKBookletMigrationStore init](&v6, "init");
  if (v2)
  {
    v3 = (BLBookletMigrationStore *)objc_alloc_init((Class)BLBookletMigrationStore);
    store = v2->_store;
    v2->_store = v3;

  }
  return v2;
}

- (id)_convertToStoreIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = BUStoreIdFromObject(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10, (_QWORD)v13));
        objc_msgSend(v4, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)setMigrationState:(int64_t)a3 forStoreIDStrings:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationStore _convertToStoreIDs:](self, "_convertToStoreIDs:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationStore store](self, "store"));
  LOBYTE(a5) = objc_msgSend(v9, "setMigrationState:forStoreIDs:error:", a3, v8, a5);

  return (char)a5;
}

- (void)migrationItemsWithStoreIDStrings:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationStore _convertToStoreIDs:](self, "_convertToStoreIDs:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationStore store](self, "store"));
  objc_msgSend(v7, "migrationInfosWithStoreIDs:completion:", v8, v6);

}

- (void)migrationItemsWithState:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationStore store](self, "store"));
  objc_msgSend(v7, "migrationInfosWithState:completion:", a3, v6);

}

- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationStore store](self, "store"));
  LOBYTE(a4) = objc_msgSend(v7, "removeAllMigrationInfosExcludingStates:error:", v6, a4);

  return (char)a4;
}

- (BLBookletMigrationStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
