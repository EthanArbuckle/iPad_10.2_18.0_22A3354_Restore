@implementation PDCloudStoreCounterpartRecordParser

- (PDCloudStoreCounterpartRecordParser)initWithDataSource:(id)a3
{
  id v5;
  PDCloudStoreCounterpartRecordParser *v6;
  PDCloudStoreCounterpartRecordParser *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *itemTypeToParserIdentifiers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDCloudStoreCounterpartRecordParser;
  v6 = -[PDCloudStoreCounterpartRecordParser init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemTypeToParserIdentifiers = v7->_itemTypeToParserIdentifiers;
    v7->_itemTypeToParserIdentifiers = v8;

  }
  return v7;
}

- (void)addRecords:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *itemTypeToParserIdentifiers;
  void *v13;
  PDCloudStoreCounterpartRecordParserIdentifiers *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = -[PDCloudStoreCounterpartRecordParserDataSource itemTypeFromRecord:](self->_dataSource, "itemTypeFromRecord:", v9);
        if (v10)
        {
          v11 = v10;
          itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](itemTypeToParserIdentifiers, "objectForKey:", v13);
          v14 = (PDCloudStoreCounterpartRecordParserIdentifiers *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v14 = objc_alloc_init(PDCloudStoreCounterpartRecordParserIdentifiers);
            v15 = self->_itemTypeToParserIdentifiers;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, v16);

          }
          -[PDCloudStoreCounterpartRecordParserDataSource identifierFromRecord:](self->_dataSource, "identifierFromRecord:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDCloudStoreCounterpartRecordParserIdentifiers addRecord:identifier:](v14, "addRecord:identifier:", v9, v17);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (void)removeIdentifiers:(id)a3 itemType:(unint64_t)a4
{
  NSMutableDictionary *itemTypeToParserIdentifiers;
  void *v6;
  id v7;
  void *v8;
  id v9;

  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](itemTypeToParserIdentifiers, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeIdentifiers:", v7);
}

- (id)allRecordsForItemType:(unint64_t)a3
{
  NSMutableDictionary *itemTypeToParserIdentifiers;
  void *v4;
  void *v5;
  void *v6;

  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](itemTypeToParserIdentifiers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allRecordsWithIdentifier:(id)a3 itemType:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  NSMutableDictionary *itemTypeToParserIdentifiers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](itemTypeToParserIdentifiers, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allRecordsWithIdentifier:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObjectsFromArray:", v12);
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (void)enumerateKeysAndObjectsForItemType:(unint64_t)a3 usingBlock:(id)a4
{
  NSMutableDictionary *itemTypeToParserIdentifiers;
  void *v6;
  id v7;
  void *v8;
  id v9;

  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](itemTypeToParserIdentifiers, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->_itemTypeToParserIdentifiers, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_recordNamePrefixes, 0);
  objc_storeStrong((id *)&self->_itemTypeToParserIdentifiers, 0);
}

@end
