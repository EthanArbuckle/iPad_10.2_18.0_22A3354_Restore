@implementation PLMemoryComputeJournalEntryPayload

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  BOOL v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  if (objc_msgSend(v13, "isEqualToKey:", CFSTR("keyAsset")))
  {
    objc_msgSend(v14, "keyAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMemoryComputeJournalEntryPayload _setAsset:forPayloadProperty:payloadAttributes:andNilAttributes:](self, "_setAsset:forPayloadProperty:payloadAttributes:andNilAttributes:", v15, v13, v10, v11);
  }
  else
  {
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("curatedAssets")))
    {
      objc_msgSend(v14, "curatedAssets");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v13, "isEqualToKey:", CFSTR("extendedCuratedAssets")))
    {
      objc_msgSend(v14, "extendedCuratedAssets");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("representativeAssets")))
      {
        v17 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v14, "representativeAssets");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v16;
    -[PLMemoryComputeJournalEntryPayload _setAssets:forPayloadProperty:payloadAttributes:andNilAttributes:](self, "_setAssets:forPayloadProperty:payloadAttributes:andNilAttributes:", v16, v13, v10, v11);
  }

  v17 = 1;
LABEL_11:

  return v17;
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("keyAsset")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToKey:", CFSTR("curatedAssets")) & 1) == 0
      && (objc_msgSend(v7, "isEqualToKey:", CFSTR("extendedCuratedAssets")) & 1) == 0
      && !objc_msgSend(v7, "isEqualToKey:", CFSTR("representativeAssets")))
    {
      v13.receiver = self;
      v13.super_class = (Class)PLMemoryComputeJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v13, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

LABEL_8:
  return v11;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "isEqualToKey:", CFSTR("curatedAssets")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToKey:", CFSTR("extendedCuratedAssets")) & 1) != 0
    || objc_msgSend(v10, "isEqualToKey:", CFSTR("representativeAssets")))
  {
    if (-[PLMemoryComputeJournalEntryPayload assetIdentifierType](self, "assetIdentifierType") == 1)
      v11 = CFSTR("cloudAssetGUID");
    else
      v11 = CFSTR("uuid");
    objc_msgSend(v9, "valueForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMemoryComputeJournalEntryPayload _remapToLocalIdentifiersForCloudIdentifiers:](self, "_remapToLocalIdentifiersForCloudIdentifiers:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToSet:", v14);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PLMemoryComputeJournalEntryPayload;
    v15 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v17, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10);
  }

  return v15;
}

- (NSString)keyAssetUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keyAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_localAssetIdentifierForCloudIdentifiers, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (NSSet)curatedAssetUUIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("curatedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemoryComputeJournalEntryPayload _remapToLocalIdentifiersForCloudIdentifiers:](self, "_remapToLocalIdentifiersForCloudIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)setCuratedAssetUUIDs:(id)a3
{
  id v4;

  -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringSet:](self, "encodedDataForUUIDStringSet:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("curatedAssets"));

}

- (NSSet)extendedCuratedAssetUUIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("extendedCuratedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemoryComputeJournalEntryPayload _remapToLocalIdentifiersForCloudIdentifiers:](self, "_remapToLocalIdentifiersForCloudIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSSet)representativeAssetUUIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("representativeAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemoryComputeJournalEntryPayload _remapToLocalIdentifiersForCloudIdentifiers:](self, "_remapToLocalIdentifiersForCloudIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  -[PLMemoryComputeJournalEntryPayload _memoryInManagedObjectContext:error:](self, "_memoryInManagedObjectContext:error:", v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (!v8)
  {
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to look up compute cache memory %{public}@ on restore, skipping: %@", buf, 0x16u);

    }
    goto LABEL_6;
  }
  if (!objc_msgSend(v8, "count"))
  {
    +[PLManagedObject insertInManagedObjectContext:](PLMemory, "insertInManagedObjectContext:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "payloadIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setUuid:](v10, "setUuid:", v12);

    -[PLManagedObjectJournalEntryPayload applyPayloadToManagedObject:payloadAttributesToUpdate:](self, "applyPayloadToManagedObject:payloadAttributesToUpdate:", v10, 0);
    -[PLMemoryComputeJournalEntryPayload _updateMemory:withAssets:](self, "_updateMemory:withAssets:", v10, v6);
LABEL_6:

  }
  return v8 != 0;
}

