@implementation PKCloudRecordArrayDatabaseZone

- (PKCloudRecordArrayDatabaseZone)initWithZoneID:(id)a3 databaseIdentifier:(id)a4
{
  id v7;
  id v8;
  PKCloudRecordArrayDatabaseZone *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *cloudRecordByZoneRecord;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudRecordArrayDatabaseZone;
  v9 = -[PKCloudRecordArrayDatabaseZone init](&v13, sel_init);
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cloudRecordByZoneRecord = v9->_cloudRecordByZoneRecord;
    v9->_cloudRecordByZoneRecord = v10;

    objc_storeStrong((id *)&v9->_zoneID, a3);
    objc_storeStrong((id *)&v9->_databaseIdentifier, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordArrayDatabaseZone)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordArrayDatabaseZone *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *cloudRecordByZoneRecord;
  uint64_t v12;
  CKRecordZoneID *zoneID;
  uint64_t v14;
  NSString *databaseIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCloudRecordArrayDatabaseZone;
  v5 = -[PKCloudRecordArrayDatabaseZone init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("cloudRecordByZoneRecord"));
    v10 = objc_claimAutoreleasedReturnValue();
    cloudRecordByZoneRecord = v5->_cloudRecordByZoneRecord;
    v5->_cloudRecordByZoneRecord = (NSMutableDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneID"));
    v12 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("databaseIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    databaseIdentifier = v5->_databaseIdentifier;
    v5->_databaseIdentifier = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *cloudRecordByZoneRecord;
  id v5;

  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cloudRecordByZoneRecord, CFSTR("cloudRecordByZoneRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneID, CFSTR("zoneID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databaseIdentifier, CFSTR("databaseIdentifier"));

}

- (id)description
{
  return -[PKCloudRecordArrayDatabaseZone descriptionWithDetailedOutput:includeItem:](self, "descriptionWithDetailedOutput:includeItem:", 0, 0);
}

- (id)descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4
{
  id v7;
  NSMutableDictionary *cloudRecordByZoneRecord;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  PKCloudRecordArrayDatabaseZone *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  BOOL v18;
  _QWORD v19[3];
  int64_t v20;
  _QWORD v21[4];

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v20 = -[PKCloudRecordArrayDatabaseZone count](self, "count");
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PKCloudRecordArrayDatabaseZone_descriptionWithDetailedOutput_includeItem___block_invoke;
  v12[3] = &unk_1E2ACC808;
  v9 = v7;
  v15 = v21;
  v16 = v19;
  v13 = v9;
  v14 = self;
  v17 = a3;
  v18 = a4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByZoneRecord, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = (void *)objc_msgSend(v9, "copy");

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  return v10;
}

uint64_t __76__PKCloudRecordArrayDatabaseZone_descriptionWithDetailedOutput_includeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v7 + 24) + 1;
  *(_QWORD *)(v7 + 24) = v8;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v6, "numberWithInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n-----------(%@ of %@)-----------------\n"), v11, v12);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("identifier: %@\n"), v10);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "zoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "ownerName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR("zoneName: %@, zoneOwner: %@\n"), v14, v15);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("database: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v16 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v9, "descriptionWithItem:", *(unsigned __int8 *)(a1 + 65));
  else
    objc_msgSend(v9, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "appendString:", v17);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("----------------------------\n"));
}

- (void)addCloudRecord:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "primaryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_cloudRecordByZoneRecord, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "applyCloudRecordObject:", v7);
    }
    else
    {
      v6 = v7;
    }
    -[NSMutableDictionary setObject:forKey:](self->_cloudRecordByZoneRecord, "setObject:forKey:", v6, v4);

  }
}

- (void)applyCloudRecordDatabaseZone:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "cloudRecordByZoneRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PKCloudRecordArrayDatabaseZone_applyCloudRecordDatabaseZone___block_invoke;
  v5[3] = &unk_1E2ACC830;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __63__PKCloudRecordArrayDatabaseZone_applyCloudRecordDatabaseZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "applyCloudRecordObject:", v5);
  }
  else
  {
    v7 = v5;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v7, v8);

}

- (id)allItems
{
  id v3;
  NSMutableDictionary *cloudRecordByZoneRecord;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PKCloudRecordArrayDatabaseZone_allItems__block_invoke;
  v8[3] = &unk_1E2ACC830;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByZoneRecord, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __42__PKCloudRecordArrayDatabaseZone_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "item");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

}

- (id)allObjects
{
  id v3;
  NSMutableDictionary *cloudRecordByZoneRecord;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PKCloudRecordArrayDatabaseZone_allObjects__block_invoke;
  v8[3] = &unk_1E2ACC830;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByZoneRecord, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

uint64_t __44__PKCloudRecordArrayDatabaseZone_allObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:");
}

- (id)allRecordsWithRecordType:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *cloudRecordByZoneRecord;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59__PKCloudRecordArrayDatabaseZone_allRecordsWithRecordType___block_invoke;
  v14 = &unk_1E2ACC858;
  v15 = v4;
  v16 = v5;
  v7 = v5;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByZoneRecord, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __59__PKCloudRecordArrayDatabaseZone_allRecordsWithRecordType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "records", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "recordType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 32);
        v12 = v10;
        v13 = v11;
        if (v12 == v13)
        {

LABEL_15:
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
          continue;
        }
        v14 = v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (v15)
        {

          continue;
        }
        v16 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v16)
          goto LABEL_15;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (id)allRecordNames
{
  id v3;
  NSMutableDictionary *cloudRecordByZoneRecord;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PKCloudRecordArrayDatabaseZone_allRecordNames__block_invoke;
  v8[3] = &unk_1E2ACC830;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByZoneRecord, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __48__PKCloudRecordArrayDatabaseZone_allRecordNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "records", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "recordID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "recordName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)allRecordIDs
{
  id v3;
  NSMutableDictionary *cloudRecordByZoneRecord;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cloudRecordByZoneRecord = self->_cloudRecordByZoneRecord;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PKCloudRecordArrayDatabaseZone_allRecordIDs__block_invoke;
  v8[3] = &unk_1E2ACC830;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByZoneRecord, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __46__PKCloudRecordArrayDatabaseZone_allRecordIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "records", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "recordID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (int64_t)count
{
  return -[NSMutableDictionary count](self->_cloudRecordByZoneRecord, "count");
}

- (NSMutableDictionary)cloudRecordByZoneRecord
{
  return self->_cloudRecordByZoneRecord;
}

- (void)setCloudRecordByZoneRecord:(id)a3
{
  objc_storeStrong((id *)&self->_cloudRecordByZoneRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudRecordByZoneRecord, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
