@implementation PDCloudStoreCounterpartRecordParserZones

- (PDCloudStoreCounterpartRecordParserZones)init
{
  PDCloudStoreCounterpartRecordParserZones *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *zoneNameToRecords;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDCloudStoreCounterpartRecordParserZones;
  v2 = -[PDCloudStoreCounterpartRecordParserZones init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    zoneNameToRecords = v2->_zoneNameToRecords;
    v2->_zoneNameToRecords = v3;

  }
  return v2;
}

- (void)addRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_zoneNameToRecords, "objectForKey:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[NSMutableDictionary setObject:forKey:](self->_zoneNameToRecords, "setObject:forKey:", v8, v7);
    }
    objc_msgSend(v8, "addObject:", v9);

    v4 = v9;
  }

}

- (id)allRecords
{
  id v3;
  NSMutableDictionary *zoneNameToRecords;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  zoneNameToRecords = self->_zoneNameToRecords;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PDCloudStoreCounterpartRecordParserZones_allRecords__block_invoke;
  v8[3] = &unk_1E2AC1908;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](zoneNameToRecords, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __54__PDCloudStoreCounterpartRecordParserZones_allRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (void)removeIdentifiers:(id)a3
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
        -[NSMutableDictionary removeObjectForKey:](self->_zoneNameToRecords, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *zoneNameToRecords;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  zoneNameToRecords = self->_zoneNameToRecords;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PDCloudStoreCounterpartRecordParserZones_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E2AC1930;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](zoneNameToRecords, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __78__PDCloudStoreCounterpartRecordParserZones_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(a3, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneNameToRecords, 0);
}

@end
