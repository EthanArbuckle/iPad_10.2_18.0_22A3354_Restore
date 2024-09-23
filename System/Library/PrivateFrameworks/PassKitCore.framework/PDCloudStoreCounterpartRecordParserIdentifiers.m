@implementation PDCloudStoreCounterpartRecordParserIdentifiers

- (PDCloudStoreCounterpartRecordParserIdentifiers)init
{
  PDCloudStoreCounterpartRecordParserIdentifiers *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *identifierToParserZones;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDCloudStoreCounterpartRecordParserIdentifiers;
  v2 = -[PDCloudStoreCounterpartRecordParserIdentifiers init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifierToParserZones = v2->_identifierToParserZones;
    v2->_identifierToParserZones = v3;

  }
  return v2;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_identifierToParserZones, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (void)addRecord:(id)a3 identifier:(id)a4
{
  id v6;
  PDCloudStoreCounterpartRecordParserZones *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_identifierToParserZones, "objectForKey:", v6);
  v7 = (PDCloudStoreCounterpartRecordParserZones *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(PDCloudStoreCounterpartRecordParserZones);
    -[NSMutableDictionary setObject:forKey:](self->_identifierToParserZones, "setObject:forKey:", v7, v6);
  }
  -[PDCloudStoreCounterpartRecordParserZones addRecord:](v7, "addRecord:", v8);

}

- (id)allRecordsWithIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[NSMutableDictionary objectForKey:](self->_identifierToParserZones, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v9 = (void *)objc_msgSend(v6, "copy");
  return v9;
}

- (id)allRecords
{
  id v3;
  NSMutableDictionary *identifierToParserZones;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  identifierToParserZones = self->_identifierToParserZones;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PDCloudStoreCounterpartRecordParserIdentifiers_allRecords__block_invoke;
  v8[3] = &unk_1E2AC18E0;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](identifierToParserZones, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __60__PDCloudStoreCounterpartRecordParserIdentifiers_allRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "allRecords");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);

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
        -[NSMutableDictionary removeObjectForKey:](self->_identifierToParserZones, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->_identifierToParserZones, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToParserZones, 0);
}

@end