- (NSSet)assetIdentifiers
{
  NSMutableSet *v3;
  NSMutableSet *allAssetIdentifiers;

  -[PLMemoryComputeJournalEntryPayload _allAssetUUIDs](self, "_allAssetUUIDs");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  allAssetIdentifiers = self->_allAssetIdentifiers;
  self->_allAssetIdentifiers = v3;

  return (NSSet *)self->_allAssetIdentifiers;
}

- (unint64_t)assetIdentifierCount
{
  void *v3;
  unint64_t v4;

  if (self->_allAssetIdentifiers)
    return -[NSMutableSet count](self->_allAssetIdentifiers, "count");
  -[PLMemoryComputeJournalEntryPayload assetIdentifiers](self, "assetIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)setLocalAssetIdentifierForCloudIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_localAssetIdentifierForCloudIdentifiers, a3);
}

- (int64_t)assetIdentifierType
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("assetIDType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)_memoryInManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchBatchSize:", 1);
  objc_msgSend(v9, "setFetchLimit:", 1);
  v10 = (void *)MEMORY[0x1E0CB3880];
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v12);

  objc_msgSend(v7, "executeFetchRequest:error:", v9, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_setAsset:(id)a3 forPayloadProperty:(id)a4 payloadAttributes:(id)a5 andNilAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a4;
  if (v21)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetIDType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (!v14)
    {
      objc_msgSend(v21, "cloudAssetGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v16 = &unk_1E37600E0;
      else
        v16 = &unk_1E37600F8;
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("assetIDType"));

    }
    objc_msgSend(v21, "cloudAssetGUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v21, "cloudAssetGUID");
    else
      objc_msgSend(v21, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v20);
  }
  else
  {
    objc_msgSend(v12, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObject:", v17);
  }

}

- (void)_setAssets:(id)a3 forPayloadProperty:(id)a4 payloadAttributes:(id)a5 andNilAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetIDType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v20, "valueForKey:", CFSTR("cloudAssetGUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {
    if (objc_msgSend(v15, "count"))
      v17 = &unk_1E37600E0;
    else
      v17 = &unk_1E37600F8;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("assetIDType"));
  }
  if (!objc_msgSend(v16, "count"))
  {
    objc_msgSend(v20, "valueForKey:", CFSTR("uuid"));
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }
  -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringSet:](self, "encodedDataForUUIDStringSet:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](self, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v10, v11, v12, v19);

}

- (id)_allAssetUUIDs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLMemoryComputeJournalEntryPayload keyAssetUUID](self, "keyAssetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[PLMemoryComputeJournalEntryPayload curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "unionSet:", v5);
  -[PLMemoryComputeJournalEntryPayload extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "unionSet:", v6);
  -[PLMemoryComputeJournalEntryPayload representativeAssetUUIDs](self, "representativeAssetUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "unionSet:", v7);

  return v3;
}

- (void)_updateMemory:(id)a3 withAssets:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a4;
  v7 = a3;
  if (-[PLMemoryComputeJournalEntryPayload assetIdentifierType](self, "assetIdentifierType") == 1)
    v8 = CFSTR("cloudAssetGUID");
  else
    v8 = CFSTR("uuid");
  v9 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryComputeJournalEntryPayload curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K in %@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredSetUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCuratedAssets:", v12);

  v13 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryComputeJournalEntryPayload extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K in %@"), v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredSetUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExtendedCuratedAssets:", v16);

  v17 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryComputeJournalEntryPayload representativeAssetUUIDs](self, "representativeAssetUUIDs");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("%K in %@"), v8, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredSetUsingPredicate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRepresentativeAssets:", v19);
}

- (id)_remapToLocalIdentifiersForCloudIdentifiers:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSDictionary *localAssetIdentifierForCloudIdentifiers;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSet:", v5);

  localAssetIdentifierForCloudIdentifiers = self->_localAssetIdentifierForCloudIdentifiers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PLMemoryComputeJournalEntryPayload__remapToLocalIdentifiersForCloudIdentifiers___block_invoke;
  v10[3] = &unk_1E36773C8;
  v8 = v6;
  v11 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](localAssetIdentifierForCloudIdentifiers, "enumerateKeysAndObjectsUsingBlock:", v10);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAssetIdentifierForCloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_allAssetIdentifiers, 0);
}

void __82__PLMemoryComputeJournalEntryPayload__remapToLocalIdentifiersForCloudIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

