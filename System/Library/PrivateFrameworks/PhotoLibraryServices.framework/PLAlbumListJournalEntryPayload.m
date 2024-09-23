@implementation PLAlbumListJournalEntryPayload

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v13, "isEqualToKey:", CFSTR("albums"));
  if (v14)
  {
    objc_msgSend(v12, "albums");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relatedEntityPropertyNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringOrderedSet:](self, "encodedDataForUUIDStringOrderedSet:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](self, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v10, v11, v13, v19);

  }
  return v14;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  objc_super v12;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("albums")))
  {
    -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)PLAlbumListJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v9);
    v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLAlbumListJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v10, v9);
  }

}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("albums")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLAlbumListJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v12, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSOrderedSet)albumUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("albums"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

- (signed)albumListType
{
  void *v2;
  signed __int16 v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortValue");

  return v3;
}

- (id)insertAlbumListFromDataInManagedObjectContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (+[PLManagedAlbumList isValidTypeForPersistence:](PLManagedAlbumList, "isValidTypeForPersistence:", -[PLAlbumListJournalEntryPayload albumListType](self, "albumListType")))
  {
    v5 = -[PLAlbumListJournalEntryPayload albumListType](self, "albumListType");
    objc_msgSend(v4, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbumList _singletonListWithType:library:](PLManagedAlbumList, "_singletonListWithType:library:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateAlbumList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAlbumListJournalEntryPayload albumUUIDs](self, "albumUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqual:", v7))
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = -[PLAlbumListJournalEntryPayload albumListType](self, "albumListType");
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Persisted albumList %d UUIDs match existing UUID ordering", buf, 8u);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v5, "count"))
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v16 = -[PLAlbumListJournalEntryPayload albumListType](self, "albumListType");
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Sorting albumList %d to match UUID ordering %@", buf, 0x12u);
    }

    objc_msgSend(v4, "albumsSortingComparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albums");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PLAlbumListJournalEntryPayload_updateAlbumList___block_invoke;
    v12[3] = &unk_1E36670F8;
    v14 = v10;
    v13 = v5;
    v8 = v10;
    objc_msgSend(v11, "sortUsingComparator:", v12);

    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v9, "isEqualToKey:", CFSTR("albums")))
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "isEqualToOrderedSet:", v8);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLAlbumListJournalEntryPayload;
    v12 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v14, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v10, v9);

  }
  return v12;
}

uint64_t __50__PLAlbumListJournalEntryPayload_updateAlbumList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:", v9);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:", v12);

    if (v10 >= v13)
      v7 = v10 > v13;
    else
      v7 = -1;
  }

  return v7;
}

+ (id)modelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("identifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("albums");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("albums"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)nonPersistedModelPropertiesDescription
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("needsReorderingNumber");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PLAlbumListJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_25840 != -1)
    dispatch_once(&modelProperties_onceToken_25840, block);
  return (id)modelProperties_modelProperties_25841;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PLAlbumListJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_25838 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_25838, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_25839;
}

+ (id)payloadClassID
{
  return +[PLManagedAlbumList entityName](PLManagedAlbumList, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("identifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PLManagedAlbumList isValidTypeForPersistence:](PLManagedAlbumList, "isValidTypeForPersistence:", (__int16)objc_msgSend(v4, "integerValue"));

  return v5;
}

void __70__PLAlbumListJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_25839;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_25839 = v1;

}

uint64_t __49__PLAlbumListJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_25841;
  modelProperties_modelProperties_25841 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_25841, 0);
}

@end
