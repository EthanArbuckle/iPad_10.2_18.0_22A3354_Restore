@implementation PLAlbumJournalEntryPayload

+ (id)modelPropertiesDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PLAlbumJournalEntryPayload;
  objc_msgSendSuper2(&v10, sel_modelPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v11 = CFSTR("assets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("assets"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

  return v5;
}

+ (id)nonPersistedModelPropertiesDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLAlbumJournalEntryPayload;
  objc_msgSendSuper2(&v9, sel_nonPersistedModelPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v10 = CFSTR("searchIndexRebuildState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PLAlbumJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_84659 != -1)
    dispatch_once(&modelProperties_onceToken_84659, block);
  return (id)modelProperties_modelProperties_84660;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_84657 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_84657, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_84658;
}

+ (id)payloadClassID
{
  return +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
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
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PLManagedAlbum validKindsForPersistence](PLManagedAlbum, "validKindsForPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

void __66__PLAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_84658;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_84658 = v1;

}

uint64_t __45__PLAlbumJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_84660;
  modelProperties_modelProperties_84660 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_84660, 0);
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "isEqualToKey:", CFSTR("assets")))
  {
    objc_msgSend((id)objc_opt_class(), "fetchRelationshipPropertyValuesForRelationshipName:fromManagedObject:usingPayloadProperty:", CFSTR("assets"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringArray:](self, "encodedDataForUUIDStringArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](self, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v10, v11, v13, v15);

    v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLAlbumJournalEntryPayload;
    v16 = -[PLGenericAlbumJournalEntryPayload updatePayloadAttributes:andNilAttributes:withManagedObject:forPayloadProperty:](&v18, sel_updatePayloadAttributes_andNilAttributes_withManagedObject_forPayloadProperty_, v10, v11, v12, v13);
  }

  return v16;
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
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("assets")))
  {
    -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)PLAlbumJournalEntryPayload;
    -[PLGenericAlbumJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v9);
    v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLAlbumJournalEntryPayload;
    -[PLGenericAlbumJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v10, v9);
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
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("assets")))
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
    v12.super_class = (Class)PLAlbumJournalEntryPayload;
    -[PLGenericAlbumJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v12, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSOrderedSet)assetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  -[PLGenericAlbumJournalEntryPayload title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGenericAlbum insertNewAlbumWithKind:title:intoLibrary:](PLGenericAlbum, "insertNewAlbumWithKind:title:intoLibrary:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLAlbumJournalEntryPayload;
  -[PLGenericAlbumJournalEntryPayload updateAlbum:includePendingChanges:](&v20, sel_updateAlbum_includePendingChanges_, v6, v4);
  -[PLAlbumJournalEntryPayload assetUUIDs](self, "assetUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PLAlbumJournalEntryPayload_updateAlbum_includePendingChanges___block_invoke;
  v16[3] = &unk_1E3673960;
  v19 = v4;
  v10 = v7;
  v17 = v10;
  v11 = v6;
  v18 = v11;
  objc_msgSend(v8, "sortedObjectsToAddWithUUIDs:uuidKey:andExistingObjects:fetchBlock:", v10, CFSTR("uuid"), v9, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Updating assets in album %@ to match persisted UUID ordering from %@", buf, 0x16u);

    }
    objc_msgSend(v11, "mutableAssets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v12);

  }
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
  if (objc_msgSend(v9, "isEqualToKey:", CFSTR("assets")))
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "isEqualToOrderedSet:", v8);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLAlbumJournalEntryPayload;
    v12 = -[PLGenericAlbumJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v14, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v10, v9);

  }
  return v12;
}

id __64__PLAlbumJournalEntryPayload_updateAlbum_includePendingChanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(unsigned __int8 *)(a1 + 48) | 2;
  objc_msgSend(*(id *)(a1 + 32), "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetsWithUUIDs:options:inManagedObjectContext:](PLManagedAsset, "assetsWithUUIDs:options:inManagedObjectContext:", v3, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
