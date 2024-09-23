@implementation SCKZone

- (SCKZone)initWithSchema:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  SCKZone *v9;
  SCKZone *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCKZone;
  v9 = -[SCKZone init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schema, a3);
    objc_storeStrong((id *)&v10->_store, a4);
  }

  return v10;
}

- (NSArray)clientRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SCKZone schema](self, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKZone clientDiff](self, "clientDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKZone store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyToRecords:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validateRecords:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (SCKZoneDiff)clientDiff
{
  SCKZoneModificationSilo *v3;
  void *v4;
  void *v5;
  void *v6;
  SCKZoneModificationSilo *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = [SCKZoneModificationSilo alloc];
  -[SCKZone schema](self, "schema");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKZone store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCKZoneModificationSilo initWithZoneSchema:contents:](v3, "initWithZoneSchema:contents:", v4, v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SCKZone store](self, "store", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pendingCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "executeWithZone:", v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[SCKZoneModificationSilo diff](v7, "diff");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (SCKZoneDiff *)v14;
}

- (BOOL)needsFirstSync
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SCKZone store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)isDirty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[SCKZone store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSyncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCKZone store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastDirtyDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v6)
      v7 = objc_msgSend(v6, "compare:", v4) == 1;
    else
      v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (SCKZoneSchema)schema
{
  return self->_schema;
}

- (SCKZoneStore)store
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
  objc_storeStrong((id *)&self->_schema, 0);
}

@end
