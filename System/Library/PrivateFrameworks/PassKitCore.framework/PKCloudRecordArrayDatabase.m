@implementation PKCloudRecordArrayDatabase

- (PKCloudRecordArrayDatabase)initWithIdentifier:(id)a3
{
  id v5;
  PKCloudRecordArrayDatabase *v6;
  PKCloudRecordArrayDatabase *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudRecordArrayDatabase;
  v6 = -[PKCloudRecordArrayDatabase init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cloudRecordByDatabaseZone = v7->_cloudRecordByDatabaseZone;
    v7->_cloudRecordByDatabaseZone = v8;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordArrayDatabase)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordArrayDatabase *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCloudRecordArrayDatabase;
  v5 = -[PKCloudRecordArrayDatabase init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("cloudRecordByDatabaseZone"));
    v10 = objc_claimAutoreleasedReturnValue();
    cloudRecordByDatabaseZone = v5->_cloudRecordByDatabaseZone;
    v5->_cloudRecordByDatabaseZone = (NSMutableDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *cloudRecordByDatabaseZone;
  id v5;

  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cloudRecordByDatabaseZone, CFSTR("cloudRecordByDatabaseZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (id)description
{
  return -[PKCloudRecordArrayDatabase descriptionWithDetailedOutput:includeItem:](self, "descriptionWithDetailedOutput:includeItem:", 0, 0);
}

- (id)descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4
{
  id v7;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __72__PKCloudRecordArrayDatabase_descriptionWithDetailedOutput_includeItem___block_invoke;
  v15 = &unk_1E2ACC768;
  v16 = v7;
  v17 = a3;
  v18 = a4;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", &v12);
  v10 = (void *)objc_msgSend(v9, "copy", v12, v13, v14, v15);

  return v10;
}

void __72__PKCloudRecordArrayDatabase_descriptionWithDetailedOutput_includeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n####### Begin Zone %@ %@#######\n"), v8, v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "descriptionWithDetailedOutput:includeItem:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendString:", v11);
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v7, "zoneName");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appendFormat:", CFSTR("\n####### End Zone %@ %@#######\n"), v14, v13);
}

- (void)applyCloudRecordDatabase:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "cloudRecordByDatabaseZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PKCloudRecordArrayDatabase_applyCloudRecordDatabase___block_invoke;
  v5[3] = &unk_1E2ACC790;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __55__PKCloudRecordArrayDatabase_applyCloudRecordDatabase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "applyCloudRecordDatabaseZone:", v5);
  }
  else
  {
    v7 = v5;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v7, v8);

}

- (void)addCloudRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKCloudRecordArrayDatabaseZone *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    objc_msgSend(v4, "records");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSMutableDictionary objectForKey:](self->_cloudRecordByDatabaseZone, "objectForKey:", v8);
      v9 = (PKCloudRecordArrayDatabaseZone *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        v9 = -[PKCloudRecordArrayDatabaseZone initWithZoneID:databaseIdentifier:]([PKCloudRecordArrayDatabaseZone alloc], "initWithZoneID:databaseIdentifier:", v8, self->_identifier);
      -[NSMutableDictionary setObject:forKey:](self->_cloudRecordByDatabaseZone, "setObject:forKey:", v9, v8);
      -[PKCloudRecordArrayDatabaseZone addCloudRecord:](v9, "addCloudRecord:", v10);

    }
    v4 = v10;
  }

}

- (id)allItems
{
  id v3;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PKCloudRecordArrayDatabase_allItems__block_invoke;
  v8[3] = &unk_1E2ACC790;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __38__PKCloudRecordArrayDatabase_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (id)allObjects
{
  id v3;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PKCloudRecordArrayDatabase_allObjects__block_invoke;
  v8[3] = &unk_1E2ACC790;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __40__PKCloudRecordArrayDatabase_allObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (id)allRecordsWithRecordType:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *cloudRecordByDatabaseZone;
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
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __55__PKCloudRecordArrayDatabase_allRecordsWithRecordType___block_invoke;
  v14 = &unk_1E2ACC7B8;
  v15 = v5;
  v16 = v4;
  v7 = v4;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __55__PKCloudRecordArrayDatabase_allRecordsWithRecordType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allRecordsWithRecordType:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

}

- (id)allRecordNames
{
  id v3;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PKCloudRecordArrayDatabase_allRecordNames__block_invoke;
  v8[3] = &unk_1E2ACC790;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __44__PKCloudRecordArrayDatabase_allRecordNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allRecordNames");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

}

- (id)allRecordIDs
{
  id v3;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PKCloudRecordArrayDatabase_allRecordIDs__block_invoke;
  v8[3] = &unk_1E2ACC790;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __42__PKCloudRecordArrayDatabase_allRecordIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allRecordIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

}

- (int64_t)count
{
  NSMutableDictionary *cloudRecordByDatabaseZone;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PKCloudRecordArrayDatabase_count__block_invoke;
  v5[3] = &unk_1E2ACC7E0;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PKCloudRecordArrayDatabase_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)countByZoneID
{
  id v3;
  NSMutableDictionary *cloudRecordByDatabaseZone;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  cloudRecordByDatabaseZone = self->_cloudRecordByDatabaseZone;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PKCloudRecordArrayDatabase_countByZoneID__block_invoke;
  v8[3] = &unk_1E2ACC790;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabaseZone, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __43__PKCloudRecordArrayDatabase_countByZoneID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a3, "count"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

- (NSMutableDictionary)cloudRecordByDatabaseZone
{
  return self->_cloudRecordByDatabaseZone;
}

- (void)setCloudRecordByDatabaseZone:(id)a3
{
  objc_storeStrong((id *)&self->_cloudRecordByDatabaseZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudRecordByDatabaseZone, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
