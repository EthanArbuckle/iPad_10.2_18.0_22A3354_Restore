@implementation PKCloudRecordArray

- (PKCloudRecordArray)init
{
  PKCloudRecordArray *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cloudRecordByDatabase;
  NSMutableDictionary *v5;
  NSMutableDictionary *reportItemsByAccountIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordArray;
  v2 = -[PKCloudRecordArray init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cloudRecordByDatabase = v2->_cloudRecordByDatabase;
    v2->_cloudRecordByDatabase = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    reportItemsByAccountIdentifier = v2->_reportItemsByAccountIdentifier;
    v2->_reportItemsByAccountIdentifier = v5;

    v2->_recordsFetchedCount = 0;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordArray)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *cloudRecordByDatabase;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *reportItemsByAccountIdentifier;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCloudRecordArray;
  v5 = -[PKCloudRecordArray init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("cloudRecordByDatabase"));
    v10 = objc_claimAutoreleasedReturnValue();
    cloudRecordByDatabase = v5->_cloudRecordByDatabase;
    v5->_cloudRecordByDatabase = (NSMutableDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("reportItemsByAccountIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    reportItemsByAccountIdentifier = v5->_reportItemsByAccountIdentifier;
    v5->_reportItemsByAccountIdentifier = (NSMutableDictionary *)v17;

    v5->_recordsFetchedCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recordsFetchedCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *cloudRecordByDatabase;
  id v5;

  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cloudRecordByDatabase, CFSTR("cloudRecordByDatabase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reportItemsByAccountIdentifier, CFSTR("reportItemsByAccountIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_recordsFetchedCount, CFSTR("recordsFetchedCount"));

}

- (id)descriptionWithItem:(BOOL)a3
{
  return -[PKCloudRecordArray _descriptionWithDetailedOutput:includeItem:](self, "_descriptionWithDetailedOutput:includeItem:", 1, a3);
}

- (id)description
{
  return -[PKCloudRecordArray _descriptionWithDetailedOutput:includeItem:](self, "_descriptionWithDetailedOutput:includeItem:", 0, 0);
}

- (id)_descriptionWithDetailedOutput:(BOOL)a3 includeItem:(BOOL)a4
{
  id v7;
  id v8;
  id v9;
  NSMutableDictionary *cloudRecordByDatabase;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke;
  v28[3] = &unk_1E2ACC650;
  v12 = v7;
  v29 = v12;
  v33 = a3;
  v34 = a4;
  v13 = v8;
  v30 = v13;
  v14 = v9;
  v31 = v14;
  v32 = &v35;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", v28);
  objc_msgSend(v12, "appendString:", CFSTR("\n*********************\n"));
  objc_msgSend(v12, "appendString:", CFSTR("Stats:\n"));
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_2;
  v26[3] = &unk_1E2AC28F0;
  v15 = v12;
  v27 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v26);
  v21 = v11;
  v22 = 3221225472;
  v23 = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_4;
  v24 = &unk_1E2ACC6A0;
  v16 = v15;
  v25 = v16;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v21);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36[3]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("Overall record count: %@\n"), v17, v21, v22, v23, v24);

  objc_msgSend(v16, "appendString:", CFSTR("*********************\n"));
  v18 = v25;
  v19 = v16;

  _Block_object_dispose(&v35, 8);
  return v19;
}

void __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 64);
  v7 = *(unsigned __int8 *)(a1 + 65);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v8, "descriptionWithDetailedOutput:includeItem:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v10);

  v11 = objc_msgSend(v8, "count");
  v12 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, v9);

  v14 = *(void **)(a1 + 48);
  objc_msgSend(v8, "countByZoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKey:", v15, v9);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v11;
}

void __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_3;
  v7[3] = &unk_1E2ACC678;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "zoneName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendFormat:", CFSTR("Number of records in database %@, zone %@ %@: %@\n"), v5, v9, v8, v6);
}

uint64_t __65__PKCloudRecordArray__descriptionWithDetailedOutput_includeItem___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Total records in database %@: %@\n"), a2, a3);
}

