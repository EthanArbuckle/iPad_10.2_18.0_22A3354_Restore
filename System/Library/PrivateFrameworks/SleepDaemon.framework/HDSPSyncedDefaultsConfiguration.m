@implementation HDSPSyncedDefaultsConfiguration

- (HDSPSyncedDefaultsConfiguration)initWithInfo:(id)a3 keySets:(id)a4
{
  id v7;
  id v8;
  HDSPSyncedDefaultsConfiguration *v9;
  HDSPSyncedDefaultsConfiguration *v10;
  uint64_t v11;
  NSDictionary *keySetMap;
  HDSPSyncedDefaultsConfiguration *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSPSyncedDefaultsConfiguration;
  v9 = -[HDSPSyncedDefaultsConfiguration init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_info, a3);
    -[HDSPSyncedDefaultsConfiguration _createKeySetMapForKeySets:](v10, "_createKeySetMapForKeySets:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    keySetMap = v10->_keySetMap;
    v10->_keySetMap = (NSDictionary *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)_createKeySetMapForKeySets:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__HDSPSyncedDefaultsConfiguration__createKeySetMapForKeySets___block_invoke;
  v9[3] = &unk_24D4E4FF8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "na_each:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __62__HDSPSyncedDefaultsConfiguration__createKeySetMapForKeySets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (NSArray)keySets
{
  return -[NSDictionary allValues](self->_keySetMap, "allValues");
}

- (id)_accumulateKeysWithBlock:(id)a3 includeVersionInfo:(BOOL)a4 isForSync:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;

  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[HDSPSyncedDefaultsConfiguration keySets](self, "keySets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __89__HDSPSyncedDefaultsConfiguration__accumulateKeysWithBlock_includeVersionInfo_isForSync___block_invoke;
  v21 = &unk_24D4E5298;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v23 = v12;
  objc_msgSend(v10, "na_each:", &v18);

  if (v6)
  {
    -[HDSPSyncedDefaultsInfo dataVersionKey](self->_info, "dataVersionKey", v18, v19, v20, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    -[HDSPSyncedDefaultsInfo cloudDataVersionKey](self->_info, "cloudDataVersionKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

    if (!a5)
    {
      -[HDSPSyncedDefaultsInfo localDataVersionKey](self->_info, "localDataVersionKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

    }
  }
  v16 = (void *)objc_msgSend(v11, "copy", v18, v19, v20, v21);

  return v16;
}

void __89__HDSPSyncedDefaultsConfiguration__accumulateKeysWithBlock_includeVersionInfo_isForSync___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unionSet:", v2);

}

- (NSSet)allKeysToPersist
{
  return (NSSet *)-[HDSPSyncedDefaultsConfiguration _accumulateKeysWithBlock:includeVersionInfo:isForSync:](self, "_accumulateKeysWithBlock:includeVersionInfo:isForSync:", &__block_literal_global_13, 1, 0);
}

uint64_t __51__HDSPSyncedDefaultsConfiguration_allKeysToPersist__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keysToPersist");
}

- (NSSet)allKeysToSync
{
  return (NSSet *)-[HDSPSyncedDefaultsConfiguration _accumulateKeysWithBlock:includeVersionInfo:isForSync:](self, "_accumulateKeysWithBlock:includeVersionInfo:isForSync:", &__block_literal_global_186, 1, 1);
}

uint64_t __48__HDSPSyncedDefaultsConfiguration_allKeysToSync__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keysToSync");
}

- (NSSet)allPerGizmoKeys
{
  return (NSSet *)-[HDSPSyncedDefaultsConfiguration _accumulateKeysWithBlock:includeVersionInfo:isForSync:](self, "_accumulateKeysWithBlock:includeVersionInfo:isForSync:", &__block_literal_global_187_0, 0, 0);
}

uint64_t __50__HDSPSyncedDefaultsConfiguration_allPerGizmoKeys__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "perGizmoKeys");
}

- (NSDictionary)allDefaultValues
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HDSPSyncedDefaultsConfiguration keySets](self, "keySets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HDSPSyncedDefaultsConfiguration_allDefaultValues__block_invoke;
  v8[3] = &unk_24D4E4FF8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return (NSDictionary *)v6;
}

void __51__HDSPSyncedDefaultsConfiguration_allDefaultValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "defaultValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

}

- (BOOL)shouldPersistKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HDSPSyncedDefaultsConfiguration allKeysToPersist](self, "allKeysToPersist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)shouldSyncKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HDSPSyncedDefaultsConfiguration allKeysToSync](self, "allKeysToSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)_keySetForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HDSPSyncedDefaultsConfiguration keySets](self, "keySets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__HDSPSyncedDefaultsConfiguration__keySetForKey___block_invoke;
  v9[3] = &unk_24D4E5340;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__HDSPSyncedDefaultsConfiguration__keySetForKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "keysToPersist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)keySetForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_keySetMap, "objectForKeyedSubscript:", a3);
}

- (id)filteredKeySetsWithKeysToSync:(id)a3
{
  id v4;
  NSDictionary *keySetMap;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  keySetMap = self->_keySetMap;
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke;
  v14[3] = &unk_24D4E5368;
  v7 = v4;
  v15 = v7;
  -[NSDictionary na_filter:](keySetMap, "na_filter:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke_2;
  v12[3] = &unk_24D4E5390;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "na_map:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "keysToSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v5;
}

HDSPSyncedDefaultsKeySet *__65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HDSPSyncedDefaultsKeySet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HDSPSyncedDefaultsKeySet *v11;

  v4 = a3;
  v5 = [HDSPSyncedDefaultsKeySet alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keysToPersist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keysToSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDSPSyncedDefaultsKeySet initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:](v5, "initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:", v6, v7, v8, v10);

  return v11;
}

- (HDSPSyncedDefaultsInfo)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_keySetMap, 0);
}

@end