+ (id)modelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[15];
  _QWORD v32[17];

  v32[15] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  v31[1] = CFSTR("title");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v25;
  v31[2] = CFSTR("subtitle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v24;
  v31[3] = CFSTR("creationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v23;
  v31[4] = CFSTR("category");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v22;
  v31[5] = CFSTR("pendingState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("pending"), 100, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v21;
  v31[6] = CFSTR("photosGraphData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v20;
  v31[7] = CFSTR("photosGraphVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v19;
  v31[8] = CFSTR("score");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v18;
  v31[9] = CFSTR("subcategory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v17;
  v31[10] = CFSTR("graphMemoryIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v16;
  v31[11] = CFSTR("keyAsset");
  v30[0] = CFSTR("uuid");
  v30[1] = CFSTR("cloudAssetGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("keyAsset"), v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v32[11] = v3;
  v31[12] = CFSTR("curatedAssets");
  v29[0] = CFSTR("uuid");
  v29[1] = CFSTR("cloudAssetGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("curatedAssets"), v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v32[12] = v6;
  v31[13] = CFSTR("extendedCuratedAssets");
  v28[0] = CFSTR("uuid");
  v28[1] = CFSTR("cloudAssetGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("extendedCuratedAssets"), v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v32[13] = v9;
  v31[14] = CFSTR("representativeAssets");
  v27[0] = CFSTR("uuid");
  v27[1] = CFSTR("cloudAssetGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("representativeAssets"), v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v32[14] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)nonPersistedModelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[34];
  _QWORD v39[36];

  v39[34] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("storyColorGradeKind");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v37;
  v38[1] = CFSTR("storySerializedTitleCategory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v36;
  v38[2] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v35;
  v38[3] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v34;
  v38[4] = CFSTR("lastMoviePlayedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v33;
  v38[5] = CFSTR("lastViewedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v32;
  v38[6] = CFSTR("lastEnrichmentDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v31;
  v38[7] = CFSTR("pendingPlayCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v30;
  v38[8] = CFSTR("pendingShareCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v29;
  v38[9] = CFSTR("pendingViewCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v28;
  v38[10] = CFSTR("featuredState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v27;
  v38[11] = CFSTR("syndicatedContentState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v26;
  v38[12] = CFSTR("sharingComposition");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v25;
  v38[13] = CFSTR("searchIndexRebuildState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v24;
  v38[14] = CFSTR("startDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v23;
  v38[15] = CFSTR("endDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v22;
  v38[16] = CFSTR("assetListPredicate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[16] = v21;
  v38[17] = CFSTR("blacklistedFeature");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[17] = v20;
  v38[18] = CFSTR("favorite");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[18] = v19;
  v38[19] = CFSTR("movieAssetState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[19] = v18;
  v38[20] = CFSTR("movieData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[20] = v17;
  v38[21] = CFSTR("notificationState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[21] = v16;
  v38[22] = CFSTR("playCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[22] = v15;
  v38[23] = CFSTR("shareCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[23] = v14;
  v38[24] = CFSTR("viewCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39[24] = v2;
  v38[25] = CFSTR("rejected");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39[25] = v3;
  v38[26] = CFSTR("userActionOptions");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[26] = v4;
  v38[27] = CFSTR("movieCuratedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[27] = v5;
  v38[28] = CFSTR("userCuratedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[28] = v6;
  v38[29] = CFSTR("customUserAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[29] = v7;
  v38[30] = CFSTR("userRemovedAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[30] = v8;
  v38[31] = CFSTR("userFeedbacks");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[31] = v9;
  v38[32] = CFSTR("targetUserEditedMemory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[32] = v10;
  v38[33] = CFSTR("sourceGeneratedMemory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[33] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 34);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PLMemoryComputeJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_81159 != -1)
    dispatch_once(&modelProperties_onceToken_81159, block);
  return (id)modelProperties_modelProperties_81160;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PLMemoryComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_81157 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_81157, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_81158;
}

+ (id)payloadClassID
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Compute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entityName
{
  return +[PLMemory entityName](PLMemory, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v3;
  PLMemoryComputePayloadAdapter *v4;

  v3 = a3;
  v4 = -[PLJournalEntryPayloadUpdateAdapter initWithManagedObject:]([PLMemoryComputePayloadAdapter alloc], "initWithManagedObject:", v3);

  return v4;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  if (a4)
    return 1;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pendingState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rejected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "BOOLValue");
  if (v7 == 2)
    return v9 ^ 1;
  else
    return 0;
}

void __74__PLMemoryComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_81158;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_81158 = v1;

}

uint64_t __53__PLMemoryComputeJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_81160;
  modelProperties_modelProperties_81160 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_81160, 0);
}

@end