- (int64_t)count
{
  NSMutableDictionary *cloudRecordByDatabase;
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
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PKCloudRecordArray_count__block_invoke;
  v5[3] = &unk_1E2ACC6C8;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__PKCloudRecordArray_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)addCloudRecord:(id)a3 forContainerDatabaseIdentifier:(id)a4
{
  NSMutableDictionary *cloudRecordByDatabase;
  id v7;
  id v8;
  PKCloudRecordArrayDatabase *v9;
  PKCloudRecordArrayDatabase *v10;

  if (a3 && a4)
  {
    cloudRecordByDatabase = self->_cloudRecordByDatabase;
    v7 = a4;
    v8 = a3;
    -[NSMutableDictionary objectForKey:](cloudRecordByDatabase, "objectForKey:", v7);
    v9 = (PKCloudRecordArrayDatabase *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = -[PKCloudRecordArrayDatabase initWithIdentifier:]([PKCloudRecordArrayDatabase alloc], "initWithIdentifier:", v7);
    v10 = v9;
    -[NSMutableDictionary setObject:forKey:](self->_cloudRecordByDatabase, "setObject:forKey:", v9, v7);

    -[PKCloudRecordArrayDatabase addCloudRecord:](v10, "addCloudRecord:", v8);
  }
}

- (void)applyCloudRecordArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  objc_msgSend(v4, "cloudRecordByDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke;
  v10[3] = &unk_1E2ACC6F0;
  v10[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(v4, "reportItemsByAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke_2;
  v9[3] = &unk_1E2ACC718;
  v9[4] = self;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  v8 = objc_msgSend(v4, "recordsFetchedCount");
  self->_recordsFetchedCount += v8;
}

void __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "applyCloudRecordDatabase:", v5);
  }
  else
  {
    v7 = v5;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v7, v8);

}

uint64_t __44__PKCloudRecordArray_applyCloudRecordArray___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addTransactionSyncReportItems:forAccountIdentifier:", a3, a2);
}

- (void)addTransactionSyncReportItem:(id)a3 forAccountIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v10 = a3;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = a4;
      v8 = a3;
      objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKCloudRecordArray addTransactionSyncReportItems:forAccountIdentifier:](self, "addTransactionSyncReportItems:forAccountIdentifier:", v9, v7, v10, v11);
    }
  }
}

- (void)addTransactionSyncReportItems:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v8, "count"))
  {
    -[NSMutableDictionary objectForKey:](self->_reportItemsByAccountIdentifier, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](self->_reportItemsByAccountIdentifier, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
}

- (void)addCountToRecordsFetched:(int64_t)a3
{
  self->_recordsFetchedCount += a3;
}

- (id)allItems
{
  id v3;
  NSMutableDictionary *cloudRecordByDatabase;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__PKCloudRecordArray_allItems__block_invoke;
  v8[3] = &unk_1E2ACC6F0;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __30__PKCloudRecordArray_allItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  NSMutableDictionary *cloudRecordByDatabase;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__PKCloudRecordArray_allObjects__block_invoke;
  v8[3] = &unk_1E2ACC6F0;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __32__PKCloudRecordArray_allObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (id)allObjectsByDatabaseIdentifier
{
  id v3;
  NSMutableDictionary *cloudRecordByDatabase;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PKCloudRecordArray_allObjectsByDatabaseIdentifier__block_invoke;
  v7[3] = &unk_1E2ACC6F0;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __52__PKCloudRecordArray_allObjectsByDatabaseIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (id)allRecordsWithRecordType:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *cloudRecordByDatabase;
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
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __47__PKCloudRecordArray_allRecordsWithRecordType___block_invoke;
  v14 = &unk_1E2ACC740;
  v15 = v5;
  v16 = v4;
  v7 = v4;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __47__PKCloudRecordArray_allRecordsWithRecordType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  NSMutableDictionary *cloudRecordByDatabase;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PKCloudRecordArray_allRecordNames__block_invoke;
  v8[3] = &unk_1E2ACC6F0;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __36__PKCloudRecordArray_allRecordNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  NSMutableDictionary *cloudRecordByDatabase;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  cloudRecordByDatabase = self->_cloudRecordByDatabase;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PKCloudRecordArray_allRecordIDs__block_invoke;
  v8[3] = &unk_1E2ACC6F0;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cloudRecordByDatabase, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __34__PKCloudRecordArray_allRecordIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allRecordIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

}

- (id)transactionSyncReportItemsByAccountIdentifier
{
  return self->_reportItemsByAccountIdentifier;
}

- (int64_t)recordsFetchedCount
{
  return self->_recordsFetchedCount;
}

- (NSMutableDictionary)cloudRecordByDatabase
{
  return self->_cloudRecordByDatabase;
}

- (void)setCloudRecordByDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_cloudRecordByDatabase, a3);
}

- (NSMutableDictionary)reportItemsByAccountIdentifier
{
  return self->_reportItemsByAccountIdentifier;
}

- (void)setReportItemsByAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_reportItemsByAccountIdentifier, a3);
}

- (void)setRecordsFetchedCount:(int64_t)a3
{
  self->_recordsFetchedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportItemsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudRecordByDatabase, 0);
}

@end
